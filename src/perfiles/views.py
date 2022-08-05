from django.shortcuts import render
from .models import Perfil
from .forms import Formulario_Perfil

from django.contrib.auth.decorators import login_required
# Create your views here.

@login_required
def perfil(request):
    perfil = Perfil.objects.get(usuario=request.user)
    form = Formulario_Perfil(request.POST or None, request.FILES or None, instance=perfil)
    actualizado = False

    if form.is_valid():
        form.save()
        actualizado = True

    datos = {
        'perfil': perfil,
        'formulario': form,
        'actualizado':actualizado,
    }
    return render(request, 'perfiles/Perfil.html', datos)