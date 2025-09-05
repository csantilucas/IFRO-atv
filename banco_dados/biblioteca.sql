-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: biblioteca
-- ------------------------------------------------------
-- Server version	5.7.31-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autores` (
  `codigo` int(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `nacionalidade` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES (22564411,'Walter Isaacson','Americana'),(55490076,'Adélia Prado','Brasileira'),(77548854,'Aana Lucia Jankovic Barduchi','Brasileira'),(85668900,'Ethevoldo Siqueira','Brasileira'),(90984133,'Steven K Scott','Americana');
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `editoras`
--

DROP TABLE IF EXISTS `editoras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `editoras` (
  `codigo_editora` int(11) NOT NULL,
  `nome_editora` varchar(45) DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  `contato` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`codigo_editora`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `editoras`
--

LOCK TABLES `editoras` WRITE;
/*!40000 ALTER TABLE `editoras` DISABLE KEYS */;
INSERT INTO `editoras` VALUES (2134000,'Saraiva','Sao Paulo','8003434'),(2287000,'Eras','Brasilia','8002432'),(3557000,'Summer','Curitiba','8002198'),(6655000,'Pontes','Sao Paulo','8005600'),(9898000,'Marks','Rio de Janeiro','8009000');
/*!40000 ALTER TABLE `editoras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `CPF` varchar(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  `salario` float DEFAULT NULL,
  `funcao` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES ('20321295096','João Alberto Smith','Itatiba','22447865',1200,'Técnico Informática'),('23161197770','Ana Salles Azir','Salto','22317865',800,'Recepcionista'),('30361290876','Ademir José Silva','Campinas','22317865',900,'Auxiliar'),('32361298734','Luís Henrique Telles','Campinas','21531785',1200,'Bibliotecário'),('45403612087','Francisco José Almeida','Indaiatuba','25417761',750,'Serviços Gerais'),('61254590871','Lucia Bento','Salto','21316565',1350,'Bibliotecaria');
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livros`
--

DROP TABLE IF EXISTS `livros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livros` (
  `numero` int(11) NOT NULL,
  `titulo` varchar(60) DEFAULT NULL,
  `genero` varchar(45) DEFAULT NULL COMMENT '	',
  `edicao` int(11) DEFAULT NULL,
  `ano_publicacao` date DEFAULT NULL,
  `CPF_funcionario` varchar(11) DEFAULT NULL,
  `codigo_editora` int(11) DEFAULT NULL,
  `CPF_usuarioRetirar` varchar(11) DEFAULT NULL,
  `CPF_usuarioReservar` varchar(11) DEFAULT NULL,
  `preco` float DEFAULT NULL,
  PRIMARY KEY (`numero`),
  KEY `fk_funcionario_idx` (`CPF_funcionario`),
  KEY `fk_usuario_retirar_idx` (`CPF_usuarioRetirar`),
  KEY `fk_usuario_reservar_idx` (`CPF_usuarioReservar`),
  KEY `fk_editora_idx` (`codigo_editora`),
  CONSTRAINT `fk_editora` FOREIGN KEY (`codigo_editora`) REFERENCES `editoras` (`codigo_editora`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_funcionario` FOREIGN KEY (`CPF_funcionario`) REFERENCES `funcionarios` (`CPF`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_reservar` FOREIGN KEY (`CPF_usuarioReservar`) REFERENCES `usuarios` (`CPF_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_retirar` FOREIGN KEY (`CPF_usuarioRetirar`) REFERENCES `usuarios` (`CPF_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livros`
--

LOCK TABLES `livros` WRITE;
/*!40000 ALTER TABLE `livros` DISABLE KEYS */;
INSERT INTO `livros` VALUES (10277843,'O Pelicano','Romance',12,'1984-12-01',NULL,2134000,NULL,NULL,45),(32176500,'Salomão - O Homem mais rico que já existiu','Romance',2,'2011-10-30','61254590871',6655000,NULL,NULL,86),(45112239,'Steve Jobs - A Biografia','Biografia',48,'2011-05-15',NULL,2134000,'19321122213',NULL,90),(67392217,'Empregabilidade - Competências Pessoais e Profissionais','Administração',22,'1970-03-01','32361298734',9898000,NULL,NULL,40),(67554421,'Bagagem','Poesia',5,'1972-02-02',NULL,6655000,NULL,'19321122213',66),(77680012,'A Duração do Dia','Poesia',1,'2010-09-25',NULL,2134000,'10122020232',NULL,78),(87659908,'Tecnologias que mudam nossa vida','Tecnologia',2,'2007-01-01',NULL,2134000,NULL,'70964411900',85);
/*!40000 ALTER TABLE `livros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livros_autores`
--

DROP TABLE IF EXISTS `livros_autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livros_autores` (
  `numero_livro` int(11) NOT NULL,
  `codigo_autor` int(11) NOT NULL,
  PRIMARY KEY (`numero_livro`,`codigo_autor`),
  KEY `fk_autor` (`codigo_autor`),
  CONSTRAINT `fk_autor` FOREIGN KEY (`codigo_autor`) REFERENCES `autores` (`codigo`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_livro` FOREIGN KEY (`numero_livro`) REFERENCES `livros` (`numero`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livros_autores`
--

LOCK TABLES `livros_autores` WRITE;
/*!40000 ALTER TABLE `livros_autores` DISABLE KEYS */;
INSERT INTO `livros_autores` VALUES (32176500,22564411),(45112239,22564411),(10277843,55490076),(67554421,55490076),(77680012,55490076),(67392217,77548854),(87659908,85668900);
/*!40000 ALTER TABLE `livros_autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `CPF_usuario` varchar(11) NOT NULL,
  `nome` varchar(45) DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  `telefone` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`CPF_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES ('10122020232','Maria de Lourdes Amaral',NULL,'35440089'),('19321122213','Jose Francisco de Paula',NULL,'27219756'),('22539910976','Ivete Medina Chernell',NULL,'48170352'),('45399109881','Raquel Santos',NULL,'87603451'),('70964411900','Luiza Souza Prado',NULL,'34559087');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-15 15:18:51
