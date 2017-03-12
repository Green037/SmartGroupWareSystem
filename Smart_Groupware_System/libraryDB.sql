-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        5.5.32 - MySQL Community Server (GPL)
-- 서버 OS:                        Win32
-- HeidiSQL 버전:                  8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- library 의 데이터베이스 구조 덤핑
DROP DATABASE IF EXISTS `library`;
CREATE DATABASE IF NOT EXISTS `library` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `library`;


-- 테이블 library의 구조를 덤프합니다. admin
DROP TABLE IF EXISTS `admin`;
CREATE TABLE IF NOT EXISTS `admin` (
  `adminId` varchar(20) NOT NULL,
  `libraryNumber` int(10) NOT NULL,
  `localNumber` int(10) NOT NULL,
  `adminPassword` varchar(50) NOT NULL,
  `adminName` varchar(30) NOT NULL,
  `adminRRN` varchar(20) NOT NULL,
  `adminAddr` varchar(200) NOT NULL,
  `adminTel` varchar(15) NOT NULL,
  PRIMARY KEY (`adminId`),
  KEY `FK_admin_library` (`libraryNumber`),
  KEY `FK_admin_local` (`localNumber`),
  CONSTRAINT `FK_admin_library` FOREIGN KEY (`libraryNumber`) REFERENCES `library` (`libraryNumber`),
  CONSTRAINT `FK_admin_local` FOREIGN KEY (`localNumber`) REFERENCES `local` (`localNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table library.admin: ~2 rows (대략적)
DELETE FROM `admin`;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` (`adminId`, `libraryNumber`, `localNumber`, `adminPassword`, `adminName`, `adminRRN`, `adminAddr`, `adminTel`) VALUES
	('admin001', 30000, 10000, 'pw001', '방상엽', '9904011584811', '전주시 중화산동', '01038390403'),
	('admin2', 30000, 10000, '1234', '윤재호', '1234561234567', '효자동', '01035427987');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;


-- 테이블 library의 구조를 덤프합니다. books
DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `booksNumber` int(10) NOT NULL AUTO_INCREMENT,
  `bookskindsNumber` int(10) DEFAULT NULL,
  `localNumber` int(10) DEFAULT NULL,
  `libraryNumber` int(10) DEFAULT NULL,
  `booksName` varchar(200) DEFAULT NULL,
  `booksMade` varchar(100) DEFAULT NULL,
  `booksAuthor` varchar(100) DEFAULT NULL,
  `firstRentDay` date DEFAULT NULL,
  `booksLendingPossible` char(50) DEFAULT NULL,
  `booksLendingCount` int(10) DEFAULT NULL,
  `booksLendingDay` int(10) DEFAULT NULL,
  `booksDamage` char(50) DEFAULT NULL,
  `booksDmageDate` date DEFAULT NULL,
  PRIMARY KEY (`booksNumber`),
  KEY `FK_books_bookskind` (`bookskindsNumber`),
  KEY `FK_books_local` (`localNumber`),
  KEY `FK_books_library` (`libraryNumber`),
  CONSTRAINT `FK_books_bookskind` FOREIGN KEY (`bookskindsNumber`) REFERENCES `bookskind` (`bookskindsNumber`),
  CONSTRAINT `FK_books_library` FOREIGN KEY (`libraryNumber`) REFERENCES `library` (`libraryNumber`),
  CONSTRAINT `FK_books_local` FOREIGN KEY (`localNumber`) REFERENCES `local` (`localNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=40010 DEFAULT CHARSET=utf8;

-- Dumping data for table library.books: ~10 rows (대략적)
DELETE FROM `books`;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` (`booksNumber`, `bookskindsNumber`, `localNumber`, `libraryNumber`, `booksName`, `booksMade`, `booksAuthor`, `firstRentDay`, `booksLendingPossible`, `booksLendingCount`, `booksLendingDay`, `booksDamage`, `booksDmageDate`) VALUES
	(40000, 20000, 10000, 30000, '빵상과함께사라지다', '미르', '방상엽', '0000-00-00', '1', 1, 4, '0', NULL),
	(40001, 20000, 10000, 30000, '군림천하', '대명종', '용대운', '2017-02-08', '1', 4, 13, '1', '2017-02-01'),
	(40002, 20000, 10000, 30000, '1', '1', '1', '2017-02-06', '0', 1, 1, '1', '2017-02-06'),
	(40003, 20000, 10000, 30000, '1', '1', '1', '2017-02-06', '0', 1, 1, '1', '2017-02-06'),
	(40004, 20000, 10000, 30000, 'qwrqwr', 'qwfqwfqwf', 'asfasf', NULL, '1', 0, 0, '0', NULL),
	(40005, 20000, 10000, 30000, '빵상의여행', '스마트도서관', '빵상', NULL, '1', 0, 0, '0', NULL),
	(40006, 20000, 10000, 30000, '드래곤볼', '집영사', '원숭이', NULL, '1', 1, 1, '0', NULL),
	(40007, 20000, 10000, 30000, 'asfafa', 'asfasf', 'asfasf', NULL, '1', 5, 5, '0', NULL),
	(40008, 20000, 10000, 30000, 'asfafsaafs', 'asfasgasg', 'zzzzvzv', NULL, '1', 4, 4, '0', NULL),
	(40009, 20000, 10000, 30000, '홍인용의 일대기', '스마트도서관', '홍인용', NULL, '1', 0, 0, '0', NULL);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;


-- 테이블 library의 구조를 덤프합니다. bookskind
DROP TABLE IF EXISTS `bookskind`;
CREATE TABLE IF NOT EXISTS `bookskind` (
  `bookskindsNumber` int(10) NOT NULL AUTO_INCREMENT,
  `bookskindsname` varchar(50) NOT NULL,
  PRIMARY KEY (`bookskindsNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=20001 DEFAULT CHARSET=utf8;

-- Dumping data for table library.bookskind: ~1 rows (대략적)
DELETE FROM `bookskind`;
/*!40000 ALTER TABLE `bookskind` DISABLE KEYS */;
INSERT INTO `bookskind` (`bookskindsNumber`, `bookskindsname`) VALUES
	(20000, '무협');
/*!40000 ALTER TABLE `bookskind` ENABLE KEYS */;


-- 테이블 library의 구조를 덤프합니다. booksrent
DROP TABLE IF EXISTS `booksrent`;
CREATE TABLE IF NOT EXISTS `booksrent` (
  `booksRentNumber` int(10) NOT NULL AUTO_INCREMENT,
  `membersNumber` int(10) NOT NULL,
  `booksNumber` int(10) NOT NULL,
  `booksRentStartDate` date NOT NULL,
  `booksRentEndDate` date NOT NULL,
  `booksRentPay` int(10) NOT NULL,
  `booksDamage` char(50) NOT NULL,
  `bookstotalRentDay` int(50) NOT NULL,
  `booksRentBack` char(50) NOT NULL,
  PRIMARY KEY (`booksRentNumber`),
  KEY `FK_booksrent_members` (`membersNumber`),
  KEY `FK_booksrent_books` (`booksNumber`),
  CONSTRAINT `FK_booksrent_books` FOREIGN KEY (`booksNumber`) REFERENCES `books` (`booksNumber`),
  CONSTRAINT `FK_booksrent_members` FOREIGN KEY (`membersNumber`) REFERENCES `members` (`membersNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=60002 DEFAULT CHARSET=utf8;

-- Dumping data for table library.booksrent: ~2 rows (대략적)
DELETE FROM `booksrent`;
/*!40000 ALTER TABLE `booksrent` DISABLE KEYS */;
INSERT INTO `booksrent` (`booksRentNumber`, `membersNumber`, `booksNumber`, `booksRentStartDate`, `booksRentEndDate`, `booksRentPay`, `booksDamage`, `bookstotalRentDay`, `booksRentBack`) VALUES
	(60000, 50000, 40000, '2017-01-20', '2017-01-23', 4000, '1', 0, '0'),
	(60001, 50000, 40001, '2017-02-01', '2017-02-01', 30000, '1', 10, '1');
/*!40000 ALTER TABLE `booksrent` ENABLE KEYS */;


-- 테이블 library의 구조를 덤프합니다. library
DROP TABLE IF EXISTS `library`;
CREATE TABLE IF NOT EXISTS `library` (
  `libraryNumber` int(10) NOT NULL AUTO_INCREMENT,
  `localNumber` int(10) NOT NULL,
  `libraryName` varchar(50) NOT NULL,
  PRIMARY KEY (`libraryNumber`),
  KEY `FK__local` (`localNumber`),
  CONSTRAINT `FK__local` FOREIGN KEY (`localNumber`) REFERENCES `local` (`localNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=30001 DEFAULT CHARSET=utf8;

-- Dumping data for table library.library: ~1 rows (대략적)
DELETE FROM `library`;
/*!40000 ALTER TABLE `library` DISABLE KEYS */;
INSERT INTO `library` (`libraryNumber`, `localNumber`, `libraryName`) VALUES
	(30000, 10000, '서신도서관');
/*!40000 ALTER TABLE `library` ENABLE KEYS */;


-- 테이블 library의 구조를 덤프합니다. local
DROP TABLE IF EXISTS `local`;
CREATE TABLE IF NOT EXISTS `local` (
  `localNumber` int(10) NOT NULL AUTO_INCREMENT,
  `localName` varchar(20) NOT NULL,
  PRIMARY KEY (`localNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=10001 DEFAULT CHARSET=utf8;

-- Dumping data for table library.local: ~1 rows (대략적)
DELETE FROM `local`;
/*!40000 ALTER TABLE `local` DISABLE KEYS */;
INSERT INTO `local` (`localNumber`, `localName`) VALUES
	(10000, '전주');
/*!40000 ALTER TABLE `local` ENABLE KEYS */;


-- 테이블 library의 구조를 덤프합니다. members
DROP TABLE IF EXISTS `members`;
CREATE TABLE IF NOT EXISTS `members` (
  `membersNumber` int(10) NOT NULL AUTO_INCREMENT,
  `localNumber` int(10) NOT NULL,
  `libraryNumber` int(10) NOT NULL,
  `membersName` varchar(30) NOT NULL,
  `membersTel` varchar(20) NOT NULL,
  `membersAddr` varchar(100) NOT NULL,
  `membersRRN` varchar(15) NOT NULL,
  `membersVIP` char(50) NOT NULL,
  PRIMARY KEY (`membersNumber`),
  KEY `FK_members_local` (`localNumber`),
  KEY `FK_members_library` (`libraryNumber`),
  CONSTRAINT `FK_members_library` FOREIGN KEY (`libraryNumber`) REFERENCES `library` (`libraryNumber`),
  CONSTRAINT `FK_members_local` FOREIGN KEY (`localNumber`) REFERENCES `local` (`localNumber`)
) ENGINE=InnoDB AUTO_INCREMENT=50002 DEFAULT CHARSET=utf8;

-- Dumping data for table library.members: ~2 rows (대략적)
DELETE FROM `members`;
/*!40000 ALTER TABLE `members` DISABLE KEYS */;
INSERT INTO `members` (`membersNumber`, `localNumber`, `libraryNumber`, `membersName`, `membersTel`, `membersAddr`, `membersRRN`, `membersVIP`) VALUES
	(50000, 10000, 30000, '방상엽', '01038390401', '전주시 서신동', '9904011584811', '1'),
	(50001, 10000, 30000, '김사나', '01034344646', '오사카', '1234561234567', '0');
/*!40000 ALTER TABLE `members` ENABLE KEYS */;


-- 프로시저 library의 구조를 덤프합니다. rent_back
DROP PROCEDURE IF EXISTS `rent_back`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `rent_back`()
BEGIN
	
	UPDATE booksrent 
	SET booksrentendDate=  '2017-01-23', booksrentpay='4000' 
	WHERE booksrentnumber = 60000; 
	
	UPDATE books SET bookslendingcount = 1, bookslendingday=4 WHERE booksnumber = 40000; 
END//
DELIMITER ;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
