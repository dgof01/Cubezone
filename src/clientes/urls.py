from django.urls import path
from django.urls.resolvers import URLPattern
from .views import (
    listaDeClientes,
    agregarCliente,
    detallesDeCliente,
    crearCliente,
    eliminarCliente,
)

app_name = 'clientes'

urlpatterns = [
    path('clientes/', listaDeClientes, name='clientes'),
    path('agregarCliente/', agregarCliente, name='agregarCliente'),
    path('clientes/agregarCliente/', crearCliente, name='crearCliente'),
    path('clientes/<pk>/', detallesDeCliente, name='detallesCliente'),
    path('<nombreCliente>/eliminarCliente', eliminarCliente, name='eliminarCliente'),
]