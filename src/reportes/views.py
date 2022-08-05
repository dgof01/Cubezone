from django.http.response import HttpResponseRedirect
from django.shortcuts import render, get_object_or_404
from .models import Perfil
from reportes.models import Reporte
from django.http import JsonResponse
from .utils import obtener_img_del_Reporte
from django.views.generic import ListView, DetailView, TemplateView

from django.conf import settings
from django.http import HttpResponse
from django.template.loader import get_template
from xhtml2pdf import pisa

from ventas.models import Venta, Orden, CSV
from productos.models import Producto
from clientes.models import Cliente
import re, datetime

from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin

# Create your views here.
class ListaDeReportes(LoginRequiredMixin, ListView):
    model = Reporte
    template_name= 'reportes/Reportes.html'

class DetallesDeReporte(LoginRequiredMixin, DetailView):
    model = Reporte
    template_name = 'reportes/DetallesReporte.html'

class SubidaDeArchivo(LoginRequiredMixin, TemplateView):
    template_name = 'reportes/SubidaDeArchivos.html'

@login_required
def crearReporte(request):
    if request.is_ajax():
        nombre = request.POST.get('nombre')
        comentarios = request.POST.get('comentarios')
        imagen = request.POST.get('imagen')

        img = obtener_img_del_Reporte(imagen)

        autor = Perfil.objects.get(usuario=request.user)
        Reporte.objects.create(nombre=nombre, comentarios=comentarios, imagen=img, autor=autor)
        return JsonResponse({'msg':'Reporte creado correctamente'})
    return JsonResponse({})

@login_required
def archivoCargado(request):
    if request.method == 'POST':
        archivoCSV = request.FILES.get('file')
        obj, creado = CSV.objects.get_or_create(nombre_archivo=archivoCSV)
        if creado:
            obj.archivoCSV = archivoCSV    
            datos = archivoCSV.readlines()
            for i, line in enumerate(datos):
                if i != 0 and i != 1:
                    cadenaSimbolos = str(line)
                    cadena = re.sub("[']","",cadenaSimbolos).replace("\\","")
                    datos = cadena
                    datos = cadena.split(",")
                    datos[0] = datos[0].replace("b","")
                    datos[5] = datos[5].replace("rn","")

                    id_orden = datos[1]
                    producto = datos[2]
                    cantidad = int(datos[3])
                    cliente = datos[4]
                    fecha = datos[5].split("/")
                    creado = datetime.date(int(fecha[2]),int(fecha[1]),int(fecha[0]))
                    try:
                        obj_producto = Producto.objects.get(nombre__iexact=producto)
                    except Producto.DoesNotExist:
                        obj_producto = None

                    if obj_producto is not None:
                        obj_cliente, _ = Cliente.objects.get_or_create(nombre=cliente) 
                        obj_vendedor = Perfil.objects.get(usuario=request.user)
                        obj_orden = Orden.objects.create(producto=obj_producto, cantidad=cantidad, creado=creado)
                        obj_venta, _ = Venta.objects.get_or_create(id_orden=id_orden, cliente=obj_cliente, vendedor=obj_vendedor, creado=creado)
                        obj_venta.ordenes.add(obj_orden)
                        obj_venta.save()
            obj.save()
            return JsonResponse({'ex': False})
        else:
            return JsonResponse({'ex': True})
    return HttpResponse()

@login_required
def crearPDF(request, nombre):
    template_path = 'reportes/pdf.html'
    obj = get_object_or_404(Reporte, nombre=nombre)
    context = {'obj': obj}

    response = HttpResponse(content_type='application/pdf')
    
    nombreArchivo = f'filename=reporte-{nombre}.pdf'

    response['Content-Disposition'] = nombreArchivo

    template = get_template(template_path)
    html = template.render(context)

    pisa_status = pisa.CreatePDF(
       html, dest=response)

    if pisa_status.err:
       return HttpResponse('Algo ha salido mal <pre>' + html + '</pre>')
    return response

@login_required
def eliminarReporte(request, nombre):
    reporte = Reporte.objects.get(nombre=nombre)
    reporte.delete()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))