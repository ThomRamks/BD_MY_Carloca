CREATE DATABASE  IF NOT EXISTS `carloca` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `carloca`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: carloca
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `CARROS`
--

DROP TABLE IF EXISTS `CARROS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CARROS` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `COR` varchar(45) NOT NULL,
  `PLACA` varchar(45) NOT NULL,
  `ANO` int NOT NULL,
  `MONTADORA` varchar(60) NOT NULL,
  `CARRO` varchar(45) NOT NULL,
  `TIPO_CARRO` int NOT NULL,
  `KM_ATUAL` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_TIPO_idx` (`TIPO_CARRO`),
  CONSTRAINT `FK_TIPO` FOREIGN KEY (`TIPO_CARRO`) REFERENCES `TIPOS_CARRO` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CARROS`
--

LOCK TABLES `CARROS` WRITE;
/*!40000 ALTER TABLE `CARROS` DISABLE KEYS */;
INSERT INTO `CARROS` VALUES (1,'Branco','ABC-1231',2022,'DYUNHAI','BH20',1,100),(2,'Prata','ABC-1232',2022,'GEUPEOT','802',2,100),(3,'Preto','ABC-1233',2022,'VHECROLET','INOX PLUS',3,100),(4,'Prata','ABC-1234',2022,'SINAN','SERVA',4,100),(5,'Branco','ABC-1235',2022,'WOLKSVAGEN','TIRVUS',5,100),(6,'Preto','ABC-1236',2022,'DONHA','VICIC',6,100),(7,'Prata','ABC-1237',2022,'TIAF','SULPE',7,100),(8,'Branco','ABC-1238',2022,'PEEJ','GENERADE',8,100);
/*!40000 ALTER TABLE `CARROS` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `CARROS_BEFORE_INSERT` BEFORE INSERT ON `CARROS` FOR EACH ROW BEGIN
IF (NEW.COR != 'PRETO' AND NEW.COR != 'PRATA' AND NEW.COR != 'BRANCO')
	THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'COR INVALIDA';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `CARROS_BEFORE_UPDATE` BEFORE UPDATE ON `CARROS` FOR EACH ROW BEGIN
IF (NEW.COR != 'PRETO' AND NEW.COR != 'PRATA' AND NEW.COR != 'BRANCO')
	THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'COR INVALIDA';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `CLIENTE`
--

DROP TABLE IF EXISTS `CLIENTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENTE` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_ENDERECO` int NOT NULL,
  `NOME` varchar(255) NOT NULL,
  `NASCIMENTO` date NOT NULL,
  `CPF` varchar(255) NOT NULL,
  `CNH` varchar(255) NOT NULL,
  `TELEFONE` int NOT NULL,
  `E_MAIL` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_ENDERECO_idx` (`ID_ENDERECO`),
  CONSTRAINT `ID_ENDERECO` FOREIGN KEY (`ID_ENDERECO`) REFERENCES `ENDERECOS` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENTE`
--

LOCK TABLES `CLIENTE` WRITE;
/*!40000 ALTER TABLE `CLIENTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DADOS_DEVOLUCAO`
--

DROP TABLE IF EXISTS `DADOS_DEVOLUCAO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DADOS_DEVOLUCAO` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_DADOS_LOCACAO` int NOT NULL,
  `DATA_FIM` date NOT NULL,
  `ID_UNIDADE_CARLOCA_FIM` int NOT NULL,
  `KM_ATUALIZADO` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_UNIDADE_CARLOCA_idx` (`ID_UNIDADE_CARLOCA_FIM`),
  KEY `FK_LOCACAO` (`ID_DADOS_LOCACAO`),
  CONSTRAINT `FK_LOCACAO` FOREIGN KEY (`ID_DADOS_LOCACAO`) REFERENCES `DADOS_LOCACAO` (`ID`),
  CONSTRAINT `FK_UNIDADE_CARLOCA` FOREIGN KEY (`ID_UNIDADE_CARLOCA_FIM`) REFERENCES `UNIDADES_CARLOCA` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DADOS_DEVOLUCAO`
--

LOCK TABLES `DADOS_DEVOLUCAO` WRITE;
/*!40000 ALTER TABLE `DADOS_DEVOLUCAO` DISABLE KEYS */;
/*!40000 ALTER TABLE `DADOS_DEVOLUCAO` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `DADOS_DEVOLUCAO_BEFORE_INSERT` BEFORE INSERT ON `DADOS_DEVOLUCAO` FOR EACH ROW BEGIN
IF (NEW.DATA_FIM < (SELECT DATA_INICIO FROM DADOS_LOCACAO DL WHERE NEW.ID_DADOS_LOCACAO = DL.ID)) 
	THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'DATA DE ENTREGA DO VEÍCULO DEVE SER MAIOR QUE A INICIAL.';
	END IF;
IF (NEW.KM_ATUALIZADO < (SELECT KM_ATUAL FROM CARROS C INNER JOIN DADOS_LOCACAO DL WHERE NEW.ID_DADOS_LOCACAO = DL.ID AND DL.ID_CARRO = C.ID))
	THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'KM ATUAL DO VEÍCULO DEVE SER MAIOR QUE A INICIAL.';
	END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `DADOS_DEVOLUCAO_AFTER_INSERT` AFTER INSERT ON `DADOS_DEVOLUCAO` FOR EACH ROW BEGIN
DECLARE vKM_RODADO INT;
DECLARE vDIAS INT;
DECLARE vVALOR INT;
DECLARE vINICIAL DATE;
DECLARE vFINAL DATE;
UPDATE STATUS_CARRO SC INNER JOIN DADOS_LOCACAO DL ON DL.ID_CARRO = SC.ID_CARRO SET SC.SITUACAO = 'DISPONIVEL';
UPDATE DADOS_LOCACAO DL INNER JOIN DADOS_DEVOLUCAO DD ON DL.ID = DD.ID_DADOS_LOCACAO SET DL.SITUACAO = 'FECHADO';
SET vKM_RODADO = NEW.KM_ATUALIZADO - (SELECT KM_ATUAL FROM CARROS C INNER JOIN DADOS_LOCACAO DL WHERE C.ID = DL.ID_CARRO);
SET vINICIAL = (SELECT DATA_INICIO FROM DADOS_LOCACAO DL INNER JOIN DADOS_DEVOLUCAO DD WHERE DL.ID = DD.ID_DADOS_LOCACAO);
SET vFINAL = (SELECT DATA_FIM FROM DADOS_DEVOLUCAO DD WHERE DD.ID = NEW.ID);
SET vDIAS = (SELECT DATEDIFF(vFINAL, vINICIAL));
SET vVALOR = (SELECT VALOR FROM TIPOS_CARRO TP INNER JOIN CARROS C INNER JOIN DADOS_LOCACAO DL WHERE C.ID = DL.ID_CARRO AND C.TIPO_CARRO = TP.ID) * vDIAS;
INSERT INTO HISTORICO_LOCACOES (ID_DEVOLUCAO, KM_RODADO, VALOR_FINAL) VALUES (NEW.ID, vKM_RODADO, vVALOR);
UPDATE CARROS C INNER JOIN DADOS_LOCACAO DL INNER JOIN DADOS_DEVOLUCAO DD SET KM_ATUAL = NEW.KM_ATUALIZADO WHERE DD.ID_DADOS_LOCACAO = DL.ID AND DL.ID_CARRO = C.ID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `DADOS_LOCACAO`
--

DROP TABLE IF EXISTS `DADOS_LOCACAO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DADOS_LOCACAO` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_CARRO` int NOT NULL,
  `ID_CLIENTE` int NOT NULL,
  `DATA_INICIO` date NOT NULL,
  `ID_UNIDADE_CARLOCA_ORIGEM` int NOT NULL,
  `SITUACAO` varchar(55) NOT NULL DEFAULT 'ABERTO',
  PRIMARY KEY (`ID`),
  KEY `ID_CARRO_idx` (`ID_CARRO`) /*!80000 INVISIBLE */,
  KEY `ID_CLIENTE_idx` (`ID_CLIENTE`),
  KEY `FK_UNIDADE_ORIGEM_idx` (`ID_UNIDADE_CARLOCA_ORIGEM`),
  CONSTRAINT `FK_UNIDADE_ORIGEM` FOREIGN KEY (`ID_UNIDADE_CARLOCA_ORIGEM`) REFERENCES `UNIDADES_CARLOCA` (`ID`),
  CONSTRAINT `ID_CARROS` FOREIGN KEY (`ID_CARRO`) REFERENCES `CARROS` (`ID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `ID_CLIENTE` FOREIGN KEY (`ID_CLIENTE`) REFERENCES `CLIENTE` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DADOS_LOCACAO`
--

LOCK TABLES `DADOS_LOCACAO` WRITE;
/*!40000 ALTER TABLE `DADOS_LOCACAO` DISABLE KEYS */;
/*!40000 ALTER TABLE `DADOS_LOCACAO` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `DADOS_LOCACAO_BEFORE_INSERT` BEFORE INSERT ON `DADOS_LOCACAO` FOR EACH ROW BEGIN
IF EXISTS (SELECT ID_CLIENTE, SITUACAO FROM DADOS_LOCACAO WHERE ID_CLIENTE = NEW.ID_CLIENTE AND SITUACAO = 'ABERTO') 
THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'CLIENTE JÁ ESTÁ LOCANDO UM CARRO';
END IF;
IF EXISTS (SELECT ID_CARRO, SITUACAO FROM DADOS_LOCACAO WHERE ID_CARRO = NEW.ID_CARRO AND SITUACAO = 'ABERTO') 
THEN SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'CARRO NÃO DISPONÍVEL';
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `DADOS_LOCACAO_AFTER_INSERT` AFTER INSERT ON `DADOS_LOCACAO` FOR EACH ROW BEGIN
UPDATE STATUS_CARRO SC INNER JOIN DADOS_LOCACAO DL
SET SC.SITUACAO = 'NÃO DISPONIVEL' 
WHERE SC.ID_CARRO = DL.ID_CARRO;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `ENDERECOS`
--

DROP TABLE IF EXISTS `ENDERECOS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ENDERECOS` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `LOGRADOURO` varchar(255) NOT NULL,
  `CEP` varchar(45) NOT NULL,
  `NUMERO` varchar(45) NOT NULL,
  `COMPLEMENTO` varchar(45) DEFAULT NULL,
  `CIDADE` varchar(45) NOT NULL,
  `ESTADO` varchar(45) NOT NULL,
  `PAIS` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ENDERECOS`
--

LOCK TABLES `ENDERECOS` WRITE;
/*!40000 ALTER TABLE `ENDERECOS` DISABLE KEYS */;
INSERT INTO `ENDERECOS` VALUES (1,'Avenida Pereira Barreto','09190-210','42',NULL,'Santo André','SP','Brasil'),(2,'Avenida Barão de Mauá','09726-070','200',NULL,'São Bernardo do Campo','SP','Brasil'),(3,'Rua Gonzaga','09540-110','450',NULL,'São Caetano do Sul','SP','Brasil');
/*!40000 ALTER TABLE `ENDERECOS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `HISTORICO_LOCACOES`
--

DROP TABLE IF EXISTS `HISTORICO_LOCACOES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `HISTORICO_LOCACOES` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_DEVOLUCAO` int NOT NULL,
  `KM_RODADO` int NOT NULL,
  `VALOR_FINAL` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_DEVOLUCAO_idx` (`ID_DEVOLUCAO`),
  CONSTRAINT `FK_DEVOLUCAO` FOREIGN KEY (`ID_DEVOLUCAO`) REFERENCES `DADOS_DEVOLUCAO` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `HISTORICO_LOCACOES`
--

LOCK TABLES `HISTORICO_LOCACOES` WRITE;
/*!40000 ALTER TABLE `HISTORICO_LOCACOES` DISABLE KEYS */;
/*!40000 ALTER TABLE `HISTORICO_LOCACOES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OPCIONAIS`
--

DROP TABLE IF EXISTS `OPCIONAIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OPCIONAIS` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `DIRECAO_ELETRICA` tinyint NOT NULL,
  `AR` tinyint NOT NULL,
  `RADIO` tinyint NOT NULL,
  `SENSOR` tinyint NOT NULL,
  `CAMERA` tinyint NOT NULL,
  `NOME_TIPO` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OPCIONAIS`
--

LOCK TABLES `OPCIONAIS` WRITE;
/*!40000 ALTER TABLE `OPCIONAIS` DISABLE KEYS */;
INSERT INTO `OPCIONAIS` VALUES (1,1,1,1,0,0,'Básico'),(2,1,1,1,1,1,'Premium');
/*!40000 ALTER TABLE `OPCIONAIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STATUS_CARRO`
--

DROP TABLE IF EXISTS `STATUS_CARRO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `STATUS_CARRO` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `ID_CARRO` int NOT NULL,
  `SITUACAO` varchar(55) NOT NULL DEFAULT 'DISPONIVEL',
  PRIMARY KEY (`ID`),
  KEY `FK_CARRO_idx` (`ID_CARRO`),
  CONSTRAINT `FK_CARRO` FOREIGN KEY (`ID_CARRO`) REFERENCES `CARROS` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STATUS_CARRO`
--

LOCK TABLES `STATUS_CARRO` WRITE;
/*!40000 ALTER TABLE `STATUS_CARRO` DISABLE KEYS */;
INSERT INTO `STATUS_CARRO` VALUES (1,1,'DISPONIVEL'),(2,2,'DISPONIVEL'),(3,3,'DISPONIVEL'),(4,4,'DISPONIVEL'),(5,5,'DISPONIVEL'),(6,6,'DISPONIVEL'),(7,7,'DISPONIVEL'),(8,8,'DISPONIVEL');
/*!40000 ALTER TABLE `STATUS_CARRO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TIPOS_CARRO`
--

DROP TABLE IF EXISTS `TIPOS_CARRO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TIPOS_CARRO` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `TIPO_CARRO` varchar(45) NOT NULL,
  `PACOTE` int NOT NULL,
  `VALOR` int NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_PACOTE_idx` (`PACOTE`),
  CONSTRAINT `FK_PACOTE` FOREIGN KEY (`PACOTE`) REFERENCES `OPCIONAIS` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TIPOS_CARRO`
--

LOCK TABLES `TIPOS_CARRO` WRITE;
/*!40000 ALTER TABLE `TIPOS_CARRO` DISABLE KEYS */;
INSERT INTO `TIPOS_CARRO` VALUES (1,'Hatch',1,100),(2,'Hatch',2,125),(3,'Sedan Compacto',1,150),(4,'Sedan Compacto',2,175),(5,'Sedan Médio',1,200),(6,'Sedan Médio',2,225),(7,'SUV',1,250),(8,'SUV',2,300);
/*!40000 ALTER TABLE `TIPOS_CARRO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UNIDADES_CARLOCA`
--

DROP TABLE IF EXISTS `UNIDADES_CARLOCA`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `UNIDADES_CARLOCA` (
  `ID` int NOT NULL AUTO_INCREMENT,
  `NOME_UNIDADE` varchar(55) NOT NULL,
  `ID_ENDERECO` int NOT NULL,
  `TELEFONE` int NOT NULL,
  `E-MAIL` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_ENDERECO_idx` (`ID_ENDERECO`),
  CONSTRAINT `FK_ENDERECO` FOREIGN KEY (`ID_ENDERECO`) REFERENCES `ENDERECOS` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UNIDADES_CARLOCA`
--

LOCK TABLES `UNIDADES_CARLOCA` WRITE;
/*!40000 ALTER TABLE `UNIDADES_CARLOCA` DISABLE KEYS */;
INSERT INTO `UNIDADES_CARLOCA` VALUES (1,'Santo André',1,42202001,'unidade_sa@carloca.com.br'),(2,'São Bernardo',2,42202002,'unidade_sbc@carloca.com.br'),(3,'São Caetano',3,42202003,'unidade_scs@carloca.com.br');
/*!40000 ALTER TABLE `UNIDADES_CARLOCA` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-21 14:01:16
