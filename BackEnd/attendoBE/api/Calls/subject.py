from django.shortcuts import render
from django.http.response import JsonResponse
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.db import connection, DatabaseError
import json

from .error import error

# Create your views here.
class SubjectViews():
    # API endpoint that allows professor to be viewed.
    #List all Professor/Add a new professor
    @api_view(http_method_names=["GET", "POST"])
    def subject_manage(request):
        with connection.cursor() as cursor:
            #Get Subject list
            if(request.method == "GET"):
                cursor.execute("""SELECT * FROM cadeira""")
                data = cursor.fectchall()
                response = []
                for user in data:
                    to_add = {"nome":user[1], "ano":user[2], "curso":user[3], "departamento":user[4], "universidade":user[5], "professor(id)":user[6]}
                    response.append(to_add)
                return Response(response)
            
            #Add a new Subject
            if(request.method == "POST"):
                data = json.loads(request.body)
                cursor.execute("""BEGIN TRANSACTION""")
                statement = ("""INSERT INTO cadeira (nome, ano, curso, departamento, univesidade, professor) VALUES(%s, %s, %s, %s, %s, %s)""")
                values = (data["name"], data["year"], data["course"], data["department"], data["university"], data["teacher"])
                try:
                    cursor.execute(statement, values)
                    cursor.execute("commit")
                    return JsonResponse({'Sucesso': 1})
                #to do
                except DatabaseError:
                    return JsonResponse(error("Erro ao inserir cadeira"))
        
    @api_view(http_method_names=["GET", "PATCH"])
    def subject_search(request, id):
        #Get subject with this number
        with connection.cursor() as cursor:
            if(request.method == "GET"):

                statement = ("""SELECT * FROM TEACHER WHERE id = %s""", json.loads("id"))
                cursor.execute(statement)
                data = cursor.fetchall()
                return JsonResponse(data)
            
            #Update a teacher with given number
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
