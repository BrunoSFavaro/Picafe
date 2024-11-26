from django.urls import path
from superuser import views

urlpatterns = [
    path('', views.admin_profile, name="admin_profile"),
    path('dashboard/', views.admin_dashboard, name='admin_dashboard'),
    path('add_product/', views.add_product, name='add_product'),
    path('edit_product/<int:product_id>/', views.edit_product, name='edit_product'),
    path('delete_product/<int:product_id>/', views.delete_product, name="delete_product"),
    path('categories/', views.view_categories, name="categories"),
    path('categories/add/', views.add_category, name='add_category'),
    path('categories/edit/<int:category_id>/', views.edit_category, name='edit_category'),
    path('categories/delete/<int:category_id>/', views.delete_category, name="delete_category"),
    path('carries/', views.view_carries, name="carries"),
    path('carries/add/', views.add_carrier, name="add_carrier"),
    path('carries/edit/<int:carrier_id>/', views.edit_carrier, name="edit_carrier"),
    path('carries/delete/<int:carrier_id>/', views.delete_carrier, name="delete_carrier"),
    path('discounts/', views.view_discounts, name="discounts"),
    
]