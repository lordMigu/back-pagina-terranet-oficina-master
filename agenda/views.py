# views.py

from rest_framework import generics, status
from rest_framework.response import Response
from rest_framework.renderers import JSONRenderer
from rest_framework import  serializers
from rest_framework.permissions import IsAuthenticated

from .models import Solicitud, TipoSolicitud, Kit, KitXProducto,HojadeTrabajo, Wisphub
from .serializers import SolicitudSerializer, TipoSolicitudSerializer, KitSerializer, KitXProductoSerializer,HojadeTrabajoSerializer,WisphubSerializer
from user.models import Usuario
from user.serializers import UsuarioSerializer


class TipoSolicitudList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    queryset = TipoSolicitud.objects.all()
    serializer_class = TipoSolicitudSerializer

class TipoSolicitudDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    queryset = TipoSolicitud.objects.all()
    serializer_class = TipoSolicitudSerializer

class KitList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    queryset = Kit.objects.all()
    serializer_class = KitSerializer

class KitDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    queryset = Kit.objects.all()
    serializer_class = KitSerializer

class KitXProductoList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    queryset = KitXProducto.objects.all()
    serializer_class = KitXProductoSerializer

class KitXProductoDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    queryset = KitXProducto.objects.all()
    serializer_class = KitXProductoSerializer

class SolicitudList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Solicitud.objects.all()
    serializer_class = SolicitudSerializer

    def perform_create(self, serializer):
        tipo_soli_id = self.request.data.get('tiposolicitud', None)
        if tipo_soli_id:
            try:
                tiposolicitud = TipoSolicitud.objects.get(id=tipo_soli_id) 
            except TipoSolicitud.DoesNotExist:
                raise serializers.ValidationError({"error":"Tipo de Solicitud no encontrada."})
            serializer.save(tiposolicitud=tiposolicitud)
            
        usu_sol_id=  self.request.data.get('usuario_solicitud', None)
        if usu_sol_id:
            try:
                usuario_solicitud = Usuario.objects.get(id=usu_sol_id) 
            except Usuario.DoesNotExist:
                raise serializers.ValidationError({"error":"Usuario no encontrado."})
            serializer.save(usuario_solicitud=usuario_solicitud)

        usu_rev_id=  self.request.data.get('usuario_revision', None)
        if usu_rev_id:
            try:
                usuario_revision = Usuario.objects.get(id=usu_rev_id) 
            except Usuario.DoesNotExist:
                raise serializers.ValidationError({"error":"Usuario no encontrado."})
            serializer.save(usuario_revision=usuario_revision)
    
        usu_agen_id=  self.request.data.get('usuario_agendo', None)
        if usu_agen_id:
            try:
                usuario_agendo = Usuario.objects.get(id=usu_agen_id) 
            except Usuario.DoesNotExist:
                raise serializers.ValidationError({"error":"Usuario no encontrado."})
            serializer.save(usuario_agendo=usuario_agendo)
    
        serializer.save()

        

class SolicitudDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Solicitud.objects.all()
    serializer_class = SolicitudSerializer

    def perform_update(self, serializer):
       
        tipo_soli_id = self.request.data.get('tiposolicitud', None)
        if tipo_soli_id:
            try:
                tiposolicitud = TipoSolicitud.objects.get(id=tipo_soli_id) 
            except TipoSolicitud.DoesNotExist:
                raise serializers.ValidationError({"error":"Tipo de Solicitud no encontrada."})
            serializer.save(tiposolicitud=tiposolicitud)
            
        usu_sol_id=  self.request.data.get('usuario_solicitud', None)
        if usu_sol_id:
            try:
                usuario_solicitud = Usuario.objects.get(id=usu_sol_id) 
            except Usuario.DoesNotExist:
                raise serializers.ValidationError({"error":"Usuario no encontrado."})
            serializer.save(usuario_solicitud=usuario_solicitud)

        usu_rev_id=  self.request.data.get('usuario_revision', None)
        if usu_rev_id:
            try:
                usuario_revision = Usuario.objects.get(id=usu_rev_id) 
            except Usuario.DoesNotExist:
                raise serializers.ValidationError({"error":"Usuario no encontrado."})
            serializer.save(usuario_revision=usuario_revision)
    
        usu_agen_id=  self.request.data.get('usuario_agendo', None)
        if usu_agen_id:
            try:
                usuario_agendo = Usuario.objects.get(id=usu_agen_id) 
            except Usuario.DoesNotExist:
                raise serializers.ValidationError({"error":"Usuario no encontrado."})
            serializer.save(usuario_agendo=usuario_agendo)
    
        serializer.save()

