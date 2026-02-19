from rest_framework.decorators import api_view, permission_classes
from rest_framework import generics, status
from rest_framework.response import Response
from rest_framework.renderers import JSONRenderer
from rest_framework.permissions import IsAuthenticated

from .models import Rol, Usuario, Permiso, Version
from rest_framework.views import APIView
from .serializers import RolSerializer ,UsuarioSerializer, PermisoSerializer,UsuarioWishupApiSerializer,Usuario1Serializer
from .serializers import VersionSerializer
import requests 
import json
from drf_yasg.utils import swagger_auto_schema


class RolList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Rol.objects.all()
    serializer_class = RolSerializer
    def perform_create(self, serializer):
        permiso_data = self.request.data.get('permisos', [])  
        permisos = Permiso.objects.filter(id__in=permiso_data) 
        serializer.save(permisos=permisos)  

class RolDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    queryset = Rol.objects.all()
    serializer_class = RolSerializer
    def perform_update(self, serializer):
        permiso_data = self.request.data.get('permisos', [])  
        permisos = Permiso.objects.filter(id__in=permiso_data) 
        serializer.save(permisos=permisos)  


class UsuarioList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Usuario.objects.all()
    serializer_class = Usuario1Serializer

    def perform_create(self, serializer):
        roles_data = self.request.data.get('roles', [])  # Obtener los identificadores de roles de la solicitud
        roles = Rol.objects.filter(id__in=roles_data)  # Obtener los objetos de Rol correspondientes
        serializer.save(roles=roles)  # Asignar roles al usuario

class UsuarioDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Usuario.objects.all()
    serializer_class = Usuario1Serializer


    def perform_update(self, serializer):
        roles_data = self.request.data.get('roles','SinDAto')  # Obtener los identificadores de roles de la solicitud
        if roles_data != "SinDAto":

            roles = Rol.objects.filter(id__in=roles_data)  # Obtener los objetos de Rol correspondientes
            serializer.save(roles=roles)  # Actualizar roles del usuario
        serializer.save()


@api_view(['POST'])
@permission_classes([IsAuthenticated])
def authenticate_user(request):
    correo = request.data.get('correo', None)
    contraseña = request.data.get('contraseña', None)
    

    if not correo or not contraseña:
        return Response({"message": "Correo y contraseña son obligatorios"}, status=status.HTTP_400_BAD_REQUEST)

    try:
        usuario = Usuario.objects.get(correo=correo)
    except Usuario.DoesNotExist:
        return Response({"message": "Usuario no existe"}, status=status.HTTP_404_NOT_FOUND)

    
    if not (contraseña == usuario.contraseña):
       
        return Response({"message": "Contraseña incorrecta"}, status=status.HTTP_401_UNAUTHORIZED)

    serializer = Usuario1Serializer(usuario)
    return Response(serializer.data, status=status.HTTP_200_OK)


class PermisoList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Permiso.objects.all()
    serializer_class = PermisoSerializer

class PermisoDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    queryset = Permiso.objects.all()
    serializer_class = PermisoSerializer

class VersionList(generics.ListCreateAPIView):
    permission_classes = [IsAuthenticated]
    renderer_classes = [JSONRenderer]
    queryset = Version.objects.all()
    serializer_class = VersionSerializer

class VersionDetail(generics.RetrieveUpdateDestroyAPIView):
    permission_classes = [IsAuthenticated]
    queryset = Version.objects.all()
    serializer_class = VersionSerializer


