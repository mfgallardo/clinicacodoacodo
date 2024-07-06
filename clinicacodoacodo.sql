-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-07-2024 a las 02:43:57
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clinicacodoacodo`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

CREATE TABLE `especialidades` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`id`, `nombre`) VALUES
(1, 'Cardiología'),
(2, 'Dermatología'),
(3, 'Gastroenterología'),
(4, 'Ginecología'),
(5, 'Neurología'),
(6, 'Oftalmología'),
(7, 'Oncología'),
(8, 'Pediatría'),
(9, 'Psiquiatría'),
(10, 'Traumatología'),
(11, 'Cardiología'),
(12, 'Dermatología'),
(13, 'Gastroenterología'),
(14, 'Neurología'),
(15, 'Pediatría');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicos`
--

CREATE TABLE `medicos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `apellido` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `telefono` varchar(255) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL,
  `dni` varchar(255) NOT NULL,
  `especialidad_id` int(11) DEFAULT NULL,
  `provincia_id` int(11) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `medicos`
--

INSERT INTO `medicos` (`id`, `nombre`, `apellido`, `email`, `telefono`, `direccion`, `ciudad`, `dni`, `especialidad_id`, `provincia_id`, `fecha_nacimiento`) VALUES
(1, 'Juan', 'Pérez ffddddfffff', 'juan.perez@example.com', '123456789', 'Calle Falsa 123', 'Ciudad A', '12345678', 1, 1, '1980-01-01'),
(2, 'Ana', 'García', 'ana.garcia@example.com', '987654321', 'Avenida Siempre Viva 742', 'Ciudad B', '23456789', 2, 2, '1985-02-02'),
(3, 'Luis', 'Martínezvbbbbbbb', 'luis.martinez@example.com', '567890123', 'Calle Real 456', 'Ciudad C', '34567890', 3, 3, '1990-03-03'),
(4, 'María', 'Rodríguez', 'maria.rodriguez@example.com', '890123456', 'Calle Luna 789', 'Ciudad D', '45678901', 4, 4, '1982-04-04'),
(5, 'Pedro', 'González', 'pedro.gonzalez@example.com', '123890456', 'Avenida Sol 101', 'Ciudad E', '56789012', 5, 5, '1988-05-05'),
(6, 'Laura', 'López', 'laura.lopez@example.com', '456789012', 'Calle Estrella 202', 'Ciudad F', '67890123', 6, 6, '1992-06-06'),
(7, 'Carlos', 'Díaz', 'carlos.diaz@example.com', '789012345', 'Avenida Mar 303', 'Ciudad G', '78901234', 7, 7, '1983-07-07'),
(8, 'Sofía', 'Fernández', 'sofia.fernandez@example.com', '901234567', 'Calle Río 404', 'Ciudad H', '89012345', 8, 8, '1987-08-08'),
(9, 'Miguel', 'Ruiz', 'miguel.ruiz@example.com', '234567890', 'Avenida Lago 505', 'Ciudad I', '90123456', 9, 9, '1991-09-09'),
(10, 'Lucía', 'Hernández', 'lucia.hernandez@example.com', '567890123', 'Calle Bosque 606', 'Ciudad J', '12345678', 10, 10, '1984-10-10'),
(11, 'David', 'Jiménez', 'david.jimenez@example.com', '890123456', 'Avenida Selva 707', 'Ciudad K', '23456789', 1, 11, '1993-11-11'),
(12, 'Carmen', 'Álvarez', 'carmen.alvarez@example.com', '123456789', 'Calle Montaña 808', 'Ciudad L', '34567890', 2, 12, '1986-12-12'),
(13, 'Javier', 'Moreno', 'javier.moreno@example.com', '456789012', 'Avenida Valle 909', 'Ciudad M', '45678901', 3, 13, '1981-01-01'),
(14, 'Marta', 'Muñoz', 'marta.munoz@example.com', '789012345', 'Calle Roca 101', 'Ciudad N', '56789012', 4, 14, '1989-02-02'),
(15, 'Alberto', 'Romero', 'alberto.romero@example.com', '012345678', 'Avenida Playa 202', 'Ciudad O', '67890123', 5, 15, '1994-03-03'),
(16, 'Elena', 'Ortiz', 'elena.ortiz@example.com', '345678901', 'Calle Viento 303', 'Ciudad P', '78901234', 6, 16, '1985-04-04'),
(17, 'Pablo', 'Iglesias', 'pablo.iglesias@example.com', '678901234', 'Avenida Nieve 404', 'Ciudad Q', '89012345', 7, 17, '1992-05-05'),
(18, 'Sara', 'Santos', 'sara.santos@example.com', '901234567', 'Calle Lluvia 505', 'Ciudad R', '90123456', 8, 18, '1988-06-06'),
(19, 'Daniel', 'Castro', 'daniel.castro@example.com', '234567890', 'Avenida Sol 606', 'Ciudad S', '12345678', 9, 19, '1991-07-07'),
(20, 'Isabel', 'Ramos', 'isabel.ramos@example.com', '567890123', 'Calle Tierra 707', 'Ciudad T', '23456789', 10, 20, '1984-08-08'),
(25, 'Pedro', 'García', 'pedro.garcia@example.com', '555555555', 'Calle 25', 'Ciudad 25', '55555555', 5, 9, '1985-01-01'),
(26, 'Laura', 'Fernández', 'laura.fernandez@example.com', '666666666', 'Calle 26', 'Ciudad 26', '66666666', 6, 9, '1986-02-02'),
(27, 'Luis', 'Rodríguez', 'luis.rodriguez@example.com', '777777777', 'Calle 27', 'Ciudad 27', '77777777', 7, 9, '1987-03-03'),
(28, 'Sofía', 'Hernández', 'sofia.hernandez@example.com', '888888888', 'Calle 28', 'Ciudad 28', '88888888', 8, 10, '1988-04-04'),
(29, 'Miguel', 'Ruiz', 'miguel.ruiz@example.com', '999999999', 'Calle 29', 'Ciudad 29', '99999999', 9, 10, '1989-05-05'),
(30, 'Lucía', 'Jiménez', 'lucia.jimenez@example.com', '101010101', 'Calle 30', 'Ciudad 30', '10101010', 10, 10, '1990-06-06'),
(31, 'David', 'González', 'david.gonzalez@example.com', '111111111', 'Calle 31', 'Ciudad 31', '11111111', 1, 11, '1981-07-07'),
(32, 'Carmen', 'Martínez', 'carmen.martinez@example.com', '222222222', 'Calle 32', 'Ciudad 32', '22222222', 2, 11, '1982-08-08'),
(33, 'Javier', 'Fernández', 'javier.fernandez@example.com', '333333333', 'Calle 33', 'Ciudad 33', '33333333', 3, 11, '1983-09-09'),
(34, 'Marta', 'García', 'marta.garcia@example.com', '444444444', 'Calle 34', 'Ciudad 34', '44444444', 4, 12, '1984-10-10'),
(35, 'Alberto', 'López', 'alberto.lopez@example.com', '555555555', 'Calle 35', 'Ciudad 35', '55555555', 5, 12, '1985-11-11'),
(36, 'Elena', 'Rodríguez', 'elena.rodriguez@example.com', '666666666', 'Calle 36', 'Ciudad 36', '66666666', 6, 12, '1986-12-12'),
(37, 'Pablo', 'Hernández', 'pablo.hernandez@example.com', '777777777', 'Calle 37', 'Ciudad 37', '77777777', 7, 13, '1987-01-01'),
(38, 'Sara', 'Ruiz', 'sara.ruiz@example.com', '888888888', 'Calle 38', 'Ciudad 38', '88888888', 8, 13, '1988-02-02'),
(39, 'Daniel', 'Jiménez', 'daniel.jimenez@example.com', '999999999', 'Calle 39', 'Ciudad 39', '99999999', 9, 13, '1989-03-03'),
(40, 'Isabel', 'González', 'isabel.gonzalez@example.com', '101010101', 'Calle 40', 'Ciudad 40', '10101010', 10, 14, '1990-04-04'),
(41, 'José', 'Pérez', 'jose.perez@example.com', '111111111', 'Calle 41', 'Ciudad 41', '11111111', 1, 14, '1981-05-05'),
(42, 'María', 'López', 'maria.lopez@example.com', '222222222', 'Calle 42', 'Ciudad 42', '22222222', 2, 14, '1982-06-06'),
(43, 'Ana', 'Gómez', 'ana.gomez@example.com', '333333333', 'Calle 43', 'Ciudad 43', '33333333', 3, 15, '1983-07-07'),
(44, 'Carlos', 'Martínez', 'carlos.martinez@example.com', '444444444', 'Calle 44', 'Ciudad 44', '44444444', 4, 15, '1984-08-08'),
(45, 'Pedro', 'García', 'pedro.garcia@example.com', '555555555', 'Calle 45', 'Ciudad 45', '55555555', 5, 15, '1985-09-09'),
(46, 'Laura', 'Fernández', 'laura.fernandez@example.com', '666666666', 'Calle 46', 'Ciudad 46', '66666666', 6, 16, '1986-10-10'),
(47, 'Luis', 'Rodríguez', 'luis.rodriguez@example.com', '777777777', 'Calle 47', 'Ciudad 47', '77777777', 7, 16, '1987-11-11'),
(48, 'Sofía', 'Hernández', 'sofia.hernandez@example.com', '888888888', 'Calle 48', 'Ciudad 48', '88888888', 8, 16, '1988-12-12'),
(49, 'Miguel', 'Ruiz', 'miguel.ruiz@example.com', '999999999', 'Calle 49', 'Ciudad 49', '99999999', 9, 17, '1989-01-01'),
(50, 'Lucía', 'Jiménez', 'lucia.jimenez@example.com', '101010101', 'Calle 50', 'Ciudad 50', '10101010', 10, 17, '1990-02-02'),
(51, 'David', 'González', 'david.gonzalez@example.com', '111111111', 'Calle 51', 'Ciudad 51', '11111111', 1, 17, '1981-03-03'),
(52, 'Carmen', 'Martínez', 'carmen.martinez@example.com', '222222222', 'Calle 52', 'Ciudad 52', '22222222', 2, 18, '1982-04-04'),
(53, 'Javier', 'Fernández', 'javier.fernandez@example.com', '333333333', 'Calle 53', 'Ciudad 53', '33333333', 3, 18, '1983-05-05'),
(54, 'Marta', 'García', 'marta.garcia@example.com', '444444444', 'Calle 54', 'Ciudad 54', '44444444', 4, 18, '1984-06-06'),
(55, 'Alberto', 'López', 'alberto.lopez@example.com', '555555555', 'Calle 55', 'Ciudad 55', '55555555', 5, 19, '1985-07-07'),
(56, 'Elena', 'Rodríguez', 'elena.rodriguez@example.com', '666666666', 'Calle 56', 'Ciudad 56', '66666666', 6, 19, '1986-08-08'),
(57, 'Pablo', 'Hernández', 'pablo.hernandez@example.com', '777777777', 'Calle 57', 'Ciudad 57', '77777777', 7, 19, '1987-09-09'),
(58, 'Sara', 'Ruiz', 'sara.ruiz@example.com', '888888888', 'Calle 58', 'Ciudad 58', '88888888', 8, 20, '1988-10-10'),
(59, 'Daniel', 'Jiménez', 'daniel.jimenez@example.com', '999999999', 'Calle 59', 'Ciudad 59', '99999999', 9, 20, '1989-11-11'),
(60, 'Isabel', 'González', 'isabel.gonzalez@example.com', '101010101', 'Calle 60', 'Ciudad 60', '10101010', 10, 20, '1990-12-12'),
(1000, 'Juan', 'Pérez fffffff', 'juan.perez@example.com', '123456789', 'Calle Falsa 123', 'Ciudad A', '12345678', 1, 1, '1980-01-01'),
(1001, 'Lusdsdsdis', 'Martínezvbbbbbbb', 'luis.martinez@example.com', '567890123', 'Calle Real 456', 'Ciudad C', '34567890', 3, 3, '1990-03-03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

CREATE TABLE `pacientes` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `ciudad` varchar(100) NOT NULL,
  `dni` varchar(20) NOT NULL,
  `provincia_id` int(11) NOT NULL,
  `fecha_nacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`id`, `nombre`, `apellido`, `email`, `telefono`, `direccion`, `ciudad`, `dni`, `provincia_id`, `fecha_nacimiento`) VALUES
