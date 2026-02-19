from rest_framework import generics, status
from rest_framework.permissions import IsAuthenticated
from rest_framework.renderers import JSONRenderer
from rest_framework.response import Response

from django.http import JsonResponse
from django.db import OperationalError


from .models import *
from .serializers import *
from user.models import Usuario
from store.models import Bodega

class MotivoGastoList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = MotivoGasto.objects.all()
    serializer_class = MotivoGastoSerializer

class MotivoGastoDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = MotivoGasto.objects.all()
    serializer_class = MotivoGastoSerializer

class CombustibleListCreate(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    # queryset = Combustible.objects.all()
    serializer_class = CombustibleSerializer

    def get_queryset(self):
        inicio = self.request.query_params.get('inicio', None)
        fin= self.request.query_params.get('fin', None)
       
        if inicio and fin:
            return Combustible.objects.filter(created_at__range=(inicio, fin))
        else:
            return Combustible.objects.all()

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        if not queryset.exists():
            return Response([], status=200)

        serialized_data = []
        for dato in queryset:
            serialized_data.append(self.get_serializer(dato).data)
        return Response(serialized_data)

    def perform_create(self, serializer):  
        motivo_id = self.request.data.get('motivo_gasto', None)
        if motivo_id:
            motivo = MotivoGasto.objects.get(id=motivo_id) 
            serializer.save(motivo_gasto=motivo)

        id_tecnico = self.request.data.get('id_tecnico', None)
        if id_tecnico:
            id_tecnico = Usuario.objects.get(id=id_tecnico) 
            serializer.save(id_tecnico=id_tecnico)

        id_cuadrilla = self.request.data.get('id_cuadrilla', None)
        if id_cuadrilla:
            id_cuadrilla = Bodega.objects.get(id=id_cuadrilla) 
            serializer.save(id_cuadrilla=id_cuadrilla)
        serializer.save()

class CombustibleDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    queryset = Combustible.objects.all()
    serializer_class = CombustibleSerializer
    
    def perform_update(self, serializer):  
        motivo_id = self.request.data.get('motivo_gasto', None)
        if motivo_id:
            motivo = MotivoGasto.objects.get(id=motivo_id) 
            serializer.save(motivo_gasto=motivo)

        id_tecnico = self.request.data.get('id_tecnico', None)
        if id_tecnico:
            id_tecnico = Usuario.objects.get(id=id_tecnico) 
            serializer.save(id_tecnico=id_tecnico)

        id_cuadrilla = self.request.data.get('id_cuadrilla', None)
        if id_cuadrilla:
            id_cuadrilla = Bodega.objects.get(id=id_cuadrilla) 
            serializer.save(id_cuadrilla=id_cuadrilla)
        serializer.save()


class RecepcionListCreate(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    # queryset = Recepcion.objects.all()
    serializer_class = RecepcionSerializer

    def get_queryset(self):
        inicio = self.request.query_params.get('inicio', None)
        fin= self.request.query_params.get('fin', None)
       
        if inicio and fin:
            return Recepcion.objects.filter(created_at__range=(inicio, fin))
        else:
            return Recepcion.objects.all()

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        if not queryset.exists():
            return Response([], status=200)

        serialized_data = []
        for dato in queryset:
            serialized_data.append(self.get_serializer(dato).data)
        return Response(serialized_data)

    def perform_create(self, serializer):  
        id_tecnico = self.request.data.get('id_tecnico', None)
        if id_tecnico:
            id_tecnico = Usuario.objects.get(id=id_tecnico) 
            serializer.save(id_tecnico=id_tecnico)
        serializer.save()
        
        
class  RecepcionDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    queryset =  Recepcion.objects.all()
    serializer_class =  RecepcionSerializer

    def perform_update(self, serializer):  
        id_tecnico = self.request.data.get('id_tecnico', None)
        if id_tecnico:
            id_tecnico = Usuario.objects.get(id=id_tecnico) 
            serializer.save(id_tecnico=id_tecnico)

        serializer.save()


class TipoRevisionList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = TipoRevision.objects.all()
    serializer_class = TipoRevisionSerializer

class TipoRevisionDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = TipoRevision.objects.all()
    serializer_class = TipoRevisionSerializer



class VehiculoListCreate(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    #queryset = Vehiculo.objects.all()
    serializer_class = VehiculoSerializer

    def list(self, request, *args, **kwargs):
        queryset = Vehiculo.objects.all()
        if not queryset.exists():
            return Response([], status=200)

        serialized_data = []
        for dato in queryset:
            serialized_data.append(self.get_serializer(dato).data)
        return Response(serialized_data)

    def perform_create(self, serializer):  
        id_usuario = self.request.data.get('id_usuario', None)
        if id_usuario:
            id_usuario = Usuario.objects.get(id=id_usuario) 
            serializer.save(usuario=id_usuario)

        id_cuadrilla = self.request.data.get('id_cuadrilla', None)
        if id_cuadrilla:
            id_cuadrilla = Bodega.objects.get(id=id_cuadrilla) 
            serializer.save(cuadrilla=id_cuadrilla)
        serializer.save()


class VehiculoDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    queryset = Vehiculo.objects.all()
    serializer_class = VehiculoSerializer
    
    def perform_update(self, serializer):  
        id_usuario = self.request.data.get('id_usuario', None)
        if id_usuario:
            id_usuario = Usuario.objects.get(id=id_usuario) 
            serializer.save(usuario=id_usuario)

        id_cuadrilla = self.request.data.get('id_cuadrilla', None)
        if id_cuadrilla:
            id_cuadrilla = Bodega.objects.get(id=id_cuadrilla) 
            serializer.save(cuadrilla=id_cuadrilla)
        serializer.save()




class RevisionListCreate(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    #queryset = Revision.objects.all()
    serializer_class = RevisionSerializer

    def get_queryset(self):
        inicio = self.request.query_params.get('inicio', None)
        fin= self.request.query_params.get('fin', None)
        vehiculo = self.request.query_params.get('vehiculo', None)
       
        if inicio and fin and vehiculo:
            return Revision.objects.filter(vehiculo=vehiculo, created_at__range=(inicio, fin))
        elif inicio and fin:
            return Revision.objects.filter(created_at__range=(inicio, fin))
        else:
            return Revision.objects.all()

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        if not queryset.exists():
            return Response([], status=200)

        serialized_data = []
        for dato in queryset:
            serialized_data.append(self.get_serializer(dato).data)
        return Response(serialized_data)

    def create(self, request, *args, **kwargs):
        try:
            data = request.data
            serializer = RevisionSerializer(data=data)
            serializer.is_valid(raise_exception=True)

            id_vehiculo = self.request.data.get('id_vehiculo', None)
            if id_vehiculo:
                id_vehiculo = Vehiculo.objects.get(id=id_vehiculo) 
                serializer.save(vehiculo=id_vehiculo)
            id_usuario = self.request.data.get('id_usuario', None)
            if id_usuario:
                id_usuario = Usuario.objects.get(id=id_usuario) 
                serializer.save(usuario=id_usuario)
            tipo_revision = self.request.data.get('tipo_revision', None)
            if tipo_revision:
                tipo_revision = TipoRevision.objects.get(id=tipo_revision) 
                serializer.save(tipo_revision=tipo_revision)
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        except Exception as e:
            return Response({'error': f'{str(e)}'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        


class RevisionDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    queryset = Revision.objects.all()
    serializer_class = RevisionSerializer
    
    def perform_update(self, serializer):  
        id_usuario = self.request.data.get('id_usuario', None)
        if id_usuario:
            id_usuario = Usuario.objects.get(id=id_usuario) 
            serializer.save(usuario=id_usuario)

        id_vehiculo = self.request.data.get('id_vehiculo', None)
        if id_vehiculo:
            id_vehiculo = Vehiculo.objects.get(id=id_vehiculo) 
            serializer.save(vehiculo=id_vehiculo)
        
        tipo_revision = self.request.data.get('tipo_revision', None)
        if tipo_revision:
            tipo_revision = TipoRevision.objects.get(id=tipo_revision) 
            serializer.save(tipo_revision=tipo_revision)
        serializer.save()
