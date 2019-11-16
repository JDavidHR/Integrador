-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-11-2019 a las 20:07:08
-- Versión del servidor: 10.4.6-MariaDB
-- Versión de PHP: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `asistencia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `administrador`
--

CREATE TABLE `administrador` (
  `id` int(11) NOT NULL COMMENT 'Identificador del administrador',
  `documento` varchar(45) NOT NULL COMMENT 'Documento del administrador',
  `nombres` varchar(45) NOT NULL COMMENT 'Nombres del administrador',
  `apellidos` varchar(45) NOT NULL COMMENT 'Apellidos del administrador',
  `tipo_usuario_id` int(11) NOT NULL COMMENT 'Id del tipo de usuario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `administrador`
--

INSERT INTO `administrador` (`id`, `documento`, `nombres`, `apellidos`, `tipo_usuario_id`) VALUES
(1, '1006318241', 'Natalia', 'Agudelo Valdes', 3),
(2, '1006291396', 'Juan David', 'Hoyos Ramirez', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aula`
--

CREATE TABLE `aula` (
  `id` int(11) NOT NULL COMMENT 'Id del aula',
  `nombre` varchar(45) NOT NULL COMMENT 'Nombre del aula'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `aula`
--

INSERT INTO `aula` (`id`, `nombre`) VALUES
(1, 'Laboratorio A'),
(2, 'Laboratorio B'),
(3, 'Laboratorio C'),
(4, 'Laboratorio D'),
(5, 'Laboratorio E');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clases`
--

CREATE TABLE `clases` (
  `id` int(11) NOT NULL COMMENT 'Id de la clase',
  `horario_id` int(11) NOT NULL COMMENT 'Id del horario',
  `dia` date NOT NULL COMMENT 'Dia de la clase'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clases`
--

INSERT INTO `clases` (`id`, `horario_id`, `dia`) VALUES
(1, 1, '2019-11-12'),
(2, 1, '2019-11-13');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clases_has_usuario`
--

CREATE TABLE `clases_has_usuario` (
  `clases_id` int(11) NOT NULL COMMENT 'Id de la clase',
  `usuario_id` int(11) NOT NULL COMMENT 'Id de los usuarios'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clases_has_usuario`
--

INSERT INTO `clases_has_usuario` (`clases_id`, `usuario_id`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario`
--

CREATE TABLE `horario` (
  `id` int(11) NOT NULL COMMENT 'Id del horario',
  `hora` time NOT NULL COMMENT 'Fecha del horario',
  `aula_id` int(11) NOT NULL COMMENT 'Id del aula'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `horario`
--

INSERT INTO `horario` (`id`, `hora`, `aula_id`) VALUES
(1, '07:45:00', 1),
(1, '07:45:00', 2),
(1, '10:30:00', 3),
(1, '10:30:00', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horario_has_materias`
--

CREATE TABLE `horario_has_materias` (
  `horario_id` int(11) NOT NULL COMMENT 'Id del horario',
  `materias_id` int(11) NOT NULL COMMENT 'Id de las materias'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `horario_has_materias`
--

INSERT INTO `horario_has_materias` (`horario_id`, `materias_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `id` int(11) NOT NULL COMMENT 'Id de la materia',
  `nombre` varchar(45) NOT NULL COMMENT 'Nombre de la materia'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `materias`
--

INSERT INTO `materias` (`id`, `nombre`) VALUES
(1, 'Matematicas discretas'),
(2, 'Administracion de sistemas informaticos'),
(3, 'Proyecto integrador tecnico'),
(4, 'Electiva especifica Programacion web'),
(5, 'Programacion orientada a objetos');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_usuario`
--

CREATE TABLE `tipo_usuario` (
  `id` int(11) NOT NULL COMMENT 'Id del usuario',
  `nombre` varchar(45) NOT NULL COMMENT 'Nombre (Administrador, Estudiante o Docente)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `tipo_usuario`
--

INSERT INTO `tipo_usuario` (`id`, `nombre`) VALUES
(1, 'Estudiante'),
(2, 'Docente'),
(3, 'Administrador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `documento` varchar(45) NOT NULL COMMENT 'Documento del usuario',
  `nombres` varchar(45) NOT NULL COMMENT 'Nombres del usuario',
  `apellidos` varchar(45) NOT NULL COMMENT 'Apellidos del usuario',
  `jornada` varchar(45) NOT NULL COMMENT 'Jornada del usuario',
  `tipo_usuario_id` int(11) NOT NULL COMMENT 'Id del tipo de usuario',
  `horario_id` int(11) NOT NULL COMMENT 'Id del horario'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `documento`, `nombres`, `apellidos`, `jornada`, `tipo_usuario_id`, `horario_id`) VALUES
(1, '1234', 'Juan', 'Perez', 'Diurna', 1, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD PRIMARY KEY (`id`,`tipo_usuario_id`),
  ADD UNIQUE KEY `documento_UNIQUE` (`documento`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_administrador_tipo_usuario1_idx` (`tipo_usuario_id`);

--
-- Indices de la tabla `aula`
--
ALTER TABLE `aula`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `clases`
--
ALTER TABLE `clases`
  ADD PRIMARY KEY (`id`,`horario_id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_clases_horario1_idx` (`horario_id`);

--
-- Indices de la tabla `clases_has_usuario`
--
ALTER TABLE `clases_has_usuario`
  ADD PRIMARY KEY (`clases_id`,`usuario_id`),
  ADD KEY `fk_clases_has_usuario_usuario1_idx` (`usuario_id`),
  ADD KEY `fk_clases_has_usuario_clases1_idx` (`clases_id`);

--
-- Indices de la tabla `horario`
--
ALTER TABLE `horario`
  ADD PRIMARY KEY (`id`,`aula_id`),
  ADD KEY `fk_horario_aula1_idx` (`aula_id`);

--
-- Indices de la tabla `horario_has_materias`
--
ALTER TABLE `horario_has_materias`
  ADD PRIMARY KEY (`horario_id`,`materias_id`),
  ADD KEY `fk_horario_has_materias_materias1_idx` (`materias_id`),
  ADD KEY `fk_horario_has_materias_horario1_idx` (`horario_id`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`,`tipo_usuario_id`,`horario_id`),
  ADD UNIQUE KEY `documento_UNIQUE` (`documento`),
  ADD UNIQUE KEY `id_UNIQUE` (`id`),
  ADD KEY `fk_usuario_tipo_usuario1_idx` (`tipo_usuario_id`),
  ADD KEY `fk_usuario_horario1_idx` (`horario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `administrador`
--
ALTER TABLE `administrador`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Identificador del administrador', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `aula`
--
ALTER TABLE `aula`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del aula', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `clases`
--
ALTER TABLE `clases`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de la clase', AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `materias`
--
ALTER TABLE `materias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id de la materia', AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo_usuario`
--
ALTER TABLE `tipo_usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Id del usuario', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `administrador`
--
ALTER TABLE `administrador`
  ADD CONSTRAINT `fk_administrador_tipo_usuario1` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `tipo_usuario` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `clases`
--
ALTER TABLE `clases`
  ADD CONSTRAINT `fk_clases_horario1` FOREIGN KEY (`horario_id`) REFERENCES `horario` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `clases_has_usuario`
--
ALTER TABLE `clases_has_usuario`
  ADD CONSTRAINT `fk_clases_has_usuario_clases1` FOREIGN KEY (`clases_id`) REFERENCES `clases` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_clases_has_usuario_usuario1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `horario`
--
ALTER TABLE `horario`
  ADD CONSTRAINT `fk_horario_aula1` FOREIGN KEY (`aula_id`) REFERENCES `aula` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `horario_has_materias`
--
ALTER TABLE `horario_has_materias`
  ADD CONSTRAINT `fk_horario_has_materias_horario1` FOREIGN KEY (`horario_id`) REFERENCES `horario` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_horario_has_materias_materias1` FOREIGN KEY (`materias_id`) REFERENCES `materias` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `fk_usuario_horario1` FOREIGN KEY (`horario_id`) REFERENCES `horario` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_usuario_tipo_usuario1` FOREIGN KEY (`tipo_usuario_id`) REFERENCES `tipo_usuario` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
