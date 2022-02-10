from django.apps import AppConfig
from . import Shedule

class ApiConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'api'
    def ready(self):
        Shedule.update_database_sheduler.start()
        return super().ready()