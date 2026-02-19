from django.contrib import admin


from .models import Solicitud, TipoSolicitud, Kit, KitXProducto

admin.site.register(Solicitud)
admin.site.register(TipoSolicitud)
admin.site.register(Kit)
admin.site.register(KitXProducto)
# Register your models here.
