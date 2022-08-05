from django.urls import path
from .views import perfil

app_name = 'perfiles'

urlpatterns = [
    path('', perfil, name='perfil')
]