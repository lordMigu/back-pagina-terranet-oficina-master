const express = require("express");
const bodyParser = require("body-parser");
const pool = require("./BD/db");

const app = express();
const port = 8559;
const host = 'localhost';
// const host = '10.100.254.162' // produccion

app.use(bodyParser.json());


//GET SERIE ULTIMO MOVIMIENTO
app.get("/serie_ultimo_mov/", async (req, res) => {
  try {
    const connection = await pool.getConnection();
    const [rows] = await connection.execute(
      `select m.id_actividad, a.*,
            b.nombre AS nombre_bodega, 
            p.nombre AS nombre_producto,
            pr.nombre AS nombre_proveedor
          from movimiento m right JOIN
          (select t.movimiento, s.* from series s left join
          (select serie_id, max(movimiento_id) as movimiento
          from movimiento_series group by serie_id) t
          on s.id = t.serie_id) a on m.id = a.movimiento
          LEFT JOIN
              bodega b ON a.bodega_id = b.id
          LEFT JOIN
              producto p ON a.producto_id = p.id
        LEFT JOIN
              proveedor pr ON a.proveedor_id = pr.id;`
    );
    connection.release();

    res.status(200).json(rows);
    console.log("Se ha realizado un GET en /serie_ultimo_mov");
  } catch (error) {
    console.error("Error al obtener time_prom_inst_tecn:", error);
    res.status(500).json({ error: "Error al obtener las time_prom_inst_tecn" });
  }
});

// TIEMPO PROMEDIO INSTALACION TECNICO
app.get("/time_prom_inst_tecn/", async (req, res) => {
  try {
    const connection = await pool.getConnection();
    const [rows] = await connection.execute(
      `SELECT a.id_tecnico_id AS id_tecnico, s.tipo, AVG(TIMESTAMPDIFF(MINUTE, a.tiempo_inicio, a.tiempo_fin)) AS tiempo
      FROM actividad a
      JOIN solicitud s ON a.solicitud_id = s.id
      WHERE s.tipo = 'INSTALACION'
      and a.estado = "TERMINADO"
      GROUP BY a.id_tecnico_id, s.tipo;`
    );
    connection.release();

    res.status(200).json(rows);
    console.log("Se ha realizado un GET en /time_prom_inst_tecn");
  } catch (error) {
    console.error("Error al obtener time_prom_inst_tecn:", error);
    res.status(500).json({ error: "Error al obtener las time_prom_inst_tecn" });
  }
});


// TIEMPO PROMEDIO INSTALACION CUADRILLA
app.get("/time_prom_inst_cuad/", async (req, res) => {
  try {
    const connection = await pool.getConnection();
    const [rows] = await connection.execute(
      `SELECT a.id_cuadrilla_id AS id_cuadrilla, s.tipo, AVG(TIMESTAMPDIFF(MINUTE, a.tiempo_inicio, a.tiempo_fin)) AS tiempo
      FROM actividad a
      JOIN solicitud s ON a.solicitud_id = s.id
      WHERE s.tipo = 'INSTALACION'
      and a.estado = "TERMINADO"
      GROUP BY a.id_cuadrilla_id, s.tipo;;`
    );
    connection.release();

    res.status(200).json(rows);
    console.log("Se ha realizado un GET en /time_prom_inst_cuad");
  } catch (error) {
    console.error("Error al obtener time_prom_inst_cuad:", error);
    res.status(500).json({ error: "Error al obtener las time_prom_inst_cuad" });
  }
});
////////////////////////////////////////////////////////////////////////

// TIEMPO PROM VISITA TECNICO 

app.get("/time_prom_vist_tecn/", async (req, res) => {
  try {
    const connection = await pool.getConnection();
    const [rows] = await connection.execute(
      `SELECT a.id_tecnico_id AS id_tecnico, s.tipo, AVG(TIMESTAMPDIFF(MINUTE, a.tiempo_inicio, a.tiempo_fin)) AS tiempo
      FROM actividad a
      JOIN solicitud s ON a.solicitud_id = s.id
      WHERE s.tipo = "VISITA TECNICA"
      and a.estado = "TERMINADO"
      GROUP BY a.id_tecnico_id, s.tipo;`
    );
    connection.release();

    res.status(200).json(rows);
    console.log("Se ha realizado un GET en /time_prom_vist_tecn");
  } catch (error) {
    console.error("Error al obtener time_prom_vist_tecn:", error);
    res.status(500).json({ error: "Error al obtener las time_prom_vist_tecn" });
  }
});


