from django.db import models
from productos.models import Producto
from clientes.models import Cliente
from perfiles.models import Perfil
from django.utils import timezone
from .utils import generar_codigo
from django.shortcuts import reverse
# Create your models here.

class Orden(models.Model):
    producto = models.ForeignKey(Producto, on_delete=models.CASCADE)
    cantidad = models.PositiveIntegerField()
    precio = models.FloatField(blank=True)
    creado = models.DateTimeField(blank=True)

    def save(self, *args, **kwargs):
        self.precio = self.producto.precio * self.cantidad
        return super().save(*args, **kwargs)

    def get_id_ventas(self):
        id_venta = self.venta_set.first()
        return id_venta.id
    
    def obtener_cliente(self):
        cliente = self.venta_set.first()
        return cliente.cliente.nombre

    def __str__(self):
        return f"id: {self.id} - producto: {self.producto.nombre} - cantidad: {self.cantidad}"

class Venta(models.Model):
    id_orden = models.CharField(max_length=12, blank=True)
    ordenes = models.ManyToManyField(Orden)
    precio_total = models.FloatField(blank=True, null=True)
    cliente = models.ForeignKey(Cliente, on_delete=models.CASCADE)
    vendedor = models.ForeignKey(Perfil, on_delete=models.CASCADE)
    creado = models.DateTimeField(blank=True)
    actualizado = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"Venta {self.id_orden}: ${self.precio_total}"

    def obtener_url(self):
        return reverse('ventas:detalles', kwargs={'pk': self.pk})

    def save(self, *args, **kwargs):
        if self.id_orden == "":
            self.id_orden = generar_codigo()
        if self.creado is None:
            self.creado = timezone.now()
        return super().save(*args, **kwargs)

    def obtener_ordenes(self):
        return self.ordenes.all()

class CSV(models.Model):
    nombre_archivo = models.CharField(max_length=120, null=True)
    archivo_CSV = models.FileField(upload_to='csvs', null=True)
    creado = models.DateTimeField(auto_now_add=True)
    actualizado = models.DateTimeField(auto_now=True)

    def __str__(self):
        return str(self.nombre_archivo)