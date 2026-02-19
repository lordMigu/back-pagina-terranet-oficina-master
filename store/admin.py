from django.contrib import admin
from .models import Bodega, Producto, Proveedor, Stock, Movimiento, Serie
from .models import Modelo, Marca, Unidad, MotivoMovimiento

admin.site.register(Bodega)
admin.site.register(Producto)
admin.site.register(Proveedor)
admin.site.register(Stock)
admin.site.register(Movimiento)
admin.site.register(Serie)
admin.site.register(Modelo)
admin.site.register(Marca)
admin.site.register(Unidad)
admin.site.register(MotivoMovimiento)


# Register your models here.
