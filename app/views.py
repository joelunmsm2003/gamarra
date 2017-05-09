from django.shortcuts import render
from django.shortcuts import *
from django.template import RequestContext
from django.contrib.auth import *
from django.contrib.auth.models import Group, User
from django.core import serializers
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect
from django.core.urlresolvers import reverse
from django.db.models import Max,Count
from django.core.mail import send_mail
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from app.models import *
from gamarra import settings
from django.db import transaction
from django.contrib.auth.hashers import *
from django.core.mail import send_mail

from django.utils.six.moves import range
from django.http import StreamingHttpResponse
from django.utils.decorators import method_decorator
from django.contrib.auth.decorators import permission_required
from django.views.decorators.csrf import csrf_exempt
import time
import collections
import xlrd
import json 
import csv
import simplejson
import xlwt
import requests
import os
from PIL import Image
from resizeimage import resizeimage
from gamarra.settings import *
from datetime import datetime,timedelta
from django.contrib.auth import authenticate

from django.contrib.sites.shortcuts import get_current_site

# Create your views here.

def home(request):

	user = request.user.id




	return render(request, 'home.html',{})


def ValuesQuerySetToDict(vqs):

    return [item for item in vqs]




@csrf_exempt
def modelos(request):


		m = Modelo.objects.all().values('id','nombre')

		m = ValuesQuerySetToDict(m)

		data_json = simplejson.dumps(m)

		return HttpResponse(data_json, content_type="application/json")




@csrf_exempt
def colores(request):


		m = Color.objects.all().values('id','nombre')

		m = ValuesQuerySetToDict(m)

		data_json = simplejson.dumps(m)

		return HttpResponse(data_json, content_type="application/json")

@csrf_exempt
def ubicacion(request):


		m = Local.objects.all().values('id','nombre')

		m = ValuesQuerySetToDict(m)

		data_json = simplejson.dumps(m)

		return HttpResponse(data_json, content_type="application/json")

@csrf_exempt
def proveedores(request):


		m = Proveedor.objects.all().values('id','nombre')

		m = ValuesQuerySetToDict(m)

		data_json = simplejson.dumps(m)

		return HttpResponse(data_json, content_type="application/json")


@csrf_exempt
def tallas(request):


		m = Talla.objects.all().values('id','nombre')

		m = ValuesQuerySetToDict(m)

		data_json = simplejson.dumps(m)

		return HttpResponse(data_json, content_type="application/json")

@csrf_exempt
def ingreso(request):

		if request.method == 'POST':

			data = json.loads(request.body)

			fecha= datetime.today()

			proveedor = None 

			local = None

			for d in data:

				if d == 'proveedor':

					proveedor = data['proveedor']['id']

				if d== 'ubicacion':

					local= data['ubicacion']['id']

			fecha = datetime.today()

			talla = data['talla']['id']

			color = data['color']['id']

			modelo = data['modelo']['id']

			cantidad=data['cantidad']

			tipo= data['tipo']

			Movimiento(proveedor_id=proveedor,color_id=color,local_id=local,modelo_id=modelo,talla_id=talla,cantidad=cantidad,tipo=tipo,fecha=fecha).save()

			data_json = simplejson.dumps('exito')

		return HttpResponse(data_json, content_type="application/json")


@csrf_exempt
def listado(request):

		if request.method == 'GET':

			l = Movimiento.objects.all().values('id','proveedor__nombre','modelo__nombre','talla__nombre','color__nombre','tipo','local__nombre','cantidad','fecha').order_by('-id')

			l = ValuesQuerySetToDict(l)

			data_json = simplejson.dumps(l)

		return HttpResponse(data_json, content_type="application/json")