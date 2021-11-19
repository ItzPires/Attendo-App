# Generated by Django 3.2.9 on 2021-11-19 00:10

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Student',
            fields=[
                ('student_number', models.IntegerField(primary_key=True, serialize=False, unique=True)),
                ('mail', models.EmailField(max_length=254, unique=True)),
                ('password', models.CharField(max_length=32)),
                ('name', models.CharField(max_length=32)),
            ],
        ),
    ]