// TIEMPO PROMEDIO VISITA CUADRILLA
app.get("/time_prom_vist_cuad/", async (req, res) => {
  try {
    const connection = await pool.getConnection();
    const [rows] = await connection.execute(
      `SELECT a.id_cuadrilla_id AS id_cuadrilla, s.tipo, AVG(TIMESTAMPDIFF(MINUTE, a.tiempo_inicio, a.tiempo_fin)) AS tiempo
      FROM actividad a
      JOIN solicitud s ON a.solicitud_id = s.id
      WHERE s.tipo = "VISITA TECNICA"
      and a.estado = "TERMINADO"
      GROUP BY a.id_cuadrilla_id, s.tipo;`
    );
    connection.release();

    res.status(200).json(rows);
    console.log("Se ha realizado un GET en /time_prom_vist_cuad");
  } catch (error) {
    console.error("Error al obtener time_prom_vist_cuad:", error);
    res.status(500).json({ error: "Error al obtener las time_prom_vist_cuad" });
  }
});
//////////////////////////////////////////////////////////////////////////////////////////////////////////
// Instalacioens REALZADS TECNICOS

app.get("/isntalac_realiz_tecnico/", async (req, res) => {
  try {
    const connection = await pool.getConnection();
    const [rows] = await connection.execute(
      `SELECT a.id_tecnico_id AS id_tecnico, s.tipo, COUNT(*) AS total
      FROM Actividad a
      JOIN Solicitud s ON a.solicitud_id = s.id
      WHERE s.tipo = 'INSTALACION'
      AND a.estado = "TERMINADO"
      GROUP BY a.id_tecnico_id, s.tipo;`
    );
    connection.release();

    res.status(200).json(rows);
    console.log("Se ha realizado un GET en /isntalac_realiz_tecnico");
  } catch (error) {
    console.error("Error al obtener isntalac_realiz_tecnico:", error);
    res.status(500).json({ error: "Error al obtener las isntalac_realiz_tecnico" });
  }
});


//INATALACIOENS SREALIZADSA CUADRILLA
app.get("/isntalac_realiz_cuadrilla/", async (req, res) => {
  try {
    const connection = await pool.getConnection();
    const [rows] = await connection.execute(
      `SELECT a.id_cuadrilla_id AS id_cuadrilla, s.tipo, COUNT(*) AS total
      FROM Actividad a
      JOIN Solicitud s ON a.solicitud_id = s.id
      WHERE s.tipo = 'INSTALACION'
      AND a.estado = "TERMINADO"
      GROUP BY a.id_cuadrilla_id, s.tipo;`
    );
    connection.release();

    res.status(200).json(rows);
    console.log("Se ha realizado un GET en /isntalac_realiz_cuadrilla");
  } catch (error) {
    console.error("Error al obtener isntalac_realiz_cuadrilla:", error);
    res.status(500).json({ error: "Error al obtener las isntalac_realiz_cuadrilla" });
  }
});

///////////////////////////////////////////////////////////////////////////////////

// VISITA REALZADS TECNICOS

app.get("/visitaTecn_realiz_tecnico/", async (req, res) => {
  try {
    const connection = await pool.getConnection();
    const [rows] = await connection.execute(
      `SELECT a.id_tecnico_id AS id_tecnico, s.tipo, COUNT(*) AS total
      FROM Actividad a
      JOIN Solicitud s ON a.solicitud_id = s.id
      WHERE s.tipo = 'VISITA TECNICA'
      AND a.estado = "TERMINADO"
      GROUP BY a.id_tecnico_id, s.tipo;`
    );
    connection.release();

    res.status(200).json(rows);
    console.log("Se ha realizado un GET en /visitaTecn_realiz_tecnico");
  } catch (error) {
    console.error("Error al obtener visitaTecn_realiz_tecnico:", error);
    res.status(500).json({ error: "Error al obtener las visitaTecn_realiz_tecnico" });
  }
});


