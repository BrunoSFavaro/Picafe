# Generated by Django 4.2.16 on 2024-11-23 03:18

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('User', '0003_userpayments'),
    ]

    operations = [
        migrations.AlterField(
            model_name='userpayments',
            name='payment_type',
            field=models.CharField(choices=[('Cartão de Crédito', 'Cartão de Crédito'), ('Debit Card', 'Cartão de Débito'), ('Pix', 'Pix')], default='Cartão de Crédito', max_length=50),
        ),
    ]
