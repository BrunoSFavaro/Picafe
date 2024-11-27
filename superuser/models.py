from django.db import models

# Create your models here.
class Category(models.Model):
    name = models.CharField(max_length=50)
    description = models.CharField(max_length=255)
    is_active = models.BooleanField(default=True)
    created_at =  models.DateTimeField(auto_now_add=True)

    class Meta:
        ordering = ['name']

    def __str__(self):
        return self.name
    

class Carrier(models.Model):
    name = models.CharField(max_length=100, verbose_name="Nome da Transportadora")
    cnpj = models.CharField(max_length=14, unique=True, verbose_name="CNPJ")
    phone = models.CharField(max_length=15, blank=True, null=True, verbose_name="Telefone de Contato")
    email = models.EmailField(max_length=255, blank=True, null=True, verbose_name="E-mail de Contato")
    created_at = models.DateTimeField(auto_now_add=True, verbose_name="Data de Criação")
    updated_at = models.DateTimeField(auto_now=True, verbose_name="Última Atualização")

    class Meta:
        verbose_name = "Transportadora"
        verbose_name_plural = "Transportadoras"
        ordering = ["name"]

    def __str__(self):
        return f"{self.name} - CNPJ: {self.cnpj}"
    
class Discount(models.Model):
    code = models.CharField(max_length=20, unique=True)  # Código único para o cupom
    description = models.TextField(blank=True, null=True)  # Descrição opcional do cupom
    discount_type = models.CharField(
        max_length=10,
        choices=[('fixed', 'Fixo'), ('percentage', 'Percentual')],
        default='percentage'
    )
    value = models.DecimalField(max_digits=10, decimal_places=2)  # Valor do desconto
    start_date = models.DateField()  # Data de início da validade
    end_date = models.DateField()  # Data de término da validade
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