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

class Color(models.Model):
    nombre = models.CharField(max_length=1000, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'color'



    def __unicode__(self):

        return self.nombre



class Local(models.Model):
    nombre = models.CharField(max_length=1000, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'local'


    def __unicode__(self):

        return self.nombre

class Proveedor(models.Model):
    nombre = models.CharField(max_length=1000, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'proveedor'


    def __unicode__(self):

        return self.nombre



class Modelo(models.Model):
    nombre = models.CharField(max_length=1000, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'modelo'


    def __unicode__(self):

        return self.nombre


class Movimiento(models.Model):
    origen = models.ForeignKey('Local', models.DO_NOTHING, db_column='origen', blank=True, null=True,related_name='origen')
    destino = models.ForeignKey('Local', models.DO_NOTHING, db_column='destino', blank=True, null=True,related_name='destino')    
    modelo = models.ForeignKey('Modelo', models.DO_NOTHING, db_column='modelo', blank=True, null=True)
    talla = models.ForeignKey('Talla', models.DO_NOTHING, db_column='talla', blank=True, null=True)
    color = models.ForeignKey('Color', models.DO_NOTHING, db_column='color', blank=True, null=True)
    proveedor = models.ForeignKey('Proveedor', models.DO_NOTHING, db_column='proveedor', blank=True, null=True)
    cantidad = models.IntegerField(blank=True, null=True)
    tipo = models.CharField(max_length=1000, blank=True, null=True)
    fecha = models.CharField(max_length=1000, blank=True, null=True,default=datetime.datetime.today())

    class Meta:
        managed = True
        db_table = 'movimiento'




class Talla(models.Model):
    nombre = models.CharField(max_length=1000, blank=True, null=True)

    class Meta:
        managed = True
        db_table = 'talla'
