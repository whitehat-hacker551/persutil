-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Servidor: database:3306
-- Tiempo de generación: 01-12-2025 a las 11:30:48
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
-- Estructura de tabla para la tabla `alcalde`
--

CREATE TABLE `alcalde` (
  `id` bigint NOT NULL,
  `titulo` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `autor` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `genero` varchar(100) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `reseña` longtext CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `valoracion` int NOT NULL,
  `publicado` tinyint(1) NOT NULL DEFAULT '1',
  `destacado` tinyint(1) NOT NULL DEFAULT '0',
  `fecha_lectura` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alfonso_respuesta`
--

CREATE TABLE `alfonso_respuesta` (
  `id` bigint NOT NULL,
  `autor` varchar(128) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `contenido` longtext CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `publicado` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `blog`
--

CREATE TABLE `blog` (
  `id` bigint NOT NULL,
  `titulo` varchar(1024) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `contenido` longtext CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `etiquetas` varchar(1024) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `calinesculistacompra`
--

CREATE TABLE `calinesculistacompra` (
  `id` bigint NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `contenido` longtext NOT NULL,
  `fecha_compra_esperada` datetime DEFAULT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `publicado` tinyint(1) NOT NULL DEFAULT '1',
  `precio` decimal(10,2) NOT NULL,
  `cantidad` int NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `castanyera`
--

CREATE TABLE `castanyera` (
  `id` bigint NOT NULL,
  `titulo` varchar(255) NOT NULL,
  `contenido` longtext CHARACTER SET utf32 COLLATE utf32_general_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime NOT NULL,
  `publico` tinyint(1) NOT NULL,
  `etiquetas` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `contreras`
--

CREATE TABLE `contreras` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `titulo` varchar(1024) COLLATE utf32_unicode_ci NOT NULL,
  `contenido` longtext COLLATE utf32_unicode_ci NOT NULL,
  `etiquetas` varchar(1024) COLLATE utf32_unicode_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `publico` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB 
  AUTO_INCREMENT=9
  DEFAULT CHARSET=utf32 
  COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `frasesmotivacionales`
--

CREATE TABLE `frasesmotivacionales` (
  `id` bigint NOT NULL,
  `frase` varchar(1024) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `autor` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL DEFAULT 'Anónimo',
  `es_publica` tinyint(1) NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `gallery_image`
--

CREATE TABLE `gallery_image` (
  `id` bigint NOT NULL,
  `titulo` varchar(1024) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `descripcion` longtext CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `url_imagen` varchar(2048) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `publicado` tinyint(1) NOT NULL DEFAULT '0',
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `garcia`
--

CREATE TABLE `garcia` (
  `id` bigint NOT NULL,
  `titulo` varchar(1000) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `objetivo` varchar(1000) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `fecha_inicio` datetime NOT NULL,
  `fecha_final` datetime NOT NULL,
  `progreso` varchar(1000) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ideas`
--

CREATE TABLE `ideas` (
  `id` bigint NOT NULL,
  `titulo` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `comentario` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `categoria` enum('IDEA','MEJORA','BUG') CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `publico` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jspreguntas`
--

CREATE TABLE `jspreguntas` (
  `id` bigint NOT NULL,
  `question` varchar(255) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `answer1` varchar(255) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `answer2` varchar(255) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `answer3` varchar(255) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `answer4` varchar(255) CHARACTER SET utf16 COLLATE utf16_unicode_ci NOT NULL,
  `correct` tinyint NOT NULL,
  `create_date` datetime NOT NULL,
  `modify_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pallas`
--

CREATE TABLE `pallas` (
  `id` bigint NOT NULL,
  `titulo` varchar(100) DEFAULT NULL,
  `contenido` longtext,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `publicado` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `receta`
--

CREATE TABLE `receta` (
  `id` bigint NOT NULL,
  `nombre` varchar(1024) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `ingredientes` longtext CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `preparacion` longtext CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recurso`
--

CREATE TABLE `recurso` (
  `id` bigint NOT NULL,
  `nombre` varchar(1024) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `publico` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sempertegui_pelicula`
--

CREATE TABLE `sempertegui_pelicula` (
  `id` bigint NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `genero` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `director` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `puntuacion` int NOT NULL,
  `anyo` year NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `soares`
--

CREATE TABLE `soares` (
  `id` bigint NOT NULL,
  `preguntas` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `fecha_creacion` datetime NOT NULL,
  `fecha_modificacion` datetime DEFAULT NULL,
  `publicacion` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tarea`
--

CREATE TABLE `tarea` (
  `id` bigint NOT NULL,
  `titulo` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `descripcion` text CHARACTER SET utf32 COLLATE utf32_unicode_ci,
  `categoria` varchar(100) CHARACTER SET utf32 COLLATE utf32_unicode_ci DEFAULT NULL,
  `completada` tinyint(1) NOT NULL DEFAULT '0',
  `publicado` tinyint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `uski_libro_visita`
--

CREATE TABLE `uski_libro_visita` (
  `id` bigint NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `comentario` varchar(1024) NOT NULL,
  `fecha_creacion` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `fecha_modificacion` timestamp NULL DEFAULT NULL,
  `esta_publicado` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alcalde`
--
ALTER TABLE `alcalde`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `alfonso_respuesta`
--
ALTER TABLE `alfonso_respuesta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `calinesculistacompra`
--
ALTER TABLE `calinesculistacompra`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `castanyera`
--
ALTER TABLE `castanyera`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `frasesmotivacionales`
--
ALTER TABLE `frasesmotivacionales`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `gallery_image`
--
ALTER TABLE `gallery_image`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `garcia`
--
ALTER TABLE `garcia`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ideas`
--
ALTER TABLE `ideas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `jspreguntas`
--
ALTER TABLE `jspreguntas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pallas`
--
ALTER TABLE `pallas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `receta`
--
ALTER TABLE `receta`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `recurso`
--
ALTER TABLE `recurso`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sempertegui_pelicula`
--
ALTER TABLE `sempertegui_pelicula`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `soares`
--
ALTER TABLE `soares`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `tarea`
--
ALTER TABLE `tarea`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `uski_libro_visita`
--
ALTER TABLE `uski_libro_visita`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alcalde`
--
ALTER TABLE `alcalde`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `alfonso_respuesta`
--
ALTER TABLE `alfonso_respuesta`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `blog`
--
ALTER TABLE `blog`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `calinesculistacompra`
--
ALTER TABLE `calinesculistacompra`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `castanyera`
--
ALTER TABLE `castanyera`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `frasesmotivacionales`
--
ALTER TABLE `frasesmotivacionales`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `gallery_image`
--
ALTER TABLE `gallery_image`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `garcia`
--
ALTER TABLE `garcia`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ideas`
--
ALTER TABLE `ideas`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `jspreguntas`
--
ALTER TABLE `jspreguntas`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pallas`
--
ALTER TABLE `pallas`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `receta`
--
ALTER TABLE `receta`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `recurso`
--
ALTER TABLE `recurso`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sempertegui_pelicula`
--
ALTER TABLE `sempertegui_pelicula`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `soares`
--
ALTER TABLE `soares`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tarea`
--
ALTER TABLE `tarea`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `uski_libro_visita`
--
ALTER TABLE `uski_libro_visita`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;
COMMIT;
