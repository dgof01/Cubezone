# Generated by Django 3.2.5 on 2021-07-31 01:29

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('productos', '0001_initial'),
        ('ventas', '0002_rename_orden_ordenes'),
    ]

    operations = [
        migrations.RenameModel(
            old_name='Ordenes',
            new_name='Orden',
        ),
    ]
