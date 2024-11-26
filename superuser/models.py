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
    