//VISITA SREALIZADSA CUADRILLA
app.get("/visitaTecn_realiz_cuadrilla/", async (req, res) => {
  try {
    const connection = await pool.getConnection();
    const [rows] = await connection.execute(
      `SELECT a.id_cuadrilla_id AS id_cuadrilla, s.tipo, COUNT(*) AS total
      FROM Actividad a
      JOIN Solicitud s ON a.solicitud_id = s.id
      WHERE s.tipo = 'VISITA TECNICA'
      AND a.estado = "TERMINADO"
      GROUP BY a.id_cuadrilla_id, s.tipo;`
    );
    connection.release();

    res.status(200).json(rows);
    console.log("Se ha realizado un GET en /visitaTecn_realiz_cuadrilla");
  } catch (error) {
    console.error("Error al obtener visitaTecn_realiz_cuadrilla:", error);
    res.status(500).json({ error: "Error al obtener las visitaTecn_realiz_cuadrilla" });
  }
});

//////////////////////////////////////////////////////////////////////////////////////

//MIGRACION SREALIZADSA CUADRILLA
app.get("/migracion_realiz_tecnico/", async (req, res) => {
  try {
    const connection = await pool.getConnection();
    const [rows] = await connection.execute(
      `SELECT a.id_cuadrilla_id AS id_cuadrilla, s.tipo, COUNT(*) AS total
      FROM Actividad a
      JOIN Solicitud s ON a.solicitud_id = s.id
      WHERE s.tipo = 'MIGRACION'
      AND a.estado = "TERMINADO"
      GROUP BY a.id_cuadrilla_id, s.tipo;`
    );
    connection.release();

    res.status(200).json(rows);
    console.log("Se ha realizado un GET en /migracion_realiz_tecnico");
  } catch (error) {
    console.error("Error al obtener migracion_realiz_tecnico:", error);
    res.status(500).json({ error: "Error al obtener las migracion_realiz_tecnico" });
  }
});

//MIGRACION SREALIZADSA CUADRILLA
app.get("/migracion_realiz_cuadrilla/", async (req, res) => {
  try {
    const connection = await pool.getConnection();
    const [rows] = await connection.execute(
      `SELECT a.id_cuadrilla_id AS id_cuadrilla, s.tipo, COUNT(*) AS total
      FROM Actividad a
      JOIN Solicitud s ON a.solicitud_id = s.id
      WHERE s.tipo = 'MIGRACION'
      AND a.estado = "TERMINADO"
      GROUP BY a.id_cuadrilla_id, s.tipo;`
    );
    connection.release();

    res.status(200).json(rows);
    console.log("Se ha realizado un GET en /migracion_realiz_cuadrilla");
  } catch (error) {
    console.error("Error al obtener migracion_realiz_cuadrilla:", error);
    res.status(500).json({ error: "Error al obtener las migracion_realiz_cuadrilla" });
  }
});

/////////////////////////////////////////////
//// Tiempo total diario de recorrio por dia cuadrilla

app.get("/Tiempo_recorrido_dia/", async (req, res) => {
  try {
    const connection = await pool.getConnection();
    const [rows] = await connection.execute(
      `SELECT
      r.cuadrilla_id AS id_cuadrilla,
      DATE(r.tiempo_inicio) AS fecha,
      SUM(TIMESTAMPDIFF(HOUR, r.tiempo_inicio, r.tiempo_fin)) AS tiempo
  FROM
      ruta r
  WHERE r.estado = "TERMINADO"
  GROUP BY
      r.cuadrilla_id,
      DATE(r.tiempo_inicio);`
    );
    connection.release();

    res.status(200).json(rows);
    console.log("Se ha realizado un GET en /Tiempo_recorrido_dia");
  } catch (error) {
    console.error("Error al obtener Tiempo_recorrido_dia:", error);
    res.status(500).json({ error: "Error al obtener las Tiempo_recorrido_dia" });
  }
});


