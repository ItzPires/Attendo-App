from django.shortcuts import render
from django.http.response import JsonResponse
import json
# Create your views here.
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.db import connection, DatabaseError





def index(render):
    return Response('<h1>We are ATTENDO</h1>')