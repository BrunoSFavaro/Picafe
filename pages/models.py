from django.db import models
from django.contrib.auth.models import User
from superuser.models import Category



# Create your models here.
class Product(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField()
    category = models.ForeignKey(Category, on_delete=models.CASCADE, related_name='products', null=True) #null=True é temporário, somente para definir as categorias dos produtos já criados
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

    def calc_total_price(self):
        self.total_price = sum(item.product.price * item.quantity for item in self.items.all())
        self.save()

    def __str__(self):
        return f'Cart #{self.id} - {self.user.username}'
    
class CartItem(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=0)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    cart = models.ForeignKey(Cart, on_delete=models.CASCADE, null=True, blank=True, related_name="items")
    date_added = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'{self.quantity} x {self.product.name}'
    
class Historic(models.Model):
    order = models.ForeignKey('Order', on_delete=models.CASCADE, related_name='historico_items')
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    quantity = models.PositiveIntegerField(default=0)
    date_added = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'Order #{self.id} - {self.quantity} x {self.product.name}'


class Order(models.Model):
    STATUS_CHOICES = [
        ('draft', 'Rascunho'),
        ('confirmed', 'Confirmado'),
    ]

    user = models.ForeignKey(User, on_delete=models.CASCADE)
    address = models.ForeignKey('User.UserAddress', on_delete=models.SET_NULL, null=True, blank=True)
    carrier = models.ForeignKey('superuser.Carrier', on_delete=models.SET_NULL, null=True, blank=True)
    total_price = models.DecimalField(max_digits=10, decimal_places=2)
    status = models.CharField(max_length=10, choices=STATUS_CHOICES, default='draft')
    created_at = models.DateTimeField(auto_now_add=True)

    def confirm(self):
        """Confirma o pedido e atualiza o estoque"""
        self.status = 'confirmed'
        self.save()

    def __str__(self):
        return f'Order #{self.id} - {self.user.username}'
    

class Wishlist(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    added_at = models.DateTimeField(auto_now_add=True)

    class Meta:
        unique_together = ('user', 'product')  # Evita duplicar o mesmo produto para um usuário
        ordering = ['-added_at']  # Ordena pelos mais recentes

    def __str__(self):
        return f"{self.user.username}'s wishlist - {self.product.name}"

