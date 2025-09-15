-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15-Set-2025 às 13:59
-- Versão do servidor: 10.4.22-MariaDB
-- versão do PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `clinicaveterinaria`
--
CREATE DATABASE IF NOT EXISTS `clinicaveterinaria` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `clinicaveterinaria`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `animal`
--

CREATE TABLE `animal` (
  `Cod_Animal` int(11) NOT NULL,
  `nome` varchar(30) DEFAULT NULL,
  `tipo_animal` varchar(30) DEFAULT NULL,
  `racaanimal` varchar(30) DEFAULT NULL,
  `racao` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `consulta`
--

CREATE TABLE `consulta` (
  `Cod_Consulta` int(11) NOT NULL,
  `Cod_Animal` int(11) DEFAULT NULL,
  `Cod_Veterinario` int(11) DEFAULT NULL,
  `Data_consulta` date DEFAULT NULL,
  `Valor` int(11) DEFAULT NULL,
  `diagnostico` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `veterinario`
--

CREATE TABLE `veterinario` (
  `Cod_Veterinario` int(11) NOT NULL,
  `CRMV` int(11) DEFAULT NULL,
  `nome` varchar(50) DEFAULT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `RG` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`Cod_Animal`);

--
-- Índices para tabela `consulta`
--
ALTER TABLE `consulta`
  ADD PRIMARY KEY (`Cod_Consulta`),
  ADD KEY `Cod_Animal` (`Cod_Animal`),
  ADD KEY `Cod_Veterinario` (`Cod_Veterinario`);

--
-- Índices para tabela `veterinario`
--
ALTER TABLE `veterinario`
  ADD PRIMARY KEY (`Cod_Veterinario`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `animal`
--
ALTER TABLE `animal`
  MODIFY `Cod_Animal` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `consulta`
--
ALTER TABLE `consulta`
  MODIFY `Cod_Consulta` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `veterinario`
--
ALTER TABLE `veterinario`
  MODIFY `Cod_Veterinario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `consulta`
--
ALTER TABLE `consulta`
  ADD CONSTRAINT `consulta_ibfk_1` FOREIGN KEY (`Cod_Animal`) REFERENCES `animal` (`Cod_Animal`),
  ADD CONSTRAINT `consulta_ibfk_2` FOREIGN KEY (`Cod_Veterinario`) REFERENCES `veterinario` (`Cod_Veterinario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
