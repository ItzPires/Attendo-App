from django.shortcuts import render
from django.http.response import JsonResponse
# Create your views here.
from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.db import connection



class StudentViews():
    # API endpoint that allows student to be viewed.

    #List all Students/Add a new student
    @api_view(http_method_names=["GET", "POST"])
    def students_manage(request):
        with connection.cursor() as cursor:
            #Get all Students
            if(request.method == "GET"):
                cursor.execute("""SELECT * FROM ALUNO""")
                data = cursor.fetchall()
                return Response(data)
            
            #Add a new Student
            if(request.method == "POST"):  
                return 
                #return Response(students_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        
    @api_view(http_method_names=["GET", "PATCH"])
    def student_search(request, number):
        with connection.cursor() as cursor:
            #Get student with this number
            if(request.method == "GET"):
                return
            
            #Update a student with given number
            if(request.method == "PATCH"):
                payload = request.get_json()
                cursor.execute("""SELECT * FROM ALUNO""")
                data = cursor.fetchall()
                return Response(payload)

class ProfessorViews():
    # API endpoint that allows professor to be viewed.
    #List all Professor/Add a new professor
    @api_view(http_method_names=["GET", "POST"])
    def professor_manage(request):
        with connection.cursor() as cursor:
        #Get all Professor
            if(request.method == "GET"):
                return
            
            #Add a new Teacher
            if(request.method == "POST"):  
                return
        
    @api_view(http_method_names=["GET", "PATCH"])
    def teacher_search(request, number):
        #Get teacher with this number
        with connection.cursor() as cursor:
            if(request.method == "GET"):
                return
            
            #Update a teacher with given number
            if(request.method == "PATCH"):
                return

def index(render):
    return JsonResponse({"Our name":'<h1>We are ATTENDO</h1>'})