(1, 'Juan', 'Pérez', 'juan.perez@example.com', '1234567890', 'Calle Falsa 123', 'Ciudad A', '11111111', 1, '1980-01-01'),
(2, 'Ana', 'Gómez', 'ana.gomez@example.com', '2345678901', 'Avenida Siempre Viva 456', 'Ciudad B', '22222222', 2, '1985-02-02'),
(3, 'Carlos', 'López', 'carlos.lopez@example.com', '3456789012', 'Calle Elm 789', 'Ciudad C', '33333333', 3, '1990-03-03'),
(4, 'María', 'Martínez', 'maria.martinez@example.com', '4567890123', 'Avenida Principal 101', 'Ciudad D', '44444444', 4, '1995-04-04'),
(5, 'Luis', 'Fernández', 'luis.fernandez@example.com', '5678901234', 'Calle Segunda 202', 'Ciudad E', '55555555', 5, '2000-05-05'),
(6, 'Laura', 'García', 'laura.garcia@example.com', '6789012345', 'Avenida Tercera 303', 'Ciudad F', '66666666', 6, '1982-06-06'),
(7, 'Pedro', 'Rodríguez', 'pedro.rodriguez@example.com', '7890123456', 'Calle Cuarta 404', 'Ciudad G', '77777777', 7, '1987-07-07'),
(8, 'Carmen', 'Sánchez', 'carmen.sanchez@example.com', '8901234567', 'Avenida Cuarta 505', 'Ciudad H', '88888888', 8, '1992-08-08'),
(9, 'Miguel', 'Ramírez', 'miguel.ramirez@example.com', '9012345678', 'Calle Quinta 606', 'Ciudad I', '99999999', 9, '1997-09-09'),
(10, 'Isabel', 'Cruz', 'isabel.cruz@example.com', '0123456789', 'Avenida Quinta 707', 'Ciudad J', '10101010', 10, '1984-10-10'),
(11, 'Francisco', 'Torres', 'francisco.torres@example.com', '1234567891', 'Calle Sexta 808', 'Ciudad K', '11111112', 11, '1989-11-11'),
(12, 'Sara', 'Flores', 'sara.flores@example.com', '2345678912', 'Avenida Sexta 909', 'Ciudad L', '22222223', 12, '1994-12-12'),
(13, 'Antonio', 'González', 'antonio.gonzalez@example.com', '3456789123', 'Calle Séptima 1010', 'Ciudad M', '33333334', 13, '1981-01-13'),
(14, 'Patricia', 'Méndez', 'patricia.mendez@example.com', '4567891234', 'Avenida Séptima 1111', 'Ciudad N', '44444445', 14, '1986-02-14'),
(15, 'Javier', 'Hernández', 'javier.hernandez@example.com', '5678912345', 'Calle Octava 1212', 'Ciudad O', '55555556', 15, '1991-03-15'),
(16, 'Raquel', 'Ruiz', 'raquel.ruiz@example.com', '6789123456', 'Avenida Octava 1313', 'Ciudad P', '66666667', 16, '1996-04-16'),
(17, 'José', 'Navarro', 'jose.navarro@example.com', '7891234567', 'Calle Novena 1414', 'Ciudad Q', '77777778', 17, '2001-05-17'),
(18, 'Elena', 'Ortiz', 'elena.ortiz@example.com', '8912345678', 'Avenida Novena 1515', 'Ciudad R', '88888889', 18, '1983-06-18'),
(19, 'Manuel', 'Jiménez', 'manuel.jimenez@example.com', '9123456789', 'Calle Décima 1616', 'Ciudad S', '99999990', 19, '1988-07-19'),
(20, 'Lucía', 'Moreno', 'lucia.moreno@example.com', '1234567892', 'Avenida Décima 1717', 'Ciudad T', '10101011', 20, '1993-08-20'),
(21, 'Lusdsdsdis', 'pepe', 'luis.martinez@example.com', '567890123', 'Calle Real 456', 'Ciudad C', '34567890', 3, '1990-03-03');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `provincias`
--

