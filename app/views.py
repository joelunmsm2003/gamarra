from django.contrib.auth.models import User, Group
from rest_framework import viewsets
from app.serializer import *
from app.models import *
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse

class UserViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows users to be viewed or edited.
    """
    queryset = User.objects.all().order_by('-date_joined')
    serializer_class = UserSerializer


class GroupViewSet(viewsets.ModelViewSet):
    """
    API endpoint that allows groups to be viewed or edited.
    """
    queryset = Group.objects.all()
    serializer_class = GroupSerializer

@csrf_exempt
def colores(request):
    """
    List all code snippets, or create a new snippet.
    """
    if request.method == 'GET':
        colores = Color.objects.all()
        serializer = ColorSerializer(colores, many=True)
        return JsonResponse(serializer.data, safe=False)


# from django.shortcuts import render
# from django.shortcuts import *
# from django.template import RequestContext
# from django.contrib.auth import *
# from django.contrib.auth.models import Group, User
# from django.core import serializers
# from django.contrib.auth.decorators import login_required
# from django.http import HttpResponse, HttpResponseRedirect
# from django.core.urlresolvers import reverse
# from django.db.models import Max,Count
# from django.core.mail import send_mail
# from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
# from app.models import *
# from gamarra import settings
# from django.db import transaction
# from django.contrib.auth.hashers import *
# from django.core.mail import send_mail

# from django.utils.six.moves import range
# from django.http import StreamingHttpResponse
# from django.utils.decorators import method_decorator
# from django.contrib.auth.decorators import permission_required
# from django.views.decorators.csrf import csrf_exempt
# import time
# import collections
# import xlrd
# import json 
# import csv
# import simplejson
# import xlwt
# import requests
# import os
# from PIL import Image
# from resizeimage import resizeimage
# from gamarra.settings import *
# from datetime import datetime,timedelta
# from django.contrib.auth import authenticate
# from django.db.models import Count,Sum
# from django.contrib.sites.shortcuts import get_current_site

# Create your views here.

# def home(request):

# 	user = request.user.id

# 	return render(request, 'home.html',{})


# def ValuesQuerySetToDict(vqs):

#     return [item for item in vqs]


# @csrf_exempt
# def inventario(request,prenda):

#   	if request.method == 'GET':

# 		data = Movimiento.objects.filter(tipo='Entrada').values('local__nombre','color__nombre','modelo__nombre','talla__nombre','cantidad','fecha')

# 		response = HttpResponse(content_type='text/csv')

# 		response['Content-Disposition'] = 'attachment; filename="Resumen.csv"'

# 		writer = csv.writer(response)

# 		writer.writerow(['Fecha','Cantidad','Modelo','Color','Talla','Destino'])



#         print 'Csv...'

#         for d in data:

#             writer.writerow([d['fecha'],d['cantidad'],d['modelo__nombre'],d['color__nombre'],d['talla__nombre'],d['local__nombre']])

#         return response   
   



# @csrf_exempt
# def entrada(request):

#   	if request.method == 'GET':

# 		data = Movimiento.objects.filter(tipo='Entrada').values('local__nombre','color__nombre','modelo__nombre','talla__nombre','cantidad','fecha')

# 		response = HttpResponse(content_type='text/csv')

# 		response['Content-Disposition'] = 'attachment; filename="Resumen.csv"'

# 		writer = csv.writer(response)

# 		writer.writerow(['Fecha','Cantidad','Modelo','Color','Talla','Destino'])



#         print 'Csv...'

#         for d in data:

#             writer.writerow([d['fecha'],d['cantidad'],d['modelo__nombre'],d['color__nombre'],d['talla__nombre'],d['local__nombre']])

#         return response   
   

# @csrf_exempt
# def salida(request):

#   	if request.method == 'GET':

# 		data = Movimiento.objects.filter(tipo='Salida').values('local__nombre','color__nombre','modelo__nombre','talla__nombre','cantidad','fecha')

# 		response = HttpResponse(content_type='text/csv')

# 		response['Content-Disposition'] = 'attachment; filename="Resumen.csv"'

# 		writer = csv.writer(response)

# 		writer.writerow(['Fecha','Cantidad','Modelo','Color','Talla','Destino'])



#         print 'Csv...'

#         for d in data:

#             writer.writerow([d['fecha'],d['cantidad'],d['modelo__nombre'],d['color__nombre'],d['talla__nombre'],d['local__nombre']])

#         return response   
   

# @csrf_exempt
# def totalizador(request,modelo):

#   	if request.method == 'GET':

# 		data = Movimiento.objects.filter(modelo_id=modelo).values('color__nombre','talla__nombre','modelo__nombre').annotate(cantidad=Sum('cantidad'))

# 		m = ValuesQuerySetToDict(data)

# 		data_json = simplejson.dumps(m)

# 		return HttpResponse(data_json, content_type="application/json")


# 		response = HttpResponse(content_type='text/csv')

# 		response['Content-Disposition'] = 'attachment; filename="Resumen.csv"'

# 		writer = csv.writer(response)

# 		writer.writerow(['Fecha','Cantidad','Modelo','Color','Talla','Destino'])

#         for d in data:

#             writer.writerow([d['fecha'],d['cantidad'],d['modelo__nombre'],d['color__nombre'],d['talla__nombre'],d['local__nombre']])

#         return response  


# @csrf_exempt
# def modelos(request):


# 		m = Modelo.objects.all().values('id','nombre')

# 		m = ValuesQuerySetToDict(m)

# 		data_json = simplejson.dumps(m)

# 		return HttpResponse(data_json, content_type="application/json")




# @csrf_exempt
# def colores(request):


# 		m = Color.objects.all().values('id','nombre')

# 		m = ValuesQuerySetToDict(m)

# 		data_json = simplejson.dumps(m)

# 		return HttpResponse(data_json, content_type="application/json")

# @csrf_exempt
# def ubicacion(request):


# 		m = Local.objects.all().values('id','nombre')

# 		m = ValuesQuerySetToDict(m)

# 		data_json = simplejson.dumps(m)

# 		return HttpResponse(data_json, content_type="application/json")

# @csrf_exempt
# def proveedores(request):


# 		m = Proveedor.objects.all().values('id','nombre')

# 		m = ValuesQuerySetToDict(m)

# 		data_json = simplejson.dumps(m)

# 		return HttpResponse(data_json, content_type="application/json")


# @csrf_exempt
# def tallas(request):


# 		m = Talla.objects.all().values('id','nombre')

# 		m = ValuesQuerySetToDict(m)

# 		data_json = simplejson.dumps(m)

# 		return HttpResponse(data_json, content_type="application/json")

# @csrf_exempt
# def ingreso(request):

# 		if request.method == 'POST':

# 			data = json.loads(request.body)

# 			fecha= datetime.today()

# 			proveedor = None 

# 			local = None

# 			for d in data:

# 				if d == 'proveedor':

# 					proveedor = data['proveedor']['id']

# 				if d== 'ubicacion':

# 					local= data['ubicacion']['id']

# 			fecha = datetime.today()

# 			talla = data['talla']['id']

# 			color = data['color']['id']

# 			modelo = data['modelo']['id']

# 			cantidad=data['cantidad']

# 			tipo= data['tipo']

# 			Movimiento(proveedor_id=proveedor,color_id=color,local_id=local,modelo_id=modelo,talla_id=talla,cantidad=cantidad,tipo=tipo,fecha=fecha).save()

# 			data_json = simplejson.dumps('exito')

# 		return HttpResponse(data_json, content_type="application/json")


# @csrf_exempt
# def listado(request):

# 		if request.method == 'GET':

# 			l = Movimiento.objects.all().values('id','proveedor__nombre','modelo__nombre','talla__nombre','color__nombre','tipo','local__nombre','cantidad','fecha').order_by('-id')

# 			l = ValuesQuerySetToDict(l)

# 			data_json = simplejson.dumps(l)

# 		return HttpResponse(data_json, content_type="application/json")