/// TIEMPO RECORRIDO MES cuadrilla 
app.get("/Tiempo_recorrido_mes/", async (req, res) => {
  try {
    const connection = await pool.getConnection();
    const [rows] = await connection.execute(
      `SELECT
      r.cuadrilla_id AS id_cuadrilla,
      DATE_FORMAT(r.tiempo_inicio, '%Y-%m') AS fecha_mes,
      SUM(TIMESTAMPDIFF(HOUR, r.tiempo_inicio, r.tiempo_fin)) AS tiempo
  FROM
      ruta r
  WHERE r.estado = "TERMINADO"
  GROUP BY
      r.cuadrilla_id,
      DATE_FORMAT(r.tiempo_inicio, '%Y-%m');`
    );
    connection.release();

    res.status(200).json(rows);
    console.log("Se ha realizado un GET en /Tiempo_recorrido_mes");
  } catch (error) {
    console.error("Error al obtener Tiempo_recorrido_mes:", error);
    res.status(500).json({ error: "Error al obtener las Tiempo_recorrido_mes" });
  }
});

/////////////////////////////////
// TIEMPO PROMEDIO JORNADA DIARIA


app.get("/Tiempo_Promedio_rec_dia/", async (req, res) => {
  try {
    const connection = await pool.getConnection();
    const [rows] = await connection.execute(
      `SELECT
          r.cuadrilla_id AS id_cuadrilla,
          AVG(TIMESTAMPDIFF(HOUR, r.tiempo_inicio, r.tiempo_fin)) AS tiempo
      FROM
          ruta r
      WHERE r.estado = "TERMINADO"
      GROUP BY
          r.cuadrilla_id;`
    );
    connection.release();

    res.status(200).json(rows);
    console.log("Se ha realizado un GET en /Tiempo_Promedio_rec_dia");
  } catch (error) {
    console.error("Error al obtener Tiempo_Promedio_rec_dia:", error);
    res.status(500).json({ error: "Error al obtener las Tiempo_Promedio_rec_dia" });
  }
});

app.get("/actividades/", async (req, res) => {
  try {
    const connection = await pool.getConnection();
    const [rows] = await connection.execute(
      `select z.*, u.nombre as modificado_por from
      (select a.*, s.cedula, s.nombres_cliente from actividad a left join solicitud s on a.solicitud_id = s.id) z
      left join usuario u on z.usuario_mod_id = u.id;`
    );
    connection.release();

    res.status(200).json(rows);
    console.log("Se ha realizado un GET en /actividades");
  } catch (error) {
    console.error("Error al obtener actividades:", error);
    res.status(500).json({ error: "Error al obtener las actividades" });
  }
});


app.get("/solicitudes/:estado/:inicio/:fin/", async (req, res) => {
  try {
    const connection = await pool.getConnection();
    let estado = req.params.estado;
    let inicio = req.params.inicio;
    let fin = req.params.fin;
    let url = `select s.*, GROUP_CONCAT(a.id SEPARATOR ';') as actividades from 
    (SELECT a.*,
         MAX(CASE when u.id = a.usuario_agendo_id then u.nombre end ) AS agendado_por,
         MAX(CASE when u.id = a.usuario_solicitud_id then u.nombre end) AS creado_por,
         MAX(CASE when u.id = a.usuario_revision_id then u.nombre end) AS revisado_por
    FROM solicitud a
    LEFT JOIN usuario u ON u.id IN (a.usuario_agendo_id, a.usuario_solicitud_id, a.usuario_revision_id)
    where a.estado = "${estado}"
    and a.created_at between "${inicio}" and "${fin}"
    GROUP BY a.id) s
   left join actividad a on s.id = a.solicitud_id GROUP BY s.id;`

    const [rows] = await connection.execute(url);
    connection.release();

    res.status(200).json(rows);
    console.log("Se ha realizado un GET en /solicitudes");
  } catch (error) {
    console.error("Error al obtener solicitudes:", error);
    res.status(500).json({ error: "Error al obtener las solicitudes" });
  }
});