CREATE TABLE `provincias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `provincias`
--

INSERT INTO `provincias` (`id`, `nombre`) VALUES
(1, 'Buenos Aires'),
(2, 'Catamarca'),
(3, 'Chaco'),
(4, 'Chubut'),
(5, 'Córdoba'),
(6, 'Corrientes'),
(7, 'Entre Ríos'),
(8, 'Formosa'),
(9, 'Jujuy'),
(10, 'La Pampa'),
(11, 'La Rioja'),
(12, 'Mendoza'),
(13, 'Misiones'),
(14, 'Neuquén'),
(15, 'Río Negro'),
(16, 'Salta'),
(17, 'San Juan'),
(18, 'San Luis'),
(19, 'Santa Cruz'),
(20, 'Santa Fe'),
(21, 'Santiago del Estero'),
(22, 'Tierra del Fuego'),
(23, 'Tucumán');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `especialidad_id` (`especialidad_id`),
  ADD KEY `provincia_id` (`provincia_id`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `provincia_id` (`provincia_id`);

--
-- Indices de la tabla `provincias`
--
ALTER TABLE `provincias`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `medicos`
--
ALTER TABLE `medicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1002;

--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `provincias`
--
ALTER TABLE `provincias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `medicos`
--
ALTER TABLE `medicos`
  ADD CONSTRAINT `medicos_ibfk_1` FOREIGN KEY (`especialidad_id`) REFERENCES `especialidades` (`id`),
  ADD CONSTRAINT `medicos_ibfk_2` FOREIGN KEY (`provincia_id`) REFERENCES `provincias` (`id`);

--
-- Filtros para la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`provincia_id`) REFERENCES `provincias` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
