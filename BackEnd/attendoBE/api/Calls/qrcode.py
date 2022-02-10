import uuid
from django.http import response
from django.shortcuts import render, resolve_url
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.db import connection, DatabaseError
import json, os, uuid

from .error import error


class QrCodeViews():
    
    #List all Students/Add a new student
    @api_view(http_method_names=["GET"])
    def get_QrCode(request, class_id):
        
        with connection.cursor() as cursor:
            cursor.execute("""SELECT qrcode, horario_id, turma_id FROM aula where id = %s""", (class_id, ))
            data = cursor.fetchone()

            try:
                to_add = {"id": class_id, "qrCode":data[0], "horario_id":data[1], "turma_id":data[2]}
                if(to_add["qrCode"] == None):
                   to_add = QrCodeViews.generate_code(to_add)
 
                to_add["qrCode_short"] =  to_add["qrCode"][:6]
                return Response(to_add)
            except:
                return Response(error("Erro a gerar QR CODE"))

    def generate_code(lecture):
        with connection.cursor() as cursor:
            try:
                cursor.execute("""BEGIN TRANSACTION""")
                cursor.execute("""SELECT qrcode FROM aula where id = %s FOR UPDATE""", (lecture["id"], ))
                qr_id = uuid.uuid1(node=None, clock_seq=None).int
                cursor.execute("""UPDATE aula SET qrcode = %s WHERE id = %s""", (str(qr_id), lecture["id"]))
                cursor.execute("""COMMIT""")
                lecture["qrCode"] = str(qr_id)
            except:
                cursor.execute("""ROLLBACK""")
                return error("Erro a gerar QR CODE")
        
        return lecture

   
