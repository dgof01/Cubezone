from django.http.response import HttpResponseRedirect, JsonResponse
from django.shortcuts import render
from .models import Cliente
from .forms import AgregarCliente, Formulario_Cliente, Formulario_Cliente
from django.contrib.auth.decorators import login_required
from django.contrib.auth.mixins import LoginRequiredMixin
# Create your views here.

@login_required    
def listaDeClientes(request):
    clientes = Cliente.objects.all()
    usuario = request.user
    formulario = AgregarCliente()
    datos = {
        'usuario':usuario,
        'clientes':clientes,
        'formulario':formulario
    }
    return render(request, 'clientes/Clientes.html', datos)

@login_required    
def agregarCliente(request):
    formulario = AgregarCliente()
    datos = {
        'formulario':formulario
    }
    return render(request, 'clientes/AgregarCliente.html', datos)

@login_required
def detallesDeCliente(request, **kwargs):
    pk = kwargs.get('pk')
    obj = Cliente.objects.get(pk=pk)
    usuario = request.user
    cliente = Cliente.objects.get(nombre=obj.nombre)
    form = Formulario_Cliente(request.POST or None, request.FILES or None, instance=cliente)
    actualizado = False

    if form.is_valid():
        form.save()
        actualizado = True
    datos = {
        'cliente': cliente,
        'form': form,
        'actualizado':actualizado,
        'usuario':usuario
    }
    return render(request, 'clientes/DetallesCliente.html',datos)

@login_required
def crearCliente(request):
    if request.is_ajax():
        nombre = request.POST.get('nombre')
        primerApellido = request.POST.get('primerApellido')
        segundoApellido = request.POST.get('segundoApellido')
        correo = request.POST.get('correo')
        Cliente.objects.create(nombre=nombre, primerApellido=primerApellido, segundoApellido=segundoApellido,correo=correo)
        return JsonResponse({'msg':'Cliente Agregado'})
    return JsonResponse({})

@login_required
def eliminarCliente(request, nombreCliente):
    cliente = Cliente.objects.get(nombre=nombreCliente)
    cliente.delete()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))