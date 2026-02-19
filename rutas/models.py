from django.db import models
from store.models import Bodega
from agenda.models import Solicitud
from user.models import Usuario
from django.utils import timezone

# Create your models here.
class ActividadHistorial(models.Model):
    actividad = models.ForeignKey('Actividad', on_delete=models.SET_NULL, null=True)
    usuario_mod = models.ForeignKey(Usuario, on_delete=models.SET_NULL, null=True)
    fecha_modificacion = models.DateTimeField(default=timezone.now)
    estado = models.CharField(max_length=200)
    ruta = models.ForeignKey('Ruta', on_delete=models.SET_NULL, null=True,related_name= 'actividades', blank=True)
    
    def __str__(self):
        return f'{self.actividad.nombre} - {self.usuario_mod.username} - {self.fecha_modificacion}'
    class Meta:
        db_table = 'actividad_historial'
        ordering = ['-fecha_modificacion']

class Actividad(models.Model):
    id = models.AutoField(primary_key=True)
    descripcion = models.CharField(max_length=300)
    fecha = models.DateTimeField()
    id_reagendado = models.IntegerField(blank=True, null=True)
    ruta = models.ForeignKey('Ruta', on_delete=models.SET_NULL, null=True, blank=True)
    estado = models.CharField(max_length=200)
    solicitud = models.ForeignKey(Solicitud, on_delete=models.SET_NULL, null=True, blank=True)
    usuario_mod = models.ForeignKey(Usuario, on_delete=models.SET_NULL, null=True)
    id_tecnico = models.ForeignKey(Usuario, on_delete=models.SET_NULL, null=True, blank=True, related_name='actividades')
    id_cuadrilla = models.ForeignKey(Bodega, on_delete=models.SET_NULL, null=True, blank=True)
    tiempo_inicio = models.DateTimeField(null=True, blank=True)
    tiempo_fin = models.DateTimeField(null=True, blank=True)
    km = models.CharField(max_length=20, null=True, blank=True)
    distancia = models.CharField(max_length=125, null=True, blank=True)
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)
    motivo_cancelado = models.CharField(max_length=300, null=True, blank=True)

    def save(self, *args, **kwargs):
        super().save(*args, **kwargs)

        ActividadHistorial.objects.create(
            actividad=self,
            usuario_mod=self.usuario_mod,
            estado = self.estado,
            ruta = self.ruta
            # Agrega otros campos del historial según sea necesario
        )

    def __str__(self):
            return self.descripcion
    class Meta:
        db_table = 'actividad'

class Ruta(models.Model):
    id = models.AutoField(primary_key=True)
    cuadrilla = models.ForeignKey(Bodega, on_delete=models.SET_NULL, null=True, blank=True)
    estado = models.CharField(max_length=60, blank=True, null=True)
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)
    tiempo_inicio = models.DateTimeField(null=True, blank=True)
    tiempo_fin = models.DateTimeField(null=True, blank=True)

    def __str__(self):
            return f"{self.id}"
    class Meta:
        db_table = 'ruta'

    