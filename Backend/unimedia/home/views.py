from django.http import JsonResponse
from rest_framework.response import Response
from rest_framework import status, generics, permissions
from rest_framework.views import APIView
from .serializers import *
from django.contrib.auth import authenticate
from .renderers import Userrenderer
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework.permissions import IsAuthenticated
from rest_framework import filters, status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.parsers import MultiPartParser, FormParser
from rest_framework.generics import CreateAPIView
from rest_framework.permissions import AllowAny
# Create your views here.


def get_tokens_for_user(user):
    refresh = RefreshToken.for_user(user)
    
    return {
        'refresh': str(refresh),
        'access': str(refresh.access_token),
    }


class UserRegistrationView(APIView):
    renderer_classes = [Userrenderer]

    def post(self, request, format=None):
        serializer = UserRegistrationSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        user = serializer.save()
        token = get_tokens_for_user(user)
        return Response({'token': token, 'msg': 'User created successfully'}, status=status.HTTP_201_CREATED)


class VerifyEmailView(APIView):
    def post(self, request):
        serializer = VerifyEmailSerializer(data=request.data)
        if serializer.is_valid():
            return Response({"message": "Email verified successfully. You can now log in."}, status=status.HTTP_200_OK)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

class UserLoginView(APIView):
    renderer_classes = [Userrenderer]

    def post(self, request, format=None):
        serializer = UserLoginSerializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        email = serializer.data.get("email")
        password = serializer.data.get("password")
        user = authenticate(email=email, password=password)
        if user is not None:
            token = get_tokens_for_user(user)
            return Response({'token': token, 'msg': 'User logged in successfully'}, status=status.HTTP_200_OK)
        else:
            return Response({'error': {'non_field_error': ['Invalid email or password']}}, status=status.HTTP_404_NOT_FOUND)


class UserProfileView(APIView):
    renderer_classes = [Userrenderer]
    permission_classes = [IsAuthenticated]

    def get(self, request, format=None):
        user = request.user
        serializer = UserProfileSerializer(user)
        return Response(serializer.data, status=status.HTTP_200_OK)

class UpdateProfileView(generics.UpdateAPIView):

    queryset = User.objects.all()
    permission_classes = (IsAuthenticated,)
    serializer_class = UpdateUserSerializer


    
class UserChangePasswordView(APIView):
    renderer_classes = [Userrenderer]
    permission_classes = [IsAuthenticated]

    def post(self, request, format=None):
        serializer = UserChangePasswordSerializer(
            data=request.data, context={'user': request.user})
        serializer.is_valid(raise_exception=True)
        serializer.save()
        return Response({'msg': 'Password changed successfully'}, status=status.HTTP_200_OK)


# class SendPasswordResetEmailView(APIView):
#     renderer_classes = [Userrenderer]

#     def post(self, request, format=None):
#         serializer = SendPasswordResetEmailSerializer(data=request.data)
#         serializer.is_valid(raise_exception=True)
#         return Response({'msg': 'Password reset link sent successfully. Please check the Email.'}, status=status.HTTP_200_OK)
       

