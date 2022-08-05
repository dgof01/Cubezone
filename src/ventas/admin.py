from django.contrib import admin
from .models import Orden, Venta, CSV
# Register your models here.
admin.site.register(Orden)
admin.site.register(Venta)
admin.site.register(CSV)
