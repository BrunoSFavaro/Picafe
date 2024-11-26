from django.db import models
from pages.models import Product
from django.contrib.auth.models import User
from django.core.validators import MinValueValidator, MaxValueValidator

# Create your models here.
class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    profile_image = models.ImageField(upload_to='profile_images/', blank=True, null=True)

    def __str__(self):
        return self.user.username

class UserAddress(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="addresses")
    country = models.CharField(max_length=50)
    state = models.CharField(max_length=50)
    city = models.CharField(max_length=50)
    cep = models.CharField(max_length=20)
    street = models.CharField(max_length=255)
    is_default = models.BooleanField(default=False)

    def save(self, *args, **kwargs):
        if self.is_default:
            UserAddress.objects.filter(user=self.user, is_default=True).update(is_default=False)
        super().save(*args, **kwargs)

    def __str__(self):
        return f"{self.user.username} - {self.street}, {self.city}"
    
class UserPayments(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name="payments")
    payment_type = models.CharField(
        max_length=50,
        choices=[('Cartão de Crédito', 'Cartão de Crédito'), ('Cartão de Débito', 'Cartão de Débito')],
        default='Cartão de Crédito',
    )
    card_holder_name = models.CharField(max_length=100, blank=True, null=True)
    card_number = models.CharField(max_length=20, blank=True, null=True)
    expiration_date = models.DateField(blank=True, null=True)
    is_default = models.BooleanField(default=False)  # Define como método principal
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def save(self, *args, **kwargs):
        if self.is_default:
            # Atualiza os outros métodos para não serem padrão
            UserPayments.objects.filter(user=self.user, is_default=True).update(is_default=False)
        super().save(*args, **kwargs)

    def __str__(self):
        return f"{self.user.username} - {self.payment_type}"

    class Meta:
        verbose_name = "Método de Pagamento"
        verbose_name_plural = "Métodos de Pagamento"


class Feedback(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, null=True, blank=True)
    product = models.ForeignKey(Product, on_delete=models.CASCADE, null=True, blank=True)
    feedback_text = models.TextField()
    rating = models.IntegerField(
        validators=[MinValueValidator(0), MaxValueValidator(5)],
        null=True,
        blank=True,
        help_text="Nota de 0 a 5"
    )
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.product} {self.user}'s feedback. Rating {self.rating}/5"

class Discount(models.Model):
    code = models.CharField(max_length=20, unique=True)  # Código único para o cupom
    description = models.TextField(blank=True, null=True)  # Descrição opcional do cupom
    discount_type = models.CharField(
        max_length=10,
        choices=[('fixo', 'Fixo'), ('percentual', 'Percentual')],
        default='percentual'
    )
    value = models.DecimalField(max_digits=10, decimal_places=2)  # Valor do desconto
    start_date = models.DateTimeField()  # Data de início da validade
    end_date = models.DateTimeField()  # Data de término da validade
    active = models.BooleanField(default=True)  # Se o cupom está ativo ou não

    def is_valid(self):
        """
        Verifica se o cupom é válido com base na data, uso e status.
        """
        from django.utils.timezone import now
        if not self.active:
            return False
        if self.end_date < now():
            return False
        if self.usage_limit is not None and self.usage_count >= self.usage_limit:
            return False
        return True

    def __str__(self):
        return self.code

