from django.db import models
from user.models import Usuario
from django.utils import timezone

# from django.core.validators import MinValueValidator 
class Bodega(models.Model):
    id = models.AutoField(primary_key=True)
    codigo = models.CharField(max_length=20, unique=True)
    nombre = models.CharField(max_length=150)
    ubicacion = models.CharField(blank=True,null=True,max_length=150)
    personas_encargadas = models.ManyToManyField(Usuario, related_name='bodega_encargados', blank=True)
    tipo = models.CharField(max_length=25)
    modelo = models.CharField(max_length=100, blank=True, null=True)
    placa = models.CharField(max_length=25, blank=True, null=True)
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)


    def __str__(self):
        return self.nombre
    class Meta:
        db_table = 'bodega'

class Marca(models.Model):
    id = models.AutoField(primary_key=True)
    marca = models.CharField(max_length=30)
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)


    def __str__(self):
        return self.marca
    class Meta:
        db_table = 'marca'

class Modelo(models.Model):
    id = models.AutoField(primary_key=True)
    modelo = models.CharField(max_length=30)
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return self.modelo
    class Meta:
        db_table = 'modelo'

class Unidad(models.Model):
    id = models.AutoField(primary_key=True)
    unidad = models.CharField(max_length=30)
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)


    
    def __str__(self):
        return self.unidad
    class Meta:
        db_table = 'unidad'

class Producto(models.Model):
    id = models.AutoField(primary_key=True)
    codigo = models.CharField(max_length=20, unique=True)
    nombre = models.CharField(max_length=100)
    nombre_simple = models.CharField(max_length=100,null=True,default='')
    marca = models.ForeignKey(Marca, on_delete=models.SET_NULL, null=True, blank=True)
    modelo = models.ForeignKey(Modelo, on_delete=models.SET_NULL, null=True, blank=True)
    unidad = models.ForeignKey(Unidad, on_delete=models.SET_NULL, null=True, blank=True)
    stock_min = models.PositiveIntegerField()
    tipo = models.CharField(max_length=35)
    usa_serie = models.BooleanField(default=False)
    unidad_real = models.IntegerField( null=True, blank=True,default=1)
    tipo2 = models.CharField(max_length=35,blank=True,default="SIMPLE")
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)
    imagenURL = models.CharField(null=True, max_length=255)


    def get_stock_in_bodega(self, bodega):
        try:
            stock = Stock.objects.get(bodega=bodega, producto=self)
            return stock.cantidad
        except Stock.DoesNotExist:
            return 0
    
    def __str__(self):
        return f'{self.id}  {self.codigo} - {self.nombre}'
    class Meta:
        db_table = 'producto'

class Proveedor(models.Model):
    id = models.AutoField(primary_key=True)
    codigo = models.CharField(max_length=20, unique=True)
    nombre = models.CharField(max_length=100)
    ubicacion = models.CharField(max_length=100)
    garantia = models.CharField(max_length=100)
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)


    
    def __str__(self):
        return self.nombre
    class Meta:
        db_table = 'proveedor'

class Stock(models.Model):
    id = models.AutoField(primary_key=True)
    bodega = models.ForeignKey(Bodega, on_delete=models.SET_NULL, null=True)
    producto = models.ForeignKey(Producto, on_delete=models.SET_NULL, null=True)
    cantidad = models.PositiveIntegerField(default=0)
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)

        
    def __str__(self):
        return f'{self.bodega} - {self.producto} - {self.cantidad}'
    class Meta:
        db_table = 'stock'

class Serie(models.Model):
    id = models.AutoField(primary_key=True)
    serie = models.CharField(max_length=60, unique=True)
    proveedor = models.ForeignKey(Proveedor, on_delete=models.SET_NULL, null=True, related_name='serie_proveedor')
    producto = models.ForeignKey(Producto, on_delete=models.SET_NULL, null=True, related_name='serie_producto')
    bodega = models.ForeignKey(Bodega, on_delete=models.SET_NULL, null=True, related_name='serie_bodega' )
    tipo = models.CharField(max_length=35,blank=True,default="SIMPLE")
    estado = models.CharField(max_length=35,blank=True,default="ACTIVO")
    stock = models.PositiveIntegerField(null=True, default=1)
    garantia =  models.CharField(max_length=5,blank=True,default="NO")
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return f'{self.id} - {self.serie}'
    class Meta:
        db_table = 'series'

class MotivoMovimiento(models.Model):
    id = models.AutoField(primary_key=True)
    motivo = models.CharField(max_length=200) 
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)


    
    def __str__(self):
        return f'{self.motivo}'
    class Meta:
        db_table = 'motivo_movimiento'

class Movimiento(models.Model):
    
    TIPO_CHOICES = [
        ('INGRESO', 'INGRESO'),
        ('EGRESO', 'EGRESO'),
    ]

    id = models.AutoField(primary_key=True)
    producto = models.ForeignKey('Producto', on_delete=models.SET_NULL, null=True)
    id_actividad = models.IntegerField(blank=True, null=True)
    cantidad = models.PositiveIntegerField()
    proveedor = models.ForeignKey('Proveedor', on_delete=models.SET_NULL, null=True)
    bodega = models.ForeignKey('Bodega', on_delete=models.SET_NULL, null=True)
    usuario  = models.ForeignKey(Usuario, on_delete=models.SET_NULL, null=True)
    motivo_movimiento = models.ForeignKey('MotivoMovimiento', on_delete=models.SET_NULL, null=True)
    tipomovimiento = models.CharField(max_length=10, choices=TIPO_CHOICES)
    descripcion = models.CharField(max_length=255)
    series = models.ManyToManyField(Serie, blank=True)
    foto = models.CharField(max_length=300, null=True, blank=True)
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)



    def __str__(self):
        return f'{self.usuario} - {self.producto} - {self.cantidad} - {self.tipomovimiento}'

    class Meta:
        db_table = 'movimiento'


class Transferencia(models.Model):
    id = models.AutoField(primary_key=True)
    movimiento_origen = models.OneToOneField(
        Movimiento,
        on_delete=models.CASCADE,
        related_name='transferencia_origen'
    )
    movimiento_destino = models.OneToOneField(
        Movimiento,
        on_delete=models.CASCADE,
        related_name='transferencia_destino'
    )

    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(default=timezone.now)

    def __str__(self):
        return f'Transferencia de {self.movimiento_origen.bodega} a {self.movimiento_destino.bodega}'
    class Meta:
        db_table = 'transferencia'
