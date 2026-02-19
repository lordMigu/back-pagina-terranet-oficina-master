from django.urls import path
from . import views

urlpatterns = [
    path('v1/tipoSolicitudes/', views.TipoSolicitudList.as_view(), name='TipoSolicitud-list'),
    path('v1/tipoSolicitudes/<int:pk>/', views.TipoSolicitudDetail.as_view(), name='TipoSolicitud-detail'),
    path('v1/kits/', views.KitList.as_view(), name='Kit-list'),
    path('v1/kits/<int:pk>/', views.KitDetail.as_view(), name='Kit-detail'),
    path('v1/kitXProductos/', views.KitXProductoList.as_view(), name='KitXProducto-list'),
    path('v1/kitXProductos/<int:pk>/', views.KitXProductoDetail.as_view(), name='KitXProducto-detail'),
    path('v1/solicitud/', views. SolicitudList.as_view(), name=' Solicitud-list'),
    path('v1/solicitud/<int:pk>/', views. SolicitudDetail.as_view(), name=' Solicitud-detail'),
    path('v1/solicitud/estado/<str:estado>/', views.SolicitudByEstadoList.as_view(), name='solicitud-by-estado'),
    path('v1/hojatrabajo/', views.HojadeTrabajoList.as_view(), name='Hoja-de-Trabajo-list'),
    path('v1/hojatrabajoby/', views.HojadeTrabajoBy.as_view(), name='Hoja-de-Trabajo-By'),
    path('v1/hojatrabajo/<int:pk>/', views.HojadeTrabajoDetail.as_view(), name='Hoja-de-Trabajo-detail'),
    path('v1/userwisp/', views.WisphubList.as_view(), name='userwisp-list'),
    path('v1/userwisp/<str:pk>/', views.WisphubDetail.as_view(), name='userwisp-detail'),
]