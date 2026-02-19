from django.urls import path
from . import views
from .views import ClientesAPIView, PlanesAPIView,ZonasAPIView,SerieUltimoMov, Alertas
from .views import TiempoInstalacion,TiempoVistaTecnica,Instalaciones,VisitaTecnica,Migracion,TiemposCuadrilla,Actividad,Solicitud,Hoja,Cuadrilla,SeriesDisponibles,Desgloce
urlpatterns = [
    path('v1/rol/', views.RolList.as_view(), name='Rol-list'),
    path('v1/rol/<int:pk>/', views.RolDetail.as_view(), name='Rol-detail'),
    path('v1/usuario/', views.UsuarioList.as_view(), name='Usuario-list'),
    path('v1/usuario/<int:pk>/', views.UsuarioDetail.as_view(), name='Usuario-detail'),
    path('v1/usuario/authenticate/', views.authenticate_user, name='authenticate-user'),
    path('v1/permiso/', views.PermisoList.as_view(), name='Permiso-list'),
    path('v1/permiso/<int:pk>/', views.PermisoDetail.as_view(), name='Permiso-detail'),
    path('v1/version/', views.VersionList.as_view(), name='Version-list'),
    path('v1/version/<int:pk>/', views.VersionDetail.as_view(), name='Version-detail'),
    path('api/clientes/', ClientesAPIView.as_view(), name='clientes-api'),
    path('api/planes/', PlanesAPIView.as_view(), name='planes-api'),
    path('api/zonas/', ZonasAPIView.as_view(), name='zonas-api'),

    path('api/series_ult_miv/', SerieUltimoMov.as_view(), name='series-ultimo-movimiento'),
    path('api/tiempo_prom_instalacion/', TiempoInstalacion.as_view(), name='Tiempo-promedio-instalcion'),
    path('api/tiempo_prom_visitat/', TiempoVistaTecnica.as_view(), name='Tiempo-promedio-visista-tecnica'),
    path('api/instalaciones_realizadas/', Instalaciones.as_view(), name='instalaciones_realizadas'),
    path('api/visitas_realizadas/', VisitaTecnica.as_view(), name='visitas_realizadas'),
    path('api/migraciones_realizadas/', Migracion.as_view(), name='migraciones_realizadas'),
    path('api/tiempos_cuadrilla/', TiemposCuadrilla.as_view(), name='tiempos-cuadrilla'),
    path('api/actividades/', Actividad.as_view(), name='actividades'),
    path('api/solicitudes/', Solicitud.as_view(), name='solicitudes'),
    path('api/hojas/', Hoja.as_view(), name='hojas'),
    path('api/cuadrillas/', Cuadrilla.as_view(), name='cuadrillas'),
    path('api/series_disponibles/', SeriesDisponibles.as_view(), name='series_disponibles'),
    path('api/desgloce/', Desgloce.as_view(), name='desgloce'),

    path('api/alertas/', Alertas.as_view(), name='alertas_vehiculo'),



    ]
