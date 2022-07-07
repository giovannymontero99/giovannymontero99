-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 06, 2022 at 02:04 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_adsi`
--

-- --------------------------------------------------------

--
-- Table structure for table `historial_clinico`
--

CREATE TABLE `historial_clinico` (
  `id_hist_clinico` int(11) NOT NULL,
  `eps` varchar(30) DEFAULT NULL,
  `rh` varchar(5) DEFAULT NULL,
  `alergias` varchar(100) DEFAULT NULL,
  `tratamiento` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `historial_clinico`
--

INSERT INTO `historial_clinico` (`id_hist_clinico`, `eps`, `rh`, `alergias`, `tratamiento`) VALUES
(78, 'Nueva EPS', 'O+', 'NINGUNA', 'NINGUNO'),
(91, 'SURA', 'O+', 'NINGUNA', 'NINGUNA');

-- --------------------------------------------------------

--
-- Table structure for table `ingreso_sistema`
--

CREATE TABLE `ingreso_sistema` (
  `id_usuario` int(11) NOT NULL,
  `usuario` varchar(10) DEFAULT NULL,
  `clave_usuario` varchar(10) DEFAULT NULL,
  `tipo_usuario` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `medico`
--

CREATE TABLE `medico` (
  `id_medico` int(11) NOT NULL,
  `nombres_medico` varchar(100) DEFAULT NULL,
  `apellidos_medico` varchar(100) DEFAULT NULL,
  `documento_medico` varchar(100) DEFAULT NULL,
  `especializacion_medico` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `medico`
--

INSERT INTO `medico` (`id_medico`, `nombres_medico`, `apellidos_medico`, `documento_medico`, `especializacion_medico`) VALUES
(2, 'Juan Jose', 'Chizco', '10536987452', 'GENERAL');

-- --------------------------------------------------------

--
-- Table structure for table `paciente`
--

CREATE TABLE `paciente` (
  `id_paciente` int(11) NOT NULL,
  `nombres_paciente` varchar(100) DEFAULT NULL,
  `apellidos_paciente` varchar(100) DEFAULT NULL,
  `documento_paciente` varchar(100) DEFAULT NULL,
  `correo_paciente` varchar(50) DEFAULT NULL,
  `tel_1_paciente` varchar(10) DEFAULT NULL,
  `tel_2_paciente` varchar(10) DEFAULT NULL,
  `dir_paciente` varchar(100) DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `id_historialClinico` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `paciente`
--

INSERT INTO `paciente` (`id_paciente`, `nombres_paciente`, `apellidos_paciente`, `documento_paciente`, `correo_paciente`, `tel_1_paciente`, `tel_2_paciente`, `dir_paciente`, `fecha_nacimiento`, `id_historialClinico`) VALUES
(78, 'DANIELA', 'CHIA', '1015392288', 'DANIGOMEZ0202@GMAIL.COM', '3182986885', '', 'CRA 74 A BIS 68-57', '2000-02-08', 78),
(91, 'Giovanny Andres', 'Montero Carvajal', '1014306118', 'rolencia99@gmail.com', '3134973973', '', 'CL 72A #78-39', '1999-06-11', 91);

-- --------------------------------------------------------

--
-- Table structure for table `pagos`
--

CREATE TABLE `pagos` (
  `id_pagos` int(11) NOT NULL,
  `val_neto_pagos` int(11) DEFAULT NULL,
  `val_iva_pagos` int(11) DEFAULT NULL,
  `val_total_pagos` int(11) DEFAULT NULL,
  `cantidad_pagos` int(11) DEFAULT NULL,
  `total_pagos` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `siste_gestion_citas`
--

CREATE TABLE `siste_gestion_citas` (
  `id_sgc` int(11) NOT NULL,
  `fecha_agendado` datetime DEFAULT NULL,
  `tema_sgc` int(1) DEFAULT NULL,
  `nombrepaciente_FK` int(11) DEFAULT NULL,
  `nombremedico_FK` int(11) DEFAULT NULL,
  `id_pagos_FK` int(11) DEFAULT NULL,
  `id_usuario` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `historial_clinico`
--
ALTER TABLE `historial_clinico`
  ADD PRIMARY KEY (`id_hist_clinico`);

--
-- Indexes for table `ingreso_sistema`
--
ALTER TABLE `ingreso_sistema`
  ADD PRIMARY KEY (`id_usuario`);

--
-- Indexes for table `medico`
--
ALTER TABLE `medico`
  ADD PRIMARY KEY (`id_medico`);

--
-- Indexes for table `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`id_paciente`),
  ADD KEY `id_historialClinico` (`id_historialClinico`);

--
-- Indexes for table `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`id_pagos`);

--
-- Indexes for table `siste_gestion_citas`
--
ALTER TABLE `siste_gestion_citas`
  ADD PRIMARY KEY (`id_sgc`),
  ADD KEY `nombrepaciente` (`nombrepaciente_FK`),
  ADD KEY `nombremedico` (`nombremedico_FK`),
  ADD KEY `id_pagos_FK` (`id_pagos_FK`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `historial_clinico`
--
ALTER TABLE `historial_clinico`
  MODIFY `id_hist_clinico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `ingreso_sistema`
--
ALTER TABLE `ingreso_sistema`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medico`
--
ALTER TABLE `medico`
  MODIFY `id_medico` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `paciente`
--
ALTER TABLE `paciente`
  MODIFY `id_paciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT for table `pagos`
--
ALTER TABLE `pagos`
  MODIFY `id_pagos` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `siste_gestion_citas`
--
ALTER TABLE `siste_gestion_citas`
  MODIFY `id_sgc` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `paciente`
--
ALTER TABLE `paciente`
  ADD CONSTRAINT `paciente_ibfk_1` FOREIGN KEY (`id_historialClinico`) REFERENCES `historial_clinico` (`id_hist_clinico`);

--
-- Constraints for table `siste_gestion_citas`
--
ALTER TABLE `siste_gestion_citas`
  ADD CONSTRAINT `siste_gestion_citas_ibfk_1` FOREIGN KEY (`nombrepaciente_FK`) REFERENCES `paciente` (`id_paciente`),
  ADD CONSTRAINT `siste_gestion_citas_ibfk_2` FOREIGN KEY (`nombremedico_FK`) REFERENCES `medico` (`id_medico`),
  ADD CONSTRAINT `siste_gestion_citas_ibfk_3` FOREIGN KEY (`id_pagos_FK`) REFERENCES `pagos` (`id_pagos`),
  ADD CONSTRAINT `siste_gestion_citas_ibfk_4` FOREIGN KEY (`id_usuario`) REFERENCES `ingreso_sistema` (`id_usuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
