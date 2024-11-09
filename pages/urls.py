from django.urls import path
from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path("<int:product_id>", views.product, name="product"),
    path("products/", views.products, name="products")
]