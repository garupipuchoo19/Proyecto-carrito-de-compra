-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-11-2025 a las 00:26:06
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `carrito_db`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carrito`
--

INSERT INTO `carrito` (`id`, `usuario_id`, `producto_id`, `cantidad`) VALUES
(13, 1, 1, 1),
(14, 1, 2, 1),
(15, 3, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  `fecha` datetime NULL,
  PRIMARY KEY (`id`)
);

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`id`, `usuario_id`, `total`, `fecha`) VALUES
(1, 1, 8278.87, '2025-11-28 16:05:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra_detalle`
--

CREATE TABLE `compra_detalle` (
  `id` int(11) NOT NULL,
  `compra_id` int(11) DEFAULT NULL,
  `producto_id` int(11) DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `precio_unitario` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compra_detalle`
--

INSERT INTO `compra_detalle` (`id`, `compra_id`, `producto_id`, `cantidad`, `precio_unitario`) VALUES
(1, 1, 1, 1, 249.99),
(2, 1, 2, 1, 699.00),
(3, 1, 3, 1, 1189.99),
(4, 1, 4, 1, 2899.50),
(5, 1, 5, 1, 2890.90),
(6, 1, 13, 1, 199.99),
(7, 1, 14, 1, 149.50);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `nombre`, `descripcion`, `precio`, `imagen`) VALUES
(1, 'Mouse Gamer RGB', 'Mouse gamer con luces RGB y 7 botones programables.', 249.99, '/img/mouse1.jpg'),
(2, 'Teclado Mecánico LED', 'Teclado mecánico retroiluminado con switches azules.', 699.00, '/img/keyboard1.jpg'),
(3, 'Headset Gamer HyperX', 'Audífonos HyperX con micrófono desmontable.', 1189.99, '/img/headset1.jpg'),
(4, 'Monitor 24\'\' 144Hz', 'Monitor para gaming con 144Hz y 1ms de respuesta.', 2899.50, '/img/monitor1.jpg'),
(5, 'Silla Gamer Reclinable', 'Silla ergonómica profesional reclinable con cojines.', 2890.90, '/img/chair1.jpg'),
(6, 'Control Xbox Series', 'Control inalámbrico compatible con Xbox Series X/S.', 1299.00, '/img/xbox1.jpg'),
(7, 'Control PS5 DualSense', 'Control inalámbrico Sony DualSense oficial.', 1590.00, '/img/ps5controller.jpg'),
(8, 'Nintendo Switch OLED', 'Nueva versión OLED con pantalla mejorada.', 7399.00, '/img/switch1.jpg'),
(9, 'Laptop Gamer ASUS', 'Laptop con RTX 3050, Ryzen 7 y 16GB RAM.', 17999.99, '/img/laptop1.jpg'),
(10, 'SSD NVMe 1TB', 'SSD NVMe Gen3 ideal para gaming y programas pesados.', 1199.50, '/img/ssd1.jpg'),
(11, 'Memoria RAM 16GB', 'Memoria RAM DDR4 3200MHz de alto rendimiento.', 899.99, '/img/ram1.jpg'),
(12, 'Bocinas RGB', 'Bocinas estéreo con iluminación RGB dinámica.', 350.00, '/img/speakers1.jpg'),
(13, 'Mousepad XXL', 'Alfombrilla gamer tamaño XL para teclado y mouse.', 199.99, '/img/mousepad1.jpg'),
(14, 'Cable HDMI 4K 2m', 'Cable HDMI compatible con 4K UHD.', 149.50, '/img/hdmi1.jpg'),
(15, 'Webcam Full HD', 'Cámara web 1080p con micrófono integrado.', 490.00, '/img/webcam1.jpg'),
(16, 'Tarjeta de Video RTX 4060', 'NVIDIA GeForce RTX 4060 8GB GDDR6.', 6590.90, '/img/rtx4060.jpg'),
(17, 'Base enfriadora para laptop', 'Cooler con 5 ventiladores y luces LED.', 389.99, '/img/cooler1.jpg'),
(18, 'Hub USB 4 puertos', 'Concentrador USB 3.0 de alta velocidad.', 129.00, '/img/hub1.jpg'),
(19, 'Cámara de seguridad WiFi', 'Cámara inteligente con visión nocturna.', 680.00, '/img/camera1.jpg'),
(20, 'Microfono Profesional', 'Micrófono cardioide ideal para streaming.', 899.50, '/img/mic1.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `password`) VALUES
(1, 'Cristopher Isaac Leon Olvera', 'isaac@gmail.com', '$2b$10$tuFkkJsz/GinN71jw099HefWn6udwrCYZ1N.qu2dgEegNL1h7V3Aq'),
(3, 'Alexis', 'Alexis@gmail.com', '$2b$10$he2RkIsiR7VISNOrxaUume2xE.yQ/9Bl69iEvG6y8egM.25.RvLgS');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `compra_detalle`
--
ALTER TABLE `compra_detalle`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carrito`
--
ALTER TABLE `carrito`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `compra_detalle`
--
ALTER TABLE `compra_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
