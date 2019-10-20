# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2019-10-19 05:12
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0017_auto_20191017_1902'),
    ]

    operations = [
        migrations.AlterField(
            model_name='movimiento',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 10, 19, 0, 12, 48, 398096), max_length=1000, null=True),
        ),
        migrations.AlterField(
            model_name='prenda',
            name='fecha_creacion',
            field=models.DateTimeField(blank=True, max_length=1000, null=True, verbose_name='Fecha Ingreso'),
        ),
        migrations.AlterField(
            model_name='prenda',
            name='fecha_ingreso',
            field=models.DateTimeField(blank=True, max_length=1000, null=True, verbose_name='Fecha Movimiento'),
        ),
    ]