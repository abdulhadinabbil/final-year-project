from rest_framework import serializers
from .models import *
from django.utils.encoding import smart_str, force_bytes, DjangoUnicodeDecodeError
from django.utils.http import urlsafe_base64_decode, urlsafe_base64_encode
from django.contrib.auth.tokens import PasswordResetTokenGenerator
from django.utils.encoding import force_bytes, force_str


from .utils import Util


# class UserRegistrationSerializer(serializers.ModelSerializer):
#     password2 = serializers.CharField(
#         style={"input_type": "password"}, write_only=True)

#     class Meta:
#         model = User
#         fields = ["email", "name", "phone_Number", "studentID", "departmentName","password", "password2"]
#         extra_kwargs = {"password": {"write_only": True}}

#     def validate(self, attrs):
#         password = attrs.get("password")
#         password2 = attrs.get("password2")
#         if password != password2:
#             raise serializers.ValidationError(
#                 {"password": "Passwords must match"})
#         return attrs

#     def create(self, validated_data):
#         validated_data.pop('password2')  # Remove password2 before creating the user
#         return User.objects.create_user(**validated_data)

class UserRegistrationSerializer(serializers.ModelSerializer):
    password2 = serializers.CharField(style={"input_type": "password"}, write_only=True)

    class Meta:
        model = User
        fields = ["email", "name", "phone_Number", "studentID", "departmentName", "password", "password2"]
        extra_kwargs = {"password": {"write_only": True}}

    def validate(self, attrs):
        password = attrs.get("password")
        password2 = attrs.get("password2")
        if password != password2:
            raise serializers.ValidationError({"password": "Passwords must match"})
        return attrs

    def create(self, validated_data):
        validated_data.pop('password2')  # Remove password2 before creating the user
        user = User.objects.create_user(**validated_data)
        user.is_active = False  # Initially deactivate the user
        # Generate and save the verification code
        user.generate_verification_code()
        user.save()

        # Send verification code via email
        email_body = (
            f'Hi {user.name},\n\nYour verification code is {user.verification_code}. '
            'It will expire in 10 minutes.'
        )
        data = {
            'subject': 'Verify Your Email',
            'body': email_body,
            'to_email': user.email,
        }
        Util.send_email(data)

        return user

from django.utils import timezone
from datetime import timedelta
class VerifyEmailSerializer(serializers.Serializer):
    email = serializers.EmailField()
    verification_code = serializers.CharField()

    def validate(self, attrs):
        try:
            # Retrieve the user by email
            user = User.objects.get(email=attrs['email'])

            # Verify the code and check its expiration
            if user.verification_code != attrs['verification_code']:
                raise serializers.ValidationError("Invalid verification code")

            # Check if the verification code is expired
            if user.verification_code_created_at < timezone.now() - timedelta(minutes=10):
                raise serializers.ValidationError("Verification code has expired")

            # Set user as verified and active
            user.is_verified = True
            user.is_active = True
            user.verification_code = None  # Clear the code after successful verification
            user.save()

        except User.DoesNotExist:
            raise serializers.ValidationError("User with this email does not exist")

        return attrs


class UserLoginSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(max_length=255)

    class Meta:
        model = User
        fields = ["email", "password"]


class UserProfileSerializer(serializers.ModelSerializer):
    departmentName = serializers.StringRelatedField()
    class Meta:
        model = User
        fields = ["email", "name", "image", "phone_Number", "address", "studentID", "departmentName", "Bio", "is_admin", 'is_active', 
                  'batch', 'is_examcontroller']

from rest_framework import serializers
from .models import User, Department

class UpdateUserSerializer(serializers.ModelSerializer):
    email = serializers.EmailField(required=False)
    name = serializers.CharField(max_length=255, required=False)
    studentID = serializers.CharField(required=False)
    departmentName = serializers.PrimaryKeyRelatedField(queryset=Department.objects.all(), required=False)
    Bio = serializers.CharField(required=False, allow_blank=True)
    batch = models.CharField(max_length=255, blank=True, null=True)
    # year_of_admission = models.CharField(required=False, allow_blank=True)

    class Meta:
        model = User
        fields = ("email", "name", "image", "phone_Number", "address", "studentID", "departmentName", "Bio", 'batch')

    def validate_email(self, value):
        user = self.context['request'].user
        if value and User.objects.exclude(pk=user.pk).filter(email=value).exists():
            raise serializers.ValidationError("This email is already in use.")
        return value

    def update(self, instance, validated_data):
        user = self.context['request'].user

        if user.pk != instance.pk:
            raise serializers.ValidationError("You don't have permission to update this user.")

        # Update fields based on the validated data
        instance.name = validated_data.get('name', instance.name)
        instance.image = validated_data.get('image', instance.image)
        instance.email = validated_data.get('email', instance.email)
        instance.phone_Number = validated_data.get('phone_Number', instance.phone_Number)
        instance.address = validated_data.get('address', instance.address)
        instance.Bio = validated_data.get('Bio', instance.Bio)

        # Only update studentID if the user is not an admin
        if not user.is_admin:
            instance.studentID = validated_data.get('studentID', instance.studentID)
            instance.departmentName = validated_data.get('departmentName', instance.departmentName)
            instance.batch = validated_data.get('batch', instance.batch)

        instance.save()
        return instance

    
