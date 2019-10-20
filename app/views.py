from django.contrib.auth.models import User, Group
from rest_framework import viewsets
from app.serializer import *
from app.models import *
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
import csv
import datetime
import xlrd
import pandas as pd
import json
from datetime import datetime, date, time, timedelta


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


@csrf_exempt
def modelos(request):
    """
    List all code snippets, or create a new snippet.
    """
    if request.method == 'GET':
        colores = Modelo.objects.all()
        serializer = ModelosSerializer(colores, many=True)
        return JsonResponse(serializer.data, safe=False)

@csrf_exempt
def tallas(request):
    """
    List all code snippets, or create a new snippet.
    """
    if request.method == 'GET':
        data = Talla.objects.all()
        serializer = TallaSerializer(data, many=True)
        return JsonResponse(serializer.data, safe=False)



@csrf_exempt
def busca(request,id):
    """
    List all code snippets, or create a new snippet.
    """
    if request.method == 'GET':
        data = Prenda.objects.filter(id=id)
        serializer = PrendaSerializer(data, many=True)
        return JsonResponse(serializer.data, safe=False)




@csrf_exempt
def vendedoras(request):
    """
    List all code snippets, or create a new snippet.
    """
    if request.method == 'GET':
        data = Vendedora.objects.all()
        serializer = VendedoraSerializer(data, many=True)
        return JsonResponse(serializer.data, safe=False)


@csrf_exempt
def prendas(request):
    """
    List all code snippets, or create a new snippet.
    """
    if request.method == 'GET':
        p = Prenda.objects.all().order_by('-id')[:500]
        serializer = PrendaSerializer(p, many=True)
        return JsonResponse(serializer.data, safe=False)


@csrf_exempt
def ventasdeldia(request):
    """
    List all code snippets, or create a new snippet.
    """
    if request.method == 'POST':

    	fecha = json.loads(request.body)['fecha']

    	start = datetime.strptime(fecha, '%Y-%m-%d')

    	end = start + timedelta(days=1) 


    	ubicacion = json.loads(request.body)['ubicacion']['id']

    	print fecha

        p = Prenda.objects.filter(fecha_venta__gte=start,fecha_venta__lt=end,ubicacion_id=ubicacion).order_by('-id')
        serializer = PrendaSerializer(p, many=True)
        return JsonResponse(serializer.data, safe=False)


@csrf_exempt
def locales(request):
    """
    List all code snippets, or create a new snippet.
    """
    if request.method == 'GET':
        p = Local.objects.all()
        serializer = LocalSerializer(p, many=True)
        return JsonResponse(serializer.data, safe=False)




@csrf_exempt
def movimiento(request):
	"""
	List all code snippets, or create a new snippet.
	"""
	if request.method == 'POST':

		data= json.loads(request.body)['data']


		Prenda.objects.filter(id=data['id']).update(ubicacion_id=data['ubicacion'],fecha_ingreso=datetime.today())

		Movimiento(destino_id=data['ubicacion'],prenda_id=data['id']).save()

		#Prenda.objects
		return JsonResponse('ok', safe=False)



@csrf_exempt
def guarda(request):
	"""
	List all code snippets, or create a new snippet.
	"""
	if request.method == 'POST':

		data= json.loads(request.body)

		for d in data:

			try: 
				talla_id=Talla.objects.get(nombre=d['talla']).id 
			except:
				talla_id=None

			try: 
				color_id=Color.objects.get(nombre=d['color']).id 
			except: 
				color_id=None

			try: 
				modelo_id=Modelo.objects.get(nombre=d['modelo']).id 
			except: 
				color_id=None

			try : 
				cantidad = int(d['cantidad'])
			except: 
				cantidad=1

			for i in range(cantidad):

				Prenda(talla_id=talla_id,color_id=color_id,modelo_id=modelo_id).save()


		print data
		#Prenda.objects
		return JsonResponse('ok', safe=False)




