from rest_framework import serializers
from user.serializers import UsuarioSerializer, Usuario
from .models import Bodega, Producto, Proveedor, Stock, Movimiento, Marca, Modelo, Unidad
from .models import Serie, MotivoMovimiento, Transferencia
class BodegaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Bodega
        fields = '__all__'
    
class MarcaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Marca
        fields = '__all__'

class ModeloSerializer(serializers.ModelSerializer):
    class Meta:
        model = Modelo
        fields = '__all__'

class UnidadSerializer(serializers.ModelSerializer):
    class Meta:
        model = Unidad
        fields = '__all__'

class ProductoSerializer(serializers.ModelSerializer):
    marca = MarcaSerializer(read_only=True)
    modelo = ModeloSerializer(read_only =True)
    unidad = UnidadSerializer(read_only = True)
    class Meta:
        model = Producto
        fields = '__all__'

class ProductoSerializer2(serializers.ModelSerializer):
    class Meta:
        model = Producto
        fields = '__all__'

class ProveedorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Proveedor
        fields = '__all__'

class StockSerializer(serializers.ModelSerializer):
    class Meta:
        model = Stock
        fields = '__all__'

class StockBodProdSerializer(serializers.ModelSerializer):
    producto = ProductoSerializer2(read_only=True)
    bodega = BodegaSerializer(read_only=True)
    class Meta:
        model = Stock
        fields = '__all__'


class SerieSerializer(serializers.ModelSerializer):
    class Meta:
        model = Serie
        fields = '__all__'


class SerieBodProdProvSerializer(serializers.ModelSerializer):
    producto = ProductoSerializer2(read_only=True)
    bodega = BodegaSerializer(read_only=True)
    proveedor = ProveedorSerializer(read_only=True)
    class Meta:
        model = Serie
        fields = '__all__'


class MotivoMovimientoSerializer(serializers.ModelSerializer):
    class Meta:
        model = MotivoMovimiento
        fields = '__all__'

###########################################################
class MovimientoSerializer(serializers.ModelSerializer):
    usuario = UsuarioSerializer(read_only=True)
    producto = ProductoSerializer(read_only=True)
    bodega = BodegaSerializer(read_only=True)
    proveedor = ProveedorSerializer(read_only=True)
    motivo_movimiento = MotivoMovimientoSerializer(read_only=True)
    series = SerieSerializer(many=True, read_only=True)
   
    class Meta:
        model = Movimiento
        fields = '__all__'


class TransferenciaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Transferencia
        fields = '__all__'

    def validate(self, data):
        origen = data.get('movimiento_origen')
        destino = data.get('movimiento_destino')

        if not Movimiento.objects.filter(id=origen.id).exists():
            raise serializers.ValidationError({'movimiento_origen': 'Referenced movimiento_origen does not exist.'})

        if not Movimiento.objects.filter(id=destino.id).exists():
            raise serializers.ValidationError({'movimiento_destino': 'Referenced movimiento_destino does not exist.'})

        return data
