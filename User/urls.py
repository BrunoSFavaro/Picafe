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
    path("profile/payments/", views.view_payments, name="payments"),
    path("profile/payments/add/", views.add_payment, name="add_payment"),
    path("profile/payments/edit/<int:payment_id>/", views.edit_payment, name="edit_payment"),
    path("profile/payments/delete/<int:payment_id>/", views.delete_payment, name="delete_payment"),
    path("profile/feedbacks/", views.view_feedbacks, name="feedbacks"),
    path("profile/feedbacks/add/<int:product_id>", views.make_feedback, name="make_feedback"),
    path("profile/feedbacks/edit/<int:feedback_id>", views.edit_feedback, name="edit_feedback")
]