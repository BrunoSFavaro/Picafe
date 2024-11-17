from django.db import models
from django.contrib.auth.models import User


# Create your models here.

class Product(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField()
    price = models.DecimalField(max_digits=10, decimal_places=2)
    image = models.ImageField(upload_to='products/')
    created_at = models.DateTimeField(auto_now_add=True)
    stock_quantity = models.IntegerField(default=0)

    def __str__(self):
        return self.name
    
class Cart(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    total_price = models.DecimalField(max_digits=10, decimal_places=2, default=0.00)
    status = models.CharField(
        max_length=20,
        choices=(
            ('open', 'Open'),
            ('finalized', 'Finalized'),
        ),
        default='open',
    )
    items = models.ManyToManyField('CartItem', blank=True)

    def calc_total_price(self):
        return sum(item.product.price * item.quantity for item in self.items.all())

    def __str__(self):
        return f'Cart #{self.id} - {self.user.username}'
    
class CartItem(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=0)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    date_added = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.quantity} x {self.product.name}'