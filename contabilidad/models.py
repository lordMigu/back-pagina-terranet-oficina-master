from django.db import models
from store.models import Bodega
from agenda.models import Solicitud
from user.models import Usuario
from django.utils import timezone


class MotivoGasto(models.Model):
    id = models.AutoField(primary_key=True)
    motivo = models.CharField(max_length=200) 
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)


    
    def __str__(self):
        return f'{self.motivo}'
    class Meta:
        db_table = 'motivo_gasto'


class Combustible(models.Model):
    id = models.AutoField(primary_key=True)
    foto_comprobante = models.TextField(blank=True)
    descripcion = models.CharField(max_length=300)
    monto_gasolina = models.FloatField()
    motivo_gasto = models.ForeignKey('MotivoGasto', on_delete=models.SET_NULL, null=True)
    id_tecnico = models.ForeignKey(Usuario, on_delete=models.SET_NULL,null=True, blank=True, related_name='combustibles')
    id_cuadrilla = models.ForeignKey(Bodega, on_delete=models.SET_NULL,null=True, blank=True, related_name='combustibles')

    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)

    def __str__(self):
            return self.descripcion
    class Meta:
        db_table = 'combustible'

class Recepcion(models.Model):
    id = models.AutoField(primary_key=True)
    foto_plata = models.TextField(blank=True)
    descripcion = models.CharField(max_length=300)
    monto = models.FloatField()
    id_tecnico = models.ForeignKey(Usuario, on_delete=models.SET_NULL,null=True, blank=True, related_name='recepciones')

    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)

    def __str__(self):
            return self.descripcion
    class Meta:
        db_table = 'recepcion'



class TipoRevision(models.Model):
    id = models.AutoField(primary_key=True)
    tipo = models.CharField(max_length=200) 
    programable = models.CharField(max_length=20)

    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)
    
    def __str__(self):
        return f'{self.motivo}'
    class Meta:
        db_table = 'tipo_revision'


class Vehiculo(models.Model):
    id = models.AutoField(primary_key=True)
    descripcion = models.CharField(max_length=300,blank=True)
    placa = models.CharField(max_length=20, null=True, blank=True)
    modelo = models.CharField(max_length=100, null=True, blank=True)
    nombre = models.CharField(max_length=100, null=True, blank=True)
    km = models.CharField(max_length=20, null=True, blank=True)
    usuario = models.ForeignKey(Usuario, on_delete=models.SET_NULL,null=True, blank=True, related_name='vehiculo')
    cuadrilla = models.ForeignKey(Bodega, on_delete=models.SET_NULL, null=True, blank=True, related_name='vehiculo')

    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)

    def __str__(self):
            return self.descripcion
    class Meta:
        db_table = 'vehiculo'


class Revision(models.Model):
    id = models.AutoField(primary_key=True)
    foto = models.TextField(null=True, blank=True)
    descripcion = models.CharField(max_length=300)
    km = models.CharField(max_length=20, null=True, blank=True)
    km_futura = models.CharField(max_length=20, null=True, blank=True)
    tipo_revision = models.ForeignKey('TipoRevision', on_delete=models.SET_NULL, null=True)
    usuario = models.ForeignKey(Usuario, on_delete=models.SET_NULL,null=True, blank=True, related_name='revision')
    vehiculo = models.ForeignKey(Vehiculo, on_delete=models.SET_NULL, null=True, blank=True, related_name='revision')

    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)

    def __str__(self):
            return self.descripcion
    class Meta:
        db_table = 'revision'


