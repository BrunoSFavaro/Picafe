from django.urls import path
from . import views

urlpatterns = [
    path("", views.index, name="user_index"),
    path("login/", views.login_view, name="login"),
    path("logout/", views.logout_view, name="logout"),
    path("signup/", views.signup, name="signup"),
    path("profile/", views.profile, name="profile"),
    path("profile/edit", views.edit_profile, name="edit_profile"),
    path("profile/addresses", views.view_addresses, name="view_addresses"),
    path("profile/addaddress", views.add_address, name="add_address"),
    path("profile/edit_address/<int:address_id>/", views.edit_address, name="edit_address"),
    path("profile/delete_address/<int:address_id>/", views.delete_address, name="delete_address"),
]