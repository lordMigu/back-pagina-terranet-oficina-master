from django.db import models
from django.utils import timezone


class Permiso(models.Model):
    id = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=50, unique=True)
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)



    def __str__(self):
        return self.nombre
    class Meta:
        db_table = 'permiso'

class Rol(models.Model):
    id = models.AutoField(primary_key=True)
    rol = models.CharField(max_length=50, unique=True)
    permisos = models.ManyToManyField(Permiso, related_name='roles', blank=True)
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)


    
    def __str__(self):
        return self.rol
    class Meta:
        db_table = 'rol'


class Usuario(models.Model):
    id = models.AutoField(primary_key=True)
    uid = models.CharField(blank=True, null=True,max_length=350)
    nombre = models.CharField(max_length=100)
    cedula = models.CharField(max_length=10, unique=True)
    correo = models.EmailField(max_length=100, unique=True)
    contraseña = models.CharField(max_length=100)  # Se recomienda almacenar las contraseñas de manera segura
    roles = models.ManyToManyField(Rol, related_name='usuarios', blank=True)
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)


    
    def __str__(self):
        return self.nombre
    class Meta:
        db_table = 'usuario'



#########################################################
#########################################################

class UsuarioWishupApi(models.Model):
    id = models.AutoField(primary_key=True)
    ip = models.CharField(max_length=15)
    plan_internet = models.CharField(max_length=10)
    zona = models.CharField(max_length=10)
    nombre = models.CharField(max_length=123)
    usuario_rb = models.CharField(max_length=123)
    cedula = models.CharField(max_length=13)

    def __str__(self):
        return self.nombre
    
    class Meta:
        db_table = 'usuarioWishupapi'


class Version(models.Model):
    version = models.CharField(max_length=10)
    sistema = models.CharField(max_length=30,blank=True)

    class Meta:
        db_table = 'version'