from .models import Perfil
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.dispatch import receiver

@receiver(post_save, sender=User)
def guardar_crear_perfil(sender, instance, created, **kwargs):
    # print(sender)
    # print(instance)
    # print(created)
    if created:
        Perfil.objects.create(usuario=instance)