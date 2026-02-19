from rest_framework import serializers
from .models import Combustible, Recepcion, MotivoGasto, TipoRevision, Vehiculo, Revision
from user.serializers import UsuarioSerializer
from store.serializers import BodegaSerializer

class MotivoGastoSerializer(serializers.ModelSerializer):
    class Meta:
        model = MotivoGasto
        fields = '__all__'



class CombustibleSerializer(serializers.ModelSerializer):
    id_tecnico = UsuarioSerializer(read_only=True)
    id_cuadrilla= BodegaSerializer(read_only=True)
    motivo_gasto = MotivoGastoSerializer(read_only=True)
    class Meta:
        model = Combustible
        fields = '__all__'

class RecepcionSerializer(serializers.ModelSerializer):
    id_tecnico = UsuarioSerializer(read_only=True)

    class Meta:
        model = Recepcion
        fields = '__all__'


class TipoRevisionSerializer(serializers.ModelSerializer):
    class Meta:
        model = TipoRevision
        fields = '__all__'

class VehiculoSerializer(serializers.ModelSerializer):
    usuario = UsuarioSerializer(read_only=True)
    cuadrilla= BodegaSerializer(read_only=True)
    class Meta:
        model = Vehiculo
        fields = '__all__'

class RevisionSerializer(serializers.ModelSerializer):
    usuario = UsuarioSerializer(read_only=True)
    vehiculo = VehiculoSerializer(read_only=True)
    tipo_revision = TipoRevisionSerializer(read_only=True)
    class Meta:
        model = Revision
        fields = '__all__'