# Generated by Django 3.2.5 on 2021-07-31 01:28

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('productos', '0001_initial'),
        ('ventas', '0001_initial'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Orden',
            new_name='Ordenes',
        ),
    ]
