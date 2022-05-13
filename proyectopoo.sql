-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 13-05-2022 a las 08:51:52
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyectopoo`
--
CREATE DATABASE IF NOT EXISTS `proyectopoo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `proyectopoo`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bitacora`
--

CREATE TABLE `bitacora` (
  `id` int(11) NOT NULL,
  `id_caso` int(11) NOT NULL,
  `cambios` varchar(300) NOT NULL,
  `fecha` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `bitacora`
--

INSERT INTO `bitacora` (`id`, `id_caso`, `cambios`, `fecha`) VALUES
(1, 3, 'Avance 1', '2022-05-12'),
(2, 3, 'Avance 2', '2022-05-12'),
(3, 3, 'Avance 3', '2022-05-12'),
(4, 3, 'Avance 4', '2022-05-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `casos`
--

CREATE TABLE `casos` (
  `id` int(11) NOT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `id_programador` int(11) DEFAULT NULL,
  `id_tester` int(11) DEFAULT NULL,
  `codigo` varchar(100) DEFAULT NULL,
  `descripcion_requerimiento` varchar(300) DEFAULT NULL,
  `pdf_requerimiento` varchar(200) DEFAULT NULL,
  `argumento_rechazo` varchar(300) DEFAULT NULL,
  `descripcion_apertura` varchar(300) DEFAULT NULL,
  `pdf_apertura` varchar(100) DEFAULT NULL,
  `fecha_apertura` date DEFAULT NULL,
  `fecha_limite` date DEFAULT NULL,
  `porcentaje` varchar(10) DEFAULT NULL,
  `observacion_devolucion` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `casos`
--

INSERT INTO `casos` (`id`, `id_estado`, `id_programador`, `id_tester`, `codigo`, `descripcion_requerimiento`, `pdf_requerimiento`, `argumento_rechazo`, `descripcion_apertura`, `pdf_apertura`, `fecha_apertura`, `fecha_limite`, `porcentaje`, `observacion_devolucion`) VALUES
(2, 2, NULL, NULL, NULL, 'Generación de reportes en PDF', '', 'Funcion ya implementada', NULL, NULL, NULL, NULL, '0', NULL),
(3, 7, 8, 11, 'DNF22040574522676', 'Nueva funcionalidad', '', NULL, 'Trabajar', '', '2022-05-12', '2022-05-21', '100', 'Errores'),
(8, 1, NULL, NULL, NULL, 'Corrección de errores aplicación ', '', NULL, NULL, NULL, NULL, NULL, '0', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(50) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `descripcion` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`id`, `codigo`, `nombre`, `descripcion`) VALUES
(1, 'DNF220405745', 'Areas de  funcionalidad', 'Departamento de funcionalidades de la empresa'),
(13, 'PVE220405752', 'Area de \nfacturación fija', 'Departamento de \nfacturación fija'),
(14, 'CLN220405748', 'Area de facturación Móvil', 'Departamento de facturación Móvil');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados_casos`
--

CREATE TABLE `estados_casos` (
  `id` int(11) NOT NULL,
  `estado` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `estados_casos`
--

INSERT INTO `estados_casos` (`id`, `estado`) VALUES
(1, 'En espera de respuesta'),
(2, 'Solicitud rechazada'),
(3, 'En desarrollo'),
(4, 'Vencido'),
(5, 'Esperando aprobación del área solicitante'),
(6, 'Devuelto con observaciones'),
(7, 'Finalizado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programadores`
--

CREATE TABLE `programadores` (
  `id` int(11) NOT NULL,
  `id_programador` int(11) NOT NULL,
  `id_jefe` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `programadores`
--

INSERT INTO `programadores` (`id`, `id_programador`, `id_jefe`) VALUES
(8, 8, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles_usuarios`
--

CREATE TABLE `roles_usuarios` (
  `id` int(11) NOT NULL,
  `rol` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles_usuarios`
--

INSERT INTO `roles_usuarios` (`id`, `rol`) VALUES
(1, 'Administrador'),
(2, 'Jefe de area'),
(3, 'Jefe de desarrollo'),
(5, 'Programador'),
(6, 'Tester');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  `id_rol` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `identificacion` varchar(200) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `sexo` varchar(200) NOT NULL,
  `correo` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `id_departamento`, `id_rol`, `nombre`, `identificacion`, `fecha_nacimiento`, `sexo`, `correo`, `password`) VALUES
(3, 1, 1, 'Emanuel Jose Molina Zuniga', '23435433-4', '2001-09-17', 'Masculino', 'emanueljosemolina@gmail.com', 'admin'),
(4, 1, 2, 'Andrea María López Carmen', '987654322', '2022-04-27', 'Femenino', 'andrea@gmail.com', 'andrea'),
(7, 1, 3, 'Juan Carlos Canizales Peña', '23453645-5', '2022-04-11', 'Masculino', 'juan@gmail.com', 'juan'),
(8, 1, 5, 'Enrique Antonio Huezo Gomez', '4534563-5', '2022-04-19', 'Masculino', 'enrique@gmail.com', 'enrique'),
(10, 1, 5, 'Maria Jose Ayala Quintanilla', '34534532-5', '2022-03-28', 'Femenino', 'maria@gmail.com', 'maria'),
(11, 1, 6, 'Nelson Antonio Navarro Ayala', '3453645-7', '2022-03-31', 'Masculino', 'nelson@gmail.com', 'nelson'),
(12, 13, 2, 'Daniela Maria Peña Torres', '23423443-2', '2022-04-19', 'Femenino', 'torres@gmail.com', 'torres');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_caso` (`id_caso`);

--
-- Indices de la tabla `casos`
--
ALTER TABLE `casos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_estado` (`id_estado`),
  ADD KEY `id_programador` (`id_programador`),
  ADD KEY `casos_ibfk_4` (`id_tester`);

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estados_casos`
--
ALTER TABLE `estados_casos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `programadores`
--
ALTER TABLE `programadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_programador`),
  ADD KEY `programadores_ibfk_1` (`id_jefe`);

--
-- Indices de la tabla `roles_usuarios`
--
ALTER TABLE `roles_usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_departamento` (`id_departamento`),
  ADD KEY `id_rol` (`id_rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bitacora`
--
ALTER TABLE `bitacora`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `casos`
--
ALTER TABLE `casos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de la tabla `estados_casos`
--
ALTER TABLE `estados_casos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `programadores`
--
ALTER TABLE `programadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `roles_usuarios`
--
ALTER TABLE `roles_usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `bitacora`
--
ALTER TABLE `bitacora`
  ADD CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`id_caso`) REFERENCES `casos` (`id`);

--
-- Filtros para la tabla `casos`
--
ALTER TABLE `casos`
  ADD CONSTRAINT `casos_ibfk_1` FOREIGN KEY (`id_estado`) REFERENCES `estados_casos` (`id`),
  ADD CONSTRAINT `casos_ibfk_3` FOREIGN KEY (`id_programador`) REFERENCES `programadores` (`id`),
  ADD CONSTRAINT `casos_ibfk_4` FOREIGN KEY (`id_tester`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `programadores`
--
ALTER TABLE `programadores`
  ADD CONSTRAINT `programadores_ibfk_1` FOREIGN KEY (`id_jefe`) REFERENCES `usuarios` (`id`),
  ADD CONSTRAINT `programadores_ibfk_2` FOREIGN KEY (`id_programador`) REFERENCES `usuarios` (`id`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_departamento`) REFERENCES `departamentos` (`id`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`id_rol`) REFERENCES `roles_usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
