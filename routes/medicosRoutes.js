const express = require('express');
const router = express.Router();
const db = require('../db');

// Crear un médico
router.post('/', (req, res) => {
    const { nombre, apellido, especialidad_id, provincia_id, email, telefono, direccion, ciudad, dni, fecha_nacimiento } = req.body;
    const query = 'INSERT INTO medicos (nombre, apellido, especialidad_id, provincia_id, email, telefono, direccion, ciudad, dni, fecha_nacimiento) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)';
    db.query(query, [nombre, apellido, especialidad_id, provincia_id, email, telefono, direccion, ciudad, dni, fecha_nacimiento], (err, result) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        res.status(201).json({ id: result.insertId });
    });
});

// Leer todos los médicos
router.get('/', (req, res) => {
    const query = `
        SELECT m.id, m.nombre, m.apellido, e.nombre AS especialidad, p.nombre AS provincia, m.email, m.telefono, m.direccion, m.ciudad, m.dni, m.fecha_nacimiento
        FROM medicos m
        INNER JOIN especialidades e ON m.especialidad_id = e.id
        INNER JOIN provincias p ON m.provincia_id = p.id
    `;
    db.query(query, (err, results) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        res.json(results);
    });
});

// Actualizar un médico
router.put('/:id', (req, res) => {
    const { id } = req.params;
    const { nombre, apellido, especialidad_id, provincia_id, email, telefono, direccion, ciudad, dni, fecha_nacimiento } = req.body;
    const query = 'UPDATE medicos SET nombre = ?, apellido = ?, especialidad_id = ?, provincia_id = ?, email = ?, telefono = ?, direccion = ?, ciudad = ?, dni = ?, fecha_nacimiento = ? WHERE id = ?';
    db.query(query, [nombre, apellido, especialidad_id, provincia_id, email, telefono, direccion, ciudad, dni, fecha_nacimiento, id], (err, result) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        res.json({ message: 'Médico actualizado' });
    });
});

// Eliminar un médico
router.delete('/:id', (req, res) => {
    const { id } = req.params;
    const query = 'DELETE FROM medicos WHERE id = ?';
    db.query(query, [id], (err, result) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        res.json({ message: 'Médico eliminado' });
    });
});

module.exports = router;
