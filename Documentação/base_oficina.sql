CREATE DATABASE  IF NOT EXISTS `oficina_mecanica` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `oficina_mecanica`;
-- MySQL dump 10.13  Distrib 5.6.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: oficina_mecanica
-- ------------------------------------------------------
-- Server version	5.6.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(150) NOT NULL,
  `cpf` varchar(15) NOT NULL,
  `rg` varchar(9) NOT NULL,
  `dtNacimento` date NOT NULL,
  `endereco` varchar(150) NOT NULL,
  `telefone` varchar(12) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `cpf_UNIQUE` (`cpf`),
  UNIQUE KEY `rg_UNIQUE` (`rg`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Elionay Barroso','987.123.123-05','1234567-9','1995-03-30','Rua B ,n188 - Bem aqui','92 3674999'),(2,'Paulo Adnre','654.123.123-06','1234567-8','1995-05-30','Rua R ,n84 - Bem ali','92 36441499'),(3,'Cileia','123.123.123-07','1234567-7','1995-01-30','Rua H ,n83 - Bem longe','92 36449259');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ent_sai_veiculos`
--

DROP TABLE IF EXISTS `ent_sai_veiculos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ent_sai_veiculos` (
  `idEnt_Sai_Veiculos` int(11) NOT NULL AUTO_INCREMENT,
  `idVeiculo` int(11) NOT NULL,
  `dtEntrada` date DEFAULT NULL,
  `dtSaida` date DEFAULT NULL,
  PRIMARY KEY (`idEnt_Sai_Veiculos`),
  KEY `fk_Ent_Sai_Veiculos_Veiculo1_idx` (`idVeiculo`),
  CONSTRAINT `fk_Ent_Sai_Veiculos_Veiculo1` FOREIGN KEY (`idVeiculo`) REFERENCES `veiculo` (`idVeiculo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ent_sai_veiculos`
--

LOCK TABLES `ent_sai_veiculos` WRITE;
/*!40000 ALTER TABLE `ent_sai_veiculos` DISABLE KEYS */;
INSERT INTO `ent_sai_veiculos` VALUES (1,2,'2014-10-01',NULL),(2,5,'2014-10-02',NULL),(3,4,'2014-10-01',NULL),(4,3,'2014-10-02',NULL);
/*!40000 ALTER TABLE `ent_sai_veiculos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `idLogin` int(11) NOT NULL AUTO_INCREMENT,
  `senha` varchar(45) NOT NULL,
  `idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idLogin`,`idCliente`),
  KEY `fk_Login_Cliente1_idx` (`idCliente`),
  CONSTRAINT `fk_Login_Cliente1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orcamento`
--

DROP TABLE IF EXISTS `orcamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orcamento` (
  `idOrcamento` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  `idOrdem_Servico` int(11) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idOrcamento`,`idOrdem_Servico`),
  KEY `fk_Orcamento_Ordem_Servico1_idx` (`idOrdem_Servico`),
  CONSTRAINT `fk_Orcamento_Ordem_Servico1` FOREIGN KEY (`idOrdem_Servico`) REFERENCES `ordem_servico` (`idOrdem_Servico`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orcamento`
--

LOCK TABLES `orcamento` WRITE;
/*!40000 ALTER TABLE `orcamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `orcamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ordem_servico`
--

DROP TABLE IF EXISTS `ordem_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ordem_servico` (
  `idOrdem_Servico` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idOrdem_Servico`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ordem_servico`
--

LOCK TABLES `ordem_servico` WRITE;
/*!40000 ALTER TABLE `ordem_servico` DISABLE KEYS */;
INSERT INTO `ordem_servico` VALUES (1,'Vai está associado a varios serv.1',0),(2,'Vai está associado a varios serv.2',0);
/*!40000 ALTER TABLE `ordem_servico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `servicos`
--

DROP TABLE IF EXISTS `servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servicos` (
  `idServicos` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(45) NOT NULL,
  `valor` float NOT NULL,
  `dtHora` datetime NOT NULL,
  `idEnt_Sai_Veiculos` int(11) NOT NULL,
  `idTipo_Servicos` int(11) NOT NULL,
  `idOrdem_Servico` int(11) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idServicos`,`descricao`),
  KEY `fk_Servicos_Ent_Sai_Veiculos1_idx` (`idEnt_Sai_Veiculos`),
  KEY `fk_Servicos_Tipo_Servicos1_idx` (`idTipo_Servicos`),
  KEY `fk_Servicos_Ordem_Servico1_idx` (`idOrdem_Servico`),
  CONSTRAINT `fk_Servicos_Ent_Sai_Veiculos1` FOREIGN KEY (`idEnt_Sai_Veiculos`) REFERENCES `ent_sai_veiculos` (`idEnt_Sai_Veiculos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Servicos_Ordem_Servico1` FOREIGN KEY (`idOrdem_Servico`) REFERENCES `ordem_servico` (`idOrdem_Servico`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Servicos_Tipo_Servicos1` FOREIGN KEY (`idTipo_Servicos`) REFERENCES `tipo_servicos` (`idTipo_Servicos`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servicos`
--

LOCK TABLES `servicos` WRITE;
/*!40000 ALTER TABLE `servicos` DISABLE KEYS */;
INSERT INTO `servicos` VALUES (2,'cobrado taxas',36.9,'2014-10-02 00:00:00',2,1,NULL,0),(3,'cobrado taxas',36.9,'2014-10-02 00:00:00',3,2,2,0),(4,'cobrado taxas',36.9,'2014-10-02 00:00:00',4,3,NULL,0),(6,'cobrado taxas',40.9,'2014-10-02 00:00:00',1,1,1,0),(7,'cobrado taxas',56.9,'2014-10-02 00:00:00',2,2,NULL,0),(8,'cobrado taxas',65.9,'2014-10-02 00:00:00',3,3,2,0),(9,'cobrado taxas',56.9,'2014-10-02 00:00:00',4,4,NULL,0),(10,'cobrado taxas',86.9,'2014-10-02 00:00:00',1,5,1,0),(11,'cobrado taxas',97.9,'2014-10-02 00:00:00',2,6,NULL,0),(12,'cobrado taxas',23.9,'2014-10-02 00:00:00',3,7,2,0),(13,'cobrado taxas',85.9,'2014-10-02 00:00:00',4,8,NULL,0),(14,'cobrado taxas',32.9,'2014-10-02 00:00:00',2,3,NULL,0),(15,'cobrado taxas',74.9,'2014-10-02 00:00:00',3,4,2,0),(16,'cobrado taxas',14.9,'2014-10-02 00:00:00',4,5,NULL,0),(17,'cobrado taxas',38.9,'2014-10-02 00:00:00',1,6,1,0);
/*!40000 ALTER TABLE `servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_servicos`
--

DROP TABLE IF EXISTS `tipo_servicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_servicos` (
  `idTipo_Servicos` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) NOT NULL,
  PRIMARY KEY (`idTipo_Servicos`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_servicos`
--

LOCK TABLES `tipo_servicos` WRITE;
/*!40000 ALTER TABLE `tipo_servicos` DISABLE KEYS */;
INSERT INTO `tipo_servicos` VALUES (1,'TROCA DE OLEO'),(2,'ALINHAMENTO'),(3,'BALANCEAMENTO'),(4,'LAVAGEM'),(5,'POLIMENTO'),(6,'PINTURA'),(7,'PACOTE REVISAO'),(8,'LANTERNAGEM');
/*!40000 ALTER TABLE `tipo_servicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veiculo`
--

DROP TABLE IF EXISTS `veiculo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `veiculo` (
  `idVeiculo` int(11) NOT NULL AUTO_INCREMENT,
  `marca` varchar(45) NOT NULL,
  `cor` varchar(45) NOT NULL,
  `ano` date NOT NULL,
  `placa` varchar(8) NOT NULL,
  `modelo` varchar(45) NOT NULL,
  `idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idVeiculo`),
  UNIQUE KEY `placa_UNIQUE` (`placa`),
  KEY `fk_Veiculo_Cliente_idx` (`idCliente`),
  CONSTRAINT `fk_Veiculo_Cliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veiculo`
--

LOCK TABLES `veiculo` WRITE;
/*!40000 ALTER TABLE `veiculo` DISABLE KEYS */;
INSERT INTO `veiculo` VALUES (1,'CHEVROLET','VERMELHO','2000-10-10','OAB-1123','CORSA',1),(2,'FIAT','BRANCO','2014-10-10','OTA-5555','VUNTER',3),(3,'TOYOTA','PRATA','2015-10-10','BUI-1123','HILLUX',2),(4,'CHEVROLET','AZUL','2000-10-10','OIB-8520','COBALT',1),(5,'BMW','AMARELO','2014-10-10','OAK-9855','ZORBA',3),(6,'HONDA','VIOLETA','2015-10-10','LOL-1563','NEW CIVIC',2);
/*!40000 ALTER TABLE `veiculo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-03  1:22:06
