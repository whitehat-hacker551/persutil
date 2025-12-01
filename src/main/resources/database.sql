-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: database:3306
-- Tiempo de generación: 10-11-2025 a las 11:28:03
-- Versión del servidor: 8.4.5
-- Versión de PHP: 8.2.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Base de datos: `persutildb`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sempertegui_pelicula`
--

CREATE TABLE `sempertegui_pelicula` (
  `id` BIGINT NOT NULL AUTO_INCREMENT , 
  `nombre` VARCHAR(255) NOT NULL , 
  `genero` VARCHAR(255) NOT NULL , 
  `director` VARCHAR(255) NOT NULL , 
  `puntuacion` INT NOT NULL , 
  `anyo` YEAR NOT NULL , 
  `fecha_creacion` DATETIME NOT NULL , 
  `fecha_modificacion` DATETIME DEFAULT NULL , 
  PRIMARY KEY (`id`), 
  UNIQUE `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Estructura de tabla para la tabla `blog`
--

CREATE TABLE `blog` (
  `id` bigint NOT NULL,
  `titulo` varchar(1024) COLLATE utf32_unicode_ci NOT NULL,
  `contenido` longtext COLLATE utf32_unicode_ci NOT NULL,
  `etiquetas` varchar(1024) COLLATE utf32_unicode_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;



--
-- Estructura tabla pallas(notas)
--

CREATE TABLE `pallas` (
  `id` bigint NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `contenido` longtext,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `publicado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Índices de la tabla `pallas`

ALTER TABLE `pallas`
  ADD PRIMARY KEY (`id`);

--AUTO_INCREMENT de la tabla `pallas`
ALTER TABLE `pallas`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;
COMMIT;
-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alfonso_respuesta`
--

CREATE TABLE `alfonso_respuesta` (
  `id` bigint NOT NULL,
  `autor` varchar(128) COLLATE utf32_unicode_ci NOT NULL,
  `contenido` longtext COLLATE utf32_unicode_ci NOT NULL,
  `publicado` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `alfonso_respuesta`
--
ALTER TABLE `alfonso_respuesta`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `blog`
--
ALTER TABLE `blog`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

CREATE TABLE `alcalde` (
  `id` bigint NOT NULL,
  `titulo` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `autor` varchar(255) COLLATE utf32_unicode_ci NOT NULL,
  `genero` varchar(100) COLLATE utf32_unicode_ci NOT NULL,
  `reseña` longtext COLLATE utf32_unicode_ci NOT NULL,
  `valoracion` int NOT NULL,
  `publicado` tinyint(1) NOT NULL DEFAULT '1',
  `destacado` tinyint(1) NOT NULL DEFAULT '0',
  `fecha_lectura` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

ALTER TABLE `alcalde`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `alcalde`
--
-- AUTO_INCREMENT de la tabla `alfonso_respuesta`
--
ALTER TABLE `alfonso_respuesta`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;
COMMIT;


-- Pollyanna --


CREATE TABLE `soares` (
  `id` bigint NOT NULL,
  `preguntas` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `publicacion` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `soares`
--
ALTER TABLE `soares`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `soares`
--
ALTER TABLE `soares`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3137;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;