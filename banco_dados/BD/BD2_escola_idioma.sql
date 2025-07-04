CREATE DATABASE  IF NOT EXISTS `escola_ii` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `escola_ii`;
-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: escola_ii
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `tb_aluno`
--

DROP TABLE IF EXISTS `tb_aluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_aluno` (
  `PK_aluno` int NOT NULL,
  `alnu_nivel` varchar(2) DEFAULT NULL,
  `FK_cadastro` int DEFAULT NULL,
  PRIMARY KEY (`PK_aluno`),
  KEY `FK_CADASTRO_PESSOA_ALUNO` (`FK_cadastro`),
  CONSTRAINT `FK_CADASTRO_PESSOA_ALUNO` FOREIGN KEY (`FK_cadastro`) REFERENCES `tb_cadastro_pessoa` (`PK_cadastro`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_aluno`
--

LOCK TABLES `tb_aluno` WRITE;
/*!40000 ALTER TABLE `tb_aluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_aluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_avaliacao`
--

DROP TABLE IF EXISTS `tb_avaliacao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_avaliacao` (
  `PK_avaliacao` int NOT NULL,
  `FK_matricula` int DEFAULT NULL,
  `FK_registro` int DEFAULT NULL,
  `fedback_alun` varchar(100) DEFAULT NULL,
  `aval_nota` int DEFAULT NULL,
  PRIMARY KEY (`PK_avaliacao`),
  KEY `FK_REGISTRO_AVALIACAO` (`FK_registro`),
  CONSTRAINT `FK_REGISTRO_AVALIACAO` FOREIGN KEY (`FK_registro`) REFERENCES `tb_registro` (`PK_registro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_avaliacao`
--

LOCK TABLES `tb_avaliacao` WRITE;
/*!40000 ALTER TABLE `tb_avaliacao` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_avaliacao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_cadastro_pessoa`
--

DROP TABLE IF EXISTS `tb_cadastro_pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_cadastro_pessoa` (
  `PK_cadastro` int NOT NULL,
  `pess_nome` varchar(45) DEFAULT NULL,
  `pess_CPF` varchar(15) DEFAULT NULL,
  `pess_endereco` varchar(45) DEFAULT NULL,
  `pess_fone` int DEFAULT NULL,
  `pess_nascimento` date DEFAULT NULL,
  `FK_endereco` int DEFAULT NULL,
  PRIMARY KEY (`PK_cadastro`),
  KEY `FK_ENDERECO_CADASTRO_PESSOA` (`FK_endereco`),
  CONSTRAINT `FK_ENDERECO_CADASTRO_PESSOA` FOREIGN KEY (`FK_endereco`) REFERENCES `tb_endereco` (`PK_endereco`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_cadastro_pessoa`
--

LOCK TABLES `tb_cadastro_pessoa` WRITE;
/*!40000 ALTER TABLE `tb_cadastro_pessoa` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_cadastro_pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_curso`
--

DROP TABLE IF EXISTS `tb_curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_curso` (
  `PK_curso` int NOT NULL,
  `curs_nome` varchar(45) DEFAULT NULL,
  `curs_descricao` varchar(100) DEFAULT NULL,
  `curs_time` time DEFAULT NULL,
  `curs_valor` varchar(45) DEFAULT NULL,
  `curs_nivel` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`PK_curso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_curso`
--

LOCK TABLES `tb_curso` WRITE;
/*!40000 ALTER TABLE `tb_curso` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_endereco`
--

DROP TABLE IF EXISTS `tb_endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_endereco` (
  `PK_endereco` int NOT NULL,
  `ende_rua` varchar(45) DEFAULT NULL,
  `ende_num` int DEFAULT NULL,
  `ende_bairro` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`PK_endereco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_endereco`
--

LOCK TABLES `tb_endereco` WRITE;
/*!40000 ALTER TABLE `tb_endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_horario`
--

DROP TABLE IF EXISTS `tb_horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_horario` (
  `PK_horario` int NOT NULL,
  `hora_turma` time DEFAULT NULL,
  `hora_sala` time DEFAULT NULL,
  PRIMARY KEY (`PK_horario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_horario`
--

LOCK TABLES `tb_horario` WRITE;
/*!40000 ALTER TABLE `tb_horario` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_matricula`
--

DROP TABLE IF EXISTS `tb_matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_matricula` (
  `PK_matricula` int NOT NULL,
  `FK_aluno` int DEFAULT NULL,
  `FK_curso` int DEFAULT NULL,
  `FK_pagamento` int DEFAULT NULL,
  `FK_avaliacao` int DEFAULT NULL,
  `FK_turma` int DEFAULT NULL,
  PRIMARY KEY (`PK_matricula`),
  KEY `FK_TURMA_MATRICULA` (`FK_turma`),
  KEY `FK_ALUNO_MATRICULA` (`FK_aluno`),
  KEY `FK_CURSO_MATRICULA` (`FK_curso`),
  KEY `Fk_PAGAMENTO_MATRICULA` (`FK_pagamento`),
  KEY `Fk_AVALIACAO_MATRICULA` (`FK_avaliacao`),
  CONSTRAINT `FK_ALUNO_MATRICULA` FOREIGN KEY (`FK_aluno`) REFERENCES `tb_aluno` (`PK_aluno`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Fk_AVALIACAO_MATRICULA` FOREIGN KEY (`FK_avaliacao`) REFERENCES `tb_avaliacao` (`PK_avaliacao`),
  CONSTRAINT `FK_CURSO_MATRICULA` FOREIGN KEY (`FK_curso`) REFERENCES `tb_curso` (`PK_curso`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Fk_PAGAMENTO_MATRICULA` FOREIGN KEY (`FK_pagamento`) REFERENCES `tb_pagamento` (`PK_pagamento`),
  CONSTRAINT `FK_TURMA_MATRICULA` FOREIGN KEY (`FK_turma`) REFERENCES `tb_turma` (`PK_turma`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_matricula`
--

LOCK TABLES `tb_matricula` WRITE;
/*!40000 ALTER TABLE `tb_matricula` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_pagamento`
--

DROP TABLE IF EXISTS `tb_pagamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_pagamento` (
  `PK_pagamento` int NOT NULL,
  `paga_status` varchar(10) DEFAULT 'false',
  `paga_fatura` varchar(45) DEFAULT NULL,
  `paga_metodo` varchar(10) DEFAULT NULL,
  `paga_nf` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`PK_pagamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_pagamento`
--

LOCK TABLES `tb_pagamento` WRITE;
/*!40000 ALTER TABLE `tb_pagamento` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_pagamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_professor`
--

DROP TABLE IF EXISTS `tb_professor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_professor` (
  `PK_professor` int NOT NULL,
  `FK_cadastro` int DEFAULT NULL,
  PRIMARY KEY (`PK_professor`),
  KEY `FK_CADASTRO_PESSOA_PROFESSOR` (`FK_cadastro`),
  CONSTRAINT `FK_CADASTRO_PESSOA_PROFESSOR` FOREIGN KEY (`FK_cadastro`) REFERENCES `tb_cadastro_pessoa` (`PK_cadastro`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_professor`
--

LOCK TABLES `tb_professor` WRITE;
/*!40000 ALTER TABLE `tb_professor` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_professor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_registro`
--

DROP TABLE IF EXISTS `tb_registro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_registro` (
  `PK_registro` int NOT NULL,
  `regi_data` date DEFAULT NULL,
  `regi_descricao` varchar(45) DEFAULT NULL,
  `regi_nivel` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PK_registro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_registro`
--

LOCK TABLES `tb_registro` WRITE;
/*!40000 ALTER TABLE `tb_registro` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_registro` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_relatorio`
--

DROP TABLE IF EXISTS `tb_relatorio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_relatorio` (
  `PK_relatorio` int NOT NULL,
  `fk_matricula` int DEFAULT NULL,
  `fk_turma` int DEFAULT NULL,
  PRIMARY KEY (`PK_relatorio`),
  KEY `FK_MATRICULA_RELATORIO` (`fk_matricula`),
  KEY `FK_TURMA_RELATORIO` (`fk_turma`),
  CONSTRAINT `FK_MATRICULA_RELATORIO` FOREIGN KEY (`fk_matricula`) REFERENCES `tb_matricula` (`PK_matricula`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_TURMA_RELATORIO` FOREIGN KEY (`fk_turma`) REFERENCES `tb_turma` (`PK_turma`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_relatorio`
--

LOCK TABLES `tb_relatorio` WRITE;
/*!40000 ALTER TABLE `tb_relatorio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_relatorio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_turma`
--

DROP TABLE IF EXISTS `tb_turma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_turma` (
  `PK_turma` int NOT NULL,
  `turm_nome` varchar(45) DEFAULT NULL,
  `FK_curso` int DEFAULT NULL,
  `FK_horario` int DEFAULT NULL,
  `FK_professor` int DEFAULT NULL,
  PRIMARY KEY (`PK_turma`),
  KEY `FK_CURSO_TURMA` (`FK_curso`),
  KEY `FK_HORARIO_TURMA` (`FK_horario`),
  KEY `FK_PROFESSOR_TURMA` (`FK_professor`),
  CONSTRAINT `FK_CURSO_TURMA` FOREIGN KEY (`FK_curso`) REFERENCES `tb_curso` (`PK_curso`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_HORARIO_TURMA` FOREIGN KEY (`FK_horario`) REFERENCES `tb_horario` (`PK_horario`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_PROFESSOR_TURMA` FOREIGN KEY (`FK_professor`) REFERENCES `tb_professor` (`PK_professor`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_turma`
--

LOCK TABLES `tb_turma` WRITE;
/*!40000 ALTER TABLE `tb_turma` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_turma` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-04 16:36:57
