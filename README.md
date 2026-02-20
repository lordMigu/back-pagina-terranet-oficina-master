Proyecto backend Terranet - Información rápida
============================================

Descripción
-----------
API REST para Terranet (Django + DRF). La configuración de la base de datos se carga desde variables de entorno (usa python-decouple).

Base de datos
-------------
La aplicación toma los parámetros de conexión desde las variables de entorno (archivo `.env` en el repo durante desarrollo). Valores actuales encontrados en el repositorio:

- Host (IP): 10.100.254.162
- Puerto: 3306
- Nombre de la base de datos: terrabase
- Usuario: controlador
- Contraseña: terrabase2023$

Nota: Estos valores se leen desde [core/settings.py](core/settings.py#L118-L123) con `config('DB_*')`. En producción gestione las credenciales con variables de entorno seguras.

Endpoints principales
---------------------
Todos los endpoints van bajo el prefijo `/api/` según [core/urls.py](core/urls.py#L1-L28). Además hay endpoints para obtención de tokens y documentación:

- Autenticación JWT:
  - POST `/api/token/` -> devuelve `access` y `refresh` (credenciales: usuario/contraseña)
  - POST `/api/token/refresh/` -> devuelve nuevo `access` a partir de `refresh`

- Documentación:
  - GET `/redocs/` -> documentación OpenAPI (Redoc)

- `user` (varios recursos y estadísticas):
  - GET `/api/v1/usuario/` -> lista de usuarios
  - GET `/api/v1/usuario/<id>/` -> detalle de usuario
  - POST `/api/v1/usuario/authenticate/` -> endpoint de autenticación (uso interno)
  - Otros: `/api/api/clientes/`, `/api/api/planes/`, `/api/api/zonas/`, `/api/api/solicitudes/`, `/api/api/hojas/`, etc. (ver [user/urls.py](user/urls.py#L1-L40))

- `store` (gestión de inventario):
  - GET `/api/v1/producto/` -> lista de productos
  - GET `/api/v1/producto/<id>/` -> detalle de producto
  - GET `/api/v1/stock/` -> lista de stocks
  - Otros: bodegas, series, movimientos, transferencias (ver [store/urls.py](store/urls.py#L1-L80)).

- `rutas` (actividades y rutas):
  - GET `/api/v1/actividades/` -> lista de actividades
  - GET `/api/v1/actividades/<id>/` -> detalle de actividad
  - GET `/api/v1/rutas/` -> lista de rutas
  - Ver [rutas/urls.py](rutas/urls.py#L1-L20)

- `agenda` (solicitudes, kits, hojas de trabajo):
  - GET `/api/v1/solicitud/` -> lista de solicitudes
  - GET `/api/v1/hojatrabajo/` -> lista hojas de trabajo
  - GET `/api/v1/kits/` -> lista de kits
  - Ver [agenda/urls.py](agenda/urls.py#L1-L30)

- `contabilidad` (combustibles, recepciones, revisiones, vehículos):
  - GET `/api/v1/combustibles/` -> lista
  - GET `/api/v1/recepciones/` -> lista
  - Ver [contabilidad/urls.py](contabilidad/urls.py#L1-L40)

Qué devuelven los endpoints (generales)
-------------------------------------
- Los endpoints siguen patrones REST: los endpoints list (`List`/`ListCreate`) devuelven colecciones en JSON; los endpoints detail (`Retrieve`/`Update`/`Destroy`) devuelven un único objeto JSON.
- Para operaciones autenticadas, se requiere token JWT (encabezado `Authorization: Bearer <token>`).
- Los endpoints de estadística en `user` retornan JSON con métricas (p. ej. `tiempo_prom_instalacion`, `instalaciones_realizadas`).

Dónde mirar el código
----------------------
- Rutas principales: [core/urls.py](core/urls.py#L1-L28) (incluye los módulos bajo `/api/`)
- Configuración DB: [core/settings.py](core/settings.py#L118-L123) (usa `decouple.config` para leer `.env`)
- Listado de endpoints por app:
  - [user/urls.py](user/urls.py#L1-L40)
  - [store/urls.py](store/urls.py#L1-L80)
  - [rutas/urls.py](rutas/urls.py#L1-L20)
  - [agenda/urls.py](agenda/urls.py#L1-L30)
  - [contabilidad/urls.py](contabilidad/urls.py#L1-L40)

Advertencias y buenas prácticas
-------------------------------
- No deje credenciales sensibles en archivos públicos. Si va a subir el repo, elimine o reemplace las credenciales del archivo `.env`.
- Para pruebas locales, puede usar el `.env` incluido; en staging/producción use variables de entorno seguras.

Si quieres, puedo añadir ejemplos de requests curl para cada endpoint o generar documentación OpenAPI completa.
