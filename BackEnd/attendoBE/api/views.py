from django.shortcuts import render
from django.http.response import JsonResponse
# Create your views here.
from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from .serializer import *
from .models import *
from . import serializer


class StudentViews():
    # API endpoint that allows student to be viewed.

    #List all Students/Add a new student
    @api_view(http_method_names=["GET", "POST"])
    def students_manage(request):

        #Get all Students
        if(request.method == "GET"):
            students = Student.objects.all()
            students_serializer = StudentSerializer(students, many = True)
            return Response(students_serializer.data)
        
        #Add a new Student
        if(request.method == "POST"):  
            students_serializer = StudentSerializer(data=request.data)
            if(students_serializer.is_valid()):
                students_serializer.save()
                return Response(students_serializer.data, status=status.HTTP_201_CREATED)
            return Response(students_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    
    @api_view(http_method_names=["GET", "PATCH"])
    def student_search(request, number):
        #Get student with this number
        if(request.method == "GET"):
            student = Student.objects.filter(student_number = number)
            students_serializer = StudentSerializer(student, many = True)
            if(students_serializer.data == []):
                return Response(data = {"error":"Student not found"}, status=status.HTTP_400_BAD_REQUEST)
            return Response(students_serializer.data)
        
        #Update a student with given number
        if(request.method == "PATCH"):
            student = Student.objects.filter(student_number = number)
            
            students_serializer = StudentSerializer(student, data = request.data, partial=True, many=True)
            print(students_serializer.data)
            if(students_serializer.is_valid()):
                students_serializer.save()
                return Response(students_serializer.data, status=status.HTTP_201_CREATED)
            return Response(students_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
def index(render):
    return JsonResponse({"Our name":'<h1>We are ATTENDO</h1>'})