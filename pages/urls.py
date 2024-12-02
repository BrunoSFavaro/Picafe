from django.urls import path
from . import views

urlpatterns = [
    path("", views.index, name="index"),
    path("products/<int:product_id>", views.product, name="product"),
    path("products/", views.products, name="products"),
    path("cart/", views.view_cart, name="view_cart"),
    path("add/<int:product_id>/", views.add_to_cart, name="add_to_cart"),
    path("subtract/<int:product_id>", views.subtract_from_cart, name="subtract_from_cart"),
    path("remove/<int:item_id>/", views.remove_from_cart, name="remove_from_cart"),
    path("checkout/", views.checkout, name="checkout"),
    path("checkout/applydiscount", views.apply_discount, name="apply_discount"),
    path("checkout/removediscount", views.remove_discount, name="remove_discount"),
    path("checkout/payment", views.checkout_payment, name="checkout_payment"),
    path('finalize', views.finalize_cart, name='finalize_cart'),
    path('historic', views.historic, name="historic"),
    path('order/<int:order_id>', views.order_details, name="order"),
    path('wishlist/', views.view_wishlist, name="wishlist"),
    path('wishlist/add/<int:product_id>/', views.add_wishlist, name="add_wishlist"),
    path('wishlist/remove/<int:product_id>/', views.remove_from_wishlist, name="remove_from_wishlist"),
]