app.get("/solicitudes/:estado/", async (req, res) => {
  try {
    const connection = await pool.getConnection();
    let estado = req.params.estado;
    let url = `select s.*, GROUP_CONCAT(a.id SEPARATOR ';') as actividades from 
    (SELECT a.*,
         MAX(CASE when u.id = a.usuario_agendo_id then u.nombre end ) AS agendado_por,
         MAX(CASE when u.id = a.usuario_solicitud_id then u.nombre end) AS creado_por,
         MAX(CASE when u.id = a.usuario_revision_id then u.nombre end) AS revisado_por
    FROM solicitud a
    LEFT JOIN usuario u ON u.id IN (a.usuario_agendo_id, a.usuario_solicitud_id, a.usuario_revision_id)
    where a.estado = "${estado}"
    GROUP BY a.id) s
   left join actividad a on s.id = a.solicitud_id GROUP BY s.id;`

    const [rows] = await connection.execute(url);
    connection.release();

    res.status(200).json(rows);
    console.log("Se ha realizado un GET en /solicitudes");
  } catch (error) {
    console.error("Error al obtener solicitudes:", error);
    res.status(500).json({ error: "Error al obtener las solicitudes" });
  }
});

app.get("/solicitudes/:inicio/:fin/", async (req, res) => {
  try {
    const connection = await pool.getConnection();
    let inicio = req.params.inicio;
    let fin = req.params.fin;
    let url = `select s.*, GROUP_CONCAT(a.id SEPARATOR ';') as actividades from 
    (SELECT a.*,
         MAX(CASE when u.id = a.usuario_agendo_id then u.nombre end ) AS agendado_por,
         MAX(CASE when u.id = a.usuario_solicitud_id then u.nombre end) AS creado_por,
         MAX(CASE when u.id = a.usuario_revision_id then u.nombre end) AS revisado_por
    FROM solicitud a
    LEFT JOIN usuario u ON u.id IN (a.usuario_agendo_id, a.usuario_solicitud_id, a.usuario_revision_id)
    where a.created_at between "${inicio}" and "${fin}"
    GROUP BY a.id) s
   left join actividad a on s.id = a.solicitud_id GROUP BY s.id;`

    const [rows] = await connection.execute(url);
    connection.release();

    res.status(200).json(rows);
    console.log("Se ha realizado un GET en /solicitudes");
  } catch (error) {
    console.error("Error al obtener solicitudes:", error);
    res.status(500).json({ error: "Error al obtener las solicitudes" });
  }
});


app.get("/solicitudes/", async (req, res) => {
  try {
    const connection = await pool.getConnection();
    const [rows] = await connection.execute(
      `select s.*, GROUP_CONCAT(a.id SEPARATOR ';') as actividades from 
    (SELECT a.*,
         MAX(CASE when u.id = a.usuario_agendo_id then u.nombre end ) AS agendado_por,
         MAX(CASE when u.id = a.usuario_solicitud_id then u.nombre end) AS creado_por,
         MAX(CASE when u.id = a.usuario_revision_id then u.nombre end) AS revisado_por
    FROM solicitud a
    LEFT JOIN usuario u ON u.id IN (a.usuario_agendo_id, a.usuario_solicitud_id, a.usuario_revision_id)
    GROUP BY a.id) s
   left join actividad a on s.id = a.solicitud_id GROUP BY s.id;`
    );
    connection.release();

    res.status(200).json(rows);
    console.log("Se ha realizado un GET en /solicitudes");
  } catch (error) {
    console.error("Error al obtener solicitudes:", error);
    res.status(500).json({ error: "Error al obtener las solicitudes" });
  }
});

app.get("/hojas/", async (req, res) => {
  try {
    const connection = await pool.getConnection();
    const [rows] = await connection.execute(
      `select h.*, s.id as solicitud, s.tipo, s.cedula, s.nombres_cliente from hojatrabajo h left join actividad a 
      on h.id_actividad = a.id left join solicitud s 
      on s.id = solicitud_id;`
    );
    connection.release();

    res.status(200).json(rows);
    console.log("Se ha realizado un GET en /hojas");
  } catch (error) {
    console.error("Error al obtener hojas:", error);
    res.status(500).json({ error: "Error al obtener las hojas" });
  }
});

