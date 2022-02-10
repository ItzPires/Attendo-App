from django.shortcuts import render
from django.http.response import JsonResponse
from rest_framework.response import Response
from rest_framework.decorators import api_view
from django.db import connection, DatabaseError
import json, os, jwt
import datetime



class Authentication():
    @api_view(http_method_names=["POST"])
    def user_login(request):
        if(request.method == "POST"):
                login_user = json.loads(request.body)
            
        email = login_user['email']
        password = login_user['password']
        with connection.cursor() as cursor:
            try:
                is_teacher = False
                try:
                    cursor.execute("""BEGIN TRANSACTION""")
                    statement = """SELECT mail, id, sobre_mim, nome, numero FROM aluno where mail = %s AND password is NOT NULL 
                AND password = crypt(%s , password) FOR UPDATE"""
                    values = (email, password)
                    print(values)
                    cursor.execute(statement, values)
                    (mail, id, sobre_mim, nome, numero) = cursor.fetchone()
                    if(id is not None):
                        cursor.execute("""UPDATE aluno set logged_in = TRUE where id = %s""",(id,))
                        cursor.execute("""COMMIT""")
                        token = {'user_id': id, "exp": datetime.datetime.utcnow() + datetime.timedelta(minutes=30)}
                        result = jwt.encode(token,os.getenv('SECRET_KEY'), algorithm="HS256")
                        result = {'authToken': result, 'isTeacher':is_teacher, 'number':numero, 'mail':mail, 'aboutMe':sobre_mim, 'name':nome, 'id':id}
                except:
                    is_teacher = True
                    statement = """SELECT mail, id, sobre_mim, nome FROM professor where mail = %s AND password is NOT NULL 
                AND password = crypt(%s , password) FOR UPDATE"""
                    values = (email, password)
                    cursor.execute(statement, values)
                    
                    (mail, id, sobre_mim, nome) = cursor.fetchone()
                    print(mail)
                    if(id is not None):
                        cursor.execute("""UPDATE professor set logged_in = TRUE where id = %s""",(id, ))
                        cursor.execute("""COMMIT""")
                        token = {'user_id': id, "exp": datetime.datetime.utcnow() + datetime.timedelta(minutes=30)}
                        result = jwt.encode(token,os.getenv('SECRET_KEY'), algorithm="HS256")
                        result = {'authToken': result, 'isTeacher':is_teacher, 'number':id, 'mail':mail, 'aboutMe':sobre_mim, 'name':nome, 'id':id}
                    else:
                        result = {'error':"Utilizador ou password incorretos"}
                        cursor.execute("""ROLLBACK""")
            
            except (Exception, DatabaseError) as error:
                result = {'error': "Utilizador ou password incorretos"}
                cursor.execute("""ROLLBACK""")

        return JsonResponse(result)
    
    def authenticate(token):
        try:
            id = jwt.decode(token, os.getenv('SECRET_KEY'), algorithms=["HS256"])
            return True
        except jwt.ExpiredSignatureError:
            msg = 'Signature has expired.'
            return False, msg
        except jwt.DecodeError:
            msg = 'Invalid Login Token Signature'
            return False,  msg
        except jwt.InvalidTokenError:
            msg = 'Invalid token.'
            return False,  msg

    
