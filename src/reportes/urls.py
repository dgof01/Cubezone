from django.urls import path
from .views import (
    crearReporte,
    ListaDeReportes,
    DetallesDeReporte,
    crearPDF,
    SubidaDeArchivo,
    archivoCargado,
    eliminarReporte
) 

app_name = 'reportes'

urlpatterns = [
    path('', ListaDeReportes.as_view(), name='Reportes'),    
    path('guardar/', crearReporte, name='crearReporte'),
    path('archivoCargado/', archivoCargado, name='archivoCargado'),
    path('subidaArchivo/', SubidaDeArchivo.as_view(), name='SubidaDeArchivo'),
    path('<pk>/', DetallesDeReporte.as_view(), name='DetalleDeReporte'),
    path('<nombre>/pdf/', crearPDF, name='PDF'),
    path('<nombre>/eliminar/', eliminarReporte, name='Eliminar'),
]
