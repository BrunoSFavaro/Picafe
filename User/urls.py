from django.urls import path
from . import views

urlpatterns = [
    path("", views.index, name="user_index"),
    path("login/", views.login_view, name="login"),
    path("logout/", views.logout_view, name="logout"),
    path("signup/", views.signup, name="signup"),
    path("profile/", views.profile, name="profile"),
    path("profile/edit", views.edit_profile, name="edit_profile")
]