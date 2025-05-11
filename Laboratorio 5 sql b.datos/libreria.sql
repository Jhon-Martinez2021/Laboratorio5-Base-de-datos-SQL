-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-05-2025 a las 12:55:41
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `libreria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `ClienteID` int(11) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `Correo` varchar(100) DEFAULT NULL,
  `Telefono` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`ClienteID`, `Nombre`, `Correo`, `Telefono`) VALUES
(1, 'Amanda Torrez', 'amanda@gmail.com', '-1122'),
(2, 'Laura Coronado', 'laura@gmail.com', '-356'),
(3, 'Sandra Rojas', 'sandra@gmail.com', '-1535');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `LibroID` int(11) NOT NULL,
  `Titulo` varchar(100) NOT NULL,
  `Autor` varchar(100) NOT NULL,
  `Genero` varchar(100) DEFAULT NULL,
  `AnioPublicacion` smallint(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`LibroID`, `Titulo`, `Autor`, `Genero`, `AnioPublicacion`) VALUES
(1, 'Cien Años de Soledad', 'Gaabriel Garcia Marquez', 'Novela', 1967),
(2, 'El Principito', 'Antoine de Saint-Exupery', 'Fabula', 1943),
(3, 'Orgullo y Prejuicio', 'Jane Austen', 'Novela', 1813),
(4, 'Don Quijote de la Mancha', 'Miguel de Cervantes', 'Novela', 1605),
(5, 'El Camino a Cristo', 'Elena White', 'Religioso', 1896);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos`
--

CREATE TABLE `prestamos` (
  `PrestamoID` int(11) NOT NULL,
  `ClienteID` int(11) NOT NULL,
  `LibroID` int(11) NOT NULL,
  `FechaPrestamo` date NOT NULL,
  `FechaDevolucion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `prestamos`
--

INSERT INTO `prestamos` (`PrestamoID`, `ClienteID`, `LibroID`, `FechaPrestamo`, `FechaDevolucion`) VALUES
(1, 1, 2, '0000-00-00', '0000-00-00'),
(2, 2, 1, '0000-00-00', '0000-00-00'),
(3, 1, 5, '0000-00-00', '0000-00-00'),
(4, 1, 2, '2025-05-01', '2025-05-10'),
(5, 2, 4, '2025-05-03', '2025-05-12'),
(6, 3, 1, '2025-05-02', NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`ClienteID`),
  ADD UNIQUE KEY `Correo` (`Correo`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`LibroID`);

--
-- Indices de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD PRIMARY KEY (`PrestamoID`),
  ADD KEY `ClienteID` (`ClienteID`),
  ADD KEY `LibroID` (`LibroID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `ClienteID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `LibroID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `prestamos`
--
ALTER TABLE `prestamos`
  MODIFY `PrestamoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamos`
--
ALTER TABLE `prestamos`
  ADD CONSTRAINT `prestamos_ibfk_1` FOREIGN KEY (`ClienteID`) REFERENCES `clientes` (`ClienteID`),
  ADD CONSTRAINT `prestamos_ibfk_2` FOREIGN KEY (`LibroID`) REFERENCES `libros` (`LibroID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
