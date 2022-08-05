from django.db import models
from perfiles.models import Perfil
from django.urls import reverse

# Create your models here.
class Reporte(models.Model):
    nombre = models.CharField(max_length=120)
    imagen = models.ImageField(upload_to='reportes', blank=True)
    comentarios = models.TextField()
    autor = models.ForeignKey(Perfil, on_delete=models.CASCADE)
    creado = models.DateTimeField(auto_now_add=True)
    actualizado = models.DateTimeField(auto_now=True)

    def obtener_url(self):
        return reverse('reportes:DetalleDeReporte', kwargs={'pk': self.pk})

    def __str__(self):
        return str(self.nombre)

    class Meta:
        ordering = ('-creado',)