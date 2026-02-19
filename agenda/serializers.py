from rest_framework import serializers
from .models import Solicitud, TipoSolicitud, Kit, KitXProducto,HojadeTrabajo,Wisphub
from user.serializers import UsuarioSerializer,UsuarioWishupApiSerializer

class TipoSolicitudSerializer(serializers.ModelSerializer):
    class Meta:
        model = TipoSolicitud
        fields = '__all__'

class KitSerializer(serializers.ModelSerializer):
    class Meta:
        model = Kit
        fields = '__all__'

class KitXProductoSerializer(serializers.ModelSerializer):
    class Meta:
        model = KitXProducto
        fields = '__all__'

class SolicitudSerializer(serializers.ModelSerializer):
    tiposolicitud = TipoSolicitudSerializer(read_only=True)
    usuario_solicitud = UsuarioSerializer(read_only=True)
    usuario_revision = UsuarioSerializer(read_only=True)
    usuario_agendo = UsuarioSerializer(read_only=True)

    class Meta:
        model = Solicitud
        fields = '__all__'

class HojadeTrabajoSerializer(serializers.ModelSerializer):
    class Meta:
        model = HojadeTrabajo
        fields = '__all__'

class WisphubSerializer(serializers.ModelSerializer):
    usuario_creacion = UsuarioSerializer(read_only=True)
    class Meta:
        model = Wisphub
        fields = '__all__'