@csrf_exempt
def registraventa(request):
    """
    List all code snippets, or create a new snippet.
    """
    if request.method == 'POST':

		data = json.loads(request.body)

		update= {}

		update['ubicacion_id']=data['ubicacion']['id']

		update['observacion'] = data['observacion']

		update['bono'] = data['bono']

		update['boleta']=data['boleta']

		update['precio'] = data['precio']

		update['talla_id']=data['talla_id']

		update['color_id']=data['color_id']

		update['modelo_id']=data['modelo_id']

		update['vendedora_id']=data['vendedora_id']

		hoy=date.today()

		update['fecha_venta']=hoy

		update['venta']=True

		if 'codigo' in data.keys():

			id= data['id']

			#Movimiento(prenda_id=prenda_id,destino_id=4).save()

			Prenda.objects.filter(id=id).update(**update)

		if 'sincodigo' in data.keys():

			Prenda(**update).save()

		return JsonResponse('OK', safe=False)



@csrf_exempt
def leer(request):

	file = "/home/andy/base.xlsx" 
	  
	xl = pd.ExcelFile(file)

	# Print the sheet names
	print xl.sheet_names

	# Load a sheet into a DataFrame by name: df1
	df = xl.parse('TORRE')

	df.columns = ["CODIGO","MODELO","COLOR","CODIGO2","MODELweO","COLedOR","CODdIGO","MODEcLO","COLOdR","CODwIGO","MODwELO"]

	for i in range(df.shape[0]):

		codigo = df['CODIGO'][i]

		

		if Prenda.objects.filter(codigo=codigo).count()>0:

			Prenda.objects.filter(codigo=codigo).update(ubicacion_id=2) # Torre


	df =xl.parse('CANEPA')

	df.columns = ["CODIGO","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20"]

	for i in range(df.shape[0]):

		codigo = df['CODIGO'][i]

		if Prenda.objects.filter(codigo=codigo).count()>0:

			Prenda.objects.filter(codigo=codigo).update(ubicacion_id=3) # Canepa



	df =xl.parse('CENTRO')

	df.columns = ["CODIGO","2","3","4","5","6","7","8","9","10"]

	for i in range(df.shape[0]):

		codigo = df['CODIGO'][i]

		if Prenda.objects.filter(codigo=codigo).count()>0:

			Prenda.objects.filter(codigo=codigo).update(ubicacion_id=1) # Canepa

	return JsonResponse('ok', safe=False)


@csrf_exempt
def importar(request):


	with open('/home/andy/base.csv') as csv_file:
		csv_reader = csv.reader(csv_file, delimiter=',')
		line_count = 0
		for row in csv_reader:
			if line_count == 0:
			
				line_count += 1
			else:
				print row[0], row[1], row[2]

				if Modelo.objects.filter(nombre=row[2]).count()==0:

					Modelo(nombre=row[2]).save()


				if Color.objects.filter(nombre=row[3]).count()==0:

					Color(nombre=row[3]).save()


				if Talla.objects.filter(nombre=row[4]).count()==0:

					Talla(nombre=row[4]).save()

				line_count += 1

				id_modelo=Modelo.objects.get(nombre=row[2]).id 
				id_color=Color.objects.get(nombre=row[3]).id
				id_talla=Talla.objects.get(nombre=row[4]).id


				row[1]=row[1].replace('mayo','May')
				row[1]=row[1].replace('abr','Apr')
				row[1]=row[1].replace('ago','Aug')
				row[1]=row[1].replace('setiembre','Sep')

				print 'ROW!!!!...',row[1]

				if row[1]:

					if len(row[1].split('-')[0])==1:

						row[1]='0'+row[1]

					datetime_str = row[1]+'-2019 00:00:00'

					print 'datetime_str',datetime_str

					datetime_object = datetime.strptime(datetime_str, '%d-%b-%Y %H:%M:%S')

				else:

					datetime_object= None

				try:

					Prenda(modelo_id=id_modelo,color_id=id_color,talla_id=id_talla,fecha_creacion=datetime_object,id=row[0]).save()

				except:

					pass
	
	return JsonResponse('ok', safe=False)


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