from django.db import models
from django.contrib.auth.models import BaseUserManager, AbstractBaseUser, PermissionsMixin
import random
from django.utils import timezone

class Department (models.Model):
    Department_name = models.CharField(max_length=200, primary_key=True)
    def __str__(self):
        return self.Department_name 

# Create user manager
class MyUserManager(BaseUserManager):
    def create_user(self, email, name, phone_Number, studentID=None, departmentName=None, password=None, is_admin=False):
        """
        Creates and saves a User with the given email, name, phone_Number, and password.
        """
        if not email:
            raise ValueError("Users must have an email address")

        if not is_admin and not studentID:
            raise ValueError("Users must have a student ID")
        
        if not is_admin and not departmentName:
            raise ValueError("Users must have a Department")
        
        if not phone_Number:
            raise ValueError('The Phone Number field must be set')

        user = self.model(
            email=self.normalize_email(email),
            name=name,
            phone_Number=phone_Number,
            studentID=studentID,
            departmentName=departmentName,
        )

        user.set_password(password)
        user.save(using=self._db)
        return user

    def create_superuser(self, email, name, phone_Number, password=None):
        """
        Creates and saves a superuser with the given email, name, phone_Number and password.
        """
        user = self.create_user(
            email,
            password=password,
            name=name,
            phone_Number=phone_Number,
            studentID=None,
            departmentName=None,
            is_admin=True,
        )
        user.is_admin = True
        user.save(using=self._db)
        return user

class User(AbstractBaseUser, PermissionsMixin):
    email = models.EmailField(
        primary_key=True, 
        verbose_name="email address",
        max_length=255,
        unique=True,
    )
    image = models.ImageField(upload_to='media/userimage', default="media/userimage/userimage.png")
    name = models.CharField(max_length=255)
    phone_Number = models.CharField(max_length=11, default="")
    address = models.CharField(max_length=300, default="")
    studentID = models.CharField(max_length=11, unique=True, null=True, blank=True)
    departmentName = models.ForeignKey('Department', on_delete=models.CASCADE, null=True, blank=True)
    Bio = models.TextField()
    batch = models.CharField(max_length=255, default="")
    # year_of_admission = models.CharField(max_length=100)
    is_active = models.BooleanField(default=True)
    is_admin = models.BooleanField(default=False)
    is_verified = models.BooleanField(default=False)
    is_examcontroller = models.BooleanField(default=False)
    create_date = models.DateTimeField(auto_now_add=True)
    update_date = models.DateTimeField(auto_now=True)
    
    # New fields for email verification
    verification_code = models.CharField(max_length=6, blank=True, null=True)
    verification_code_created_at = models.DateTimeField(blank=True, null=True)

    objects = MyUserManager()

    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = ["name", "phone_Number"]

    def __str__(self):
        return self.email

    def has_perm(self, perm, obj=None):
        """Does the user have a specific permission? Only admins should have full permissions."""
        return self.is_admin

    def has_module_perms(self, app_label):
        """Does the user have permissions to view the app `app_label`? Only admins should have full permissions."""
        return self.is_admin

    @property
    def is_staff(self):
        """Is the user a member of staff? All admins are considered staff."""
        return self.is_admin

    def generate_verification_code(self):
        """Generates a 6-digit verification code and records the timestamp."""
        self.verification_code = str(random.randint(100000, 999999))
        self.verification_code_created_at = timezone.now()
  

class Contact(models.Model):
    id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=300)
    email = models.EmailField()
    phone_number = models.CharField(max_length=11)
    message = models.TextField()

class News (models.Model):
    id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=1000)
    image = models.ImageField(upload_to="media/Event/images", default ="")
    date = models.DateField()
    content = models.TextField()

class Notice (models.Model):
    id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=1000)
    date = models.DateField()
    content = models.TextField()

#Bus

class BusSchedule(models.Model):
    route = models.CharField(max_length=255)
    arrival = models.TimeField(null=True, blank=True)
    departure = models.TimeField(null=True, blank=True)
    number_of_Bus = models.IntegerField()
    audience = models.CharField(max_length=255)


class Faculty_Member(models.Model):
    id = models.AutoField(primary_key=True)
    department = models.ForeignKey(Department, on_delete=models.CASCADE, null=True, blank=True)
    image = models.ImageField(upload_to="media/Faculty_Members/", default ="")
    name = models.CharField(max_length=200)
    designation = models.CharField(max_length=300)



class bscincse(models.Model):
    id = models.AutoField(primary_key=True)
    content = models.TextField()

class bscinsoftware(models.Model):
    id = models.AutoField(primary_key=True)
    content = models.TextField()

class bscineee(models.Model):
    id = models.AutoField(primary_key=True)
    content = models.TextField()

class bba(models.Model):
    id = models.AutoField(primary_key=True)
    content = models.TextField()


#Result
# class semester(models.Model):
#     semester = models.CharField(max_length=200)

class Course(models.Model):
    id = models.AutoField(primary_key=True)
    coursecode = models.CharField(max_length=8, unique=True)
    coursetitle = models.CharField(max_length=300, unique=True)
    department = models.ForeignKey(Department, on_delete=models.CASCADE, null=True, blank=True)

    def __str__(self):
        return self.coursetitle

class Result(models.Model):
    id = models.AutoField(primary_key=True)
    student = models.ForeignKey(User, on_delete=models.CASCADE, null=True, blank=True, default='')
    course = models.ForeignKey(Course, on_delete=models.CASCADE, null=True, blank=True)
    status = models.CharField(max_length=200,default='')
    credit = models.FloatField()
    letterGrade = models.CharField(max_length=20, default='')
    GradePoint = models.FloatField()
