# -*- coding: utf-8 -*-
# Generated by Django 1.11.5 on 2019-10-14 20:03
from __future__ import unicode_literals

import datetime
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Color',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(blank=True, max_length=1000, null=True)),
            ],
            options={
                'db_table': 'color',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Local',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(blank=True, max_length=1000, null=True)),
            ],
            options={
                'db_table': 'local',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Modelo',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(blank=True, max_length=1000, null=True)),
            ],
            options={
                'db_table': 'modelo',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Movimiento',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('fecha', models.DateTimeField(blank=True, default=datetime.datetime(2019, 10, 14, 20, 3, 24, 817448), max_length=1000, null=True)),
                ('observacion', models.CharField(blank=True, max_length=1000, null=True)),
                ('destino', models.ForeignKey(blank=True, db_column='destino', null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='destino', to='app.Local')),
                ('origen', models.ForeignKey(blank=True, db_column='origen', null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='origen', to='app.Local')),
            ],
            options={
                'db_table': 'movimiento',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Prenda',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('codigo', models.CharField(blank=True, max_length=1000, null=True)),
                ('descripcion', models.CharField(blank=True, max_length=1000, null=True)),
                ('cantidad', models.IntegerField(blank=True, null=True)),
                ('tipo', models.CharField(blank=True, max_length=1000, null=True)),
                ('fecha_creacion', models.DateTimeField(blank=True, max_length=1000, null=True)),
                ('fecha_ingreso', models.DateTimeField(blank=True, max_length=1000, null=True)),
                ('observacion', models.CharField(blank=True, max_length=1000, null=True)),
                ('venta', models.BooleanField(default=False)),
                ('fecha_venta', models.DateTimeField(blank=True, null=True)),
                ('color', models.ForeignKey(blank=True, db_column='color', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='app.Color')),
                ('modelo', models.ForeignKey(blank=True, db_column='modelo', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='app.Modelo')),
                ('origen', models.ForeignKey(blank=True, db_column='prenda_origen', null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='prenda_origen', to='app.Local')),
            ],
            options={
                'db_table': 'prenda',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Proveedor',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(blank=True, max_length=1000, null=True)),
            ],
            options={
                'db_table': 'proveedor',
                'managed': True,
            },
        ),
        migrations.CreateModel(
            name='Talla',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(blank=True, max_length=1000, null=True)),
            ],
            options={
                'db_table': 'talla',
                'managed': True,
            },
        ),
        migrations.AddField(
            model_name='prenda',
            name='proveedor',
            field=models.ForeignKey(blank=True, db_column='proveedor', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='app.Proveedor'),
        ),
        migrations.AddField(
            model_name='prenda',
            name='talla',
            field=models.ForeignKey(blank=True, db_column='talla', null=True, on_delete=django.db.models.deletion.DO_NOTHING, to='app.Talla'),
        ),
        migrations.AddField(
            model_name='movimiento',
            name='prenda',
            field=models.ForeignKey(blank=True, db_column='prenda', null=True, on_delete=django.db.models.deletion.DO_NOTHING, related_name='prenda', to='app.Prenda'),
        ),
    ]
