from django.urls import path
from .views import *
urlpatterns = [
    path('register/', UserRegistrationView.as_view(), name='register'),
    path('verify-email/', VerifyEmailView.as_view(), name='verify-email'),
    path('login/', UserLoginView.as_view(), name='login'),
    path('userprofile/', UserProfileView.as_view(), name='userprofile'),
    path('update_profile/<str:pk>/', UpdateProfileView.as_view(), name='auth_update_profile'),
    path('changepassword/', UserChangePasswordView.as_view(), name='changepassword'),
    path('send-reset-password-email/', SendPasswordResetEmailView.as_view(), name='send-reset-password-email'),
    path('reset-password/<email>/<token>/', UserPasswordResetView.as_view(), name='reset-password'),
    path('delete_user/', delete_user, name='delete_user'),
    path('Contact/feedback', ContactAPIView.as_view()),
    path('news/', CreateNewsView.as_view(), name='News-list-create'),
    path('news/<int:id>/', NewsDetailView.as_view(), name='News-detail'),    
    path('notice/', CreateNoticeView.as_view(), name='Notice-list-create'),
    path('notice/<int:id>/', NoticeDetailView.as_view(), name='Notice-detail'),
    path('faculty_members/', Faculty_MemberAPIView.as_view()),

    path('bscincse/', CreatebscincseView.as_view(), name='bscincse-list-create'),
    path('bscincse/<int:id>/', bscincseDetailView.as_view(), name='bscincse-detail'),

    path('bscinsoftware/', CreatebscinsoftwareView.as_view(), name='bscinsoftware-list-create'),
    path('bscinsoftware/<int:id>/', bscinsoftwareDetailView.as_view(), name='bscinsoftware-detail'),

    path('bscineee/', CreatebscineeeView.as_view(), name='bscineee-list-create'),
    path('bscineee/<int:id>/', bscineeeDetailView.as_view(), name='bscineee-detail'),

    path('bba/', CreatebbaView.as_view(), name='bba-list-create'),
    path('bba/<int:id>/', bbaDetailView.as_view(), name='bba-detail'),

    path('bus-schedule/', BusScheduleView.as_view(), name='bus_schedule'),

    path('results/create/', ResultCreateView.as_view(), name='result-create'),  # Admin only
    path('results/', ResultListView.as_view(), name='result-list'),  # Public access
    path('all-students-and-courses/', ResultListCreateView.as_view(), name='result-list-create'),  # Admin only for creating
    path('results/<int:id>/', ResultDetailView.as_view(), name='result-detail'),  # Admin only

    path('user/search/', UserSearchView.as_view(), name='user-search'),

    path('courses/', CourseListView.as_view(), name='course-list'),

    # List view for admin users
    path('admin/users/', UserListView.as_view(), name='user-list'),
    
    # Detail view for specific user using email as the lookup
    path('admin/users/<str:email>/', UserDetailView.as_view(), name='user-detail'),
]
