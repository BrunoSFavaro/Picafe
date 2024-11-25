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