from django.http.response import HttpResponseRedirect
from django.shortcuts import render
from django.views.generic import ListView, DetailView
from clientes.models import Cliente
from reportes.models import Reporte
from productos.models import Producto

from .models import Venta
from .forms import Formulario_BusquedaDeVentas
from reportes.forms import Formulario_Reporte
import pandas as pd
from .utils import obtener_grafica, obtener_cliente_desde_id, obtener_vendedor_desde_id

from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin

# Create your views here.
@login_required
def inicio(request):
    ventas = Venta.objects.all()
    ventasPrecioTotal = 0
    for venta in ventas:
        ventasPrecioTotal = ventasPrecioTotal + venta.precio_total
    productos = Producto.objects.all()
    productosPrecioTotal = 0
    for producto in productos:
        productosPrecioTotal = productosPrecioTotal + producto.precio
    clientes = Cliente.objects.all()
    reportes = Reporte.objects.all()
    datos = {
        'cantidadVentas':len(ventas),
        'ventasPrecioTotal':ventasPrecioTotal,
        'cantidadProductos':len(productos),
        'productosPrecioTotal':productosPrecioTotal,
        'cantidadClientes':len(clientes),
        'cantidadReportes':len(reportes)
    }
    return render(request, 'ventas/Inicio.html', datos)



@login_required
def agregarReporte(request):
    df_ventas = None
    df_ordenes = None
    df_merged = None
    df = None
    grafica = None
    sin_datos = None
    formulario_Ventas = Formulario_BusquedaDeVentas(request.POST or None)
    formulario_Reporte = Formulario_Reporte()
    if request.method == 'POST':
        fechaInicio = request.POST.get('fechaInicio')
        fechaFin = request.POST.get('fechaFin')
        tipoGrafica = request.POST.get('tipoGrafica')
        resultados = request.POST.get('resultados')
        
        ventas_rango = Venta.objects.filter(creado__date__lte=fechaFin, creado__date__gte=fechaInicio)
        if len(ventas_rango) > 0 :
            df_ventas = pd.DataFrame(ventas_rango.values())   
            print(df_ventas)           
            df_ventas['cliente_id'] = df_ventas['cliente_id'].apply(obtener_cliente_desde_id)
            df_ventas['vendedor_id'] = df_ventas['vendedor_id'].apply(obtener_vendedor_desde_id)
            df_ventas['creado'] = df_ventas['creado'].apply(lambda x: x.strftime('%Y-%m-%d'))
            df_ventas['actualizado'] = df_ventas['actualizado'].apply(lambda x: x.strftime('%Y-%m-%d'))
            df_ventas.rename({'cliente_id':'Cliente','vendedor_id':'Vendedor','id':'Id_Venta','id_orden':'Orden','creado':'Creado','actualizado':'Actualizado','precio_total':'Precio Total'},axis=1, inplace=True)
            datos_ordenes = []
            for venta in ventas_rango:
                for pos in venta.obtener_ordenes():
                    obj = {
                        'Id_Orden':pos.id,
                        'Producto':pos.producto.nombre,
                        'Cantidad':pos.cantidad,
                        'Precio':pos.precio,
                        'Id_Venta':pos.get_id_ventas(),
                    }
                    datos_ordenes.append(obj)
            df_ordenes = pd.DataFrame(datos_ordenes)
            print(df_ordenes)
            df_merged = pd.merge(df_ventas, df_ordenes, on='Id_Venta')
            print(df_merged)
            df = df_merged.groupby('Orden', as_index=False)['Precio'].agg('sum')

            grafica = obtener_grafica(tipoGrafica, df_ventas, resultados)
            df_ventas = df_ventas.to_html()
            df_ordenes = df_ordenes.to_html()
            df_merged = df_merged.to_html()
            df = df.to_html()
        else:
            sin_datos = 'No hay datos disponibles en este rango de fechas'
    context = {
        'formulario_Ventas':formulario_Ventas,
        'formulario_Reporte':formulario_Reporte,
        'df_ventas': df_ventas,
        'df_ordenes': df_ordenes,
        'df_merged':df_merged,
        'df':df,
        'grafica':grafica,
        'sin_datos':sin_datos,
    }
    return render(request, 'ventas/AgregarReporte.html', context)

class ListaDeVentas(LoginRequiredMixin, ListView):
    model = Venta
    template_name = 'ventas/ListaVentas.html' 

class DetallesDeVenta(LoginRequiredMixin, DetailView):
    model = Venta
    template_name = 'ventas/DetallesVenta.html'

@login_required
def eliminar_Venta(request, id_orden):
    venta = Venta.objects.get(id_orden=id_orden)
    venta.delete()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))