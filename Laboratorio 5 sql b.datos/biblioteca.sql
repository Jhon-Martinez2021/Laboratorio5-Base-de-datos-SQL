-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-05-2025 a las 12:52:04
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
-- Base de datos: `biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `autores`
--

CREATE TABLE `autores` (
  `AutorID` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Nacionalidad` varchar(100) DEFAULT NULL,
  `Fecha_nacimiento` date DEFAULT NULL,
  `Genero` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `autores`
--

INSERT INTO `autores` (`AutorID`, `Nombre`, `Nacionalidad`, `Fecha_nacimiento`, `Genero`) VALUES
(1, 'Gabriel Garcia Marquez', 'Colombiana', '1927-03-06', NULL),
(2, 'Jane Austen', 'Inglesa', '1775-12-16', NULL),
(3, 'J.R.R Tolklein', 'Sudafricana', '1892-01-03', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `categoriaID` int(11) NOT NULL,
  `Nombrecategoria` varchar(100) NOT NULL,
  `Descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`categoriaID`, `Nombrecategoria`, `Descripcion`) VALUES
(1, 'Novela', NULL),
(2, 'Novela', NULL),
(3, 'Ciencia Ficcion', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `LibroID` int(11) NOT NULL,
  `Titulo` varchar(100) DEFAULT NULL,
  `AutorID` varchar(100) DEFAULT NULL,
  `CategoriaID` varchar(100) NOT NULL,
  `Descripcion` text DEFAULT NULL,
  `Aniopublicacion` int(11) DEFAULT NULL,
  `Disponible` tinyint(1) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`LibroID`, `Titulo`, `AutorID`, `CategoriaID`, `Descripcion`, `Aniopublicacion`, `Disponible`) VALUES
(1, 'Cien Años de Soledad', '1', '1', NULL, 1967, 1),
(2, 'Emma', '2', '2', NULL, 1815, 1),
(3, 'Las dos torrez', '3', '3', NULL, 1954, 1),
(4, 'Emma', '2', '2', NULL, 1815, 1),
(5, 'Las dos torrez', '3', '3', NULL, 1954, 1),
(6, 'Cien Años de Soledad', '1', '1', NULL, 1967, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamos_usuarios`
--

CREATE TABLE `prestamos_usuarios` (
  `PrestamoID` int(11) NOT NULL,
  `UsuarioID` int(11) DEFAULT NULL,
  `LibroID` int(11) DEFAULT NULL,
  `Fechaprestamo` date NOT NULL,
  `FechaDevolucion` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `prestamos_usuarios`
--

INSERT INTO `prestamos_usuarios` (`PrestamoID`, `UsuarioID`, `LibroID`, `Fechaprestamo`, `FechaDevolucion`) VALUES
(1, 1, 1, '0000-00-00', '0000-00-00'),
(2, 2, 3, '0000-00-00', '0000-00-00'),
(3, 1, 1, '0000-00-00', '0000-00-00'),
(4, 2, 3, '0000-00-00', '0000-00-00'),
(5, 1, 1, '2024-08-01', '2024-08-15'),
(6, 2, 3, '2024-08-02', '2024-08-16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `UsuarioID` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Direccion` varchar(100) DEFAULT NULL,
  `Telefono` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`UsuarioID`, `Nombre`, `Direccion`, `Telefono`) VALUES
(1, 'Carlos Martinez', 'Calle Luna 234', '0000-00-00'),
(2, 'Lucia Fernandez', 'Avenida Sol 398', '0000-00-00');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `autores`
--
ALTER TABLE `autores`
  ADD PRIMARY KEY (`AutorID`);

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`categoriaID`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`LibroID`);

--
-- Indices de la tabla `prestamos_usuarios`
--
ALTER TABLE `prestamos_usuarios`
  ADD PRIMARY KEY (`PrestamoID`),
  ADD KEY `UsuarioID` (`UsuarioID`),
  ADD KEY `LibroID` (`LibroID`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`UsuarioID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `autores`
--
ALTER TABLE `autores`
  MODIFY `AutorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `categoriaID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `LibroID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `prestamos_usuarios`
--
ALTER TABLE `prestamos_usuarios`
  MODIFY `PrestamoID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `UsuarioID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamos_usuarios`
--
ALTER TABLE `prestamos_usuarios`
  ADD CONSTRAINT `prestamos_usuarios_ibfk_1` FOREIGN KEY (`UsuarioID`) REFERENCES `usuarios` (`UsuarioID`),
  ADD CONSTRAINT `prestamos_usuarios_ibfk_2` FOREIGN KEY (`LibroID`) REFERENCES `libros` (`LibroID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
