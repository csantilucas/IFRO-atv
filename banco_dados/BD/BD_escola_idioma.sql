-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: escola_idioma
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
  `FK_nivel` int DEFAULT NULL,
  `FK_cadastro` int DEFAULT NULL,
  PRIMARY KEY (`PK_aluno`),
  KEY `FK_CADASTRO_PESSOA_ALUNO` (`FK_cadastro`),
  KEY `FK_NIVEL_ALUNO` (`FK_nivel`),
  CONSTRAINT `FK_CADASTRO_PESSOA_ALUNO` FOREIGN KEY (`FK_cadastro`) REFERENCES `tb_cadastro_pessoa` (`PK_cadastro`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_NIVEL_ALUNO` FOREIGN KEY (`FK_nivel`) REFERENCES `tb_nivel_lingua` (`PK_nivel`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_aluno`
--

LOCK TABLES `tb_aluno` WRITE;
/*!40000 ALTER TABLE `tb_aluno` DISABLE KEYS */;
INSERT INTO `tb_aluno` VALUES (1,1,1),(2,2,2),(3,4,3),(4,7,4),(5,12,5);
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
INSERT INTO `tb_avaliacao` VALUES (1,1,'Aluno dedicado, bom progresso inicial.',90),(2,3,'Bom desempenho no módulo.',85),(3,4,'Precisa praticar mais a conversação.',70),(4,2,'Excelente pronúncia, muito participativo.',95),(5,5,'Entendimento da gramática precisa de reforço.',75);
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
INSERT INTO `tb_cadastro_pessoa` VALUES (1,'Ana Silva','123.456.789-00',987654321,'2000-05-15',1),(2,'Silva Ana','435.446.100-40',987654321,'2000-05-15',2),(3,'Ana Silva','553.056.179-05',987654321,'2000-05-15',3),(4,'Ana Silva','123.456.789-00',987654321,'2000-05-15',4),(5,'Ana Silva','190.236.119-22',987654321,'2000-05-15',5),(6,'Carlos Souza','223.654.321-11',912345678,'1980-11-20',6),(7,'Pedro Paulo','432.654.321-11',915455678,'1980-08-02',7),(8,'Paulo','987.654.121-11',915355678,'1980-01-08',8),(9,'Luiz','987.654.341-11',913455678,'1980-03-20',9),(10,'Henrique','222.623.321-11',953455678,'1980-04-20',10);
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
  `FK_nivel` int DEFAULT NULL,
  PRIMARY KEY (`PK_curso`),
  KEY `FK_NIVEL_CURSO` (`FK_nivel`),
  CONSTRAINT `FK_NIVEL_CURSO` FOREIGN KEY (`FK_nivel`) REFERENCES `tb_nivel_lingua` (`PK_nivel`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_curso`
--

LOCK TABLES `tb_curso` WRITE;
/*!40000 ALTER TABLE `tb_curso` DISABLE KEYS */;
INSERT INTO `tb_curso` VALUES (1,'ingles','curso de lingua inglesa, vivel fluente','19:00:00','R$ 800.00',1),(2,'ingles','curso de lingua inglesa, nivel fluente/intermediario','19:00:00','R$ 500.00',2),(3,'espanhol','curso de lingua espanhola , nivel intermediario','19:00:00','R$ 300.00',4),(4,'espanhol;','curso de lingua espanhola, nivel fluente','19:00:00','R$ 300.00',7),(5,'espanhol;','curso de lingua espanhola, nivel iniciante','19:00:00','R$ 150.00',12);
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
INSERT INTO `tb_endereco` VALUES (1,'Rua das Flores',1223,'Centro'),(2,'Rua jardim',2314,'cidade verde'),(3,'Rua Jardim',1923,'cidede verde'),(4,'Rua das Flores',9123,'Centro'),(5,'Rua das Flores',5123,'Centro'),(6,'Rua das Flores',1323,'Centro'),(7,'Rua jardim',2389,'cidade verde'),(8,'Rua Jardim',3423,'cidede verde'),(9,'Rua das Flores',1233,'Centro'),(10,'Rua das Flores',5553,'Centro');
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
  `hora_sala` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`PK_horario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_horario`
--

LOCK TABLES `tb_horario` WRITE;
/*!40000 ALTER TABLE `tb_horario` DISABLE KEYS */;
INSERT INTO `tb_horario` VALUES (1,'08:00:00','SALA A'),(2,'10:00:00','SALA B'),(3,'14:00:00','SALA C'),(4,'16:00:00','SALA A'),(5,'19:00:00','SALA B');
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
INSERT INTO `tb_matricula` VALUES (1,1,1,1,1,1),(2,2,2,2,2,2),(3,3,3,3,3,3),(4,4,4,4,4,4),(5,5,5,5,5,5);
/*!40000 ALTER TABLE `tb_matricula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_nivel_lingua`
--

DROP TABLE IF EXISTS `tb_nivel_lingua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_nivel_lingua` (
  `PK_nivel` int NOT NULL,
  `lingua` varchar(45) DEFAULT NULL,
  `nivel` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`PK_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_nivel_lingua`
--

LOCK TABLES `tb_nivel_lingua` WRITE;
/*!40000 ALTER TABLE `tb_nivel_lingua` DISABLE KEYS */;
INSERT INTO `tb_nivel_lingua` VALUES (1,'ingles','A1'),(2,'ingles','A2'),(3,'ingles','B1'),(4,'ingles','B2'),(5,'ingles','C1'),(6,'ingles','C2'),(7,'espanhol','A1'),(8,'espanhol','A2'),(9,'espanhol','B1'),(10,'espanhol','B2'),(11,'espanhol','C1'),(12,'espanhol','C2');
/*!40000 ALTER TABLE `tb_nivel_lingua` ENABLE KEYS */;
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
INSERT INTO `tb_pagamento` VALUES (1,'true','FAT001/2025','Cartão','NF001'),(2,'true','FAT002/2025','Boleto','NF002'),(3,'false','FAT003/2025','Pix','NF003'),(4,'true','FAT004/2025','Cartão','NF004'),(5,'false','FAT005/2025','Boleto','NF005');
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
  `prof_especialidade` varchar(45) DEFAULT NULL,
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
INSERT INTO `tb_professor` VALUES (1,'lingua inglesa',6),(2,'lingua espanhola',7),(3,'lingua inglesa',8),(4,'lingua inglesa',9),(5,'lingua espanhola',7);
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
INSERT INTO `tb_registro` VALUES (1,'2025-06-01','Início das aulas de Inglês A1','A1'),(2,'2025-06-15','Progresso em Espanhol A1','A1'),(3,'2025-07-01','Finalização Módulo Inglês A2','A2'),(4,'2025-07-10','Início das aulas de Inglês B1','B1'),(5,'2025-07-20','Progresso em Espanhol B2','B2');
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
INSERT INTO `tb_relatorio` VALUES (1,1,1),(2,2,2),(3,3,3),(4,4,4),(5,5,5);
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
INSERT INTO `tb_turma` VALUES (1,'Inglês A1 - Manhã',1,1,1),(2,'Inglês A2 - Tarde',2,3,3),(3,'Inglês B1 - Noite',3,5,4),(4,'Espanhol A1 - Manhã',4,2,2),(5,'Espanhol B2 - Tarde',5,4,5);
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

-- Dump completed on 2025-07-05 16:59:47
