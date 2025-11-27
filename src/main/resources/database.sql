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
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `blog`
--
ALTER TABLE `blog`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

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

--
-- Volcado de datos para la tabla `calinesculistacompra`
--

INSERT INTO `calinesculistacompra` (`id`, `nombre`, `contenido`, `fecha_compra_esperada`, `fecha_creacion`, `fecha_modificacion`, `publicado`, `precio`, `cantidad`) VALUES
(195, 'David', 'dasdfsaass', NULL, '2025-11-27 23:39:02', NULL, 1, 100.00, 3),
(196, 'Producto0', 'contenido1contenido2contenido3contenido4contenido5contenido6contenido7contenido8contenido9contenido10', NULL, '2025-11-27 23:39:04', NULL, 1, 0.00, 1),
(197, 'Producto1', 'contenido1contenido2contenido3contenido4contenido5contenido6contenido7contenido8contenido9contenido10', NULL, '2025-11-27 23:39:04', NULL, 1, 0.00, 1),
(198, 'Producto2', 'contenido1contenido2contenido3contenido4contenido5contenido6contenido7contenido8contenido9contenido10', NULL, '2025-11-27 23:39:04', NULL, 1, 0.00, 1),
(199, 'Producto3', 'contenido1contenido2contenido3contenido4contenido5contenido6contenido7contenido8contenido9contenido10', NULL, '2025-11-27 23:39:04', '2025-11-27 23:39:19', 0, 1000.00, 5),
(200, 'Producto4', 'contenido1contenido2contenido3contenido4contenido5contenido6contenido7contenido8contenido9contenido10', NULL, '2025-11-27 23:39:04', NULL, 1, 0.00, 1),
(201, 'Producto5', 'contenido1contenido2contenido3contenido4contenido5contenido6contenido7contenido8contenido9contenido10', NULL, '2025-11-27 23:39:04', NULL, 1, 0.00, 1),
(202, 'Producto6', 'contenido1contenido2contenido3contenido4contenido5contenido6contenido7contenido8contenido9contenido10', NULL, '2025-11-27 23:39:04', NULL, 1, 0.00, 1),
(203, 'Producto7', 'contenido1contenido2contenido3contenido4contenido5contenido6contenido7contenido8contenido9contenido10', NULL, '2025-11-27 23:39:04', NULL, 1, 0.00, 1),
(204, 'Producto8', 'contenido1contenido2contenido3contenido4contenido5contenido6contenido7contenido8contenido9contenido10', NULL, '2025-11-27 23:39:04', NULL, 1, 0.00, 1),
(205, 'Producto9', 'contenido1contenido2contenido3contenido4contenido5contenido6contenido7contenido8contenido9contenido10', NULL, '2025-11-27 23:39:04', NULL, 1, 0.00, 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `calinesculistacompra`
--
ALTER TABLE `calinesculistacompra`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `calinesculistacompra`
--
ALTER TABLE `calinesculistacompra`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

COMMIT;