class SendPasswordResetEmailView(generics.GenericAPIView):
    serializer_class = SendPasswordResetEmailSerializer

    def post(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        return Response({'success': 'Password reset link sent successfully.'})

class UserPasswordResetView(APIView):
    renderer_classes = [Userrenderer]

    def post(self, request, email, token, format=None):
        serializer = UserPasswordResetSerializer(
        data=request.data, context={'email': email, 'token': token})
        serializer.is_valid(raise_exception=True)
        return Response({'msg': 'Password reset successfully'}, status=status.HTTP_200_OK)

@api_view(['DELETE'])
@permission_classes([IsAuthenticated])
def delete_user(request):
    user = request.user
    user.delete()
    return Response({'message': 'Account deleted successfully'}, status=status.HTTP_204_NO_CONTENT)


class ContactAPIView(APIView):
    permission_classes = [AllowAny]
    def get(self, request, format=None):
        contact_list = Contact.objects.all()
        contact_serializers = Contactserializers(contact_list, many=True)
        return Response(contact_serializers.data)

    def post(self, request, format=None):
        contact_serializers = Contactserializers(data=request.data)
        if contact_serializers.is_valid():
            contact_serializers.save()
            return Response(contact_serializers.data, status=status.HTTP_201_CREATED)
        return Response(contact_serializers.errors, status=status.HTTP_400_BAD_REQUEST)
    

from rest_framework.permissions import DjangoModelPermissionsOrAnonReadOnly
class CreateNewsView(generics.ListCreateAPIView):
    queryset = News.objects.all()
    serializer_class = NewsSerializer
    permission_classes = [DjangoModelPermissionsOrAnonReadOnly]

# Detail View for retrieving a single News post
class NewsDetailView(generics.RetrieveAPIView):
    queryset = News.objects.all()
    serializer_class = NewsSerializer
    permission_classes = [DjangoModelPermissionsOrAnonReadOnly]
    lookup_field = 'id'

#Notice
class CreateNoticeView(generics.ListCreateAPIView):
    queryset = Notice.objects.all()
    serializer_class = NoticeSerializer
    permission_classes = [DjangoModelPermissionsOrAnonReadOnly]

class NoticeDetailView(generics.RetrieveAPIView):
    queryset = Notice.objects.all()
    serializer_class = NoticeSerializer
    permission_classes = [DjangoModelPermissionsOrAnonReadOnly]
    lookup_field = 'id'

class Faculty_MemberAPIView(generics.ListAPIView):
    queryset= Faculty_Member.objects.all()
    serializer_class= Faculty_MemberSerializer


#programs

class CreatebscincseView(generics.ListCreateAPIView):
    queryset = bscincse.objects.all()
    serializer_class = bscincseSerializer
    permission_classes = [DjangoModelPermissionsOrAnonReadOnly]

# Detail View for retrieving a single bscincse post
class bscincseDetailView(APIView):
    def get(self, request, id):
        try:
            content = bscincse.objects.get(id=id)
            serializer = bscincseSerializer(content)
            return Response(serializer.data)
        except bscincse.DoesNotExist:
            return Response({'error': 'Not found'}, status=status.HTTP_404_NOT_FOUND)

    def put(self, request, id):
        try:
            content = bscincse.objects.get(id=id)
            serializer = bscincseSerializer(content, data=request.data, partial=True)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        except bscincse.DoesNotExist:
            return Response({'error': 'Not found'}, status=status.HTTP_404_NOT_FOUND)

class CreatebscinsoftwareView(generics.ListCreateAPIView):
    queryset = bscinsoftware.objects.all()
    serializer_class = bscinsoftwareSerializer
    permission_classes = [DjangoModelPermissionsOrAnonReadOnly]

# Detail View for retrieving a single bscinsoftware post
class bscinsoftwareDetailView(APIView):
    def get(self, request, id):
        try:
            content = bscinsoftware.objects.get(id=id)
            serializer = bscinsoftwareSerializer(content)
            return Response(serializer.data)
        except bscinsoftware.DoesNotExist:
            return Response({'error': 'Not found'}, status=status.HTTP_404_NOT_FOUND)

    def put(self, request, id):
        try:
            content = bscinsoftware.objects.get(id=id)
            serializer = bscinsoftwareSerializer(content, data=request.data, partial=True)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        except bscinsoftware.DoesNotExist:
            return Response({'error': 'Not found'}, status=status.HTTP_404_NOT_FOUND)

class CreatebscineeeView(generics.ListCreateAPIView):
    queryset = bscineee.objects.all()
    serializer_class = bscineeeSerializer
    permission_classes = [DjangoModelPermissionsOrAnonReadOnly]

# Detail View for retrieving a single bscineee post
class bscineeeDetailView(APIView):
    def get(self, request, id):
        try:
            content = bscineee.objects.get(id=id)
            serializer = bscineeeSerializer(content)
            return Response(serializer.data)
        except bscineee.DoesNotExist:
            return Response({'error': 'Not found'}, status=status.HTTP_404_NOT_FOUND)

    def put(self, request, id):
        try:
            content = bscineee.objects.get(id=id)
            serializer = bscineeeSerializer(content, data=request.data, partial=True)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        except bscineee.DoesNotExist:
            return Response({'error': 'Not found'}, status=status.HTTP_404_NOT_FOUND)


class CreatebbaView(generics.ListCreateAPIView):
    queryset = bba.objects.all()
    serializer_class = bbaSerializer
    permission_classes = [DjangoModelPermissionsOrAnonReadOnly]

# Detail View for retrieving a single bba post
class bbaDetailView(APIView):
    def get(self, request, id):
        try:
            content = bba.objects.get(id=id)
            serializer = bbaSerializer(content)
            return Response(serializer.data)
        except bba.DoesNotExist:
            return Response({'error': 'Not found'}, status=status.HTTP_404_NOT_FOUND)

    def put(self, request, id):
        try:
            content = bba.objects.get(id=id)
            serializer = bbaSerializer(content, data=request.data, partial=True)
            if serializer.is_valid():
                serializer.save()
                return Response(serializer.data)
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        except bba.DoesNotExist:
            return Response({'error': 'Not found'}, status=status.HTTP_404_NOT_FOUND)
        

#Bus Schedule
class BusScheduleView(APIView):
    def get(self, request):
        schedules = BusSchedule.objects.all()
        serializer = BusScheduleSerializer(schedules, many=True)
        return Response(serializer.data)
    
#Result
class CourseListView(generics.ListAPIView):
    queryset = Course.objects.all()
    serializer_class = coursesSerializer

# Custom permission to allow unauthenticated access for GET but restrict others
class IsAdminOrReadOnly(permissions.BasePermission):
    def has_permission(self, request, view):
        if request.method in permissions.SAFE_METHODS:
            return True
        return request.user and request.user.is_staff  # Only staff/admin can modify

# New view to fetch all students and courses
class AllStudentsAndCoursesView(generics.GenericAPIView):
    permission_classes = [IsAdminOrReadOnly]

    def get(self, request, *args, **kwargs):
        # Fetch all students
        students = User.objects.all()
        student_serializer = UserProfileSerializer(students, many=True)

        # Fetch all courses
        courses = Course.objects.all()
        course_serializer = coursesSerializer(courses, many=True)

        # Combine the data
        data = {
            'students': student_serializer.data,
            'courses': course_serializer.data,
        }
        return Response(data)


from rest_framework.exceptions import ValidationError

class ResultCreateView(generics.CreateAPIView):
    queryset = Result.objects.all()
    serializer_class = ResultSerializer
    permission_classes = [permissions.IsAuthenticated, permissions.IsAdminOrExamController]

    def perform_create(self, serializer):
        serializer.save()  # `student` and `course` are fetched in the serializer's `create` method
# View for listing and creating results
class ResultListCreateView(generics.ListCreateAPIView):
    queryset = Result.objects.all()
    serializer_class = ResultSerializer
    permission_classes = [permissions.IsAdminOrExamController]  # Admin permission for create

# View for retrieving or updating a specific result
class ResultDetailView(generics.RetrieveUpdateAPIView):
    queryset = Result.objects.all()
    serializer_class = ResultSerializer
    permission_classes = [permissions.IsAdminOrExamController]  # Admin permission for update

# View for listing results without authentication
class ResultListView(generics.ListAPIView):
    queryset = Result.objects.all()
    serializer_class = ResultSerializer
    permission_classes = []  # No permission required for listing


#search student

class UserSearchView(APIView):
    permission_classes = [IsAuthenticated]  # Ensure only authenticated users can access this

    def get(self, request):
        # Check if the requesting user is an admin
        if not (request.user.is_admin or request.user.is_examcontroller):
            return Response({"detail": "You do not have permission to perform this action."}, status=status.HTTP_403_FORBIDDEN)

        # Get the 'department' and 'batch' query parameters
        department_name = request.query_params.get('department')
        batch = request.query_params.get('batch')

        if not department_name or not batch:
            return Response({"error": "Please provide both department and batch parameters."}, status=status.HTTP_400_BAD_REQUEST)

        try:
            # Fetch the department by name
            department = Department.objects.get(Department_name=department_name)
        except Department.DoesNotExist:
            return Response({"error": "Department not found."}, status=status.HTTP_404_NOT_FOUND)

        # Filter users by department and batch
        users = User.objects.filter(departmentName=department, batch=batch)
        
        # Serialize the filtered user data
        serializer = UserProfileSerializer(users, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
    

from rest_framework.exceptions import PermissionDenied
# User List View - Only for admins
class UserListView(generics.ListAPIView):
    queryset = User.objects.all()
    serializer_class = UserProfileSerializer
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        if not (self.request.user.is_admin or self.request.user.is_examcontroller):
            raise PermissionDenied("You do not have permission to view this resource.")
        return super().get_queryset()

# User Detail View - Only for admins
class UserDetailView(generics.RetrieveAPIView):
    queryset = User.objects.all()
    serializer_class = UserProfileSerializer
    lookup_field = 'email'  # Now looking up users by email
    permission_classes = [permissions.IsAuthenticated]

    def get_queryset(self):
        if not (self.request.user.is_admin or self.request.user.is_examcontroller):
            raise PermissionDenied("You do not have permission to view this resource.")
        return super().get_queryset()