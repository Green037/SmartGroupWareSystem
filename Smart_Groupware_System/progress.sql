-- --------------------------------------------------------
-- 호스트:                          rang1536.cafe24.com
-- 서버 버전:                        5.5.17-log - MySQL Community Server (GPL)
-- 서버 OS:                        Linux
-- HeidiSQL 버전:                  8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 테이블 rang1536의 구조를 덤프합니다. incentive
CREATE TABLE IF NOT EXISTS `incentive` (
  `in_code` int(11) NOT NULL AUTO_INCREMENT,
  `re_code` int(11) NOT NULL,
  `mm_code` int(11) NOT NULL,
  `in_kind` varchar(12) NOT NULL,
  `in_bonus` int(11) NOT NULL,
  `in_possible` tinyint(1) NOT NULL,
  `in_date` date DEFAULT NULL,
  `in_mmCode` int(11) NOT NULL,
  PRIMARY KEY (`in_code`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='성과급';

-- Dumping data for table rang1536.incentive: 11 rows
/*!40000 ALTER TABLE `incentive` DISABLE KEYS */;
INSERT INTO `incentive` (`in_code`, `re_code`, `mm_code`, `in_kind`, `in_bonus`, `in_possible`, `in_date`, `in_mmCode`) VALUES
	(2, 0, 3, '프로젝트 완료', 895600, 0, NULL, 2),
	(3, 0, 4, '프로젝트 완료', 956000, 0, NULL, 2),
	(4, 0, 5, '프로젝트 완료', 456230, 0, NULL, 2),
	(5, 0, 6, '프로젝트 완료', 0, 0, NULL, 2),
	(6, 0, 8, '프로젝트 완료', 565600, 0, NULL, 2),
	(7, 0, 9, '프로젝트 완료', 956500, 0, NULL, 2),
	(8, 0, 10, '프로젝트 완료', 963200, 0, NULL, 2),
	(9, 0, 11, '프로젝트 완료', 1313100, 0, NULL, 2),
	(10, 0, 12, '프로젝트 완료', 0, 0, NULL, 2),
	(11, 0, 13, '프로젝트 완료', 0, 0, NULL, 2),
	(12, 0, 14, '프로젝트 완료', 656300, 0, NULL, 2);
/*!40000 ALTER TABLE `incentive` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
