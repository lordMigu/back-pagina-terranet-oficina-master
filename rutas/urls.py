from django.urls import path
from . import views
app_name = 'rutas'
urlpatterns = [
    path('v1/actividades/', views.ActividadList.as_view(), name='actividad-list'),
    path('v1/actividades/<int:pk>/', views.ActividadDetail.as_view(), name='actividad-detail'),
    path('v1/actividades/estado/<str:estado>/', views.ActividadByEstadoList.as_view(), name='actividad-by-estado'),
    path('v1/actividadhistorial/<int:actividad_id>/', views.ActividadHistorialList.as_view(), name='actividadhistorial-list'),
    path('v1/actividadhistorial/detail/<int:pk>/', views.ActividadHistorialDetail.as_view(), name='actividadhistorial-detail'),
    path('v1/rutas/', views.RutaList.as_view(), name='ruta-list'),
    path('v1/rutasby/', views.RutatBy.as_view(), name='ruta-by-paranms'),
    path('v1/rutas/<int:pk>/', views.RutaDetail.as_view(), name='ruta-detail'),
]