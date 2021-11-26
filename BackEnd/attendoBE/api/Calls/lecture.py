from django.shortcuts import render
from django.http.response import JsonResponse
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.db import connection, DatabaseError
import json

from .error import error

# Create your views here.
class LectureViews():
    # API endpoint that allows professor to be viewed.
    #List all Professor/Add a new professor
    @api_view(http_method_names=["GET", "POST"])
    def lecture_manage(request):
        with connection.cursor() as cursor:
            #Get lecture list
            if(request.method == "GET"):
                cursor.execute("""SELECT * FROM aula""")
                data = cursor.fectchall()
                response = []
                for user in data:
                    to_add = {"sala":user[1], "qrcode":user[2], "horario_id":user[3], "turma_id":user[4]}
                    response.append(to_add)
                return Response(response)
            
            #Add a new lecture
            if(request.method == "POST"):
                data = json.loads(request.body)
                cursor.execute("""BEGIN TRANSACTION""")
                statement = ("""INSERT INTO aula (sala, qrcode, horario_id, turma_id) VALUES(%s, %s, %s, %s)""")
                values = (data["classroom"], data["qrcode"], data["schedule"], data["class"])
                try:
                    cursor.execute(statement, values)
                    cursor.execute("commit")
                    return JsonResponse({'Sucesso': 1})
                #to do
                except DatabaseError:
                    return JsonResponse(error("Error adding lecture"))
        
    @api_view(http_method_names=["GET", "PATCH"])
    def lecture_search(request, id):
        #Get lecture with this number
        with connection.cursor() as cursor:
            if(request.method == "GET"):

                statement = ("""SELECT * FROM aula WHERE id = %s""", json.loads("id"))
                cursor.execute(statement)
                data = cursor.fetchall()
                return JsonResponse(data)
            
            #Update a lecture with given number
            if(request.method == "PATCH"):
                try:
                    data = json.loads(request.body)
                    cursor.execute("""BEGIN TRANSACTION""")
                    cursor.execute("""SELECT * FROM aula WHERE id = %s FOR UPDATE""", (id,))
                    statement = """UPDATE aula SET sala = %s, qrcode = %s, horario_id = %s, turma_id = %s WHERE id = %s"""
                    values = (data["classroom"], data["qrcode"], data["schedule"], data["class"], id)
                    cursor.execute(statement, values)
                    print(values)
                    cursor.execute("COMMIT")
                    return JsonResponse({'sucesso': 1})
                except DatabaseError:
                    return JsonResponse(error("Unable to update lecture information"))