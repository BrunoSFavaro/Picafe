from django.urls import path
from superuser import views

urlpatterns = [
    path('/dashboard', views.admin_dashboard, name='admin_dashboard'),
]