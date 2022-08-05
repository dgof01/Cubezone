from django.http.response import HttpResponseRedirect, JsonResponse
from django.shortcuts import render
from .forms import Formulario_Producto, AgregarProducto
from django.db import models
from django.views.generic import ListView, DetailView
from .models import Producto
from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin

# Create your views here.

@login_required    
def listaDeProductos(request):
    productos = Producto.objects.all()
    usuario = request.user
    formularioProducto = AgregarProducto()
    data = {
        'usuario':usuario,
        'productos':productos,
        'formularioProducto':formularioProducto
    }
    return render(request, 'productos/Productos.html', data)

def agregarProducto(request):
    formularioProducto = AgregarProducto()
    data = {
        'formularioProducto':formularioProducto
    }
    return render(request, 'productos/AgregarProducto.html', data)

@login_required
def detallesDeProducto(request, **kwargs):
    pk = kwargs.get('pk')
    obj = Producto.objects.get(pk=pk)
    usuario = request.user
    producto = Producto.objects.get(nombre=obj.nombre)
    form = Formulario_Producto(request.POST or None, request.FILES or None, instance=producto)
    actualizado = False

    if form.is_valid():
        form.save()
        actualizado = True
    datos = {
        'producto': producto,
        'form': form,
        'actualizado':actualizado,
        'usuario':usuario
    }
    return render(request, 'productos/DetallesProducto.html',datos)

@login_required
def crearProducto(request):
    if request.is_ajax():
        nombre = request.POST.get('nombre')
        precio = request.POST.get('precio')
        Producto.objects.create(nombre=nombre, precio=precio)
        return JsonResponse({'msg':'Producto Agregado'})
    return JsonResponse({})

@login_required
def eliminarProducto(request, nombreProducto):
    producto = Producto.objects.get(nombre=nombreProducto)
    producto.delete()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))