class SolicitudByEstadoList(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    serializer_class = SolicitudSerializer

    def get_queryset(self):
        estado = self.kwargs['estado']  # Obtener el estado del parámetro de la URL
        inicio = self.request.query_params.get('inicio', None)
        fin= self.request.query_params.get('fin', None)
        if inicio and fin:
            return Solicitud.objects.filter(estado=estado, created_at__range=(inicio, fin))
        else:
            return Solicitud.objects.filter(estado=estado)
    
class HojadeTrabajoList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    queryset = HojadeTrabajo.objects.all()
    serializer_class = HojadeTrabajoSerializer

class HojadeTrabajoBy(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = HojadeTrabajo.objects.all()
    serializer_class = HojadeTrabajoSerializer

    def get_queryset(self):
        actividad = self.request.query_params.get('actividad', None)
        estado = self.request.query_params.get('estado', None)
        tipo = self.request.query_params.get('tipo', None)
        inicio = self.request.query_params.get('inicio', None)
        fin= self.request.query_params.get('fin', None)
        if actividad:
            queryset = HojadeTrabajo.objects.filter(id_actividad=actividad)
        elif estado and tipo and inicio and fin:
            queryset = HojadeTrabajo.objects.filter(estado=estado, tipo=tipo,created_at__range=(inicio, fin))
        elif estado and tipo:
            queryset = HojadeTrabajo.objects.filter(estado=estado, tipo=tipo)
        else:
            queryset = HojadeTrabajo.objects.none()

        return queryset



class HojadeTrabajoDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = HojadeTrabajo.objects.all()
    serializer_class = HojadeTrabajoSerializer

class WisphubList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    # queryset = Wisphub.objects.all()
    serializer_class = WisphubSerializer

    def get_queryset(self):
        inicio = self.request.query_params.get('inicio', None)
        fin= self.request.query_params.get('fin', None)
       
        if inicio and fin:
            return Wisphub.objects.filter(created_at__range=(inicio, fin))
        else:
            return Wisphub.objects.all()

    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        if not queryset.exists():
            return Response([], status=200)

        serialized_data = []
        for dato in queryset:
            serialized_data.append(self.get_serializer(dato).data)
        return Response(serialized_data)

    def perform_create(self, serializer):
        usuario_creacion = self.request.data.get('usuario_creacion', None)
        if usuario_creacion:
            try:
                usuario_creacion = Usuario.objects.get(id=usuario_creacion)

            except Usuario.DoesNotExist:
                raise serializers.ValidationError({"error":"Usuario no encontrada."})
        
        serializer.save(usuario_creacion=usuario_creacion)


class WisphubDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Wisphub.objects.all()
    serializer_class = WisphubSerializer

    def perform_update(self, serializer):
        datos = self.armar_datos()
        if serializer.is_valid():
            serializer.save(**datos)
        else:
            raise serializers.ValidationError(serializer.errors)
 
    def armar_datos(self):
        usuario_creacion = self.request.data.get('usuario_creacion', None)
        hojatrabajo = self.request.data.get('hojatrabajo', None)

        datos = dict(self.request.data)

        if usuario_creacion:
            try:
                usuario_creacion = Usuario.objects.get(id=usuario_creacion)
                datos['usuario_creacion'] = usuario_creacion
            except Usuario.DoesNotExist:
                raise serializers.ValidationError({"error": "Usuario no encontrado."})

        if hojatrabajo:
            try:
                hojatrabajo = HojadeTrabajo.objects.get(id=hojatrabajo)
                datos['hojatrabajo'] = hojatrabajo
            except HojadeTrabajo.DoesNotExist:
                raise serializers.ValidationError({"error": "HojadeTrabajo no encontrada."})

        return datos
    
