from django.urls import path
from . import views
urlpatterns = [
    path('v1/combustibles/', views.CombustibleListCreate.as_view(), name='combustible-list-create'),
    path('v1/combustibles/<int:pk>/', views.CombustibleDetail.as_view(), name='combustible-detail'),
    path('v1/recepciones/', views.RecepcionListCreate.as_view(), name='recepcion-list-create'),
    path('v1/recepciones/<int:pk>/', views.RecepcionDetail.as_view(), name='recepcion-detail'),

    path('v1/motivo_gastos/', views.MotivoGastoList.as_view(), name='Motivo_Gasto-list'),
    path('v1/motivo_gastos/<int:pk>/', views.MotivoGastoDetail.as_view(), name='Motivo_Gasto-detail'),


    path('v1/revisiones/', views.RevisionListCreate.as_view(), name='revision-list-create'),
    path('v1/revisiones/<int:pk>/', views.RevisionDetail.as_view(), name='revision-detail'),

    path('v1/vehiculos/', views.VehiculoListCreate.as_view(), name='vehiculo-list-create'),
    path('v1/vehiculos/<int:pk>/', views.VehiculoDetail.as_view(), name='vehiculo-detail'),


    path('v1/tipo_revision/', views.TipoRevisionList.as_view(), name='tipo_revision-list'),
    path('v1/tipo_revision/<int:pk>/', views.TipoRevisionDetail.as_view(), name='tipo_revision-detail'),
]