app.get("/hojas/:inicio/:fin", async (req, res) => {
  try {
    let inicio = req.params.inicio;
    let fin = req.params.fin;
    const connection = await pool.getConnection();
    const [rows] = await connection.execute(
      `select h.*, s.id as solicitud, s.tipo, s.cedula, s.nombres_cliente from hojatrabajo h left join actividad a 
      on h.id_actividad = a.id left join solicitud s 
      on s.id = solicitud_id
      where h.created_at between "${inicio}" and "${fin}" ;`
    );
    connection.release();

    res.status(200).json(rows);
    console.log("Se ha realizado un GET en /hojas");
  } catch (error) {
    console.error("Error al obtener hojas:", error);
    res.status(500).json({ error: "Error al obtener las hojas" });
  }
});

app.get("/cuadrillas/", async (req, res) => {
  try {
    const connection = await pool.getConnection();
    const [rows] = await connection.execute(
      `SELECT b.*,GROUP_CONCAT(u.nombre SEPARATOR ', ') as usuarios FROM bodega b left join bodega_personas_encargadas bp on b.id=bp.bodega_id
      left join usuario u on u.id = bp.usuario_id
      where b.tipo = "CUADRILLA"
      group by b.id;`
    );
    connection.release();

    res.status(200).json(rows);
    console.log("Se ha realizado un GET en /cuadrillas");
  } catch (error) {
    console.error("Error al obtener cuadrillas:", error);
    res.status(500).json({ error: "Error al obtener las cuadrillas" });
  }
});

app.get("/seriesdisponibles/", async (req, res) => {
  try {
    const connection = await pool.getConnection();
    const [rows] = await connection.execute(
      `select id, serie, bodega_id from series where bodega_id is not null;`
    );
    connection.release();

    res.status(200).json(rows);
    console.log("Se ha realizado un GET en /seriesdisponibles");
  } catch (error) {
    console.error("Error al obtener seriesdisponibles:", error);
    res.status(500).json({ error: "Error al obtener las seriesdisponibles" });
  }
});

app.get("/desgloce/", async (req, res) => {
  try {
    const connection = await pool.getConnection();
    const [rows] = await connection.execute(
      `select z.actividad, z.inicio_actividad, z.fin_actividad,
      z.estado_actividad, z.km, z.motivo_cancelado, z.solicitud, z.tipo, z.cedula, z.nombres_cliente,
     r.* from (select a.id as actividad, a.tiempo_fin as fin_actividad,
     a.tiempo_inicio as inicio_actividad, a.estado as estado_actividad, a.km, a.motivo_cancelado, a.ruta_id,
      s.id as solicitud, s.tipo, s.cedula, s.nombres_cliente from actividad a left join solicitud s on a.solicitud_id= s.id)
     z left join (
     select b.nombre as cuadrilla, r.id as ruta, r.tiempo_inicio as inicio_ruta, r.tiempo_fin as fin_ruta,
      r.estado as estado_ruta from ruta r left join bodega b on r.cuadrilla_id = b.id)
      r on z.ruta_id = r.ruta
      order by ruta desc;`
    );
    connection.release();

    res.status(200).json(rows);
    console.log("Se ha realizado un GET en /desgloce");
  } catch (error) {
    console.error("Error al obtener desgloce:", error);
    res.status(500).json({ error: "Error al obtener las desgloce" });
  }
});

app.get("/alerta/:vehiculo", async (req, res) => {
  try {
    let vehiculo = req.params.vehiculo;

    const connection = await pool.getConnection();
    const [rows] = await connection.execute(
      `SELECT r.id, r.km_futura, r.vehiculo_id, r.tipo_revision_id, ultimos.tipo
      FROM revision r
      INNER JOIN (
          select re.tipo_revision_id, tr.tipo, max(re.created_at) as fecha_creacion  from revision re
          inner join tipo_revision tr on tr.id = re.tipo_revision_id
          where vehiculo_id = ${vehiculo} and km_futura is not null
          group by re.tipo_revision_id, tr.tipo
      ) ultimos ON
       r.tipo_revision_id = ultimos.tipo_revision_id AND r.created_at = ultimos.fecha_creacion;`
    );
    connection.release();

    res.status(200).json(rows);
    console.log("Se ha realizado un GET en /alerta");
  } catch (error) {
    console.error("Error al obtener alerta:", error);
    res.status(500).json({ error: "Error al obtener las alertas" });
  }
});



app.listen(port, () => {
  console.log(`Servidor corriendo en http://localhost:${port}`);
});
