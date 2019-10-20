# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2019-10-15 19:30
from __future__ import unicode_literals

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0004_auto_20191014_1559'),
    ]

    operations = [
        migrations.CreateModel(
            name='Vendedora',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(blank=True, max_length=1000, null=True)),
                ('telefono', models.CharField(blank=True, max_length=1000, null=True)),
                ('edad', models.CharField(blank=True, max_length=1000, null=True)),
            ],
            options={
                'db_table': 'vendedora',
                'managed': True,
            },
        ),
        migrations.AlterField(
            model_name='movimiento',
            name='fecha',
            field=models.DateTimeField(blank=True, default=datetime.datetime(2019, 10, 15, 14, 30, 31, 992106), max_length=1000, null=True),
        ),
    ]