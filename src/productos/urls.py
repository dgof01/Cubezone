from django.urls import path
from django.urls.resolvers import URLPattern
from .views import (
    listaDeProductos,
    agregarProducto,
    detallesDeProducto,
    crearProducto,
    eliminarProducto,
)

app_name = 'productos'

urlpatterns = [
    path('productos/', listaDeProductos, name='productos'),
    path('agregarProducto/', agregarProducto, name='agregarProducto'),
    path('productos/agregar/', crearProducto, name='crearProducto'),
    path('productos/<pk>/', detallesDeProducto, name='detallesProducto'),
    path('<nombreProducto>/eliminar', eliminarProducto, name='eliminarProducto'),
]