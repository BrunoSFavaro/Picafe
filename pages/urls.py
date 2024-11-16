from django.urls import path
from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path("<int:product_id>", views.product, name="product"),
    path("products/", views.products, name="products"),
    path("cart/", views.view_cart, name="view_cart"),
    path("add/<int:product_id>/", views.add_to_cart, name="add_to_cart"),
    path("subtract/<int:product_id>", views.subtract_from_cart, name="subtract_from_cart"),
    path("remove/<int:item_id>/", views.remove_from_cart, name="remove_from_cart"),
    path('finalize', views.finalize_cart, name='finalize_cart')
]