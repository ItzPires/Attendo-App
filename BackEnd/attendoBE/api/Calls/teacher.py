from django.shortcuts import render
from django.http.response import JsonResponse
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.db import connection, DatabaseError
import json

from .error import error

# Create your views here.
class ProfessorViews():
    # API endpoint that allows professor to be viewed.
    #List all Professor/Add a new professor
    @api_view(http_method_names=["GET", "POST"])
    def professor_manage(request):
        with connection.cursor() as cursor:
            #Get Professor list
            if(request.method == "GET"):
                cursor.execute("""SELECT mail, nome FROM PROFESSOR""")
                data = cursor.fetchall()
                response = []
                for user in data:
                    to_add = {"mail":user[0], "nome":user[1]}
                    response.append(to_add)
                return Response(response)
            
            #Add a new Teacher
            if(request.method == "POST"):
                data = json.loads(request.body)
                cursor.execute("""BEGIN TRANSACTION""")
                statement = ("""INSERT INTO PROFESSOR (mail, password, nome) VALUES(%s, %s, %s)""")
                values = (data["mail"], data["password"], data["name"])
                try:
                    cursor.execute(statement, values)
                    cursor.execute("commit")
                    return JsonResponse({'Sucesso': 1})
                #to do
                except DatabaseError:
                    return JsonResponse(error("Erro ao inserir professor"))
        
    @api_view(http_method_names=["GET", "PATCH"])
    def teacher_search(request, id):
        #Get teacher with this id
        with connection.cursor() as cursor:
            if(request.method == "GET"):

                statement = ("""SELECT * FROM TEACHER WHERE id = %s""", json.loads("id"))
                cursor.execute(statement)
                data = cursor.fetchall()
                return JsonResponse(data)
            
            #Update a teacher with given number (id)
            if(request.method == "PATCH"):
                try:
                    data = json.loads(request.body)
                    cursor.execute("""BEGIN TRANSACTION""")
                    cursor.execute("""SELECT * FROM professor WHERE id = %s FOR UPDATE""", (id,))
                    statement = """UPDATE professor SET mail = %s, password = %s, nome = %s WHERE id = %s"""
                    values = (data["mail"], data["password"], data["name"], id)
                    cursor.execute(statement, values)
                    print(values)
                    cursor.execute("COMMIT")
                    return JsonResponse({'sucesso': 1})
                except DatabaseError:
                    return JsonResponse(error("Nao foi possivel atualizar as informacoes do professor"))