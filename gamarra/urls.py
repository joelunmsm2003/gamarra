from django.contrib import admin
from django.conf.urls import url, include

from django.contrib.auth.models import User
from rest_framework import routers, serializers, viewsets

from app.views import *

router = routers.DefaultRouter()
router.register(r'users', UserViewSet)
router.register(r'groups', GroupViewSet)



##Agregando par el commit


urlpatterns = [
    url(r'^admin/', admin.site.urls),
    url('', include(router.urls)),
    url('colores/', colores),
    url('modelos/', modelos),
    url('tallas/', tallas),
    url(r'^busca/(\w+)', busca),
    url('importar/', importar),
    url('leer/', leer),
    url('locales/', locales),
    url('prendas/', prendas),
    url('vendedoras/', vendedoras),
    url('registraventa/', registraventa),
    url('movimiento/', movimiento),
    url('guarda/', guarda),
    url('ventasdeldia/', ventasdeldia),
    url('api-auth/', include('rest_framework.urls', namespace='rest_framework'))

    # url(r'^$', 'app.views.home'),
    # url(r'^modelos$', 'app.views.modelos'),
    # url(r'^colores$', 'app.views.colores'),
    # url(r'^ubicacion$', 'app.views.ubicacion'),
    # url(r'^ingreso$', 'app.views.ingreso'),
    # url(r'^tallas$', 'app.views.tallas'),
    # url(r'^listado$', 'app.views.listado'),
    # url(r'^proveedores$', 'app.views.proveedores'),
    # url(r'^entrada$', 'app.views.entrada'),
    # url(r'^salida$', 'app.views.salida'),
    # url(r'^totalizador/(\w+)$', 'app.views.totalizador'),

]
