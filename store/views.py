from django.shortcuts import render
from django.db.models import F
from rest_framework import generics, status
from rest_framework import viewsets
from django.shortcuts import get_object_or_404
from rest_framework.response import Response
from rest_framework.renderers import JSONRenderer
from rest_framework.permissions import IsAuthenticated
from user.models import Usuario
from .models import Bodega, Producto, Proveedor, Stock, Movimiento, Marca, Modelo, Unidad, Serie, MotivoMovimiento, Transferencia
from .serializers import BodegaSerializer ,ProductoSerializer, ProveedorSerializer, StockSerializer, MovimientoSerializer,StockBodProdSerializer, TransferenciaSerializer
from .serializers import MarcaSerializer, ModeloSerializer, UnidadSerializer, SerieSerializer,SerieBodProdProvSerializer, MotivoMovimientoSerializer,ProductoSerializer2
from rest_framework import serializers
from drf_yasg.utils import swagger_auto_schema


class BodegaList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]

    renderer_classes = [JSONRenderer]
    serializer_class = BodegaSerializer

    def get_queryset(self):
        queryset = Bodega.objects.all()
        tipo = self.request.query_params.get('tipo', None)
        encargado_id = self.request.query_params.get('encargado_id', None)
        
        if tipo:
            queryset = queryset.filter(tipo=tipo)

        if encargado_id:
            encargado_bodegas = Bodega.objects.filter(personas_encargadas__id=encargado_id)
            return encargado_bodegas
        
        return queryset


class BodegaDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Bodega.objects.all()
    serializer_class = BodegaSerializer
# Create your views here.

class ProductoList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Producto.objects.all()
    serializer_class = ProductoSerializer

    def perform_create(self, serializer):
        
        marca_id = self.request.data.get('marca', None)
        if marca_id:
            marca = Marca.objects.get(id=marca_id) 
            serializer.save(marca=marca)
        modelo_id = self.request.data.get('modelo', None)
        if modelo_id:
            modelo = Modelo.objects.get(id=modelo_id)
            serializer.save(modelo=modelo) 
        unidad_id = self.request.data.get('unidad', None)
        if unidad_id:
            unidad = Unidad.objects.get(id=unidad_id) 
            serializer.save(unidad=unidad)


class ProductoDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Producto.objects.all()
    serializer_class = ProductoSerializer
    def perform_update(self, serializer):
        data = self.request.data
        marca_id = data.get('marca', 'nohay')
        if marca_id!='nohay':
            if marca_id == None:
               serializer.save(marca=None)
            else:
                marca = Marca.objects.get(id=marca_id) 
                serializer.save(marca=marca)
        modelo_id = data.get('modelo', None)
        if modelo_id!='nohay':
            if modelo_id == None:
               serializer.save(modelo=None)
            else:
                modelo = Modelo.objects.get(id=modelo_id)
                serializer.save(modelo=modelo) 
        unidad_id = data.get('unidad', None)
        if unidad_id!='nohay':
            if unidad_id == None:
               serializer.save(unidad=None)
            else:
                unidad = Unidad.objects.get(id=unidad_id) 
                serializer.save(unidad=unidad)

class ProveedorList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Proveedor.objects.all()
    serializer_class = ProveedorSerializer

class ProveedorDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Proveedor.objects.all()
    serializer_class = ProveedorSerializer

class StockList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Stock.objects.all()
    serializer_class = StockBodProdSerializer

    def perform_create(self, serializer):
        permission_classes = [IsAuthenticated]
        id_producto = self.request.data.get('producto', None)
        id_bodega = self.request.data.get('bodega', None)
       
        if id_bodega:
            try:
                bodega = Bodega.objects.get(id=id_bodega)
            except Bodega.DoesNotExist:
                raise serializers.ValidationError({"error":"bodega no encontrada."})
            
        if id_producto:
            try:
                producto = Producto.objects.get(id=id_producto)
            except Producto.DoesNotExist:
                raise serializers.ValidationError({"error":"Producto no encontrada."})
        
        serializer.save(producto=producto,bodega=bodega)



class StockListByProductoBodega(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    serializer_class = StockBodProdSerializer

    def get_queryset(self):
        producto_id = self.request.query_params.get('producto')
        bodega_id = self.request.query_params.get('bodega')

        if producto_id and bodega_id:
            return Stock.objects.filter(producto_id=producto_id, bodega_id=bodega_id)
        elif producto_id:
            return Stock.objects.filter(producto_id=producto_id)
        elif bodega_id:
            return Stock.objects.filter(bodega_id=bodega_id)
        else:
            return Stock.objects.none()

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        if not queryset.exists():
            return Response([], status=200)
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)

class StockDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Stock.objects.all()
    serializer_class = StockBodProdSerializer

    def perform_update(self, serializer):
        datos = self.armar_datos_stock()
        if serializer.is_valid():
            serializer.save(**datos)
        else:
            raise serializers.ValidationError(serializer.errors)
 
    def armar_datos_stock(self):

        id_producto = self.request.data.get('producto', None)
        id_bodega = self.request.data.get('bodega', None)
        datos = dict(self.request.data)
        if id_bodega:
            try:
                bodega = Bodega.objects.get(id=id_bodega)
                datos['bodega'] = bodega
            except Bodega.DoesNotExist:
                raise serializers.ValidationError({"error":"bodega no encontrada."})
            
        if id_producto:
            try:
                producto = Producto.objects.get(id=id_producto)
                datos['producto'] = producto
            except Producto.DoesNotExist:
                raise serializers.ValidationError({"error":"Producto no encontrada."})
        
        return datos
    

class StockBelowMinimum(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = StockBodProdSerializer

    def get_queryset(self):

        bodegas_filtradas = Bodega.objects.filter(tipo__in=['NODO', 'BODEGA'])
        
        queryset = Stock.objects.filter(
            cantidad__lte=F('producto__stock_min'),
            bodega__in=bodegas_filtradas
        )
        
        return queryset
    
class MotivoMovimientoList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = MotivoMovimiento.objects.all()
    serializer_class = MotivoMovimientoSerializer

class MotivoMovimientoDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = MotivoMovimiento.objects.all()
    serializer_class = MotivoMovimientoSerializer

### MOVIMIENTO DE TIPO SIMPLE 
class MovimientoList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Movimiento.objects.all()
    serializer_class = MovimientoSerializer

    def get_queryset(self):
        serie = self.request.query_params.get('serie', None)
        actividad = self.request.query_params.get('actividad', None)
        inicio = self.request.query_params.get('inicio', None)
        fin= self.request.query_params.get('fin', None)
        if serie and inicio and fin:
            queryset = Movimiento.objects.filter(series__serie=serie,created_at__range=(inicio, fin))
            if not queryset:
                return Movimiento.objects.none()
            else: 
                return queryset
        elif actividad and inicio and fin:
            queryset = Movimiento.objects.filter(id_actividad=actividad,created_at__range=(inicio, fin))
            if not queryset:
                return Movimiento.objects.none()
            else: 
                return queryset
        elif inicio and fin:
            queryset = Movimiento.objects.filter(created_at__range=(inicio, fin))
            if not queryset:
                return Movimiento.objects.none()
            else: 
                return queryset
        elif serie:
            # Filtrar los movimientos que contengan la serie proporcionada
            queryset = Movimiento.objects.filter(series__serie=serie)
            if not queryset:
                return Movimiento.objects.none()
            else: 
                return queryset
        elif actividad:
            # Filtrar los movimientos que contengan la serie proporcionada
            queryset = Movimiento.objects.filter(id_actividad=actividad)
            if not queryset:
                return Movimiento.objects.none()
            else: 
                return queryset
        else:
            queryset = Movimiento.objects.all()

        return queryset
    
    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        if not queryset.exists():
            return Response([], status=200)
        serializer = self.get_serializer(queryset, many=True)
        data = serializer.data
        filtered_data = []
        for item in data:
            usuario = item.get('usuario')
            if usuario and 'contraseña' in usuario:
                usuario.pop('contraseña')
            if usuario and 'cedula' in usuario:
                usuario.pop('cedula')
            filtered_data.append(item)
        return Response(filtered_data)

    
    def create(self, request, *args, **kwargs):
        try:
            usuario_id = self.request.data.get('usuario', None)
            producto_id = self.request.data.get('producto', None)
            bodega_id = self.request.data.get('bodega', None)
            motivo_mov_id = self.request.data.get('motivo_movimiento', None)
            proveedor_id = self.request.data.get('proveedor', None)
            garantia = self.request.data.get('garantia', None)

            if not (usuario_id and producto_id and bodega_id and motivo_mov_id ):
                return Response({'error': 'Se requiere usuario, motivo,  producto ybodega.'}, status=status.HTTP_400_BAD_REQUEST)
            
            if proveedor_id:
                try:
                    proveedor = Proveedor.objects.get(id=proveedor_id)
                
                except Proveedor.DoesNotExist:
                    return Response({'error': 'Proveedor no encontrado.'}, status=status.HTTP_400_BAD_REQUEST)


            usuario = Usuario.objects.get(id=usuario_id)
            producto = Producto.objects.get(id=producto_id)
            bodega = Bodega.objects.get(id=bodega_id)
            motivo_movimiento = MotivoMovimiento.objects.get(id=motivo_mov_id)
            
            series_data = request.data.get('series', [])
            tipo = request.data.get('tipomovimiento')
            series_obj = []
            for serie_data in series_data:
                if tipo =="INGRESO":
                    serie, created = Serie.objects.get_or_create(producto=producto, serie=serie_data,)                  
                    bodega = Bodega.objects.get(id=request.data.get('bodega'))
                    serie.bodega = bodega
                    if proveedor_id:
                        serie.proveedor = proveedor
                    if garantia:
                        serie.garantia = garantia
                    serie.save()
                    series_obj.append(serie.id)

                elif tipo =="EGRESO":
                    serie = Serie.objects.get(producto=producto, serie=serie_data)
                    serie.bodega = None
                    serie.save()
                    series_obj.append(serie.id)
                             
            data = request.data
            data['series'] = series_obj
            serializer = MovimientoSerializer(data=data)
            serializer.is_valid(raise_exception=True)
           
            if proveedor_id:
                serializer.save(usuario=usuario, producto=producto, bodega=bodega, motivo_movimiento=motivo_movimiento, series= data['series'],proveedor=proveedor)
            else:
                serializer.save(usuario=usuario, producto=producto, bodega=bodega, motivo_movimiento=motivo_movimiento, series= data['series'])
                  
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        except Exception as e:
            return Response({'error': f'Error en create: {e}'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    
    
class MovimientoDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Movimiento.objects.all()
    serializer_class = MovimientoSerializer

    def perform_update(self, serializer):
        usuario_id = self.request.data.get('usuario', None)
        producto_id = self.request.data.get('producto', None)
        bodega_id = self.request.data.get('bodega', None)

        if not (usuario_id and producto_id and bodega_id):
            return Response({'error': 'Se requiere usuario, producto y bodega.'}, status=status.HTTP_400_BAD_REQUEST)

        try:
            usuario = Usuario.objects.get(id=usuario_id)
            producto = Producto.objects.get(id=producto_id)
            bodega = Bodega.objects.get(id=bodega_id)
        except Usuario.DoesNotExist:
            return Response({'error': 'Usuario no encontrado.'}, status=status.HTTP_400_BAD_REQUEST)
        except Producto.DoesNotExist:
            return Response({'error': 'Producto no encontrado.'}, status=status.HTTP_400_BAD_REQUEST)
        except Bodega.DoesNotExist:
            return Response({'error': 'Bodega no encontrada.'}, status=status.HTTP_400_BAD_REQUEST)

        serializer.save(usuario=usuario, producto=producto, bodega=bodega)



### MOVIMIENTO DE TIPO COMPUESTO 
class MovimientoCompList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Movimiento.objects.all()
    serializer_class = MovimientoSerializer
    
    def create(self, request, *args, **kwargs):
        try:
            usuario_id = self.request.data.get('usuario', None)
            producto_id = self.request.data.get('producto', None)
            bodega_id = self.request.data.get('bodega', None)
            motivo_mov_id = self.request.data.get('motivo_movimiento', None)
            proveedor_id = self.request.data.get('proveedor', None)
            proveedor = None
            garantia = self.request.data.get('garantia', None)

            if not (usuario_id and producto_id and bodega_id and motivo_mov_id ):
                return Response({'error': 'Se requiere usuario, motivo,  producto ybodega.'}, status=status.HTTP_400_BAD_REQUEST)
            
            if proveedor_id:
                try:
                    proveedor = Proveedor.objects.get(id=proveedor_id)
                
                except Proveedor.DoesNotExist:
                    return Response({'error': 'Proveedor no encontrado.'}, status=status.HTTP_400_BAD_REQUEST)


            usuario = Usuario.objects.get(id=usuario_id)
            producto = Producto.objects.get(id=producto_id)
            bodega = Bodega.objects.get(id=bodega_id)
            motivo_movimiento = MotivoMovimiento.objects.get(id=motivo_mov_id)
            
            series_data = request.data.get('series', [])
            cantidad = request.data.get('cantidad',None)
            tipo = request.data.get('tipomovimiento')
            series_obj = []
            for serie_data in series_data:
                if tipo =="INGRESO":
                    try:
                        serie = Serie.objects.get(producto=producto, serie=serie_data)
                        serie.bodega = Bodega.objects.get(id=request.data.get('bodega'))
                        serie.stock += cantidad
                        serie.save()
                        series_obj.append(serie.id)

                    except Serie.DoesNotExist:
                        serie = Serie.objects.create(producto=producto, serie=serie_data)
                        serie.bodega = Bodega.objects.get(id=request.data.get('bodega'))
                        serie.tipo = "COMPUESTO"
                        if proveedor:
                            serie.proveedor = proveedor
                        if garantia:
                           serie.garantia = garantia   

                        serie.stock = cantidad
                        serie.save()
                        series_obj.append(serie.id)

                elif tipo =="EGRESO":
                    try:
                        serie = Serie.objects.get(producto=producto, serie=serie_data)
                        if cantidad <= serie.stock:
                            serie.stock = serie.stock - cantidad
                            serie.save()
                            series_obj.append(serie.id)
                        else:
                            return Response({'error': 'La cantidad a egresar es mayor que el stock disponible.'}, status=status.HTTP_400_BAD_REQUEST)


                    except Serie.DoesNotExist:
                        return Response({'error': 'Series no encontrado.'}, status=status.HTTP_400_BAD_REQUEST)
                             
            data = request.data
            data['series'] = series_obj
            serializer = MovimientoSerializer(data=data)
            serializer.is_valid(raise_exception=True)
            if proveedor_id:
                serializer.save(usuario=usuario, producto=producto, bodega=bodega, motivo_movimiento=motivo_movimiento, series= data['series'],proveedor=proveedor)
            else:
                serializer.save(usuario=usuario, producto=producto, bodega=bodega, motivo_movimiento=motivo_movimiento, series= data['series'])

            return Response(serializer.data, status=status.HTTP_201_CREATED)
        except Exception as e:
            return Response({'error': f'Error en create: {e}'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


class TransferenciaListCreateView(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    serializer_class = TransferenciaSerializer

    def get_queryset(self):
        qs = Transferencia.objects.all()
        producto_id = self.request.query_params.get('producto')
        inicio = self.request.query_params.get('inicio')
        fin = self.request.query_params.get('fin')
        
        if producto_id:
            qs = qs.filter(
                Q(movimiento_origen__producto_id=producto_id) |
                Q(movimiento_destino__producto_id=producto_id)
            )
        if inicio and fin:
            qs = qs.filter(created_at__range=[inicio, fin])

        return qs.order_by('-created_at')

    def create(self, request, *args, **kwargs):
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        transferencia = serializer.save()
        return Response(self.get_serializer(transferencia).data, status=status.HTTP_201_CREATED)

class TransferenciaDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Transferencia.objects.all()
    serializer_class = TransferenciaSerializer

class MarcaList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Marca.objects.all()
    serializer_class = MarcaSerializer

class MarcaDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Marca.objects.all()
    serializer_class = MarcaSerializer

class ModeloList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Modelo.objects.all()
    serializer_class = ModeloSerializer

class ModeloDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Modelo.objects.all()
    serializer_class = ModeloSerializer

class UnidadList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Unidad.objects.all()
    serializer_class = UnidadSerializer

class UnidadDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Unidad.objects.all()
    serializer_class = UnidadSerializer

class UnidadList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Unidad.objects.all()
    serializer_class = UnidadSerializer

class UnidadDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Unidad.objects.all()
    serializer_class = UnidadSerializer


class SerieList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Serie.objects.all()
    serializer_class = SerieSerializer

class SerieDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Serie.objects.all()
    serializer_class = SerieBodProdProvSerializer

class SerieDetail2(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    queryset = Serie.objects.all()
    serializer_class = SerieBodProdProvSerializer
    
    def perform_update(self, serializer):  
        producto = self.request.data.get('producto', None)
        if producto:
            producto = Producto.objects.get(id=producto) 
            serializer.save(producto=producto)
        serializer.save()

from drf_yasg.utils import swagger_auto_schema
from drf_yasg import openapi
from django.utils.decorators import method_decorator


# @method_decorator(
#     name="get", # change is here
#     decorator=swagger_auto_schema(tags=['Series'],
#         manual_parameters=[
#             openapi.Parameter(
#                 "email",
#                 openapi.IN_QUERY,
#                 description="Email to be checked",
#                 type=openapi.TYPE_STRING,
#             )
#         ]
#     ),
# )
class SerieListByProductoBodega(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    serializer_class = SerieSerializer

    def get_queryset(self):
        producto_id = self.request.query_params.get('producto')
        bodega_id = self.request.query_params.get('bodega')

        if producto_id and bodega_id:
            return Serie.objects.filter(producto_id=producto_id, bodega_id=bodega_id)
        elif producto_id:
            return Serie.objects.filter(producto_id=producto_id)
        elif bodega_id:
            return Serie.objects.filter(bodega_id=bodega_id)
        else:
            return Serie.objects.none()
        
    
    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        if not queryset.exists():
            return Response([], status=200)
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data)

class ProductosEnBodegaAPIView(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    serializer_class = ProductoSerializer2

    def get_queryset(self):
        bodega_id = self.request.query_params.get('bodega_id')
        stocks = Stock.objects.filter(bodega_id=bodega_id, cantidad__gt=0)
        productos_ids = stocks.values_list('producto_id', flat=True)
        return Producto.objects.filter(id__in=productos_ids)

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        if not queryset.exists():
            return Response([], status=status.HTTP_200_OK)
        serializer = self.get_serializer(queryset, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)
