from django.db import models
from django.contrib.auth.models import User
# Create your models here.
class Perfil(models.Model):
    usuario = models.OneToOneField(User, on_delete=models.CASCADE)
    info = models.TextField(default="sin información..")
    foto = models.ImageField(upload_to='fotosDeUsuarios', default='sin_foto.png')
    creado = models.DateTimeField(auto_now_add=True)
    actualizado = models.DateTimeField(auto_now=True)

    def __str__(self):
        return f"Perfil de: {self.usuario.username}"
