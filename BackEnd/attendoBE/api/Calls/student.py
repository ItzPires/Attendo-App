from django.http import response
from django.http.response import JsonResponse
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.db import connection, DatabaseError
import json, os
from .error import error
class StudentViews():
    # API endpoint that allows student to be viewed.

    #List all Students/Add a new student
    @api_view(http_method_names=["GET", "POST"])
    def students_manage(request):

        with connection.cursor() as cursor:
            #Get all Students
            if(request.method == "GET"):
                cursor.execute("""SELECT numero, mail, nome,sobre_mim FROM ALUNO""")
                data = cursor.fetchall()
                response = []
                for user in data:
                    to_add = {"numero":user[0], "mail":user[1], "nome":user[2], "sobre_mim": user[3]}
                    response.append(to_add)
                return Response(response)
            
            #Add a new Student
            if(request.method == "POST"):
                data = json.loads(request.body)
                statement = """ INSERT into ALUNO (numero, mail, password, nome) VALUES(%s, %s, %s, %s)"""
                values = (data["student_number"], data["mail"], data["password"], data["name"])

                try:
                    cursor.execute(statement, values)
                    cursor.execute("COMMIT")
                    return JsonResponse({'Sucesso': 1})
                except DatabaseError:
                    return JsonResponse(error("Erro ao inserir aluno"))
        
    @api_view(http_method_names=["GET", "PATCH"])
    def student_search(request, number):
        with connection.cursor() as cursor:
            #Get student with this number
            if(request.method == "GET"):

                cursor.execute("""SELECT numero, mail, nome, sobre_mim FROM ALUNO WHERE numero = %s""", (number, ))
                user = cursor.fetchone()
                to_add = {"number":user[0], "mail":user[1], "name":user[2], "sobre_mim":user[3]}
                return Response(to_add)
            
            #Update a student with given number
            if(request.method == "PATCH"):
                try:
                    data = json.loads(request.body)
                    cursor.execute("""BEGIN TRANSACTION""")
                    cursor.execute("""SELECT * FROM aluno WHERE numero = %s FOR UPDATE""", (number,) )
                    statement = """ UPDATE aluno SET mail = %s, password = %s, nome = %s WHERE numero = %s"""
                    values = (data["mail"], data["password"], data["name"], number)
                    cursor.execute(statement, values)
                    cursor.execute("COMMIT")
                    return JsonResponse({'Sucesso': 1})
                except DatabaseError:
                    cursor.execute("ROLLBACK")
                    return JsonResponse(error("Erro ao Atualizar alunos"))
