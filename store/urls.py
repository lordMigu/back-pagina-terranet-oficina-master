from django.urls import path
from . import views

urlpatterns = [
    path('v1/bodega/', views.BodegaList.as_view(), name='bodega-list'),
    path('v1/bodega/<int:pk>/', views.BodegaDetail.as_view(), name='bodega-detail'),
    path('v1/productosby/', views.ProductosEnBodegaAPIView.as_view(), name='productos-en-bodega'),
    path('v1/producto/', views.ProductoList.as_view(), name='producto-list'),
    path('v1/producto/<int:pk>/', views.ProductoDetail.as_view(), name='producto-detail'),
    path('v1/proveedor/', views.ProveedorList.as_view(), name='proveedor-list'),
    path('v1/proveedor/<int:pk>/', views.ProveedorDetail.as_view(), name='proveedor-detail'),
    path('v1/stock/', views.StockList.as_view(), name='stock-list'),
    path('v1/stock/<int:pk>/', views.StockDetail.as_view(), name='stock-detail'),
    path('v1/stockby/', views.StockListByProductoBodega.as_view(), name='stock-list-by-producto-bodega'),
    path('v1/stock/below-minimum/', views.StockBelowMinimum.as_view(), name='stock-below-minimum'),
    path('v1/movimiento/', views.MovimientoList.as_view(), name='movimiento-list'),
    path('v1/movimientoCompuesto/', views.MovimientoCompList.as_view(), name='movimiento-compuesto-list'),
    path('v1/movimiento/<int:pk>/', views.MovimientoDetail.as_view(), name='movimiento-detail'),
    path('v1/marca/', views.MarcaList.as_view(), name='marca-list'),
    path('v1/marca/<int:pk>/', views.MarcaDetail.as_view(), name='marca-detail'),
    path('v1/modelo/', views.ModeloList.as_view(), name='modelo-list'),
    path('v1/modelo/<int:pk>/', views.ModeloDetail.as_view(), name='modelo-detail'),
    path('v1/unidad/', views.UnidadList.as_view(), name='unidad-list'),
    path('v1/unidad/<int:pk>/', views.UnidadDetail.as_view(), name='unidad-detail'),
    path('v1/serie/', views.SerieList.as_view(), name='Serie-list'),
    path('v1/serie/<int:pk>/', views.SerieDetail.as_view(), name='Serie-detail'),
    path('v1/serie2/<int:pk>/', views.SerieDetail2.as_view(), name='Serie-detail2'),

    path('v1/seriesby/', views.SerieListByProductoBodega.as_view(), name='serie-list-by-producto-bodega'),
    path('v1/motivo_movimiento/', views.MotivoMovimientoList.as_view(), name='Motivo_Movimiento-list'),
    path('v1/motivo_movimiento/<int:pk>/', views.MotivoMovimientoDetail.as_view(), name='Motivo_Movimiento-detail'),

    path('v1/transferencia/', views.TransferenciaListCreateView.as_view(), name='Transferencia-list'),
    path('v1/transferencia/<int:pk>/', views.TransferenciaDetail.as_view(), name='Transferencia-detail'),


    # Repite el proceso para los otros modelos
]
