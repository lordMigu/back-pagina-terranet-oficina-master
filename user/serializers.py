from rest_framework import serializers
from .models import Rol, Usuario, Permiso

from rest_framework import serializers
from .models import Rol, Usuario, Permiso,UsuarioWishupApi,Version

class PermisoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Permiso
        fields = '__all__'

class RolSerializer(serializers.ModelSerializer):
    permisos = PermisoSerializer(many=True, read_only=True)
    
    class Meta:
        model = Rol
        fields = '__all__'

class UsuarioSerializer(serializers.ModelSerializer):

    class Meta:
        model = Usuario
        fields = '__all__'

class Usuario1Serializer(serializers.ModelSerializer):
    roles = RolSerializer(many=True, read_only=True)
    class Meta:
        model = Usuario
        fields = '__all__'
    
class UsuarioWishupApiSerializer(serializers.ModelSerializer):

    class Meta:
        model = UsuarioWishupApi
        fields = ["ip","plan_internet","zona","usuario_rb"]



class VersionSerializer(serializers.ModelSerializer):
    class Meta:
        model = Version
        fields = '__all__'