class UserChangePasswordSerializer(serializers.Serializer):
    current_password = serializers.CharField(max_length=255, style={'input_type': 'password'}, write_only=True)
    password = serializers.CharField(max_length=255, style={'input_type': 'password'}, write_only=True)
    password2 = serializers.CharField(max_length=255, style={'input_type': 'password'}, write_only=True)

    class Meta:
        fields = ['current_password', 'password', 'password2']

    def validate(self, attrs):
        user = self.context.get('user')
        current_password = attrs.get('current_password')
        password = attrs.get('password')
        password2 = attrs.get('password2')

        # Validate current password
        if not user.check_password(current_password):
            raise serializers.ValidationError({"current_password": "Current password is incorrect."})

        # Validate new passwords
        if password != password2:
            raise serializers.ValidationError({"password": "New passwords must match."})

        return attrs

    def save(self):
        user = self.context.get('user')
        user.set_password(self.validated_data['password'])
        user.save()


import logging

logger = logging.getLogger(__name__)

class SendPasswordResetEmailSerializer(serializers.Serializer):
    email = serializers.EmailField(max_length=255)

    def validate(self, attrs):
        email = attrs.get('email')

        # Check if the user with the provided email exists
        try:
            user = User.objects.get(email=email)
        except User.DoesNotExist:
            raise serializers.ValidationError('You are not a Registered User')

        # Encode user ID and generate token
        uid = urlsafe_base64_encode(force_bytes(user.pk))
        token = PasswordResetTokenGenerator().make_token(user)

        logger.debug(f'Encoded UID: {uid}')
        logger.debug(f'Password Reset Token: {token}')

        # Construct the password reset link
        link = f'http://localhost:3000/apiv1/user/reset/{uid}/{token}'
        logger.debug(f'Password Reset Link: {link}')

        # Send email
        body = f'Click the following link to reset your password: {link}'
        data = {
            'subject': 'Reset Your Password',
            'body': body,
            'to_email': user.email
        }
        Util.send_email(data)

        return attrs

class UserPasswordResetSerializer(serializers.Serializer):
  password = serializers.CharField(max_length=255, style={'input_type':'password'}, write_only=True)
  password2 = serializers.CharField(max_length=255, style={'input_type':'password'}, write_only=True)
  class Meta:
    fields = ['password', 'password2']

  def validate(self, attrs):
    try:
      password = attrs.get('password')
      password2 = attrs.get('password2')
      email = self.context.get('email')
      token = self.context.get('token')
      if password != password2:
        raise serializers.ValidationError("Password and Confirm Password doesn't match")
      uid = force_str(urlsafe_base64_decode(email))
      user = User.objects.get(pk=uid)
      if not PasswordResetTokenGenerator().check_token(user, token):
        raise serializers.ValidationError('Token is not Valid or Expired')
      user.set_password(password)
      user.save()
      return attrs
    except DjangoUnicodeDecodeError as identifier:
      PasswordResetTokenGenerator().check_token(user, token)
      raise serializers.ValidationError('Token is not Valid or Expired')


#Department
class Departmentserializers(serializers.ModelSerializer):
    class Meta:
        model = Department
        fields = "__all__"

class Contactserializers(serializers.ModelSerializer):
    class Meta:
        model = Contact
        fields = "__all__"

class NewsSerializer(serializers.ModelSerializer):
    class Meta:
        model = News
        fields = "__all__"

class NoticeSerializer(serializers.ModelSerializer):
    class Meta:
        model = Notice
        fields = "__all__"

class Faculty_MemberSerializer(serializers.ModelSerializer):
    class Meta:
        model =Faculty_Member
        fields = "__all__"

class bscincseSerializer(serializers.ModelSerializer):
    class Meta:
        model =bscincse
        fields = "__all__"

class bscinsoftwareSerializer(serializers.ModelSerializer):
    class Meta:
        model =bscinsoftware
        fields = "__all__"

class bscineeeSerializer(serializers.ModelSerializer):
    class Meta:
        model =bscineee
        fields = "__all__"

class bbaSerializer(serializers.ModelSerializer):
    class Meta:
        model =bba
        fields = "__all__"

class BusScheduleSerializer(serializers.ModelSerializer):
    class Meta:
        model = BusSchedule
        fields = "__all__"

#Result
class coursesSerializer(serializers.ModelSerializer):
    class Meta:
        model = Course
        fields = "__all__"


class ResultSerializer(serializers.ModelSerializer):
    student = UserProfileSerializer(read_only=True)  # Use full user profile serializer
    course = coursesSerializer(read_only=True)       # Use full course serializer

    class Meta:
        model = Result
        fields = "__all__"

    def create(self, validated_data):
        # Retrieve student email and course code from the request data
        student_email = self.context['request'].data.get('student')
        coursetitle = self.context['request'].data.get('course')

        # Fetch the student based on the email
        try:
            student = User.objects.get(email=student_email)
        except User.DoesNotExist:
            raise serializers.ValidationError("Student with this email does not exist.")

        # Fetch the course based on the course code
        try:
            course = Course.objects.get(coursetitle=coursetitle)  # Use `Course` model here
        except Course.DoesNotExist:
            raise serializers.ValidationError("Course with this title does not exist.")

        # Ensure that the result for the same student and course doesn't already exist
        if Result.objects.filter(student=student, course=course).exists():
            raise serializers.ValidationError("Result for this course and student already exists.")

        # Create and return the result with the associated student and course
        return Result.objects.create(student=student, course=course, **validated_data)


# class semesterSerializer(serializers.ModelSerializer):
#     student = UserProfileSerializer(read_only=True)
#     class Meta:
#         model = semester
#         fields = "__all__"