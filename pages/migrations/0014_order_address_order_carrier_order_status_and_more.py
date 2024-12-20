# Generated by Django 4.2.16 on 2024-11-27 16:45

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('superuser', '0005_alter_discount_discount_type'),
        ('User', '0010_delete_discount'),
        ('pages', '0013_delete_feedback'),
    ]

    operations = [
        migrations.AddField(
            model_name='order',
            name='address',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='User.useraddress'),
        ),
        migrations.AddField(
            model_name='order',
            name='carrier',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='superuser.carrier'),
        ),
        migrations.AddField(
            model_name='order',
            name='status',
            field=models.CharField(choices=[('draft', 'Rascunho'), ('confirmed', 'Confirmado')], default='draft', max_length=10),
        ),
        migrations.AlterField(
            model_name='order',
            name='total_price',
            field=models.DecimalField(decimal_places=2, max_digits=10),
        ),
    ]
