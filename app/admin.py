from django.contrib import admin
from app.models import *
# Register your models here.
@admin.register(Color)
class ColorAdmin(admin.ModelAdmin):
	list_display = ('id','nombre',)

@admin.register(Local)
class LocalAdmin(admin.ModelAdmin):
	list_display = ('id','nombre',)
	csv_fields = ['id', 'nombre']


@admin.register(Modelo)
class ModeloAdmin(admin.ModelAdmin):
	list_display = ('id','nombre',)


@admin.register(Vendedora)
class VendedoraAdmin(admin.ModelAdmin):
	list_display = ('id','nombre',)


@admin.register(Talla)
class TallaAdmin(admin.ModelAdmin):
	list_display = ('id','nombre',)


@admin.register(Prenda)
class PrendaAdmin(admin.ModelAdmin):
	list_display = ('id','ubicacion','modelo','talla','color','fecha_creacion','fecha_ingreso','fecha_venta','precio','vendedora')
	#list_filter = ('ubicacion','origen')
	#list_editable = ('',)
	#search_fields = ('codigo',)


@admin.register(Movimiento)
class MovimientoAdmin(admin.ModelAdmin):
	list_display = ('id','_origen','destino','prenda','fecha')
