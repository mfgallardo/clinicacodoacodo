const express = require("express");
const router = express.Router();
const db = require("../db");

// Crear un paciente
router.post("/", (req, res) => {
  const {
    nombre,
    apellido,
    provincia_id,
    email,
    telefono,
    direccion,
    ciudad,
    dni,
    fecha_nacimiento,
  } = req.body;
  const query =
    "INSERT INTO pacientes (nombre, apellido, provincia_id, email, telefono, direccion, ciudad, dni, fecha_nacimiento) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
  db.query(
    query,
    [
      nombre,
      apellido,
      provincia_id,
      email,
      telefono,
      direccion,
      ciudad,
      dni,
      fecha_nacimiento,
    ],
    (err, result) => {
      if (err) {
        return res.status(500).json({ error: err.message });
      }
      res.status(201).json({ id: result.insertId });
    }
  );
});

// Leer todos los pacientes
router.get("/", (req, res) => {
  const query = `
        SELECT pa.id, pa.nombre, pa.apellido, pa.email, pa.telefono, pa.direccion, pa.ciudad, pa.dni, p.nombre AS provincia, pa.fecha_nacimiento
        FROM pacientes pa
        INNER JOIN provincias p ON pa.provincia_id = p.id
    `;
  db.query(query, (err, results) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    res.json(results);
  });
});

// Traer un resultado

router.get(`/:id`, (req, res) => {
  const { id } = req.params;

  const sql = "SELECT * FROM pacientes WHERE id = ?";
  db.query(sql, [id], (error, rows) => {
    if (error) {
      console.error("Error al buscar paciente:", error);
      return res.status(500).json({ error: "Error interno del servidor" });
    }
    if (rows.length === 0) {
      return res.status(404).json({ error: "Paciente no encontrado" });
    }
    res.json(rows[0]);
  });
});

// Actualizar un paciente
router.put("/:id", (req, res) => {
  const { id } = req.params;
  const {
    nombre,
    apellido,
    provincia_id,
    email,
    telefono,
    direccion,
    ciudad,
    dni,
    fecha_nacimiento,
  } = req.body;
  const query =
    "UPDATE pacientes SET nombre = ?, apellido = ?, provincia_id = ?, email = ?, telefono = ?, direccion = ?, ciudad = ?, dni = ?, fecha_nacimiento = ? WHERE id = ?";
  db.query(
    query,
    [
      nombre,
      apellido,
      provincia_id,
      email,
      telefono,
      direccion,
      ciudad,
      dni,
      fecha_nacimiento,
      id,
    ],
    (err, result) => {
      if (err) {
        return res.status(500).json({ error: err.message });
      }
      res.json({ message: "Paciente actualizado" });
    }
  );
});

// Eliminar un paciente
router.delete("/:id", (req, res) => {
  const { id } = req.params;
  const query = "DELETE FROM pacientes WHERE id = ?";
  db.query(query, [id], (err, result) => {
    if (err) {
      return res.status(500).json({ error: err.message });
    }
    res.json({ message: "Paciente eliminado" });
  });
});

module.exports = router;
