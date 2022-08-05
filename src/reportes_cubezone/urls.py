"""reportes_cubezone URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from .views import ingresar, cerrarSesion

urlpatterns = [
    path('admin/', admin.site.urls),
    path('', include('ventas.urls', namespace='ventas')),
    path('', include('productos.urls', namespace='productos')),
    path('', include('clientes.urls', namespace='clientes')),
    path('reportes/', include('reportes.urls', namespace='reportes')),
    path('perfil/', include('perfiles.urls', namespace='perfiles')),
    path('ingresar/', ingresar, name='ingresar'),
    path('cerrarSesion/', cerrarSesion, name='cerrarSesion'),
]

urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)