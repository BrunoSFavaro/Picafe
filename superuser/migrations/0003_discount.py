# Generated by Django 4.2.16 on 2024-11-26 21:46

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('superuser', '0002_carrier'),
    ]

    operations = [
        migrations.CreateModel(
            name='Discount',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('code', models.CharField(max_length=20, unique=True)),
                ('description', models.TextField(blank=True, null=True)),
                ('discount_type', models.CharField(choices=[('fixo', 'Fixo'), ('percentual', 'Percentual')], default='percentual', max_length=10)),
                ('value', models.DecimalField(decimal_places=2, max_digits=10)),
                ('start_date', models.DateTimeField()),
                ('end_date', models.DateTimeField()),
                ('active', models.BooleanField(default=True)),
            ],
        ),
    ]
