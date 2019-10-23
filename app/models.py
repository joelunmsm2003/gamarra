# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = True` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from __future__ import unicode_literals

from django.db import models
import datetime
from django.db.models import Avg, Count, Min, Sum



class Color(models.Model):
    nombre = models.CharField(max_length=1000, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'color'



    def __unicode__(self):

        if self.nombre:

            return self.nombre

        else:

            return ''


class Local(models.Model):
    nombre = models.CharField(max_length=1000, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'local'

    def __unicode__(self):

        if self.nombre:

            return self.nombre

        else:

            return ''

class Proveedor(models.Model):
    nombre = models.CharField(max_length=1000, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'proveedor'


    def __unicode__(self):

        if self.nombre:

            return self.nombre

        else:

            return ''

class Prenda(models.Model):

    codigo = models.CharField(max_length=1000, blank=True, null=True)
    origen = models.ForeignKey('Local', models.DO_NOTHING, db_column='prenda_origen', blank=True, null=True,related_name='origen')
    ubicacion = models.ForeignKey('Local', models.DO_NOTHING, db_column='ubicacion', blank=True, null=True,related_name='ubicacion')    
    descripcion = models.CharField(max_length=1000, blank=True, null=True)
    modelo = models.ForeignKey('Modelo', models.DO_NOTHING, db_column='modelo', blank=True, null=True,related_name='modelo')
    talla = models.ForeignKey('Talla', models.DO_NOTHING, db_column='talla', blank=True, null=True,related_name='talla')
    color = models.ForeignKey('Color', models.DO_NOTHING, db_column='color', blank=True, null=True,related_name='color')
    proveedor = models.ForeignKey('Proveedor', models.DO_NOTHING, db_column='proveedor', blank=True, null=True)
    cantidad = models.IntegerField(blank=True, null=True)
    tipo = models.CharField(max_length=1000, blank=True, null=True)
    fecha_creacion = models.DateTimeField('Fecha Ingreso',max_length=1000, blank=True, null=True)
    fecha_ingreso = models.DateTimeField('Fecha Movimiento',max_length=1000, blank=True, null=True)
    observacion = models.CharField(max_length=1000, blank=True, null=True)
    nombre_modelo = models.CharField(max_length=1000, blank=True, null=True)    
    venta = models.BooleanField(blank=True,default=False)
    pormayor = models.BooleanField(blank=True,default=False)
    sin_codigo = models.BooleanField(blank=True,default=False)
    precio = models.CharField(max_length=1000, blank=True, null=True)
    bono = models.CharField(max_length=1000, blank=True, null=True)
    fecha_venta = models.DateTimeField(blank=True, null=True)
    boleta = models.CharField(max_length=1000, blank=True, null=True)
    vendedora = models.ForeignKey('Vendedora', models.DO_NOTHING, db_column='vendedora', blank=True, null=True)
    vendedora2 = models.ForeignKey('Vendedora', models.DO_NOTHING, db_column='vendedora2', blank=True, null=True,related_name='vendedora2')
        

    class Meta:
        managed = True
        db_table = 'prenda'


class Vendedora(models.Model):
    nombre = models.CharField(max_length=1000, blank=True, null=True)
    telefono = models.CharField(max_length=1000, blank=True, null=True)
    edad = models.CharField(max_length=1000, blank=True, null=True)



    class Meta:
        managed = True
        db_table = 'vendedora'





    @property
    def termometro(self):
        
        bono=0

        print 'tiempoooooooooooooooooooo',datetime.date.today()

        _bono = Prenda.objects.filter(vendedora_id=self.id,fecha_venta__gte=datetime.date.today())

        for b in _bono:

            if b.precio>0:

                try:

                    bono=bono+int(b.precio)
                
                except:

                    pass

        t = int(bono*100/2000)

        if int(bono*100/2000)>100:

            t=100

        return t


    @property
    def termometrocolor(self):
        
        bono=0

        print 'tiempoooooooooooooooooooo',datetime.date.today()

        _bono = Prenda.objects.filter(vendedora_id=self.id,fecha_venta__gte=datetime.date.today())

        for b in _bono:

            if b.precio>0:

                try:

                    bono=bono+int(b.precio)

                except:

                    pass
        #self.total =self.id

        color='red'

        if int(bono*100/2000)>33:

            color='yellow'

        if int(bono*100/2000)>66:

            color='green'

        return color


    def __unicode__(self):

        if self.nombre:

            return self.nombre

        else:

            return ''

class Modelo(models.Model):
    nombre = models.CharField(max_length=1000, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'modelo'


    def __unicode__(self):

        if self.nombre:

            return self.nombre

        else:

            return ''



class Movimiento(models.Model):

    destino = models.ForeignKey('Local', models.DO_NOTHING, db_column='destino', blank=True, null=True,related_name='destino')    
    _origen = models.ForeignKey('Local', models.DO_NOTHING, db_column='origen', blank=True, null=True,related_name='_origen')
    prenda = models.ForeignKey('Prenda', models.DO_NOTHING, db_column='prenda', blank=True, null=True,related_name='prenda')
    fecha = models.DateTimeField(max_length=1000, blank=True, null=True,default=datetime.datetime.today())
    observacion = models.CharField(max_length=1000, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'movimiento'

    def __unicode__(self):

        if self.nombre:

            return self.nombre

        else:

            return ''


class Talla(models.Model):
    nombre = models.CharField(max_length=1000, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'talla'


    def __unicode__(self):

        if self.nombre:

            return self.nombre

        else:

            return ''