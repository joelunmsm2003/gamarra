from django.contrib import admin
from app.models import *
# Register your models here.
@admin.register(Color)
class ColorAdmin(admin.ModelAdmin):
	list_display = ('id','nombre',)

@admin.register(Local)
class LocalAdmin(admin.ModelAdmin):
	list_display = ('id','nombre',)


@admin.register(Modelo)
class ModeloAdmin(admin.ModelAdmin):
	list_display = ('id','nombre',)


@admin.register(Talla)
class TallaAdmin(admin.ModelAdmin):
	list_display = ('id','nombre',)


@admin.register(Movimiento)
class MovimientoAdmin(admin.ModelAdmin):
	list_display = ('id',)
