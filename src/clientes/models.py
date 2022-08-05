from django.db import models
from django.shortcuts import reverse
# Create your models here.
class Cliente(models.Model):
    nombre = models.CharField(max_length=120)
    primerApellido = models.CharField(max_length=120, default='')
    segundoApellido = models.CharField(max_length=120, default='')
    correo = models.EmailField(max_length = 254, default='')
    foto = models.ImageField(upload_to='clientes', default='sin_foto.png')

    def obtener_url(self):
        return reverse('clientes:detallesCliente', kwargs={'pk': self.pk})

    def __str__(self):
        return str(self.nombre + " " + self.primerApellido)