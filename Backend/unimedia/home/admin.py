from django.contrib import admin
from .models import *
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin

from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin

class UserAdmin(BaseUserAdmin):
    list_display = ["email", "name", "phone_Number", "departmentName", "studentID", "is_admin", "is_verified", "is_examcontroller"]
    list_filter = ["is_admin"]
    
    def get_fieldsets(self, request, obj=None):
        # If the user is an admin (or being edited as a superuser), exclude 'departmentName' and 'studentID'
        if obj and obj.is_admin:
            return [
                ('User Credentials', {"fields": ["email", "password"]}),
                ("Personal info", {"fields": ["name", "phone_Number", "image", "address"]}),
                ("Permissions", {"fields": ["is_admin", "is_active","is_examcontroller"]}),
            ]

        if obj and obj.is_examcontroller:
           return [
                ('User Credentials', {"fields": ["email", "password"]}),
                ("Personal info", {"fields": ["name", "phone_Number", "image", "address"]}),
                ("Permissions", {"fields": ["is_examcontroller", "is_active"]}),
            ]
        # If the user is not an admin, show the full fieldset
        return [
            ('User Credentials', {"fields": ["email", "password"]}),
            ("Personal info", {"fields": ["name", "phone_Number", "image", "address", "departmentName", "studentID", "batch"]}),
            ("Permissions", {"fields": ["is_verified", "is_active"]}),
        ]
    
    def get_add_fieldsets(self, request):
        """
        Override get_add_fieldsets for when creating a new user.
        Exclude 'departmentName' and 'studentID' for admins.
        """
        return [
            (
                None,
                {
                    "classes": ["wide"],
                    "fields": ["email", "image", "address", "name", "phone_Number", "password1", "password2"],
                },
            ),
        ]
    
    def get_form(self, request, obj=None, **kwargs):
        """
        Override get_form to exclude 'departmentName' and 'studentID' fields for admin users.
        """
        form = super(UserAdmin, self).get_form(request, obj, **kwargs)
        if obj and obj.is_admin:
            # If the user is an admin, remove 'departmentName' and 'studentID' from the form
            form.base_fields.pop("departmentName", None)
            form.base_fields.pop("studentID", None)
            form.base_fields.pop("batch", None)
        return form

    search_fields = ["email", "name", "phone_Number"]
    ordering = ["email", "name", "phone_Number"]
    filter_horizontal = []

# Now register the modified UserAdmin...
admin.site.register(User, UserAdmin)


class Departmentadmin(admin.ModelAdmin):
    list_display = ["Department_name"]
    class Meta:
        model = Department
admin.site.register(Department, Departmentadmin)

class Contactadmin(admin.ModelAdmin):
    list_display = ["name", "email", "phone_number"]
    class Meta:
        model = Contact
admin.site.register(Contact, Contactadmin)

class Newsadmin(admin.ModelAdmin):
    list_display = ["title", "date"]
    class Meta:
        model = News
admin.site.register(News, Newsadmin)

# Notice
class Noticeadmin(admin.ModelAdmin):
    list_display = ["title", "date"]
    class Meta:
        model = Notice
admin.site.register(Notice, Noticeadmin)

#Faculty_Members
class Faculty_Memberadmin(admin.ModelAdmin):
    list_display = ["name","department","designation"]
    class Meta:
        model = Faculty_Member
admin.site.register(Faculty_Member, Faculty_Memberadmin)

#Bus
class BusScheduleadmin(admin.ModelAdmin):
    list_display = ["route","arrival","departure"]
    class Meta:
        model = BusSchedule
admin.site.register(BusSchedule, BusScheduleadmin)

#Result
class coursesadmin(admin.ModelAdmin):
    list_display = ["coursecode", 'coursetitle']
    class Meta:
        model = Course
admin.site.register(Course, coursesadmin)

class Resultadmin(admin.ModelAdmin):
    list_display = ["student", "status", "letterGrade"]
    class Meta:
        model = Result
admin.site.register(Result, Resultadmin)

# class semesteradmin(admin.ModelAdmin):
#     list_display = ["semester"]
#     class Meta:
#         model = semester
# admin.site.register(semester, semesteradmin)


class bscincseadmin(admin.ModelAdmin):
    class Meta:
        model = bscincse
admin.site.register(bscincse, bscincseadmin)

class bscinsoftwareadmin(admin.ModelAdmin):
    class Meta:
        model = bscinsoftware
admin.site.register(bscinsoftware, bscinsoftwareadmin)

class bscineeeadmin(admin.ModelAdmin):
    class Meta:
        model = bscineee
admin.site.register(bscineee, bscineeeadmin)

class bbaadmin(admin.ModelAdmin):
    class Meta:
        model = bba
admin.site.register(bba, bbaadmin)