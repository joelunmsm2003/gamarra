from django.contrib.auth.models import User, Group
from rest_framework import serializers
from app.models import *



class UserSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = User
        fields = ['url', 'username', 'email', 'groups']


class GroupSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Group
        fields = ['url', 'name']



class LocalSerializer(serializers.ModelSerializer):
    class Meta:
        model = Local
        fields = ['id', 'nombre']


class TallaSerializer(serializers.ModelSerializer):
    class Meta:
        model = Talla
        fields = ['id', 'nombre']


class ColorSerializer(serializers.ModelSerializer):
    class Meta:
        model = Color
        fields = ['id', 'nombre']

class VendedoraSerializer(serializers.ModelSerializer):
    class Meta:
        model = Vendedora
        fields = ['id', 'nombre','termometro','termometrocolor']

class ModelosSerializer(serializers.ModelSerializer):
    class Meta:
        model = Modelo
        fields = ['id', 'nombre']



class PrendaSerializer(serializers.ModelSerializer):

    modelo = serializers.StringRelatedField(many=False)
    talla = serializers.StringRelatedField(many=False)
    color = serializers.StringRelatedField(many=False)
    origen = serializers.StringRelatedField(many=False)
    ubicacion = serializers.StringRelatedField(many=False)
    vendedora = serializers.StringRelatedField(many=False)
    fecha_venta = serializers.DateTimeField(format="%Y-%m-%d")


	
    class Meta:
        model = Prenda
        fields = ['id','codigo','modelo_id','pormayor','ubicacion','vendedora','vendedora_id','origen','ubicacion','modelo','talla','color','fecha_creacion','boleta','precio','venta','fecha_ingreso','venta','fecha_venta','observacion','bono']
