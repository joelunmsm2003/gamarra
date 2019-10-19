# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2019-10-16 23:12
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0013_auto_20191015_2032'),
    ]

    operations = [
        migrations.AddField(
            model_name='prenda',
            name='vendedora',
            field=models.ForeignKey(blank=True, db_column='vendedora', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='app.Vendedora'),
        ),
        migrations.AlterField(
            model_name='movimiento',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 10, 16, 18, 12, 21, 480701), max_length=1000, null=True),
        ),
    ]