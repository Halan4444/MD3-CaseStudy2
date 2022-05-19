-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: furama_manager
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Table structure for table `academic_level`
--

DROP TABLE IF EXISTS `academic_level`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academic_level` (
  `academic_id` int NOT NULL AUTO_INCREMENT,
  `level_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`academic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_level`
--

LOCK TABLES `academic_level` WRITE;
/*!40000 ALTER TABLE `academic_level` DISABLE KEYS */;
INSERT INTO `academic_level` VALUES (1,'Trung Cấp'),(2,'Cao Đẳng'),(3,'Đại Học'),(4,'Sau Đại Học');
/*!40000 ALTER TABLE `academic_level` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `account` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  `name` varchar(45) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'HueYeu','Bao123','Huệ','admin'),(2,'long23','Bao123','Long','user');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract` (
  `contract_id` int NOT NULL AUTO_INCREMENT,
  `date_signed` date NOT NULL,
  `date_end` date NOT NULL,
  `deposit` double NOT NULL,
  `employee_id` int NOT NULL,
  `customer_id` int NOT NULL,
  `facility_id` int NOT NULL,
  PRIMARY KEY (`contract_id`),
  KEY `employee_id` (`employee_id`),
  KEY `customer_id` (`customer_id`),
  KEY `facility_id` (`facility_id`),
  CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `contract_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `contract_ibfk_3` FOREIGN KEY (`facility_id`) REFERENCES `facility` (`facility_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
INSERT INTO `contract` VALUES (1,'2020-12-08','2020-12-08',0,3,1,3),(2,'2020-07-14','2020-07-21',200000,7,3,1),(3,'2021-03-15','2021-03-17',50000,3,4,2),(4,'2021-01-14','2021-01-18',100000,7,5,5),(5,'2021-07-14','2021-07-15',0,7,2,6),(6,'2021-06-01','2021-06-03',0,7,7,6),(7,'2021-09-02','2021-09-05',100000,7,4,4),(8,'2021-06-17','2021-06-18',150000,3,4,1),(9,'2020-11-19','2020-11-19',0,3,4,3),(10,'2021-04-12','2021-04-14',0,10,3,5),(11,'2021-04-25','2021-04-25',0,2,2,1),(12,'2021-05-25','2021-05-27',0,7,10,1);
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract_detail`
--

DROP TABLE IF EXISTS `contract_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract_detail` (
  `contract_detail_id` int NOT NULL AUTO_INCREMENT,
  `contract_id` int NOT NULL,
  `service_include_id` int NOT NULL,
  `amount` int NOT NULL,
  PRIMARY KEY (`contract_detail_id`),
  KEY `contract_id` (`contract_id`),
  KEY `service_include_id` (`service_include_id`),
  CONSTRAINT `contract_detail_ibfk_1` FOREIGN KEY (`contract_id`) REFERENCES `contract` (`contract_id`),
  CONSTRAINT `contract_detail_ibfk_2` FOREIGN KEY (`service_include_id`) REFERENCES `service_include` (`service_include_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract_detail`
--

LOCK TABLES `contract_detail` WRITE;
/*!40000 ALTER TABLE `contract_detail` DISABLE KEYS */;
INSERT INTO `contract_detail` VALUES (1,2,4,5),(2,2,5,8),(3,2,6,15),(4,3,1,1),(5,3,2,11),(6,1,3,1),(7,1,2,2),(8,12,2,2);
/*!40000 ALTER TABLE `contract_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_type_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `gender` bit(1) NOT NULL,
  `id_card` varchar(20) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `customer_code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_id`),
  KEY `customer_type_id` (`customer_type_id`),
  CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`customer_type_id`) REFERENCES `customer_type` (`customer_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,5,'Nguyễn Thị Hào','1970-11-07',_binary '\0','643431213','945423362','thihao07@gmail.com','23 Nguyễn Hoàng, Đà Nẵng','KH-1234'),(2,3,'Phạm Xuân Diệu','1992-08-08',_binary '','865342123','954333333','xuandieu92@gmail.com','K77/22 Thái Phiên, Quảng Trị','KH-1235'),(3,1,'Trương Đình Nghệ','1990-02-27',_binary '','488645199','373213122','nghenhan2702@gmail.com','K323/12 Ông Ích Khiêm, Vinh','KH-1236'),(4,1,'Dương Văn Quan','1981-07-08',_binary '','543432111','490039241','duongquan@gmail.com','K453/12 Lê Lợi, Đà Nẵng','KH-1237'),(5,4,'Hoàng Trần Nhi Nhi','1995-12-09',_binary '\0','795453345','312345678','nhinhi123@gmail.com','224 Lý Thái Tổ, Gia Lai','KH-1238'),(6,4,'Tôn Nữ Mộc Châu','2005-12-06',_binary '\0','732434215','988888844','tonnuchau@gmail.com','37 Yên Thế, Đà Nẵng','KH-1239'),(7,1,'Nguyễn Mỹ Kim','1984-04-08',_binary '\0','856453123','912345698','kimcuong84@gmail.com','K123/45 Lê Lợi, Hồ Chí Minh','KH-1240'),(8,3,'Nguyễn Thị Hào','1999-04-08',_binary '\0','965656433','763212345','haohao99@gmail.com','55 Nguyễn Văn Linh, Kon Tum','KH-1241'),(9,1,'Trần Đại Danh','1994-07-01',_binary '','432341235','643343433','danhhai99@gmail.com','24 Lý Thường Kiệt, Quảng Ngãi','KH-1242'),(10,2,'Nguyễn Tâm Đắc','1989-07-01',_binary '','344343432','987654321','dactam@gmail.com','22 Ngô Quyền, Đà Nẵng','KH-1243');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_type`
--

DROP TABLE IF EXISTS `customer_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_type` (
  `customer_type_id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`customer_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_type`
--

LOCK TABLES `customer_type` WRITE;
/*!40000 ALTER TABLE `customer_type` DISABLE KEYS */;
INSERT INTO `customer_type` VALUES (1,'Diamond'),(2,'Platinium'),(3,'Gold'),(4,'Silver'),(5,'Member');
/*!40000 ALTER TABLE `customer_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `department_id` int NOT NULL AUTO_INCREMENT,
  `department_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (1,'Sale-Marketing'),(2,'Hành chính'),(3,'Phục vụ'),(4,'Quản lý');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `id_card` varchar(20) NOT NULL,
  `salary` double NOT NULL,
  `phone` varchar(20) NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `position_id` int DEFAULT NULL,
  `academic_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `position_id` (`position_id`),
  KEY `academic_id` (`academic_id`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`position_id`) REFERENCES `position` (`position_id`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`academic_id`) REFERENCES `academic_level` (`academic_id`),
  CONSTRAINT `employee_ibfk_3` FOREIGN KEY (`department_id`) REFERENCES `department` (`department_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Nguyễn Văn An','1970-11-07','456231786',10000000,'901234121','annguyen@gmail.com','295 Nguyễn Tất Thành, Đà Nẵng',1,3,1),(2,'Lê Văn Bình','1997-04-09','654231234',7000000,'934212314','binhlv@gmail.com','22 Yên Bái, Đà Nẵng',1,2,2),(3,'Hồ Thị Yến','1995-12-12','999231723',14000000,'412352315','thiyen@gmail.com','K234/11 Điện Biên Phủ, Gia Lai',1,3,2),(4,'Võ Công Toản','1980-04-04','123231365',17000000,'374443232','toan0404@gmail.com','77 Hoàng Diệu, Quảng Trị',1,4,4),(5,'Nguyễn Bỉnh Phát','1999-12-09','454363232',6000000,'902341231','phatphat@gmail.com','43 Yên Bái, Đà Nẵng',2,1,1),(6,'Khúc Nguyễn An Nghi','2000-11-08','964542311',7000000,'978653213','annghi20@gmail.com','294 Nguyễn Tất Thành, Đà Nẵng',2,2,3),(7,'Nguyễn Hữu Hà','1993-01-01','534323231',8000000,'941234553','nhh0101@gmail.com','4 Nguyễn Chí Thanh, Huế',2,3,2),(8,'Nguyễn Hà Đông','1989-09-03','234414123',9000000,'642123111','donghanguyen@gmail.com','111 Hùng Vương, Hà Nội',2,4,4),(9,'Tòng Hoang','1982-09-03','256781231',6000000,'245144444','hoangtong@gmail.com','213 Hàm Nghi, Đà Nẵng',2,4,4),(10,'Nguyễn Công Đạo','1994-01-08','755434343',8000000,'988767111','nguyencongdao12@gmail.com','6 Hoà Khánh, Đồng Nai',2,3,2);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facility`
--

DROP TABLE IF EXISTS `facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facility` (
  `facility_id` int NOT NULL AUTO_INCREMENT,
  `facility_name` varchar(45) NOT NULL,
  `floor_square` double DEFAULT NULL,
  `rental_fee` double NOT NULL,
  `maximum_people` int DEFAULT NULL,
  `facility_type_id` int NOT NULL,
  `rent_type_id` int NOT NULL,
  `room_standard` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  `pool_square` double DEFAULT NULL,
  `floor` int DEFAULT NULL,
  `facility_code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`facility_id`),
  KEY `facility_type_id` (`facility_type_id`),
  KEY `rent_type_id` (`rent_type_id`),
  CONSTRAINT `facility_ibfk_1` FOREIGN KEY (`facility_type_id`) REFERENCES `facility_type` (`facility_type_id`),
  CONSTRAINT `facility_ibfk_2` FOREIGN KEY (`rent_type_id`) REFERENCES `rent_type` (`rent_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility`
--

LOCK TABLES `facility` WRITE;
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` VALUES (1,'Villa Beach Front',25000,10000000,10,1,3,'vip','Có hồ bơi',500,4,'DV-1234'),(2,'House Princess 01',14000,5000000,7,2,2,'vip','Có thêm bếp nướng',NULL,3,'DV-1235'),(3,'Room Twin 01',5000,1000000,2,3,4,'normal','Có tivi',NULL,NULL,'DV-1236'),(4,'Villa No Beach Front',22000,9000000,8,1,3,'normal','Có hồ bơi',300,3,'DV-1237'),(5,'House Princess 02',10000,4000000,5,2,3,'normal','Có thêm bếp nướng',NULL,2,'DV-1238'),(6,'Room Twin 02',3000,900000,2,3,4,'normal','Có tivi',NULL,NULL,'DV-1239'),(7,'Nguyễn Tiến Long',25000,12456,2,1,3,'Vip','Tên gọi khác của xinh đẹp là Hue Hue',12000,2,'DV-1245');
/*!40000 ALTER TABLE `facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facility_type`
--

DROP TABLE IF EXISTS `facility_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facility_type` (
  `facility_type_id` int NOT NULL AUTO_INCREMENT,
  `value` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`facility_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility_type`
--

LOCK TABLES `facility_type` WRITE;
/*!40000 ALTER TABLE `facility_type` DISABLE KEYS */;
INSERT INTO `facility_type` VALUES (1,'Villa'),(2,'House'),(3,'Room');
/*!40000 ALTER TABLE `facility_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `position`
--

DROP TABLE IF EXISTS `position`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `position` (
  `position_id` int NOT NULL AUTO_INCREMENT,
  `position_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `position`
--

LOCK TABLES `position` WRITE;
/*!40000 ALTER TABLE `position` DISABLE KEYS */;
INSERT INTO `position` VALUES (1,'Quản Lý'),(2,'Nhân Viên');
/*!40000 ALTER TABLE `position` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rent_type`
--

DROP TABLE IF EXISTS `rent_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rent_type` (
  `rent_type_id` int NOT NULL AUTO_INCREMENT,
  `rent_type_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`rent_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rent_type`
--

LOCK TABLES `rent_type` WRITE;
/*!40000 ALTER TABLE `rent_type` DISABLE KEYS */;
INSERT INTO `rent_type` VALUES (1,'year'),(2,'month'),(3,'day'),(4,'hour');
/*!40000 ALTER TABLE `rent_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service_include`
--

DROP TABLE IF EXISTS `service_include`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service_include` (
  `service_include_id` int NOT NULL AUTO_INCREMENT,
  `service_include_name` varchar(45) NOT NULL,
  `price` double NOT NULL,
  `unit` varchar(10) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`service_include_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service_include`
--

LOCK TABLES `service_include` WRITE;
/*!40000 ALTER TABLE `service_include` DISABLE KEYS */;
INSERT INTO `service_include` VALUES (1,'Karaoke',10000,'giờ','tiện nghi, hiện tại'),(2,'Thuê xe máy',10000,'chiếc','hỏng 1 xe'),(3,'Thuê xe đạp',20000,'chiếc','tốt'),(4,'Buffet buổi sáng',15000,'suất','đầy đủ đồ ăn, tráng miệng'),(5,'Buffet buổi trưa',90000,'suất','đầy đủ đồ ăn, tráng miệng'),(6,'Buffet buổi tối',16000,'suất','đầy đủ đồ ăn, tráng miệng');
/*!40000 ALTER TABLE `service_include` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-19  8:20:13
