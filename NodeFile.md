# Análisis - Node_File (Servidor Express Independiente)

## Conclusiones Generales

### ¿Qué es este servidor Node?
Es un **servidor Express independiente** que actúa como una **API REST específica** para consultas analíticas y de movimientos. **No es un consumidor de otra API**, sino que accede **directamente a la base de datos "terranet"**.

---

## Arquitectura y Conexión

### Tipo de Servidor
- **Servidor Express Node.js** que corre en:
  - **Puerto**: 8559
  - **Host**: 10.100.254.162
  - **Base de datos**: Conexión directa a MySQL/MariaDB (terranet)
  - **Pool de conexiones**: Usa `mysql2` con connection pooling

### Dependencias Principales
```json
- express: Framework web
- mysql2: Driver MySQL con soporte a Promises
- body-parser: Middleware para parsear JSON
- dotenv: Variables de entorno
- pg: PostgreSQL (instalado pero no usado actualmente)
- nodemon: Para desarrollo (reinicio automático)
```

---

## Endpoints Disponibles

El servidor expone múltiples endpoints GET que consultan directamente la BD:

1. `/serie_ultimo_mov/` - Último movimiento de series (JOIN con bodega, producto, proveedor)
2. `/time_prom_inst_tecn/` - Tiempo promedio instalación por técnico
3. `/time_prom_inst_cuad/` - Tiempo promedio instalación por cuadrilla
4. `/time_prom_vist_tecn/` - Tiempo promedio visita técnica por técnico
5. `/time_prom_vist_cuad/` - Tiempo promedio visita técnica por cuadrilla
6. `/isntalac_realiz_tecnico/` - Instalaciones realizadas por técnico
7. Y más endpoints de análisis...

---

## ¿Es Primordial para la API Principal?

### **SÍ, ES CRÍTICO** pero OPCIONAL en términos de operación básica

**Impacto si falla:**
- ✅ La API principal (Django REST) **sigue funcionando** normalmente
- ❌ Los dashboards/reportes que dependen de estos endpoints **no cargarán datos analíticos**
- ❌ Queries complejas de análisis de desempeño de técnicos/cuadrillas no disponibles

**Recomendación:** Este servidor es **secundario pero importante** para:
- Dashboards de reportes
- Análisis de tiempos de instalación
- Seguimiento de movimientos de series
- Métricas de productividad

Si el negocio depende de estos reportes → **ES CRÍTICO START-UP**

---

## Triggers.txt - Ejecución en Base de Datos

### Ubicación de Ejecución: **EN LA BASE DE DATOS**

**Los triggers NO se ejecutan en Node**, se deben ejecutar directamente en MySQL/MariaDB:

```sql
mysql -u usuario -p terranet < triggers.txt
```

### Triggers Críticos Identificados

1. **stock_change** - Automático actualiza stock en INGRESO/EGRESO
2. **hojanueva** - Marca actividad como TERMINADO al crear hoja de trabajo
3. **clientenuevo** - Actualiza estado a "USUARIO CREADO" en wisphub
4. **delactividad** - Limpia referencias cuando se elimina actividad
5. **addserie** - Valida que series no estén en uso
6. **actividadkm** - Valida incremento de km en actividades
7. **revisionkm** - Valida incremento de km en revisiones

### Importancia de Triggers
- **CRÍTICOS** para integridad de datos
- Se ejecutan automáticamente en operaciones específicas
- **No dependen de Node**, son funcionalidad nativa de la BD
- **Deben estar presentes** para que los flujos funcionen correctamente

---

## Recomendaciones

1. **Asegurar que los triggers estén instalados** en la BD antes de operar
2. **Mantener este servidor ejecutándose** si los dashboards son importantes
3. **Monitorear** la conexión del servidor a la BD
4. **Documentar** si hay dependencias de frontend con estos endpoints
5. **Considerar** migrar algunas queries a vistas de BD para mejor rendimiento
6. **No confundir**: Los triggers se ejecutan EN LA BD, no en Node.js

---

## Resumen Técnico

| Aspecto | Detalle |
|--------|--------|
| **¿Consume otra API?** | No, acceso directo a BD |
| **¿Requiere BD terranet?** | Sí, conexión directa |
| **¿Triggers ejecutan en Node?** | No, en MySQL/MariaDB |
| **¿Es crítico para operación?** | Parcialmente (reportes) |
| **Puerto** | 8559 |
| **Host** | 10.100.254.162 |
