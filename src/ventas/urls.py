from django.urls import path
from django.urls.resolvers import URLPattern
from .views import (
    inicio,
    agregarReporte,
    ListaDeVentas,
    DetallesDeVenta,
    eliminar_Venta
)

app_name = 'ventas'

urlpatterns = [
    path('', inicio, name='inicio'),
    path('agregarReporte/', agregarReporte, name='agregarReporte'),
    path('ventas/', ListaDeVentas.as_view(), name='ventas'),
    path('venta/<pk>', DetallesDeVenta.as_view(), name='detalles'),
    path('<id_orden>/eliminar/', eliminar_Venta, name='eliminar'),
] 