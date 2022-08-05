from django.db import models
from django.shortcuts import reverse
# Create your models here.
class Producto(models.Model):
    nombre = models.CharField(max_length=120)
    imagen = models.ImageField(upload_to='productos', default='sin_foto.png')
    precio = models.FloatField(help_text='deberá estar en Pesos Mexicanos - MXN')
    creado = models.DateTimeField(auto_now_add=True)
    actualizado = models.DateTimeField(auto_now=True)

    def obtener_url(self):
        return reverse('productos:detallesProducto', kwargs={'pk': self.pk})

    def __str__(self):
        return f"{self.nombre} - ${self.precio} - {self.creado.strftime('%d/%m/%Y')}"