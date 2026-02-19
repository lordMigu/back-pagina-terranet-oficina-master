from rest_framework import generics, status
from rest_framework.response import Response
from rest_framework.renderers import JSONRenderer
from rest_framework.permissions import IsAuthenticated

from .models import Actividad, Ruta, ActividadHistorial
from store.models import Bodega
from agenda.models import Solicitud
from user.models import Usuario
from .serializers import ActividadSerializer, RutaSerializer,ActividadHistorialSerializer
from rest_framework import serializers

class ActividadList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    # queryset = Actividad.objects.all()
    serializer_class = ActividadSerializer

    def get_queryset(self):
        inicio = self.request.query_params.get('inicio', None)
        fin= self.request.query_params.get('fin', None)
       
        if inicio and fin:
            return Actividad.objects.filter(created_at__range=(inicio, fin))
        else:
            return Actividad.objects.all()

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
        solicitud = self.request.data.get('solicitud', None)
        user_mod_id = self.request.data.get('usuario_mod', None)
        ruta_id=None
        ruta_id = self.request.data.get('ruta', None)

        if solicitud:
            try:
                solicitud = Solicitud.objects.get(id=solicitud)
            except Solicitud.DoesNotExist:
                raise serializers.ValidationError({"error":"Solicitud no encontrada."})
            
        if user_mod_id:
            try:
                usuario_mod = Usuario.objects.get(id=user_mod_id)

            except Usuario.DoesNotExist:
                raise serializers.ValidationError({"error":"Usuario no encontrada."})
            
        if id_tecnico:
            try:
                id_tecnico = Usuario.objects.get(id=id_tecnico)

            except Usuario.DoesNotExist:
                raise serializers.ValidationError({"error":"Tecnico no encontrada."})
        
        if ruta_id:
            try:
                ruta_id = Ruta.objects.get(id=ruta_id)

            except Ruta.DoesNotExist:
                raise serializers.ValidationError({"error":"Ruta no encontrada."})
        
        serializer.save(id_tecnico=id_tecnico,solicitud=solicitud,usuario_mod=usuario_mod)

class ActividadDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Actividad.objects.all()
    serializer_class = ActividadSerializer


    def perform_update(self, serializer):
        datos = self.armar_datos_actividad()
        try:
            if serializer.is_valid():
                serializer.save(**datos)
            else:
                raise serializers.ValidationError(serializer.errors)
        except Exception as e:
            error_message = "error: {}".format(str(e))
            raise serializers.ValidationError({"error": error_message})

            

    def armar_datos_actividad(self):
        solicitud_id = self.request.data.get('solicitud', None)
        user_mod_id = self.request.data.get('usuario_mod', None)
        id_tecnico = self.request.data.get('id_tecnico', None)
        id_cuadrilla= self.request.data.get('id_cuadrilla', None)
        ruta = self.request.data.get('ruta', None)

        datos = dict(self.request.data)

        if solicitud_id:
            try:
                solicitud = Solicitud.objects.get(id=solicitud_id)
                datos['solicitud'] = solicitud
            except Solicitud.DoesNotExist:
                raise serializers.ValidationError({"error": "Solicitud no encontrada."})

        if user_mod_id:
            try:
                usuario_mod = Usuario.objects.get(id=user_mod_id)
                datos['usuario_mod'] = usuario_mod
            except Usuario.DoesNotExist:
                raise serializers.ValidationError({"error": "Usuario no encontrada."})

        if id_tecnico:
            try:
                id_tecnico = Usuario.objects.get(id=id_tecnico)
                datos['id_tecnico'] = id_tecnico
            except Usuario.DoesNotExist:
                raise serializers.ValidationError({"error": "Tecnico no encontrado."})

        if id_cuadrilla:
            try:
                id_cuadrilla = Bodega.objects.get(id=id_cuadrilla)
                datos['id_cuadrilla'] = id_cuadrilla
            except Bodega.DoesNotExist:
                raise serializers.ValidationError({"error": "Bodega/Cuadrilla no encontrada."})


        if ruta:
            try:
                ruta = Ruta.objects.get(id=ruta)
                datos['ruta'] = ruta
            except Ruta.DoesNotExist:
                raise serializers.ValidationError({"error": "Ruta no encontrada."})

        
        # Puedes agregar más lógica para otros campos si es necesario
        return datos
    

