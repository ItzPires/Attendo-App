from datetime import datetime, time, timedelta
from apscheduler.schedulers.background import BackgroundScheduler
from django.db import connection, DatabaseError


def updateDatabase():
    with connection.cursor() as cursor:
        cursor.execute("""BEGIN TRANSACTION""")
        cursor.execute("""SELECT turma_id FROM aula""")
        turmas = cursor.fetchall()
        if(turmas != None):
            for turma in turmas:
                cursor.execute("""SELECT dia_ultima_guardada, dia_semana, hora_de_inicio, hora_de_fim FROM horario_semanal where turma_id = %s""", params=(turma, ))
                horarios = cursor.fetchall()
                if(horarios != None):
                    for dia_ultima_guardada, dia_semana, hora_inicio, hora_fim in horarios:
                        if(dia_ultima_guardada == None):
                            dia_ultima_guardada = datetime.now()
                            t = timedelta((dia_semana+5 - dia_ultima_guardada.weekday()) % 7)
                        else:
                            t = timedelta((dia_semana+5 - dia_ultima_guardada.weekday()) % 7)
                        
                        print ('Weeks:', (dia_ultima_guardada + timedelta(weeks= 3) - datetime.now()).days / 7)
                        



def start():
    updateDatabase()
    scheduler = BackgroundScheduler()
    scheduler.add_job(updateDatabase, 'interval', weeks =  1)
    scheduler.start()