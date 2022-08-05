from .models import Venta
from django.db.models.signals import m2m_changed
from django.dispatch import receiver

@receiver(m2m_changed, sender=Venta.ordenes.through)
def calcular_precio_total(sender, instance, action, **kwargs):
    # print('action', action)
    precio_total = 0
    if action == 'post_add' or action=='post_remove':
        for item in instance.obtener_ordenes():
            precio_total += item.precio
    
    instance.precio_total = precio_total
    instance.save()