class ActividadByEstadoList(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    serializer_class = ActividadSerializer

    def get_queryset(self):
        estado = self.kwargs['estado']  # Obtener el estado del parámetro de la URL
        inicio = self.request.query_params.get('inicio', None)
        fin= self.request.query_params.get('fin', None)
        if inicio and fin:
            return Actividad.objects.filter(estado=estado, created_at__range=(inicio, fin))
        else:
            return Actividad.objects.filter(estado=estado)

    

class ActividadHistorialList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    serializer_class = ActividadHistorialSerializer

    def get_queryset(self):
        actividad_id = self.kwargs['actividad_id']
        return ActividadHistorial.objects.filter(actividad_id=actividad_id)

class ActividadHistorialDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = ActividadHistorial.objects.all()
    serializer_class = ActividadHistorialSerializer

class RutaList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    # queryset = Ruta.objects.all()
    serializer_class = RutaSerializer

    def get_queryset(self):
        inicio = self.request.query_params.get('inicio', None)
        fin= self.request.query_params.get('fin', None)
       
        if inicio and fin:
            return Ruta.objects.filter(created_at__range=(inicio, fin))
        else:
            return Ruta.objects.all()
        
    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        response = super().list(request, *args, **kwargs)
        for ruta_data in response.data:
            # Obtener el ID de la ruta actual
            ruta_id = ruta_data['id']

            # Consultar las actividades relacionadas con la ruta actual
            actividades = Actividad.objects.filter(ruta_id=ruta_id).values()

            # Asociar las actividades a la respuesta
            ruta_data['actividades'] = list(actividades)

        return response



    def perform_create(self, serializer):      
        cuadrilla_id = self.request.data.get('cuadrilla', None)
        if cuadrilla_id:
            try:
                cuadrilla = Bodega.objects.get(id=cuadrilla_id) 
            except Bodega.DoesNotExist:
                raise serializers.ValidationError({"error":"Cuadrilla no encotrada."})
            serializer.save(cuadrilla=cuadrilla)

        serializer.save()

    def create(self, request, *args, **kwargs):
        # Extraer la lista de actividades del cuerpo de la solicitud
        actividades_ids = request.data.get('actividades', [])

        # Crear la ruta
        serializer = self.get_serializer(data=request.data)
        serializer.is_valid(raise_exception=True)
        self.perform_create(serializer)
        data = serializer.data
        # Obtener la ruta recién creada
        ruta = Ruta.objects.get(id=serializer.data['id'])
        if actividades_ids:
            data['actividades']=[]
        # Asignar la ruta a las actividades existentes
        for actividad_id in actividades_ids:
            try:
                actividad = Actividad.objects.get(pk=actividad_id)
                actividad.ruta = ruta
                actividad.save()
                actividad_serializer = ActividadSerializer(actividad)
                data['actividades'].append(actividad_serializer.data)
            except Actividad.DoesNotExist:
                # Manejar la excepción si la actividad no existe
                pass
        
        

        headers = self.get_success_headers(serializer.data)
        return Response(data, status=status.HTTP_201_CREATED, headers=headers)

    
class RutatBy(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    serializer_class = RutaSerializer

    def get_queryset(self):
        estado = self.request.query_params.get('estado')
        cuadrilla_id = self.request.query_params.get('cuadrilla')
        inicio = self.request.query_params.get('inicio', None)
        fin= self.request.query_params.get('fin', None)
        
        estado2 = self.request.query_params.get('estado2')

       
        if estado and cuadrilla_id and inicio and fin:
            return Ruta.objects.filter(estado=estado, cuadrilla_id=cuadrilla_id, created_at__range=(inicio, fin))
        elif estado and cuadrilla_id:
            return Ruta.objects.filter(estado=estado, cuadrilla_id=cuadrilla_id)
        
        elif estado2 and cuadrilla_id:
            return Ruta.objects.filter(cuadrilla_id=cuadrilla_id).exclude(estado=estado2)
        
        elif estado and inicio and fin:
            return Ruta.objects.filter(estado=estado, created_at__range=(inicio, fin))
        elif estado:
            return Ruta.objects.filter(estado=estado)
        
        elif estado2 and inicio and fin:
            return Ruta.objects.filter(created_at__range=(inicio, fin)).exclude(estado=estado2)
        elif estado2:
            return Ruta.objects.exclude(estado=estado2)
        
        elif cuadrilla_id and inicio and fin:
            return Ruta.objects.filter(cuadrilla_id=cuadrilla_id, created_at__range=(inicio, fin))
        elif cuadrilla_id:
            return Ruta.objects.filter(cuadrilla_id=cuadrilla_id)
        else:
            return Ruta.objects.none()


    def list(self, request, *args, **kwargs):
        queryset = self.get_queryset()
        if not queryset.exists():
            return Response([], status=200)

        serialized_data = []
        for ruta in queryset:
            ruta_data = self.get_serializer(ruta).data
            actividades = Actividad.objects.filter(ruta_id=ruta.id).values()
            ruta_data['actividades'] = list(actividades)
            serialized_data.append(ruta_data)

        return Response(serialized_data)

class RutaDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Ruta.objects.all()
    serializer_class = RutaSerializer 


    def perform_update(self, serializer):
        cuadrilla_id = self.request.data.get('cuadrilla', None)
        
        if cuadrilla_id:
            cuadrilla = Bodega.objects.get(id=cuadrilla_id) 
            serializer.save(cuadrilla=cuadrilla)
        actividades_data = self.request.data.get('actividades', 'Vacio')
        serializer.is_valid(raise_exception=True)
        serializer.save()
        
        data = serializer.data

        if actividades_data != 'Vacio':
            data['actividades']=[]
        # Asignar la ruta a las actividades existentes
            for actividad_id in actividades_data:
                try:
                    actividad = Actividad.objects.get(pk=actividad_id)
                    actividad.ruta = serializer.instance
                    actividad.save()
                    actividad_serializer = ActividadSerializer(actividad)
                    data['actividades'].append(actividad_serializer.data)
                except Actividad.DoesNotExist:
                    pass
        
        
        
    def retrieve(self, request, *args, **kwargs):
        response = super().retrieve(request, *args, **kwargs)

        # Obtener el ID de la ruta actual
        ruta_id = response.data['id']

        # Consultar las actividades relacionadas con la ruta actual
        actividades = Actividad.objects.filter(ruta_id=ruta_id).values()

        # Asociar las actividades a la respuesta
        response.data['actividades'] = actividades

        return response