class ClientesAPIView(APIView):
    permission_classes = [IsAuthenticated]
   
    def get(self, request, *args, **kwargs):
        # Recuperar los parámetros de consulta
        id_servicio = request.query_params.get('id_servicio')
        usuario = request.query_params.get('usuario')
        cedula = request.query_params.get('cedula')

        # Construir la URL de la API externa con los parámetros
        url = 'http://api.wisphub.net/api/clientes/?limit=50000'

        if id_servicio:
            url += f'&id_servicio={id_servicio}'

        if usuario:
            url += f'&usuario={usuario}@econtel'

        if cedula:
            url += f'&cedula={cedula}'

        headers = {'Authorization': 'Api-Key hM1L5TRK.YkGmkccbO8RGJOEeVHPhv9uHV6m1lcFf'}

        try:
            response = requests.get(url, headers=headers)
            response.raise_for_status()  # Lanza una excepción para errores HTTP

            data = response.json()
            
            if data['results'][0]['direccion'] != '':   

                print(data['results'][0]['direccion'].split('\n')[0])
                data['results'][0]['direccion']= data['results'][0]['direccion'].split('\n')[0]
            return Response(data['results'], status=status.HTTP_200_OK)

        except requests.RequestException as e:
            return Response({'error': f'Error en la solicitud planes: {str(e)}'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

    def post(self, request, *args, **kwargs):
        serializer = UsuarioWishupApiSerializer(data=request.data)
        if serializer.is_valid():
            data_from_request = request.data
            zona = data_from_request["zona"]
            data_from_request.pop('zona')
            # data_from_request["nombre"] =data_from_request["usuario_rb"]
            data_from_request["plan_internet"] = int(data_from_request["plan_internet"])
            try:
                url = f'https://api.wisphub.net/api/clientes/agregar-cliente/{zona}/'

                headers = {'Authorization': 'Api-Key hM1L5TRK.YkGmkccbO8RGJOEeVHPhv9uHV6m1lcFf'}

                response = requests.post(url, json=data_from_request, headers=headers)
                response.raise_for_status()  # Lanza una excepción para errores HTTP
                data = response.json()
                return Response(data, status=status.HTTP_200_OK)
                # return Response(data_from_request, status=status.HTTP_200_OK)
            except requests.RequestException as e:
                return Response({'error': f'Error en la solicitud: {str(e)}'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

            
        elif not serializer.is_valid():
            return Response({'message':'error en datos adninistrados'} , status=status.HTTP_424_FAILED_DEPENDENCY)


class PlanesAPIView(APIView):
    permission_classes = [IsAuthenticated]
    def get(self, request, *args, **kwargs):
        url = 'https://api.wisphub.net/api/plan-internet/?limit=50000'
        headers = {'Authorization': 'Api-Key hM1L5TRK.YkGmkccbO8RGJOEeVHPhv9uHV6m1lcFf'}

        try:
            response = requests.get(url, headers=headers)
            response.raise_for_status()  # Lanza una excepción para errores HTTP

            data = response.json()
            return Response(data['results'], status=status.HTTP_200_OK)

        except requests.RequestException as e:
            return Response({'error': f'Error en la solicitud planes: {str(e)}'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
      

class ZonasAPIView(APIView):
    permission_classes = [IsAuthenticated]

    #@swagger_auto_schema(tags=['Zonas'])
    def get(self, request, *args, **kwargs):
        url = 'https://api.wisphub.net/api/zonas/?limit=50000'
        headers = {'Authorization': 'Api-Key hM1L5TRK.YkGmkccbO8RGJOEeVHPhv9uHV6m1lcFf'}
        
        try:
            response = requests.get(url, headers=headers)
            response.raise_for_status()  # Lanza una excepción para errores HTTP

            data = response.json()
            return Response(data['results'], status=status.HTTP_200_OK)

        except requests.RequestException as e:
            return Response({'error': f'Error en la solicitud zonas: {str(e)}'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        


class SerieUltimoMov(APIView):
    permission_classes = [IsAuthenticated]
    #@swagger_auto_schema(tags=['Series']) 
    def get(self, request, *args, **kwargs):
        url = 'http://10.100.254.162:8559/serie_ultimo_mov'
        headers={"Content-Type":"text"}

        try:
            response = requests.get(url, headers=headers)
            response.raise_for_status()  # Lanza una excepción para errores HTTP

            data = response.json()
            return Response(data, status=status.HTTP_200_OK)

        except requests.RequestException as e:
            return Response({'error': f'Error en la solicitud planes: {str(e)}'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

class TiempoInstalacion(APIView):
    permission_classes = [IsAuthenticated]
    def get(self, request, *args, **kwargs):
        parametro = request.query_params.get('tipo', None)

        # Determinar la URL de la API según el parámetro
        if parametro == 'tecnico':
            url = 'http://10.100.254.162:8559/time_prom_inst_tecn/'
        elif parametro == 'cuadrilla':
            url = 'http://10.100.254.162:8559/time_prom_inst_cuad/'
        else:
            return Response({'error': 'Parámetro incorrecto'}, status=status.HTTP_400_BAD_REQUEST)

        headers={"Content-Type": "text"}

        try:
            response = requests.get(url, headers=headers)
            response.raise_for_status()  # Lanza una excepción para errores HTTP

            data = response.json()
            return Response(data, status=status.HTTP_200_OK)

        except requests.RequestException as e:
            return Response({'error': f'Error en la solicitud: {str(e)}'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        

class TiempoVistaTecnica(APIView):
    permission_classes = [IsAuthenticated]
    def get(self, request, *args, **kwargs):
        parametro = request.query_params.get('tipo', None)

        if parametro == 'tecnico':
            url = 'http://10.100.254.162:8559/time_prom_vist_tecn/'
        elif parametro == 'cuadrilla':
            url = 'http://10.100.254.162:8559/time_prom_vist_cuad/'
        else:
            return Response({'error': 'Parámetro incorrecto'}, status=status.HTTP_400_BAD_REQUEST)

        headers={"Content-Type": "text"}

        try:
            response = requests.get(url, headers=headers)
            response.raise_for_status()  # Lanza una excepción para errores HTTP

            data = response.json()
            return Response(data, status=status.HTTP_200_OK)

        except requests.RequestException as e:
            return Response({'error': f'Error en la solicitud: {str(e)}'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        

class Instalaciones(APIView):
    permission_classes = [IsAuthenticated]
    def get(self, request, *args, **kwargs):
        # Obtener el parámetro de la solicitud
        parametro = request.query_params.get('tipo', None)

        # Determinar la URL de la API según el parámetro
        if parametro == 'tecnico':
            url = 'http://10.100.254.162:8559/isntalac_realiz_tecnico/'
        elif parametro == 'cuadrilla':
            url = 'http://10.100.254.162:8559/isntalac_realiz_cuadrilla/'
        else:
            return Response({'error': 'Parámetro incorrecto'}, status=status.HTTP_400_BAD_REQUEST)

        headers={"Content-Type": "text"}

        try:
            response = requests.get(url, headers=headers)
            response.raise_for_status()  # Lanza una excepción para errores HTTP

            data = response.json()
            return Response(data, status=status.HTTP_200_OK)

        except requests.RequestException as e:
            return Response({'error': f'Error en la solicitud: {str(e)}'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    
class VisitaTecnica(APIView):
    permission_classes = [IsAuthenticated]
    def get(self, request, *args, **kwargs):
        # Obtener el parámetro de la solicitud
        parametro = request.query_params.get('tipo', None)

        # Determinar la URL de la API según el parámetro
        if parametro == 'tecnico':
            url = 'http://10.100.254.162:8559/visitaTecn_realiz_tecnico/'
        elif parametro == 'cuadrilla':
            url = 'http://10.100.254.162:8559/visitaTecn_realiz_cuadrilla/'
        else:
            return Response({'error': 'Parámetro incorrecto'}, status=status.HTTP_400_BAD_REQUEST)

        headers={"Content-Type": "text"}

        try:
            response = requests.get(url, headers=headers)
            response.raise_for_status()  # Lanza una excepción para errores HTTP

            data = response.json()
            return Response(data, status=status.HTTP_200_OK)

        except requests.RequestException as e:
            return Response({'error': f'Error en la solicitud: {str(e)}'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        
class Migracion(APIView):
    permission_classes = [IsAuthenticated]
    def get(self, request, *args, **kwargs):
        # Obtener el parámetro de la solicitud
        parametro = request.query_params.get('tipo', None)

        # Determinar la URL de la API según el parámetro
        if parametro == 'tecnico':
            url = 'http://10.100.254.162:8559/migracion_realiz_tecnico/'
        elif parametro == 'cuadrilla':
            url = 'http://10.100.254.162:8559/migracion_realiz_cuadrilla/'
        else:
            return Response({'error': 'Parámetro incorrecto'}, status=status.HTTP_400_BAD_REQUEST)

        headers={"Content-Type": "text"}

        try:
            response = requests.get(url, headers=headers)
            response.raise_for_status()  # Lanza una excepción para errores HTTP

            data = response.json()
            return Response(data, status=status.HTTP_200_OK)

        except requests.RequestException as e:
            return Response({'error': f'Error en la solicitud: {str(e)}'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        

class TiemposCuadrilla(APIView):
    permission_classes = [IsAuthenticated]
    def get(self, request, *args, **kwargs):
        # Obtener el parámetro de la solicitud
        parametro = request.query_params.get('estadistico', None)

        # Determinar la URL de la API según el parámetro
        if parametro == 'Tiempo_recorrido_dia':
            url = 'http://10.100.254.162:8559/Tiempo_recorrido_dia/'
        elif parametro == 'Tiempo_recorrido_mes':
            url = 'http://10.100.254.162:8559/Tiempo_recorrido_mes/'
        elif parametro == 'tiempo_promedio_dia':
            url = 'http://10.100.254.162:8559/Tiempo_Promedio_rec_dia/'
        else:
            return Response({'error': 'Parámetro incorrecto'}, status=status.HTTP_400_BAD_REQUEST)

        headers={"Content-Type": "text"}

        try:
            response = requests.get(url, headers=headers)
            response.raise_for_status()  # Lanza una excepción para errores HTTP

            data = response.json()
            return Response(data, status=status.HTTP_200_OK)

        except requests.RequestException as e:
            return Response({'error': f'Error en la solicitud: {str(e)}'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        
class Actividad(APIView):
    permission_classes = [IsAuthenticated]
    #@swagger_auto_schema(tags=['Actividad']) 
    def get(self, request, *args, **kwargs):
        url = 'http://10.100.254.162:8559/actividades'
        headers={"Content-Type":"text"}

        try:
            response = requests.get(url, headers=headers)
            response.raise_for_status()  # Lanza una excepción para errores HTTP

            data = response.json()
            return Response(data, status=status.HTTP_200_OK)

        except requests.RequestException as e:
            return Response({'error': f'Error en la solicitud: {str(e)}'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
    
class Solicitud(APIView):
    permission_classes = [IsAuthenticated]
    #@swagger_auto_schema(tags=['Solicitud']) 
    def get(self, request, *args, **kwargs):

        parametro = request.query_params.get('estado', None)
        inicio = self.request.query_params.get('inicio', None)
        fin= self.request.query_params.get('fin', None)
        if parametro != 'TODOS' and inicio and fin:
            url = 'http://10.100.254.162:8559/solicitudes/'+parametro+'/'+inicio+'/'+fin
        elif parametro == 'TODOS' and inicio and fin:
            url = 'http://10.100.254.162:8559/solicitudes/'+inicio+'/'+fin
        elif parametro != 'TODOS':
            url = 'http://10.100.254.162:8559/solicitudes/'+parametro
        elif inicio and fin:
            url = 'http://10.100.254.162:8559/solicitudes/'+inicio+'/'+fin
        else:
            url = 'http://10.100.254.162:8559/solicitudes'

        headers={"Content-Type":"text"}

        try:
            response = requests.get(url, headers=headers)
            response.raise_for_status()  # Lanza una excepción para errores HTTP

            data = response.json()
            return Response(data, status=status.HTTP_200_OK)

        except requests.RequestException as e:
            return Response({'error': f'Error en la solicitud: {str(e)}'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)
        
class Hoja(APIView):
    permission_classes = [IsAuthenticated]
    #@swagger_auto_schema(tags=['Hoja']) 
    def get(self, request, *args, **kwargs):

        inicio = self.request.query_params.get('inicio', None)
        fin= self.request.query_params.get('fin', None)
        if inicio and fin:
            url = 'http://10.100.254.162:8559/hojas/'+inicio+'/'+fin
        else:
            url = 'http://10.100.254.162:8559/hojas'

        headers={"Content-Type":"text"}

        try:
            response = requests.get(url, headers=headers)
            response.raise_for_status()  # Lanza una excepción para errores HTTP

            data = response.json()
            return Response(data, status=status.HTTP_200_OK)

        except requests.RequestException as e:
            return Response({'error': f'Error en la solicitud: {str(e)}'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


class Cuadrilla(APIView):
    permission_classes = [IsAuthenticated]
    #@swagger_auto_schema(tags=['Cuadrilla']) 
    def get(self, request, *args, **kwargs):
        url = 'http://10.100.254.162:8559/cuadrillas'
        headers={"Content-Type":"text"}

        try:
            response = requests.get(url, headers=headers)
            response.raise_for_status()  # Lanza una excepción para errores HTTP

            data = response.json()
            return Response(data, status=status.HTTP_200_OK)

        except requests.RequestException as e:
            return Response({'error': f'Error en la solicitud: {str(e)}'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


class SeriesDisponibles(APIView):
    permission_classes = [IsAuthenticated]
    #@swagger_auto_schema(tags=['SeriesDisponibles']) 
    def get(self, request, *args, **kwargs):
        url = 'http://10.100.254.162:8559/seriesdisponibles'
        headers={"Content-Type":"text"}

        try:
            response = requests.get(url, headers=headers)
            response.raise_for_status()  # Lanza una excepción para errores HTTP

            data = response.json()
            return Response(data, status=status.HTTP_200_OK)

        except requests.RequestException as e:
            return Response({'error': f'Error en la solicitud: {str(e)}'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


class Desgloce(APIView):
    permission_classes = [IsAuthenticated]
    #@swagger_auto_schema(tags=['Desgloce']) 
    def get(self, request, *args, **kwargs):
        url = 'http://10.100.254.162:8559/desgloce'
        headers={"Content-Type":"text"}

        try:
            response = requests.get(url, headers=headers)
            response.raise_for_status()  # Lanza una excepción para errores HTTP

            data = response.json()
            return Response(data, status=status.HTTP_200_OK)

        except requests.RequestException as e:
            return Response({'error': f'Error en la solicitud: {str(e)}'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)


class Alertas(APIView):
    permission_classes = [IsAuthenticated]
    #@swagger_auto_schema(tags=['Alerta']) 
    def get(self, request, *args, **kwargs):

        vehiculo = self.request.query_params.get('vehiculo', None)
        if vehiculo:
            url = 'http://10.100.254.162:8559/alerta/'+vehiculo
        else:
            url = 'http://10.100.254.162:8559/alerta'
        headers={"Content-Type":"text"}

        try:
            response = requests.get(url, headers=headers)
            response.raise_for_status()  # Lanza una excepción para errores HTTP

            data = response.json()
            return Response(data, status=status.HTTP_200_OK)

        except requests.RequestException as e:
            return Response({'error': f'Error en la solicitud: {str(e)}'}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)