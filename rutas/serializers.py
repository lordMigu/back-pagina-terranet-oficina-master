from rest_framework import serializers
from store.serializers import BodegaSerializer
from agenda.serializers import SolicitudSerializer
from user.serializers import UsuarioSerializer
from .models import Actividad, Ruta, ActividadHistorial

class ActividadHistorialSerializer(serializers.ModelSerializer):
    class Meta:
        model = ActividadHistorial
        fields = '__all__'

    class Meta:
        model = Ruta
        fields = '__all__'



class RutaSerializer(serializers.ModelSerializer):
    cuadrilla = BodegaSerializer(read_only=True)
    class Meta:
        model = Ruta
        fields = '__all__'
    
class ActividadSerializer(serializers.ModelSerializer):
    solicitud = SolicitudSerializer(read_only=True)
    usuario_mod = UsuarioSerializer(read_only=True)
    class Meta:
        model = Actividad
        fields = '__all__'