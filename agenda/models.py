from django.db import models
from store.models import Producto
from user.models import Usuario
from django.utils import timezone


class TipoSolicitud(models.Model):
    id = models.AutoField(primary_key=True)
    tipo = models.CharField(max_length=255, unique=True)
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return f'{self.id} - {self.tipo}'
    class Meta:
        db_table = 'tipo_solicitud'

class Solicitud(models.Model):
    id = models.AutoField(primary_key=True)
    idcliente =models.CharField(max_length=20, blank=True)
    tipo = models.CharField(max_length=60)
    usuario_solicitud = models.ForeignKey(Usuario, on_delete=models.SET_NULL, null=True, related_name='solicitudes_user_solicitud', blank=True)
    usuario_revision = models.ForeignKey(Usuario, on_delete=models.SET_NULL, null=True, related_name='solicitudes_user_revision', blank=True)
    usuario_agendo = models.ForeignKey(Usuario, on_delete=models.SET_NULL, null=True, related_name='solicitudes_user_agenda', blank=True)
    fecha_agenda = models.DateTimeField(blank=True, null=True) 
    estado = models.CharField(max_length=220, blank=True, null=True)
    descripcion = models.TextField(max_length=220, blank=True, null=True)
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)


    observacion = models.TextField(blank=True)
    casa_npisos = models.CharField(max_length=120,blank=True)
    cliente_tiene_equipo = models.CharField(max_length=120,blank=True)

    #Datos de diferentes solicitudes
    #CONTRATAR
    cedula = models.CharField(max_length=20,blank=True)
    direccion = models.CharField(max_length=300,blank=True)
    latitud = models.CharField(max_length=50,blank=True)
    longitud = models.CharField(max_length=50,blank=True)
    celular = models.CharField(max_length=50,blank=True)
    telefono = models.CharField(max_length=50,blank=True)
    correo_electronico = models.EmailField(blank=True)
    plan_contratar = models.CharField(max_length=100,blank=True)
    horarios_disponibles = models.CharField(max_length=256,blank=True)
    foto_casa = models.TextField(blank=True)
    #CAMBIO DE DOMICILIO
    nombres_cliente = models.CharField(max_length=255, blank=True)
    direccion_anterior = models.CharField(max_length=255, blank=True)
    latitud_anterior = models.CharField(max_length=20,blank=True)
    longitud_anterior = models.CharField(max_length=20,blank=True)
    latitud_nueva = models.CharField(max_length=20,blank=True)
    longitud_nueva = models.CharField(max_length=20,blank=True)
    #VISITA TECNICA
    senal_potencia = models.CharField(max_length=50, blank=True)
    tecnologia = models.CharField(max_length=50, blank=True)
    
    observacion_diagnostico = models.TextField(blank=True)
    gestion_operador = models.TextField(blank=True)
    # MIGRACION 
    ## direccion,ubicacion_gps,telefonos, horarios_disponibles

    def __str__(self):
        return f'{self.id} - {self.tipo}'
    class Meta:
        db_table = 'solicitud'

class Kit(models.Model):
    id = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=255)
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)
    
    def __str__(self):
        return self.nombre
    class Meta:
        db_table = 'kit'

class KitXProducto(models.Model):
    id = models.AutoField(primary_key=True)
    kit = models.ForeignKey(Kit, on_delete=models.SET_NULL, null=True)
    producto = models.ForeignKey(Producto, on_delete=models.SET_NULL, null=True)
    cantidad = models.PositiveIntegerField()
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return self.nombre
    class Meta:
        db_table = 'kitxproducto'

class HojadeTrabajo(models.Model):
    id = models.AutoField(primary_key=True)
    estado =models.CharField(max_length=35, blank=True)
    tipo = models.CharField(max_length=60, blank=True)
    id_actividad = models.IntegerField(blank=True, null=True)
    usuario_creacion = models.ForeignKey(Usuario, on_delete=models.SET_NULL, null=True, related_name='hojatrabajo_user_solicitud', blank=True)
    usuario_modificacion = models.ForeignKey(Usuario, on_delete=models.SET_NULL, null=True, related_name='hojatrabajo_user_revision', blank=True)
    datos = models.JSONField(null=True)
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)

    class Meta:
        db_table = 'hojatrabajo'

class Wisphub(models.Model):
    id = models.AutoField(primary_key=True)
    usuario_creacion = models.ForeignKey(Usuario, on_delete=models.SET_NULL, null=True, related_name='wisphub_ususario_crea', blank=True)
    hojatrabajo = models.ForeignKey(HojadeTrabajo, on_delete=models.SET_NULL, null=True, related_name='wisphubhojatrabajo')
    idzona = models.CharField(max_length=25, blank=True)
    zona = models.CharField(max_length=75, blank=True)
    plan = models.CharField(max_length=75, blank=True)
    ip = models.CharField(max_length=15, blank=True)
    id_plan = models.CharField(max_length=25, blank=True)
    usuariorb = models.CharField(max_length=55, blank=True)
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)

    class Meta:
        db_table = 'wisphub'

