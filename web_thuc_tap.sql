-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: web_thuc_tap
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `classes` (
  `id` int NOT NULL,
  `name_class` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `classes`
--

LOCK TABLES `classes` WRITE;
/*!40000 ALTER TABLE `classes` DISABLE KEYS */;
INSERT INTO `classes` VALUES (1,'a0920i1'),(2,'a01020i1'),(3,'a0821i1'),(4,'a0921i1');
/*!40000 ALTER TABLE `classes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_name` varchar(255) DEFAULT NULL,
  `name_exam` varchar(255) DEFAULT NULL,
  `classes_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp3wglafw35rxngx7hvqj39873` (`classes_id`),
  KEY `FKos7g6kn2748ll3ofc3w163gxh` (`subject_id`),
  CONSTRAINT `FKos7g6kn2748ll3ofc3w163gxh` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`),
  CONSTRAINT `FKp3wglafw35rxngx7hvqj39873` FOREIGN KEY (`classes_id`) REFERENCES `classes` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
INSERT INTO `exam` VALUES (1,'MD-0001','Đề toán từ 2010 đến 2021',2,1),(2,'MD-8839','Toán đại cương 2020',2,0),(5,'MD-0283','Câu hỏi trắc nghiệm lý thuyết tiếng anh 1',3,3),(6,'MD-9383','Câu hỏi trắc nghiệm lý thuyết hóa học 1',1,2),(21,'MD-3882','Đề kiểm tra 1 tiết môn toán',1,0),(22,'MD-8329','Đề Toán 1',2,0),(28,'MD-9273','Đề kiểm tra 1 tiết môn vật lí',3,1),(29,'MD-3829','Đề kiểm tra 2 tiết môn vật lí',2,1),(30,'MD-3832','Đề kiểm tra 1 tiết môn vật lí 45',2,1),(34,'MD-9393','english basic',2,3),(35,'MD-3838','hoá 1 tiết',2,2),(36,'MD-0009','Đề thi giữa kỳ lần 3',2,1),(37,'MD-0009','Đề thi giữa kỳ lần 3',2,1);
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam_question`
--

DROP TABLE IF EXISTS `exam_question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam_question` (
  `exam_id` int NOT NULL,
  `ques_id` int NOT NULL,
  KEY `FKl7iemhe9amxumih4r8pmylqvb` (`ques_id`),
  KEY `FK75y5n4rt15oyfmshrwwi73d` (`exam_id`),
  CONSTRAINT `FK75y5n4rt15oyfmshrwwi73d` FOREIGN KEY (`exam_id`) REFERENCES `exam` (`id`),
  CONSTRAINT `FKl7iemhe9amxumih4r8pmylqvb` FOREIGN KEY (`ques_id`) REFERENCES `question` (`ques_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam_question`
--

LOCK TABLES `exam_question` WRITE;
/*!40000 ALTER TABLE `exam_question` DISABLE KEYS */;
INSERT INTO `exam_question` VALUES (2,16),(2,17),(2,18),(2,19),(2,20),(2,21),(2,22),(2,23),(2,24),(2,25),(2,26),(5,113),(5,115),(5,116),(5,117),(5,118),(5,119),(5,120),(5,121),(5,122),(5,190),(6,88),(6,89),(6,90),(6,91),(6,92),(6,93),(6,94),(6,95),(6,96),(6,97),(6,98),(28,62),(28,63),(29,1),(29,31),(29,32),(29,33),(29,34),(29,35),(29,36),(29,37),(29,39),(29,40),(22,1),(22,2),(22,3),(22,4),(22,5),(22,6),(22,7),(22,8),(22,9),(22,10),(22,11),(22,12),(30,63),(30,1),(30,31),(30,32),(30,33),(30,34),(30,35),(30,36),(30,37),(30,39),(30,40),(21,1),(21,2),(21,3),(21,4),(21,5),(21,6),(21,7),(34,113),(34,115),(34,116),(34,117),(34,118),(34,119),(34,120),(34,121),(34,122),(34,190),(35,88),(35,89),(35,90),(35,91),(35,92),(35,93),(35,94),(35,95),(35,96),(35,97),(1,3),(1,4),(1,5),(1,6),(1,7),(1,8),(1,9),(1,10),(1,12);
/*!40000 ALTER TABLE `exam_question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1),(1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `ques_id` int NOT NULL AUTO_INCREMENT,
  `ans` int NOT NULL,
  `chose` int NOT NULL,
  `optiona` varchar(255) DEFAULT NULL,
  `optionb` varchar(255) DEFAULT NULL,
  `optionc` varchar(255) DEFAULT NULL,
  `optiond` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `id_subject` int DEFAULT NULL,
  PRIMARY KEY (`ques_id`),
  KEY `FKgkrmmhtghxqxio4ghkxqw8jbt` (`id_subject`),
  CONSTRAINT `FKgkrmmhtghxqxio4ghkxqw8jbt` FOREIGN KEY (`id_subject`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,4,0,'Người điều khiển xe đạp máy, xe máy điện có bắt buộc đội mũ bảo hiểm không ?','Người tham gia giao thông ở phía trước và ở phía sau người điều khiển giao thông được đi thẳng; người tham gia giao thông ở phía bên phải và bên trái người điều khiển được đi thẳng và rẽ phải.','Người tham gia giao thông ở phía trước và ở phía sau người điều khiển giao thông phải dừng lại; người tham gia giao thông ở phía bên phải và bên trái người điều khiển được đi.','Cả 3 đều đúng','Người tham gia giao thông đường bộ bằng xe môtô hai bánh, ba bánh, xe gắn máy phải đội mũ bảo hiểm có cài quai đúng quy cách khi nào?',NULL),(2,2,-1,'Người điều khiển xe đạp máy, xe máy điện có bắt buộc đội mũ bảo hiểm không ?','Người tham gia giao thông ở phía trước và ở phía sau người điều khiển giao thông được đi thẳng; người tham gia giao thông ở phía bên phải và bên trái người điều khiển được đi thẳng và rẽ phải.','Người tham gia giao thông ở phía trước và ở phía sau người điều khiển giao thông phải dừng lại; người tham gia giao thông ở phía bên phải và bên trái người điều khiển được đi.','Cả 3 đều sai','Người tham gia giao thông đường bộ bằng xe môtô hai bánh, ba bánh, xe gắn máy phải đội mũ bảo hiểm có cài quai đúng quy cách khi nào?',0),(3,3,-1,'Người tham gia giao thông ở tất cả các hướng phải dừng lại.','Người tham gia giao thông ở phía trước và ở phía sau người điều khiển giao thông được đi thẳng; người tham gia giao thông ở phía bên phải và bên trái người điều khiển được đi thẳng và rẽ phải.','Người tham gia giao thông ở phía trước và ở phía sau người điều khiển giao thông phải dừng lại; người tham gia giao thông ở phía bên phải và bên trái người điều khiển được đi.','Cả 3 đều sai','Người tham gia giao thông đường bộ bằng xe môtô hai bánh, ba bánh, xe gắn máy phải đội mũ bảo hiểm có cài quai đúng quy cách khi nào?',0),(4,3,0,'Người tham gia giao thông ở tất cả các hướng phải dừng lại.','Người tham gia giao thông ở phía trước và ở phía sau người điều khiển giao thông được đi thẳng; người tham gia giao thông ở phía bên phải và bên trái người điều khiển được đi thẳng và rẽ phải.','Người tham gia giao thông ở phía trước và ở phía sau người điều khiển giao thông phải dừng lại; người tham gia giao thông ở phía bên phải và bên trái người điều khiển được đi.','Cả 3 đều sai','Người tham gia giao thông đường bộ bằng xe môtô hai bánh, ba bánh, xe gắn máy phải đội mũ bảo hiểm có cài quai đúng quy cách khi nào?',NULL),(5,2,0,'Người tham gia giao thông ở tất cả các hướng phải dừng lại.','Người tham gia giao thông ở phía trước và ở phía sau người điều khiển giao thông được đi thẳng; người tham gia giao thông ở phía bên phải và bên trái người điều khiển được đi thẳng và rẽ phải.','Người tham gia giao thông ở phía trước và ở phía sau người điều khiển giao thông phải dừng lại; người tham gia giao thông ở phía bên phải và bên trái người điều khiển được đi.','Cả 3 đều sai','Người tham gia giao thông đường bộ bằng xe môtô hai bánh, ba bánh, xe gắn máy phải đội mũ bảo hiểm có cài quai đúng quy cách khi nào?',0),(6,2,-1,'Người tham gia giao thông ở tất cả các hướng phải dừng lại.','Người tham gia giao thông ở phía trước và ở phía sau người điều khiển giao thông được đi thẳng; người tham gia giao thông ở phía bên phải và bên trái người điều khiển được đi thẳng và rẽ phải.','Người tham gia giao thông ở phía trước và ở phía sau người điều khiển giao thông phải dừng lại; người tham gia giao thông ở phía bên phải và bên trái người điều khiển được đi.','Cả 3 đều sai','Người tham gia giao thông đường bộ bằng xe môtô hai bánh, ba bánh, xe gắn máy phải đội mũ bảo hiểm có cài quai đúng quy cách khi nào?',0),(7,2,-1,'Người tham gia giao thông ở các hướng phải dừng lại.','Người tham gia giao thông ở phía trước và ở phía sau người điều khiển giao thông phải dừng lại; người tham gia giao thông ở phía bên phải và bên trái người điều khiển được đi.','Tất cả các trường hợp trên.','Cả 3 đều sai','Người tham gia giao thông đường bộ bằng xe môtô hai bánh, ba bánh, xe gắn máy phải đội mũ bảo hiểm có cài quai đúng quy cách khi nào?',0),(8,1,-1,'Người tham gia giao thông ở các hướng phải dừng lại.','Người tham gia giao thông ở phía trước và ở phía sau người điều khiển giao thông phải dừng lại; người tham gia giao thông ở phía bên phải và bên trái người điều khiển được đi.','Tất cả các trường hợp trên.','Cả 3 đều sai','Người tham gia giao thông đường bộ bằng xe môtô hai bánh, ba bánh, xe gắn máy phải đội mũ bảo hiểm có cài quai đúng quy cách khi nào?',0),(9,2,-1,'Người tham gia giao thông ở các hướng phải dừng lại.','Người tham gia giao thông ở phía trước và ở phía sau người điều khiển giao thông phải dừng lại; người tham gia giao thông ở phía bên phải và bên trái người điều khiển được đi.','Tất cả các trường hợp trên.','Cả 3 đều sai','Người tham gia giao thông đường bộ bằng xe môtô hai bánh, ba bánh, xe gắn máy phải đội mũ bảo hiểm có cài quai đúng quy cách khi nào?',0),(10,1,-1,'Người tham gia giao thông ở các hướng phải dừng lại.','Người tham gia giao thông ở phía trước và ở phía sau người điều khiển giao thông phải dừng lại; người tham gia giao thông ở phía bên phải và bên trái người điều khiển được đi.','Tất cả các trường hợp trên.','Cả 3 đều sai','Người tham gia giao thông đường bộ bằng xe môtô hai bánh, ba bánh, xe gắn máy phải đội mũ bảo hiểm có cài quai đúng quy cách khi nào?',0),(11,2,-1,'Người tham gia giao thông ở các hướng phải dừng lại.','Người tham gia giao thông ở phía trước và ở phía sau người điều khiển giao thông phải dừng lại; người tham gia giao thông ở phía bên phải và bên trái người điều khiển được đi.','Tất cả các trường hợp trên.','Cả 3 đều sai','Người tham gia giao thông đường bộ bằng xe môtô hai bánh, ba bánh, xe gắn máy phải đội mũ bảo hiểm có cài quai đúng quy cách khi nào?',0),(12,1,-1,'Người tham gia giao thông ở các hướng phải dừng lại.','Người tham gia giao thông ở phía trước và ở phía sau người điều khiển giao thông phải dừng lại; người tham gia giao thông ở phía bên phải và bên trái người điều khiển được đi.','Tất cả các trường hợp trên.','Cả 3 đều sai','Người tham gia giao thông đường bộ bằng xe môtô hai bánh, ba bánh, xe gắn máy phải đội mũ bảo hiểm có cài quai đúng quy cách khi nào?',0),(13,1,-1,'Trên cầu hẹp có một làn xe.','Không có chướng ngại vật phía trước, không có xe chạy ngược chiều trong đoạn đường định vượt, xe chạy trước không có tín hiệu vượt xe khác và đã tránh về bên phải.','Nơi đường giao nhau, đường bộ giao nhau cùng mức với đường sắt.','Cả 3 đều sai','Người tham gia giao thông đường bộ bằng xe môtô hai bánh, ba bánh, xe gắn máy phải đội mũ bảo hiểm có cài quai đúng quy cách khi nào?',0),(14,2,-1,'Trên cầu hẹp có một làn xe.','Không có chướng ngại vật phía trước, không có xe chạy ngược chiều trong đoạn đường định vượt, xe chạy trước không có tín hiệu vượt xe khác và đã tránh về bên phải.','Nơi đường giao nhau, đường bộ giao nhau cùng mức với đường sắt.','Cả 3 đều sai','Người tham gia giao thông đường bộ bằng xe môtô hai bánh, ba bánh, xe gắn máy phải đội mũ bảo hiểm có cài quai đúng quy cách khi nào?',0),(15,1,-1,'Trên cầu hẹp có một làn xe.','Không có chướng ngại vật phía trước, không có xe chạy ngược chiều trong đoạn đường định vượt, xe chạy trước không có tín hiệu vượt xe khác và đã tránh về bên phải.','Nơi đường giao nhau, đường bộ giao nhau cùng mức với đường sắt.','Cả 3 đều sai','Đèn tín hiệu giao thông dành cho người đi bộ có mấy màu?',0),(16,1,-1,'Trên cầu hẹp có một làn xe.','Không có chướng ngại vật phía trước, không có xe chạy ngược chiều trong đoạn đường định vượt, xe chạy trước không có tín hiệu vượt xe khác và đã tránh về bên phải.','Nơi đường giao nhau, đường bộ giao nhau cùng mức với đường sắt.','Cả 3 đều sai','Đèn tín hiệu giao thông dành cho người đi bộ có mấy màu?',0),(17,3,-1,'Trên cầu hẹp có một làn xe.','Không có chướng ngại vật phía trước, không có xe chạy ngược chiều trong đoạn đường định vượt, xe chạy trước không có tín hiệu vượt xe khác và đã tránh về bên phải.','Nơi đường giao nhau, đường bộ giao nhau cùng mức với đường sắt.','Cả 3 đều sai','Đèn tín hiệu giao thông dành cho người đi bộ có mấy màu?',0),(18,3,-1,'Trên cầu hẹp có một làn xe.','Không có chướng ngại vật phía trước, không có xe chạy ngược chiều trong đoạn đường định vượt, xe chạy trước không có tín hiệu vượt xe khác và đã tránh về bên phải.','Nơi đường giao nhau, đường bộ giao nhau cùng mức với đường sắt.','Cả 3 đều sai','Đèn tín hiệu giao thông dành cho người đi bộ có mấy màu?',0),(19,2,-1,'Hiệu lệnh của biển báo hiệu đường bộ.','Hiệu lệnh của đèn điều khiển giao thông.','Hiệu lệnh của người điều khiển giao thông.','Cả 3 đều sai','Đèn tín hiệu giao thông dành cho người đi bộ có mấy màu?',0),(20,1,-1,'Hiệu lệnh của biển báo hiệu đường bộ.','Hiệu lệnh của đèn điều khiển giao thông.','Hiệu lệnh của người điều khiển giao thông.','Cả 3 đều sai','Đèn tín hiệu giao thông dành cho người đi bộ có mấy màu?',0),(21,3,-1,'Hiệu lệnh của biển báo hiệu đường bộ.','Hiệu lệnh của đèn điều khiển giao thông.','Hiệu lệnh của người điều khiển giao thông.','Cả 3 đều sai','Đèn tín hiệu giao thông dành cho người đi bộ có mấy màu?',0),(22,2,-1,'Hiệu lệnh của biển báo hiệu đường bộ.','Hiệu lệnh của đèn điều khiển giao thông.','Hiệu lệnh của người điều khiển giao thông.','Cả 3 đều sai','Đèn tín hiệu giao thông dành cho người đi bộ có mấy màu?',0),(23,3,-1,'Hiệu lệnh của biển báo hiệu đường bộ.','Hiệu lệnh của đèn điều khiển giao thông.','Hiệu lệnh của người điều khiển giao thông.','Cả 3 đều sai','Đèn tín hiệu giao thông dành cho người đi bộ có mấy màu?',0),(24,1,-1,'Không chấp hành biển nào','Biển báo hiệu cố định.','Biển báo hiệu tạm thời','Cả 3 đều sai','Đèn tín hiệu giao thông dành cho người đi bộ có mấy màu?',0),(25,1,-1,'Không chấp hành biển nào','Biển báo hiệu cố định.','Biển báo hiệu tạm thời','Cả 3 đều sai','Đèn tín hiệu giao thông dành cho người đi bộ có mấy màu?',0),(26,2,-1,'Không chấp hành biển nào','Biển báo hiệu cố định.','Biển báo hiệu tạm thời','Cả 3 đều sai','Tại nơi đường giao nhau có báo hiệu đi theo vòng xuyến, người điều khiển phương tiện phải nhường đường như thế nào?',0),(27,3,-1,'Không chấp hành biển nào','Biển báo hiệu cố định.','Biển báo hiệu tạm thời','Cả 3 đều sai','Tại nơi đường giao nhau có báo hiệu đi theo vòng xuyến, người điều khiển phương tiện phải nhường đường như thế nào?',0),(28,1,-1,'Không chấp hành biển nào','Biển báo hiệu cố định.','Biển báo hiệu tạm thời','Cả 3 đều sai','Tại nơi đường giao nhau có báo hiệu đi theo vòng xuyến, người điều khiển phương tiện phải nhường đường như thế nào?',0),(29,2,-1,'Cảnh sát giao thông, người được giao nhiệm vụ hướng dẫn giao thông tại nơi thi công, nơi ùn tắc giao thông, ở bến phà, tại cầu đường bộ đi chung với đường sắt.','Cảnh sát đặc nhiệm.','Người điều khiển phương tiện tham gia giao thông.','Cả 3 đều sai','Tại nơi đường giao nhau có báo hiệu đi theo vòng xuyến, người điều khiển phương tiện phải nhường đường như thế nào?',0),(30,1,-1,'Cảnh sát giao thông, người được giao nhiệm vụ hướng dẫn giao thông tại nơi thi công, nơi ùn tắc giao thông, ở bến phà, tại cầu đường bộ đi chung với đường sắt.','Cảnh sát đặc nhiệm.','Người điều khiển phương tiện tham gia giao thông.','A đúng , B Sai','Tại nơi đường giao nhau có báo hiệu đi theo vòng xuyến, người điều khiển phương tiện phải nhường đường như thế nào?',0),(31,3,-1,'Cảnh sát giao thông, người được giao nhiệm vụ hướng dẫn giao thông tại nơi thi công, nơi ùn tắc giao thông, ở bến phà, tại cầu đường bộ đi chung với đường sắt.','Cảnh sát đặc nhiệm.','Người điều khiển phương tiện tham gia giao thông.','Cả 3 đều sai','Tại nơi đường giao nhau có báo hiệu đi theo vòng xuyến, người điều khiển phương tiện phải nhường đường như thế nào?',1),(32,3,-1,'Giấy phép lái xe','Chứng nhận đăng kí xe','Vì có ánh sáng từ vật truyền vào mắt ta','Cả 3 đều sai','Tại nơi đường giao nhau có báo hiệu đi theo vòng xuyến, người điều khiển phương tiện phải nhường đường như thế nào?',1),(33,1,-1,'Giấy phép lái xe','Chứng nhận đăng kí xe','Vật sáng bao gồm cả nguồn sáng và vật được chiếu sáng','Cả 3 đều sai','Tại nơi đường giao nhau giữa đường không ưu tiên và đường ưu tiên hoặc giữa đường nhánh và đường chính người lái xe phải xử lý như thế nào?',1),(34,2,-1,'Giấy phép lái xe','Chứng nhận đăng kí xe','Bảo hiểm dân sự','Cả 3 đều sai','Tại nơi đường giao nhau giữa đường không ưu tiên và đường ưu tiên hoặc giữa đường nhánh và đường chính người lái xe phải xử lý như thế nào?',1),(35,2,-1,'Giấy phép lái xe','Chứng nhận đăng kí xe','Bảo hiểm dân sự','Cả 3 đều sai','Tại nơi đường giao nhau giữa đường không ưu tiên và đường ưu tiên hoặc giữa đường nhánh và đường chính người lái xe phải xử lý như thế nào?',1),(36,3,-1,'Giấy phép lái xe','Chứng nhận đăng kí xe','Bảo hiểm dân sự','Cả 3 đều sai','Tại nơi đường giao nhau giữa đường không ưu tiên và đường ưu tiên hoặc giữa đường nhánh và đường chính người lái xe phải xử lý như thế nào?',1),(37,3,-1,'Giấy phép lái xe','Chứng nhận đăng kí xe','Bảo hiểm dân sự','Cả 3 đều sai','Trong đô thị trường hợp nào dưới đây xe không được dùng còi (trừ các xe ưu tiên theo Luật định)?',1),(38,3,-1,'Giấy phép lái xe','Chứng nhận đăng kí xe','Bảo hiểm dân sự','Cả 3 đều sai','Trong đô thị trường hợp nào dưới đây xe không được dùng còi (trừ các xe ưu tiên theo Luật định)?',1),(39,3,-1,'Giấy phép lái xe','Chứng nhận đăng kí xe','Bảo hiểm dân sự','Cả 3 đều sai','Trong đô thị trường hợp nào dưới đây xe không được dùng còi (trừ các xe ưu tiên theo Luật định)?',1),(40,3,-1,'Giấy phép lái xe','Chứng nhận đăng kí xe','Bảo hiểm dân sự','Cả 3 đều sai','Trong đô thị trường hợp nào dưới đây xe không được dùng còi (trừ các xe ưu tiên theo Luật định)?',1),(41,2,-1,'Giấy phép lái xe','Chứng nhận đăng kí xe','Bảo hiểm dân sự','Cả 3 đều sai','Trong đô thị trường hợp nào dưới đây xe không được dùng còi (trừ các xe ưu tiên theo Luật định)?',1),(42,2,-1,'Chứng nhận đăng kí xe và bảo hiểm dân sự.','Giấy phép lái xe',' Giấy phép lái xe, Chứng nhận đăng kí xe và Bảo hiểm dân sự.','Cả 3 đều sai','Trong đô thị trường hợp nào dưới đây xe không được dùng còi (trừ các xe ưu tiên theo Luật định)?',1),(43,3,-1,'Chứng nhận đăng kí xe và bảo hiểm dân sự.','Giấy phép lái xe',' Giấy phép lái xe, Chứng nhận đăng kí xe và Bảo hiểm dân sự.','Cả 3 đều sai','Trong đô thị trường hợp nào dưới đây xe không được dùng còi (trừ các xe ưu tiên theo Luật định)?',1),(44,3,-1,'Chứng nhận đăng kí xe và bảo hiểm dân sự.','Giấy phép lái xe',' Giấy phép lái xe, Chứng nhận đăng kí xe và Bảo hiểm dân sự.','Cả 3 đều sai','Trong đô thị trường hợp nào dưới đây xe không được dùng còi (trừ các xe ưu tiên theo Luật định)?',1),(45,3,-1,'Chứng nhận đăng kí xe và bảo hiểm dân sự.','Giấy phép lái xe',' Giấy phép lái xe, Chứng nhận đăng kí xe và Bảo hiểm dân sự.','Cả 3 đều sai','Trong đô thị trường hợp nào dưới đây xe không được dùng còi (trừ các xe ưu tiên theo Luật định)?',1),(46,3,-1,'Chứng nhận đăng kí xe và bảo hiểm dân sự.','Giấy phép lái xe',' Giấy phép lái xe, Chứng nhận đăng kí xe và Bảo hiểm dân sự.','Cả 3 đều sai','Trong những trường hợp sau, trường hợp nào ánh sáng truyền đi theo đường thẳng',1),(47,2,-1,'Chứng nhận đăng kí xe và bảo hiểm dân sự.','Giấy phép lái xe',' Giấy phép lái xe, Chứng nhận đăng kí xe và Bảo hiểm dân sự.','Cả 3 đều sai','Khi gặp một đoàn xe, một đoàn xe tang hay một đoàn người có tổ chức đi theo hàng ngũ, người lái xe phải xử lý như thế nào cho đúng quy tắc giao thông?',1),(48,3,-1,'Chứng nhận đăng kí xe và bảo hiểm dân sự.','Giấy phép lái xe',' Giấy phép lái xe, Chứng nhận đăng kí xe và Bảo hiểm dân sự.','Cả 3 đều sai','Khi gặp một đoàn xe, một đoàn xe tang hay một đoàn người có tổ chức đi theo hàng ngũ, người lái xe phải xử lý như thế nào cho đúng quy tắc giao thông?',1),(49,2,-1,'Tiếp tục đi nhưng phải chú ý quan sát tránh gây tai nạn giao thông.','Được đi tiếp nhưng chỉ được rẽ trái.','Dừng lại trước vạch dừng.','Cả 3 đều sai','Khi gặp một đoàn xe, một đoàn xe tang hay một đoàn người có tổ chức đi theo hàng ngũ, người lái xe phải xử lý như thế nào cho đúng quy tắc giao thông?',1),(50,2,-1,'Tiếp tục đi nhưng phải chú ý quan sát tránh gây tai nạn giao thông.','Được đi tiếp nhưng chỉ được rẽ trái.','Dừng lại trước vạch dừng.','Cả 3 đều sai','Khi gặp một đoàn xe, một đoàn xe tang hay một đoàn người có tổ chức đi theo hàng ngũ, người lái xe phải xử lý như thế nào cho đúng quy tắc giao thông?',1),(51,3,-1,'Tiếp tục đi nhưng phải chú ý quan sát tránh gây tai nạn giao thông.','Được đi tiếp nhưng chỉ được rẽ trái.','Dừng lại trước vạch dừng.','Cả 3 đều sai','Người điều khiển xe môtô hai bánh, ba bánh có dung tích xi lanh từ 50 cm3 trở lên phải đủ bao nhiêu tuổi?',1),(52,3,-1,'Tiếp tục đi nhưng phải chú ý quan sát tránh gây tai nạn giao thông.','Được đi tiếp nhưng chỉ được rẽ trái.','Dừng lại trước vạch dừng.','Cả 3 đều sai','Người điều khiển xe môtô hai bánh, ba bánh có dung tích xi lanh từ 50 cm3 trở lên phải đủ bao nhiêu tuổi?',1),(53,3,-1,'Tiếp tục đi nhưng phải chú ý quan sát tránh gây tai nạn giao thông.','Được đi tiếp nhưng chỉ được rẽ trái.','Dừng lại trước vạch dừng.','Cả 3 đều sai','Người điều khiển xe môtô hai bánh, ba bánh có dung tích xi lanh từ 50 cm3 trở lên phải đủ bao nhiêu tuổi?',1),(54,3,-1,'Người điều khiển, người sử dụng phương tiện tham gia giao thông đường bộ.','Người điều khiển, dẫn dắt súc vật.','Người điều khiển, người sử dụng phương tiện tham gia giao thông đường bộ. Người điều khiển, dẫn dắt súc vật và người đi bộ trên đường bộ.','Cả 3 đều sai','Người điều khiển xe môtô hai bánh, ba bánh có dung tích xi lanh từ 50 cm3 trở lên phải đủ bao nhiêu tuổi?',1),(55,2,-1,'Người điều khiển, người sử dụng phương tiện tham gia giao thông đường bộ.','Người điều khiển, dẫn dắt súc vật.','Người điều khiển, người sử dụng phương tiện tham gia giao thông đường bộ. Người điều khiển, dẫn dắt súc vật và người đi bộ trên đường bộ.','Cả 3 đều sai','Người điều khiển xe môtô hai bánh, ba bánh có dung tích xi lanh từ 50 cm3 trở lên phải đủ bao nhiêu tuổi?',1),(56,3,-1,'Người điều khiển, người sử dụng phương tiện tham gia giao thông đường bộ.','Người điều khiển, dẫn dắt súc vật.','Người điều khiển, người sử dụng phương tiện tham gia giao thông đường bộ. Người điều khiển, dẫn dắt súc vật và người đi bộ trên đường bộ.','Cả 3 đều sai','Người điều khiển xe môtô hai bánh, ba bánh có dung tích xi lanh từ 50 cm3 trở lên phải đủ bao nhiêu tuổi?',1),(57,3,-1,'Người điều khiển, người sử dụng phương tiện tham gia giao thông đường bộ.','Người điều khiển, dẫn dắt súc vật.','Người điều khiển, người sử dụng phương tiện tham gia giao thông đường bộ. Người điều khiển, dẫn dắt súc vật và người đi bộ trên đường bộ.','Cả 3 đều sai','Trên đường bộ trong khu vực đông dân cư xe môtô hai bánh, ba bánh, xe máy được lưu thông với tốc độ tối đa là bao nhiêu km/h?',1),(58,3,-1,'Người điều khiển, người sử dụng phương tiện tham gia giao thông đường bộ.','Người điều khiển, dẫn dắt súc vật.','Người điều khiển, người sử dụng phương tiện tham gia giao thông đường bộ. Người điều khiển, dẫn dắt súc vật và người đi bộ trên đường bộ.','Cả 3 đều sai','Trên đường bộ trong khu vực đông dân cư xe môtô hai bánh, ba bánh, xe máy được lưu thông với tốc độ tối đa là bao nhiêu km/h?',1),(59,1,-1,'Đi bên phải theo chiều đi của mình.','Đi đúng phần đường quy định','Đi bên phải theo chiều đi của mình, đi đúng phần đường quy định và chấp hành hệ thống báo hiệu đường bộ.','Cả 3 đều sai','Trên đường bộ trong khu vực đông dân cư xe môtô hai bánh, ba bánh, xe máy được lưu thông với tốc độ tối đa là bao nhiêu km/h?',1),(60,2,-1,'Đi bên phải theo chiều đi của mình.','Đi đúng phần đường quy định','Đi bên phải theo chiều đi của mình, đi đúng phần đường quy định và chấp hành hệ thống báo hiệu đường bộ.','Cả 3 đều sai','Trên đường bộ trong khu vực đông dân cư xe môtô hai bánh, ba bánh, xe máy được lưu thông với tốc độ tối đa là bao nhiêu km/h?',1),(61,3,-1,'Đi bên phải theo chiều đi của mình.','Đi đúng phần đường quy định','Đi bên phải theo chiều đi của mình, đi đúng phần đường quy định và chấp hành hệ thống báo hiệu đường bộ.','Cả 3 đều sai','Trên đường bộ trong khu vực đông dân cư xe môtô hai bánh, ba bánh, xe máy được lưu thông với tốc độ tối đa là bao nhiêu km/h?',1),(62,3,-1,'Đi bên phải theo chiều đi của mình.','Đi đúng phần đường quy định','Đi bên phải theo chiều đi của mình, đi đúng phần đường quy định và chấp hành hệ thống báo hiệu đường bộ.','Cả 3 đều sai','Trên đường bộ trong khu vực đông dân cư xe môtô hai bánh, ba bánh, xe máy được lưu thông với tốc độ tối đa là bao nhiêu km/h?',1),(63,3,-1,'Đi bên phải theo chiều đi của mình.','Đi đúng phần đường quy định','Đi bên phải theo chiều đi của mình, đi đúng phần đường quy định và chấp hành hệ thống báo hiệu đường bộ.','Cả 3 đều sai','Trên đường bộ trong khu vực đông dân cư xe môtô hai bánh, ba bánh, xe máy được lưu thông với tốc độ tối đa là bao nhiêu km/h?',1),(64,3,-1,'Đi bên phải theo chiều đi của mình.','Đi đúng phần đường quy định','Đi bên phải theo chiều đi của mình, đi đúng phần đường quy định và chấp hành hệ thống báo hiệu đường bộ.','Cả 3 đều sai','Người ngồi trên xe mô tô hai bánh, ba bánh, xe gắn máy khi tham gia giao thông có được mang vác vật cồng kềnh hay không?',1),(65,1,-1,'Đi bên phải theo chiều đi của mình.','Đi đúng phần đường quy định','Đi bên phải theo chiều đi của mình, đi đúng phần đường quy định và chấp hành hệ thống báo hiệu đường bộ.','Cả 3 đều sai','Người ngồi trên xe mô tô hai bánh, ba bánh, xe gắn máy khi tham gia giao thông có được mang vác vật cồng kềnh hay không?',1),(66,2,-1,'Xe thô sơ phải đi trên làn đường bên trái trong cùng, xe cơ giới, xe máy chuyên dùng đi trên làn đường bên phải.','Xe thô sơ phải đi trên làn đường phù hợp không gây cản trở giao thông, xe cơ giới, xe máy chuyên dùng đi trên làn đường bên phải.',' Xe thô sơ phải đi trên làn đường bên phải trong cùng, xe cơ giới, xe máy chuyên dùng đi trên làn đường bên trái.','Cả 3 đều sai','Người ngồi trên xe mô tô hai bánh, ba bánh, xe gắn máy khi tham gia giao thông có được mang vác vật cồng kềnh hay không?',1),(67,3,-1,'Xe thô sơ phải đi trên làn đường bên trái trong cùng, xe cơ giới, xe máy chuyên dùng đi trên làn đường bên phải.','Xe thô sơ phải đi trên làn đường phù hợp không gây cản trở giao thông, xe cơ giới, xe máy chuyên dùng đi trên làn đường bên phải.',' Xe thô sơ phải đi trên làn đường bên phải trong cùng, xe cơ giới, xe máy chuyên dùng đi trên làn đường bên trái.','Cả 3 đều sai','Người ngồi trên xe mô tô hai bánh, ba bánh, xe gắn máy khi tham gia giao thông có được mang vác vật cồng kềnh hay không?',1),(68,3,-1,'Xe thô sơ phải đi trên làn đường bên trái trong cùng, xe cơ giới, xe máy chuyên dùng đi trên làn đường bên phải.','Xe thô sơ phải đi trên làn đường phù hợp không gây cản trở giao thông, xe cơ giới, xe máy chuyên dùng đi trên làn đường bên phải.',' Xe thô sơ phải đi trên làn đường bên phải trong cùng, xe cơ giới, xe máy chuyên dùng đi trên làn đường bên trái.','Cả 3 đều sai','Người ngồi trên xe mô tô hai bánh, ba bánh, xe gắn máy khi tham gia giao thông có được mang vác vật cồng kềnh hay không?',1),(69,2,-1,'Xe thô sơ phải đi trên làn đường bên trái trong cùng, xe cơ giới, xe máy chuyên dùng đi trên làn đường bên phải.','Xe thô sơ phải đi trên làn đường phù hợp không gây cản trở giao thông, xe cơ giới, xe máy chuyên dùng đi trên làn đường bên phải.',' Xe thô sơ phải đi trên làn đường bên phải trong cùng, xe cơ giới, xe máy chuyên dùng đi trên làn đường bên trái.','Cả 3 đều sai','Người ngồi trên xe mô tô hai bánh, ba bánh, xe gắn máy khi tham gia giao thông có được mang vác vật cồng kềnh hay không?',1),(70,1,-1,'Xe thô sơ phải đi trên làn đường bên trái trong cùng, xe cơ giới, xe máy chuyên dùng đi trên làn đường bên phải.','Xe thô sơ phải đi trên làn đường phù hợp không gây cản trở giao thông, xe cơ giới, xe máy chuyên dùng đi trên làn đường bên phải.',' Xe thô sơ phải đi trên làn đường bên phải trong cùng, xe cơ giới, xe máy chuyên dùng đi trên làn đường bên trái.','Cả 3 đều sai','Người ngồi trên xe mô tô hai bánh, ba bánh, xe gắn máy khi tham gia giao thông có được mang vác vật cồng kềnh hay không?',1),(71,2,-1,'Xe thô sơ phải đi trên làn đường bên trái trong cùng, xe cơ giới, xe máy chuyên dùng đi trên làn đường bên phải.','Xe thô sơ phải đi trên làn đường phù hợp không gây cản trở giao thông, xe cơ giới, xe máy chuyên dùng đi trên làn đường bên phải.',' Xe thô sơ phải đi trên làn đường bên phải trong cùng, xe cơ giới, xe máy chuyên dùng đi trên làn đường bên trái.','Cả 3 đều sai','Người ngồi trên xe mô tô hai bánh, ba bánh, xe gắn máy khi tham gia giao thông có được mang vác vật cồng kềnh hay không?',1),(72,3,-1,'Xe thô sơ phải đi trên làn đường bên trái trong cùng, xe cơ giới, xe máy chuyên dùng đi trên làn đường bên phải.','Xe thô sơ phải đi trên làn đường phù hợp không gây cản trở giao thông, xe cơ giới, xe máy chuyên dùng đi trên làn đường bên phải.',' Xe thô sơ phải đi trên làn đường bên phải trong cùng, xe cơ giới, xe máy chuyên dùng đi trên làn đường bên trái.','Cả 3 đều sai','Người ngồi trên xe mô tô hai bánh, ba bánh, xe gắn máy khi tham gia giao thông có được mang vác vật cồng kềnh hay không?',1),(73,3,-1,'Phải nhanh chóng giảm tốc độ, tránh hoặc dừng lại sát lề đường bên phải để nhường đường. Không được gây cản trở xe được ưu tiên','Phải nhanh chóng giảm tốc độ, tránh hoặc dừng lại sát lề đường bên phải để nhường đường','Phải nhanh chóng giảm tốc độ, tránh sát lề đường để nhường đường cho xe ưu tiên. Cấm các hành vi gây cản trở xe ưu tiên.','Cả 3 đều sai','Người ngồi trên xe mô tô hai bánh, ba bánh, xe gắn máy khi tham gia giao thông có được mang vác vật cồng kềnh hay không?',1),(74,2,-1,'Phải nhanh chóng giảm tốc độ, tránh hoặc dừng lại sát lề đường bên phải để nhường đường. Không được gây cản trở xe được ưu tiên','Phải nhanh chóng giảm tốc độ, tránh hoặc dừng lại sát lề đường bên phải để nhường đường','Phải nhanh chóng giảm tốc độ, tránh sát lề đường để nhường đường cho xe ưu tiên. Cấm các hành vi gây cản trở xe ưu tiên.','Cả 3 đều sai','Người ngồi trên xe mô tô hai bánh, ba bánh, xe gắn máy khi tham gia giao thông có được mang vác vật cồng kềnh hay không?',1),(75,2,-1,'Phải nhanh chóng giảm tốc độ, tránh hoặc dừng lại sát lề đường bên phải để nhường đường. Không được gây cản trở xe được ưu tiên','Phải nhanh chóng giảm tốc độ, tránh hoặc dừng lại sát lề đường bên phải để nhường đường','Phải nhanh chóng giảm tốc độ, tránh sát lề đường để nhường đường cho xe ưu tiên. Cấm các hành vi gây cản trở xe ưu tiên.','Cả 3 đều sai','Trong khi chuyển hướng, người điều khiển phương tiện tham gia giao thông phải nhường đường như thế nào?',1),(76,1,-1,'Phải nhanh chóng giảm tốc độ, tránh hoặc dừng lại sát lề đường bên phải để nhường đường. Không được gây cản trở xe được ưu tiên','Phải nhanh chóng giảm tốc độ, tránh hoặc dừng lại sát lề đường bên phải để nhường đường','Phải nhanh chóng giảm tốc độ, tránh sát lề đường để nhường đường cho xe ưu tiên. Cấm các hành vi gây cản trở xe ưu tiên.','Cả 3 đều sai','Trong khi chuyển hướng, người điều khiển phương tiện tham gia giao thông phải nhường đường như thế nào?',1),(77,2,-1,'Phải nhanh chóng giảm tốc độ, tránh hoặc dừng lại sát lề đường bên phải để nhường đường. Không được gây cản trở xe được ưu tiên','Phải nhanh chóng giảm tốc độ, tránh hoặc dừng lại sát lề đường bên phải để nhường đường','Phải nhanh chóng giảm tốc độ, tránh sát lề đường để nhường đường cho xe ưu tiên. Cấm các hành vi gây cản trở xe ưu tiên.','Cả 3 đều sai','Trong khi chuyển hướng, người điều khiển phương tiện tham gia giao thông phải nhường đường như thế nào?',0),(78,3,-1,'Phải nhanh chóng giảm tốc độ, tránh hoặc dừng lại sát lề đường bên phải để nhường đường. Không được gây cản trở xe được ưu tiên','Phải nhanh chóng giảm tốc độ, tránh hoặc dừng lại sát lề đường bên phải để nhường đường','Phải nhanh chóng giảm tốc độ, tránh sát lề đường để nhường đường cho xe ưu tiên. Cấm các hành vi gây cản trở xe ưu tiên.','Cả 3 đều sai','Trong đô thị và khu đông dân cư từ 22 giờ đến 5 giờ xe xin vượt phải báo hiệu như thế nào?',0),(79,3,-1,'Phải nhanh chóng giảm tốc độ, tránh hoặc dừng lại sát lề đường bên phải để nhường đường. Không được gây cản trở xe được ưu tiên','Phải nhanh chóng giảm tốc độ, tránh hoặc dừng lại sát lề đường bên phải để nhường đường','Phải nhanh chóng giảm tốc độ, tránh sát lề đường để nhường đường cho xe ưu tiên. Cấm các hành vi gây cản trở xe ưu tiên.','Cả 3 đều sai','Trong đô thị và khu đông dân cư từ 22 giờ đến 5 giờ xe xin vượt phải báo hiệu như thế nào?',0),(80,2,-1,'Phải nhanh chóng giảm tốc độ, tránh hoặc dừng lại sát lề đường bên phải để nhường đường. Không được gây cản trở xe được ưu tiên','Phải nhanh chóng giảm tốc độ, tránh hoặc dừng lại sát lề đường bên phải để nhường đường','Phải nhanh chóng giảm tốc độ, tránh sát lề đường để nhường đường cho xe ưu tiên. Cấm các hành vi gây cản trở xe ưu tiên.','Cả 3 đều sai','Trong đô thị và khu đông dân cư từ 22 giờ đến 5 giờ xe xin vượt phải báo hiệu như thế nào?',0),(81,2,-1,'Phải nhanh chóng giảm tốc độ, tránh sát lề đường để nhường đường cho xe ưu tiên. Cấm các hành vi gây cản trở xe ưu tiên.','Bóp còi, rú ga để cắt ngang qua.','Chờ đoàn xe, đoàn người đi qua hết thì tiếp tục lưu thông.','Cả 3 đều sai','Trong đô thị và khu đông dân cư từ 22 giờ đến 5 giờ xe xin vượt phải báo hiệu như thế nào?',0),(82,1,-1,'Phải nhanh chóng giảm tốc độ, tránh sát lề đường để nhường đường cho xe ưu tiên. Cấm các hành vi gây cản trở xe ưu tiên.','Bóp còi, rú ga để cắt ngang qua.','Chờ đoàn xe, đoàn người đi qua hết thì tiếp tục lưu thông.','Cả 3 đều sai','Trường hợp nào dưới đây được quy định trong luật giao thông đường bộ?',0),(83,2,-1,'Báo hiệu và từ từ cho xe đi qua để đảm bảo an toàn.','Khi đi trên các tuyến đường quốc lộ','Khi đi trên các tuyến đường giao thông trong thành phố, thị xã, thị trấn, khu vực đông dân cư.','Cả 3 đều sai','Trường hợp nào dưới đây được quy định trong luật giao thông đường bộ?',0),(84,2,-1,'Báo hiệu và từ từ cho xe đi qua để đảm bảo an toàn.','Khi đi trên các tuyến đường quốc lộ','Khi đi trên các tuyến đường giao thông trong thành phố, thị xã, thị trấn, khu vực đông dân cư.','Cả 3 đều sai','Trường hợp nào dưới đây được quy định trong luật giao thông đường bộ?',0),(85,3,-1,'Báo hiệu và từ từ cho xe đi qua để đảm bảo an toàn.','Khi đi trên các tuyến đường quốc lộ','Khi đi trên các tuyến đường giao thông trong thành phố, thị xã, thị trấn, khu vực đông dân cư.','Cả 3 đều sai','Người điều khiển phương tiện được dừng xe, đỗ xe tại các vị trí nào sau đây?',0),(86,2,-1,'Báo hiệu và từ từ cho xe đi qua để đảm bảo an toàn.','Khi đi trên các tuyến đường quốc lộ','Khi đi trên các tuyến đường giao thông trong thành phố, thị xã, thị trấn, khu vực đông dân cư.','Cả 3 đều sai','Người điều khiển phương tiện được dừng xe, đỗ xe tại các vị trí nào sau đây?',0),(87,1,-1,'Báo hiệu và từ từ cho xe đi qua để đảm bảo an toàn.','Khi đi trên các tuyến đường quốc lộ','Khi đi trên các tuyến đường giao thông trong thành phố, thị xã, thị trấn, khu vực đông dân cư.','Cả 3 đều sai','Người điều khiển phương tiện được dừng xe, đỗ xe tại các vị trí nào sau đây?',0),(88,3,-1,'Khi qua nơi có trường học trẻ em đi lại trên đường.','Khi qua nơi đông người tụ họp, đi lại trên đường.','Khi qua ngã ba, ngã tư, trong thành phố, thị xã, thị trấn đông người qua lại.','Cả 3 đều sai','Người điều khiển phương tiện được dừng xe, đỗ xe tại các vị trí nào sau đây?',2),(89,3,-1,'Khi qua nơi có trường học trẻ em đi lại trên đường.','Khi qua nơi đông người tụ họp, đi lại trên đường.','Khi qua ngã ba, ngã tư, trong thành phố, thị xã, thị trấn đông người qua lại.','Cả 3 đều sai','Xe mô tô, xe gắn máy không được xếp hàng hóa, hành lý vượt chiều cao tính từ mặt đường xe chạy trở lên là bao nhiêu?',2),(90,3,-1,'Khi qua nơi có trường học trẻ em đi lại trên đường.','Khi qua nơi đông người tụ họp, đi lại trên đường.','Khi qua ngã ba, ngã tư, trong thành phố, thị xã, thị trấn đông người qua lại.','Cả 3 đều sai','Xe mô tô, xe gắn máy không được xếp hàng hóa, hành lý vượt chiều cao tính từ mặt đường xe chạy trở lên là bao nhiêu?',2),(91,1,-1,'Khi qua nơi có trường học trẻ em đi lại trên đường.','Khi qua nơi đông người tụ họp, đi lại trên đường.','Khi qua ngã ba, ngã tư, trong thành phố, thị xã, thị trấn đông người qua lại.','Cả 3 đều sai','Xe mô tô, xe gắn máy không được xếp hàng hóa, hành lý vượt chiều cao tính từ mặt đường xe chạy trở lên là bao nhiêu?',2),(92,3,-1,'Khi qua nơi có trường học trẻ em đi lại trên đường.','Khi qua nơi đông người tụ họp, đi lại trên đường.','Khi qua ngã ba, ngã tư, trong thành phố, thị xã, thị trấn đông người qua lại.','Cả 3 đều sai','Xe mô tô, xe gắn máy không được xếp hàng hóa, hành lý vượt chiều cao tính từ mặt đường xe chạy trở lên là bao nhiêu?',2),(93,2,-1,'Khi qua nơi có trường học trẻ em đi lại trên đường.','Khi qua nơi đông người tụ họp, đi lại trên đường.','Khi qua ngã ba, ngã tư, trong thành phố, thị xã, thị trấn đông người qua lại.','Cả 3 đều sai','Xe mô tô, xe gắn máy không được xếp hàng hóa, hành lý vượt chiều cao tính từ mặt đường xe chạy trở lên là bao nhiêu?',2),(94,2,-1,'Khi qua nơi có trường học trẻ em đi lại trên đường.','Khi qua nơi đông người tụ họp, đi lại trên đường.','Khi qua ngã ba, ngã tư, trong thành phố, thị xã, thị trấn đông người qua lại.','Cả 3 đều sai','Xe mô tô, xe gắn máy không được xếp hàng hóa, hành lý vượt chiều cao tính từ mặt đường xe chạy trở lên là bao nhiêu?',2),(95,3,-1,'Khi qua nơi có trường học trẻ em đi lại trên đường.','Khi qua nơi đông người tụ họp, đi lại trên đường.','Khi qua ngã ba, ngã tư, trong thành phố, thị xã, thị trấn đông người qua lại.','Cả 3 đều sai','Người ngồi trên xe mô tô hai bánh, xe mô tô ba bánh, xe gắn máy khi tham gia giao thông được thực hiện các hành vi sau đây?',2),(96,1,-1,'Khi qua nơi có trường học trẻ em đi lại trên đường.','Khi qua nơi đông người tụ họp, đi lại trên đường.','Khi qua ngã ba, ngã tư, trong thành phố, thị xã, thị trấn đông người qua lại.','Cả 3 đều sai','Người ngồi trên xe mô tô hai bánh, xe mô tô ba bánh, xe gắn máy khi tham gia giao thông được thực hiện các hành vi sau đây?',2),(97,2,-1,'Xe báo hiệu xin đường trước xe đó được đi trước.',' Phải nhường đường cho xe đi bên phải.','Phải nhường đường cho xe đi bên trái.','Cả 3 đều sai','Người ngồi trên xe mô tô hai bánh, xe mô tô ba bánh, xe gắn máy khi tham gia giao thông được thực hiện các hành vi sau đây?',2),(98,3,-1,'Xe báo hiệu xin đường trước xe đó được đi trước.',' Phải nhường đường cho xe đi bên phải.','Phải nhường đường cho xe đi bên trái.','Cả 3 đều sai','Người ngồi trên xe mô tô hai bánh, xe mô tô ba bánh, xe gắn máy khi tham gia giao thông được thực hiện các hành vi sau đây?',2),(99,2,-1,'Xe báo hiệu xin đường trước xe đó được đi trước.',' Phải nhường đường cho xe đi bên phải.','Phải nhường đường cho xe đi bên trái.','Cả 3 đều sai','Người điều khiển xe đạp chỉ được chở một người, trường hợp nào dưới đây thì được chở tối đa hai người?',2),(100,1,-1,'Xe báo hiệu xin đường trước xe đó được đi trước.',' Phải nhường đường cho xe đi bên phải.','Phải nhường đường cho xe đi bên trái.','Cả 3 đều sai','Người điều khiển xe đạp chỉ được chở một người, trường hợp nào dưới đây thì được chở tối đa hai người?',2),(101,3,-1,'Xe báo hiệu xin đường trước xe đó được đi trước.',' Phải nhường đường cho xe đi bên phải.','Phải nhường đường cho xe đi bên trái.','Cả 3 đều sai','Người điều khiển xe đạp chỉ được chở một người, trường hợp nào dưới đây thì được chở tối đa hai người?',0),(102,2,-1,'Xe báo hiệu xin đường trước xe đó được đi trước.',' Phải nhường đường cho xe đi bên phải.','Phải nhường đường cho xe đi bên trái.','Cả 3 đều sai','Giá trị của chữ số 6 trong số 8 365 927 là:',0),(103,1,-1,'Xe báo hiệu xin đường trước xe đó được đi trước.',' Phải nhường đường cho xe đi bên phải.','Phải nhường đường cho xe đi bên trái.','Cả 3 đều sai','Giá trị của biểu thức 25+38×m với m = 8 là ....',0),(104,1,-1,'Xe báo hiệu xin đường trước xe đó được đi trước.',' Phải nhường đường cho xe đi bên phải.','Phải nhường đường cho xe đi bên trái.','Cả 3 đều sai','Số gồm hai tỉ và năm trăm nghìn có số chữ số 0 là:',0),(105,1,-1,'Xe báo hiệu xin đường trước xe đó được đi trước.',' Phải nhường đường cho xe đi bên phải.','Phải nhường đường cho xe đi bên trái.','Cả 3 đều sai','Người điều khiển xe đạp chỉ được chở một người, trường hợp nào dưới đây thì được chở tối đa hai người?',0),(106,1,-1,'Nhường đường cho xe chạy ở bên phải mình tới.','Nhường đường cho xe chạy ở bên trái mình tới.','Nhường đường cho xe đi trên đường ưu tiên hoặc đường chính từ bất kỳ hướng nào tới','Cả 3 đều sai','Người điều khiển xe đạp chỉ được chở một người, trường hợp nào dưới đây thì được chở tối đa hai người?',0),(107,2,-1,'Nhường đường cho xe chạy ở bên phải mình tới.','Nhường đường cho xe chạy ở bên trái mình tới.','Nhường đường cho xe đi trên đường ưu tiên hoặc đường chính từ bất kỳ hướng nào tới','Cả 3 đều sai','Ai là người có trách nhiệm giúp đỡ trẻ em dưới 7 tuổi khi đi qua đường?',0),(108,3,-1,'Nhường đường cho xe chạy ở bên phải mình tới.','Nhường đường cho xe chạy ở bên trái mình tới.','Nhường đường cho xe đi trên đường ưu tiên hoặc đường chính từ bất kỳ hướng nào tới','Cả 3 đều sai','Ai là người có trách nhiệm giúp đỡ trẻ em dưới 7 tuổi khi đi qua đường?',0),(109,1,-1,'Nhường đường cho xe chạy ở bên phải mình tới.','Nhường đường cho xe chạy ở bên trái mình tới.','Nhường đường cho xe đi trên đường ưu tiên hoặc đường chính từ bất kỳ hướng nào tới','Cả 3 đều sai','Ai là người có trách nhiệm giúp đỡ trẻ em dưới 7 tuổi khi đi qua đường?',0),(110,3,-1,'Nhường đường cho xe chạy ở bên phải mình tới.','Nhường đường cho xe chạy ở bên trái mình tới.','Nhường đường cho xe đi trên đường ưu tiên hoặc đường chính từ bất kỳ hướng nào tới','Cả 3 đều sai','Ai là người có trách nhiệm giúp đỡ trẻ em dưới 7 tuổi khi đi qua đường?',0),(111,2,-1,'Nhường đường cho xe chạy ở bên phải mình tới.','Nhường đường cho xe chạy ở bên trái mình tới.','Nhường đường cho xe đi trên đường ưu tiên hoặc đường chính từ bất kỳ hướng nào tới','Cả 3 đều sai','Ai là người có trách nhiệm giúp đỡ trẻ em dưới 7 tuổi khi đi qua đường?',0),(112,3,-1,'Nhường đường cho xe chạy ở bên phải mình tới.','Nhường đường cho xe chạy ở bên trái mình tới.','Nhường đường cho xe đi trên đường ưu tiên hoặc đường chính từ bất kỳ hướng nào tới','Cả 3 đều sai','Ai là người có trách nhiệm giúp đỡ trẻ em dưới 7 tuổi khi đi qua đường?',0),(113,2,-1,'Người điều khiển xe đạp máy, xe máy điện có bắt buộc đội mũ bảo hiểm không ?','Hầm đường bộ, bến phà đường bộ','Là phần của đường bộ được sử dụng cho các phương tiện qua lại','Cả 3 đều sai','Ở nơi không có đèn tín hiệu, không có vạch kẻ đường, cầu vượt, hầm dành cho người đi bộ, thì người đi bộ phải qua đường như thế nào cho an toàn?',3),(115,1,-1,'Người điều khiển xe đạp máy, xe máy điện có bắt buộc đội mũ bảo hiểm không ?','Hầm đường bộ, bến phà đường bộ','Là phần của đường bộ được sử dụng cho các phương tiện qua lại','Cả 3 đều sai','Ở nơi không có đèn tín hiệu, không có vạch kẻ đường, cầu vượt, hầm dành cho người đi bộ, thì người đi bộ phải qua đường như thế nào cho an toàn?',3),(116,2,-1,' Đường, cầu đường bộ','Hầm đường bộ, bến phà đường bộ','Là phần của đường bộ được sử dụng cho các phương tiện qua lại','Cả 3 đều sai','Ở nơi không có đèn tín hiệu, không có vạch kẻ đường, cầu vượt, hầm dành cho người đi bộ, thì người đi bộ phải qua đường như thế nào cho an toàn?',3),(117,3,-1,' Đường, cầu đường bộ','Hầm đường bộ, bến phà đường bộ','Là phần của đường bộ được sử dụng cho các phương tiện qua lại','Cả 3 đều sai','Ở nơi không có đèn tín hiệu, không có vạch kẻ đường, cầu vượt, hầm dành cho người đi bộ, thì người đi bộ phải qua đường như thế nào cho an toàn?',3),(118,1,-1,' Đường, cầu đường bộ','Hầm đường bộ, bến phà đường bộ','Là phần của đường bộ được sử dụng cho các phương tiện qua lại, các công trình, thiết bị phụ trợ khác,  dải đất dọc bên đường để đảm bảo an toàn giao thông','Cả 3 đều sai','Những người có mặt tại nơi xảy ra vụ tai nạn có trách nhiệm gì sau đây?',3),(119,3,-1,' Đường, cầu đường bộ','Hầm đường bộ, bến phà đường bộ','Là phần của đường bộ được sử dụng cho các phương tiện qua lại, các công trình, thiết bị phụ trợ khác,  dải đất dọc bên đường để đảm bảo an toàn giao thông','Cả 3 đều sai','Những người có mặt tại nơi xảy ra vụ tai nạn có trách nhiệm gì sau đây?',3),(120,2,-1,' Đường, cầu đường bộ',' Đường, cầu đường bộ, hầm đường bộ, bến phà đường bộ và các công trình đường bộ khác','Là phần của đường bộ được sử dụng cho các phương tiện qua lại, các công trình, thiết bị phụ trợ khác,  dải đất dọc bên đường để đảm bảo an toàn giao thông','Cả 3 đều sai','Những người có mặt tại nơi xảy ra vụ tai nạn có trách nhiệm gì sau đây?',3),(121,1,-1,' Đường, cầu đường bộ',' Đường, cầu đường bộ, hầm đường bộ, bến phà đường bộ và các công trình đường bộ khác','Là phần của đường bộ được sử dụng cho các phương tiện qua lại, các công trình, thiết bị phụ trợ khác,  dải đất dọc bên đường để đảm bảo an toàn giao thông','Cả 3 đều sai','Những người có mặt tại nơi xảy ra vụ tai nạn có trách nhiệm gì sau đây?',3),(122,3,-1,' Đường, cầu đường bộ',' Đường, cầu đường bộ, hầm đường bộ, bến phà đường bộ và các công trình đường bộ khác','Là phần của đường bộ được sử dụng cho các phương tiện qua lại, các công trình, thiết bị phụ trợ khác,  dải đất dọc bên đường để đảm bảo an toàn giao thông','Cả 3 đều sai','Những người có mặt tại nơi xảy ra vụ tai nạn có trách nhiệm gì sau đây?',3),(190,1,-1,' Đường, cầu đường bộ','Vạch kẻ đường là vạch chỉ sự phân chia làn đường, vị trí hoặc hướng đi, vị trí dừng lại','Là phần của đường bộ được sử dụng cho các phương tiện qua lại, các công trình, thiết bị phụ trợ khác,  dải đất dọc bên đường để đảm bảo an toàn giao thông','Cả 3 đều sai','Những người có mặt tại nơi xảy ra vụ tai nạn có trách nhiệm gì sau đây?',3),(191,2,-1,'Vạch kẻ đường là vạch để phân biệt vị trí dừng, đỗ trên đường','Vạch kẻ đường là vạch chỉ sự phân chia làn đường, vị trí hoặc hướng đi, vị trí dừng lại','Là phần của đường bộ được sử dụng cho các phương tiện qua lại, các công trình, thiết bị phụ trợ khác,  dải đất dọc bên đường để đảm bảo an toàn giao thông','Cả 3 đều sai','Những người có mặt tại nơi xảy ra vụ tai nạn có trách nhiệm gì sau đây?',NULL),(192,3,-1,'Vạch kẻ đường là vạch để phân biệt vị trí dừng, đỗ trên đường','Vạch kẻ đường là vạch chỉ sự phân chia làn đường, vị trí hoặc hướng đi, vị trí dừng lại','Là phần của đường bộ được sử dụng cho các phương tiện qua lại, dải đất dọc bên đường để đảm bảo an toàn giao thông','Cả 3 đều sai','Trên đường một chiều có vạch kẻ phân làn đường, xe thô sơ và xe cơ giới phải đi như thế nào là đúng quy tắc giao thông?',0),(194,2,-1,'Vạch kẻ đường là vạch để phân biệt vị trí dừng, đỗ trên đường','Vạch kẻ đường là vạch chỉ sự phân chia làn đường, vị trí hoặc hướng đi, vị trí dừng lại','Là phần của đường bộ được sử dụng cho các phương tiện qua lại, dải đất dọc bên đường để đảm bảo an toàn giao thông','Cả 3 đều sai','Trên đường một chiều có vạch kẻ phân làn đường, xe thô sơ và xe cơ giới phải đi như thế nào là đúng quy tắc giao thông?',NULL),(195,2,-1,'Vạch kẻ đường là vạch để phân biệt vị trí dừng, đỗ trên đường','Vạch kẻ đường là vạch chỉ sự phân chia làn đường, vị trí hoặc hướng đi, vị trí dừng lại','Là phần của đường bộ được sử dụng cho các phương tiện qua lại, dải đất dọc bên đường để đảm bảo an toàn giao thông','Cả 3 đều sai','Trên đường một chiều có vạch kẻ phân làn đường, xe thô sơ và xe cơ giới phải đi như thế nào là đúng quy tắc giao thông?',1),(196,2,-1,'Vạch kẻ đường là vạch để phân biệt vị trí dừng, đỗ trên đường','Vạch kẻ đường là vạch chỉ sự phân chia làn đường, vị trí hoặc hướng đi, vị trí dừng lại','Là phần của đường bộ được sử dụng cho các phương tiện qua lại, dải đất dọc bên đường để đảm bảo an toàn giao thông','Cả 3 đều sai','Khi có tín hiệu của xe ưu tiên, người tham gia giao thông phải làm gì?',1);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `result` (
  `id` int NOT NULL AUTO_INCREMENT,
  `total_correct` int NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `id_exam` int DEFAULT NULL,
  `users_user` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKqqmspitg4ogj84afc4g5rksp5` (`id_exam`),
  KEY `FKdjvgll8a3pvda9f9jthb2xvs1` (`users_user`),
  CONSTRAINT `FKdjvgll8a3pvda9f9jthb2xvs1` FOREIGN KEY (`users_user`) REFERENCES `user` (`id`),
  CONSTRAINT `FKqqmspitg4ogj84afc4g5rksp5` FOREIGN KEY (`id_exam`) REFERENCES `exam` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (11,2,'cuong',1,'cuong'),(22,1,'uyen',29,'uyen'),(28,4,'cuong',21,'cuong'),(30,5,'uyen',28,'uyen'),(32,6,'tram',1,'tram'),(40,3,'nhu',22,'nhu'),(44,2,'hau',1,'hau'),(46,1,'uyen',21,'uyen'),(48,5,'thang',1,'thang'),(49,2,'admin',NULL,NULL),(50,2,'admin',1,'admin'),(51,1,'admin',NULL,NULL),(52,1,'admin',1,'admin'),(53,4,'uyen',NULL,NULL),(54,4,'uyen',1,'uyen'),(55,1,'uyen',NULL,NULL),(56,1,'uyen',1,'uyen'),(57,0,'uyen',NULL,NULL),(58,0,'uyen',1,'uyen'),(59,5,'uyen',NULL,NULL),(60,5,'uyen',1,'uyen'),(61,3,'tram',NULL,NULL),(62,3,'tram',6,'tram'),(63,0,'admin',NULL,NULL),(64,0,'admin',2,'admin'),(65,1,'admin',NULL,NULL),(66,1,'admin',2,'admin'),(67,3,'admin',NULL,NULL),(68,3,'admin',2,'admin'),(69,3,'admin',NULL,NULL),(70,3,'admin',2,'admin'),(71,3,'admin',NULL,NULL),(72,3,'tramdang',NULL,'tramdang'),(73,4,'tramdang',NULL,NULL),(74,3,'tramdang',NULL,NULL),(75,3,'tramdang',NULL,NULL),(76,0,'admin',NULL,NULL),(77,0,'admin',NULL,'admin');
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL,
  `role_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ROLE_ADMIN'),(2,'ROLE_KHACH');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sign`
--

DROP TABLE IF EXISTS `sign`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sign` (
  `id` int NOT NULL AUTO_INCREMENT,
  `motahinhdang` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `photo` varchar(64) DEFAULT NULL,
  `quydinh` varchar(255) DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK63tlbilfm8jrcv8o5gvnmixrk` (`subject_id`),
  CONSTRAINT `FK63tlbilfm8jrcv8o5gvnmixrk` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=178 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sign`
--

LOCK TABLES `sign` WRITE;
/*!40000 ALTER TABLE `sign` DISABLE KEYS */;
INSERT INTO `sign` VALUES (101,'- Biển báo hạn chế với hai màu sắc trắng đỏ tương phản vô cùng nổi bật và thu hút sự chú ý.','BIỂN BÁO HẠN CHẾ TỐC ĐỘ 20KM/H','0.png','Biển có giá trị báo cho người tham gia giao thông biết hiệu lực của biển số R.306 hết tác dụng, kể từ biển này các xe được phép chạy chậm hơn trị số ghi trên biển nhưng không được gây cản trở các xe khác.',0),(102,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Tốc độ tối đa cho phép (30km/h)','1.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',0),(103,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Tốc độ tối đa cho phép (50km/h)','2.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',0),(104,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Tốc độ tối đa cho phép(60km/h)\'','3.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',0),(105,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Tốc độ tối đa cho phép (70km/h)','4.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',0),(106,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Tốc độ tối đa cho phép (80km/h)','5.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',0),(107,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Hết tốc độ tối đa cho phép (80km/h)','6.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',0),(108,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Tốc độ tối đa cho phép (100km/h)','7.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',0),(109,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Tốc độ tối đa cho phép (120km/h)','8.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',0),(110,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Cấm vượt','9.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',0),(111,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Cấm ôtô tải vượt - No passing veh over 3.5 tons','10.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',0),(112,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Giao nhau với đường không ưu tiên ','11.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',0),(113,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Đường ưu tiên','12.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',1),(114,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Giao nhau với đường ưu tiên','13.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',1),(115,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Dừng lại','14.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',1),(116,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Đường cấm','15.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',1),(117,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Cấm xe tải','16.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',1),(118,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Cấm đi ngược chiều','17.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',1),(119,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Nguy hiểm khác','18.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',1),(120,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','chỗ ngoặt nguy hiểm vòng bên trái','19.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',1),(121,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','chỗ ngoặt nguy hiểm vòng bên phải','20.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',1),(122,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Nhiều chỗ ngoặt nguy hiểm liên tiếp','21.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',1),(123,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Đường không bằng phẳng','22.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',1),(124,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Đường trơn','23.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',1),(125,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Đường bị hẹp về phía phải','24.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',1),(126,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Công trường','25.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',1),(127,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Giao nhau có tín hiệu đèn','26.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',1),(128,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Đường người đi bộ cắt ngang','27.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',0),(129,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Đường trẻ em đi cắt ngang','28.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',0),(130,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Đường đi xe đạp cắt ngang','29.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',0),(131,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Cẩn thận băng/tuyết','30.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',0),(132,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Thú rừng vượt qua đường','31.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',0),(133,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Hết tất cả các lệnh cấm','32.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',0),(134,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Các xe chỉ được rẽ phải','33.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',0),(135,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Các xe chỉ được rẽ trái','34.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',1),(136,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Hướng đi thẳng phải theo','35.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',1),(137,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Các xe chỉ được đi thẳng và rẽ phải','36.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',1),(138,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Các xe chỉ được đi thẳng và rẽ trái','37.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',1),(139,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Hướng phải đi vòng sang phải','38.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',1),(140,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Hướng phải đi vòng sang trái','39.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',1),(141,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Nơi giao nhau chạy theo vòng xuyến','40.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',1),(142,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Hết cấm vượt','41.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',1),(143,'Hình tròn, màu nền đỏ, viền đỏ, có biểu tượng đen','Hết cấm ô tô tải vượt','42.png','Biển báo tốc độ tối thiểu cho phép là biển báo tốc độ tối thiểu cho phép các xe cơ giới chạy. Biển cấm các loại xe cơ giới chạy với tốc độ nhỏ hơn trị số ghi trên biển.',1),(144,NULL,NULL,'10.png',NULL,NULL),(145,NULL,NULL,'11.png',NULL,NULL),(146,NULL,NULL,'12.png',NULL,NULL),(147,NULL,NULL,'13.png',NULL,NULL),(148,NULL,NULL,'14.png',NULL,NULL),(149,NULL,NULL,'15.png',NULL,NULL),(150,NULL,NULL,'16.png',NULL,NULL),(151,NULL,NULL,'17.png',NULL,NULL),(152,NULL,NULL,'18.png',NULL,NULL),(153,NULL,NULL,'19.png',NULL,NULL),(154,NULL,NULL,'20.png',NULL,NULL),(155,NULL,NULL,'21.png',NULL,NULL),(156,NULL,NULL,'22.png',NULL,NULL),(157,NULL,NULL,'23.png',NULL,NULL),(158,NULL,NULL,'24.png',NULL,NULL),(159,NULL,NULL,'25.png',NULL,NULL),(160,NULL,NULL,'26.png',NULL,NULL),(161,NULL,NULL,'27.png',NULL,NULL),(162,NULL,NULL,'28.png',NULL,NULL),(163,NULL,NULL,'29.png',NULL,NULL),(164,NULL,NULL,'30.png',NULL,NULL),(165,NULL,NULL,'31.png',NULL,NULL),(166,NULL,NULL,'32.png',NULL,NULL),(167,NULL,NULL,'33.png',NULL,NULL),(168,NULL,NULL,'34.png',NULL,NULL),(169,NULL,NULL,'35.png',NULL,NULL),(170,NULL,NULL,'36.png',NULL,NULL),(171,NULL,NULL,'37.png',NULL,NULL),(172,NULL,NULL,'38.png',NULL,NULL),(173,NULL,NULL,'39.png',NULL,NULL),(174,NULL,NULL,'40.png',NULL,NULL),(175,NULL,NULL,'41.png',NULL,NULL),(176,NULL,NULL,'42.png',NULL,NULL),(177,NULL,NULL,'43.png',NULL,NULL);
/*!40000 ALTER TABLE `sign` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signin`
--

DROP TABLE IF EXISTS `signin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `signin` (
  `signinId` varchar(255) NOT NULL,
  PRIMARY KEY (`signinId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signin`
--

LOCK TABLES `signin` WRITE;
/*!40000 ALTER TABLE `signin` DISABLE KEYS */;
/*!40000 ALTER TABLE `signin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject`
--

DROP TABLE IF EXISTS `subject`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject`
--

LOCK TABLES `subject` WRITE;
/*!40000 ALTER TABLE `subject` DISABLE KEYS */;
INSERT INTO `subject` VALUES (0,'Biển báo cấm'),(1,'Biển báo nguy hiểm'),(2,'Biển báo tốc độ'),(3,'Biển báo hiệu lệnh'),(4,'Biển phụ');
/*!40000 ALTER TABLE `subject` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_exam`
--

DROP TABLE IF EXISTS `test_exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_exam` (
  `id` int NOT NULL,
  `score_sum` double NOT NULL,
  `time_end` datetime(6) DEFAULT NULL,
  `time_start` datetime(6) DEFAULT NULL,
  `exams_id` int DEFAULT NULL,
  `users_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKl2hj4o10agy2fvr1uwgldotf6` (`exams_id`),
  KEY `FKlx08i2lwwbelxh4vguq2ho40g` (`users_id`),
  CONSTRAINT `FKl2hj4o10agy2fvr1uwgldotf6` FOREIGN KEY (`exams_id`) REFERENCES `exam` (`id`),
  CONSTRAINT `FKlx08i2lwwbelxh4vguq2ho40g` FOREIGN KEY (`users_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_exam`
--

LOCK TABLES `test_exam` WRITE;
/*!40000 ALTER TABLE `test_exam` DISABLE KEYS */;
INSERT INTO `test_exam` VALUES (1,7,'2021-08-30 13:05:00.000000','2021-08-30 13:00:00.000000',1,'admin');
/*!40000 ALTER TABLE `test_exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `img` varchar(255) DEFAULT NULL,
  `pass_word` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `re_pass_word` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('admin','K101 Dong Da, Liên Chiểu, Hải Châu','hoale12@gmail.com','Lê Đức ','lisa.jpg','$2a$10$GP3Qyi4cSZmVJKR59gVsmeixSet.RYXKsi5VmT5J0V5vqGJ8wLlI6','0914814420','$2a$10$Zv5pz.Y7J94XybzyFf4U6uQOlmknFCKRM3ilENmsPgZzbGP3D5r.y'),('cuong','thanh hoá 1','cuong374@gmail.com','hoàng cường le','anh2.jpg','$2a$10$kqO1cdaFjWKMQrijeT42deF4Q6K.PnMgMqPxDJQbZQ8ADLYG/0Rqu','0903636988','$2a$10$kqO1cdaFjWKMQrijeT42deF4Q6K.PnMgMqPxDJQbZQ8ADLYG/0Rqu'),('hau','quảng nam','hau8383@gmail.com','trung hau','anh2.jpg','$2a$10$kqO1cdaFjWKMQrijeT42deF4Q6K.PnMgMqPxDJQbZQ8ADLYG/0Rqu','0903636777','$2a$10$kqO1cdaFjWKMQrijeT42deF4Q6K.PnMgMqPxDJQbZQ8ADLYG/0Rqu'),('nhu','đà lạt','ynhu738@gmail.com','ý như 1','anh2.jpg','$2a$10$fGxAOHFgPpRjzI2pWf/qJuKXs7PmtO3m/xr4bu1Ay9wLQ5jc2OG.G','0903636985','$2a$10$w0/mcVJVNt33W2D9VhwJxO4YliTPeL9C0lPvPZSLKS3U/8I8hWM4q'),('thang','quảng nam','thang8383@gmail.com','thắng nguyễn','bg.jpg','$2a$10$0WLZtVxlfXVt.bsQ8Bvw3eesR2R9b5PP6ty9S62IJqMudoTkLUr76','0903636978','$2a$10$0WLZtVxlfXVt.bsQ8Bvw3eesR2R9b5PP6ty9S62IJqMudoTkLUr76'),('tram','đà nẵng','tram3993@gmail.com','thuỳ trâm','bg.jpg','$2a$10$kqO1cdaFjWKMQrijeT42deF4Q6K.PnMgMqPxDJQbZQ8ADLYG/0Rqu','0903636987','$2a$10$kqO1cdaFjWKMQrijeT42deF4Q6K.PnMgMqPxDJQbZQ8ADLYG/0Rqu'),('tramdang','K97 Phạm Tứ, Liên Chiểu, Hải Châu','tramdang@gmail.com','Phạm Thị Thu Uyên','lisa.jpg','$2a$10$/rUkUfvK3.JOEZADvbCGY.j55EvjHgrR.MLiActQXpBDxoaa/TRG6','0905467035','$2a$10$/rUkUfvK3.JOEZADvbCGY.j55EvjHgrR.MLiActQXpBDxoaa/TRG6'),('uyen','Quảng Nam','nguyenuyen552000@gmail.com','đặng thùy trâm','anh2.jpg','$2a$10$1ivVApcKWVyZUG7pqjDfYOvl5Nbphd/b9wfgDFx742YXKVgw5fz5W','0914814420','$2a$10$vdOW4fysrlrTCMEf9JXqi.D8IbNxO6m1XGoRbII7oOAkqs19sOuDK');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `username` varchar(255) NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`username`,`role_id`),
  KEY `FKa68196081fvovjhkek5m97n3y` (`role_id`),
  CONSTRAINT `FKa68196081fvovjhkek5m97n3y` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`),
  CONSTRAINT `FKnircs1pyebpo0eucojumm0aed` FOREIGN KEY (`username`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES ('cuong',2),('tram',2);
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-19 19:39:29
