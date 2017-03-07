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

-- rang1536 의 데이터베이스 구조 덤핑
DROP DATABASE IF EXISTS `rang1536`;
CREATE DATABASE IF NOT EXISTS `rang1536` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `rang1536`;


-- 테이블 rang1536의 구조를 덤프합니다. achieve
DROP TABLE IF EXISTS `achieve`;
CREATE TABLE IF NOT EXISTS `achieve` (
  `ac_code` int(11) NOT NULL AUTO_INCREMENT,
  `ac_name` varchar(50) NOT NULL,
  PRIMARY KEY (`ac_code`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='학력';

-- Dumping data for table rang1536.achieve: 10 rows
DELETE FROM `achieve`;
/*!40000 ALTER TABLE `achieve` DISABLE KEYS */;
INSERT INTO `achieve` (`ac_code`, `ac_name`) VALUES
	(1, '초등학교졸업'),
	(2, '중학교졸업'),
	(3, '고등학교졸업'),
	(4, '전문대졸업'),
	(5, '대학교졸업'),
	(6, '석사'),
	(7, '박사'),
	(8, '중졸검정고시'),
	(9, '고졸검정고시'),
	(10, '학력무관');
/*!40000 ALTER TABLE `achieve` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. approval
DROP TABLE IF EXISTS `approval`;
CREATE TABLE IF NOT EXISTS `approval` (
  `apr_code` int(11) NOT NULL AUTO_INCREMENT,
  `mm_code` int(11) NOT NULL,
  `apr_approval1` int(11) DEFAULT NULL,
  `apr_approval2` int(11) DEFAULT NULL,
  `apr_approval3` int(11) DEFAULT NULL,
  PRIMARY KEY (`apr_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='결재선';

-- Dumping data for table rang1536.approval: 0 rows
DELETE FROM `approval`;
/*!40000 ALTER TABLE `approval` DISABLE KEYS */;
/*!40000 ALTER TABLE `approval` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. career
DROP TABLE IF EXISTS `career`;
CREATE TABLE IF NOT EXISTS `career` (
  `cr_code` int(11) NOT NULL AUTO_INCREMENT,
  `ma_code` int(11) DEFAULT NULL,
  `mi_code` int(11) DEFAULT NULL,
  `cr_data` varchar(50) NOT NULL,
  `cr_service` varchar(50) NOT NULL,
  `cr_pastJoinDay` date NOT NULL,
  `cr_pastResignDay` date NOT NULL,
  `cr_responsibility` varchar(50) NOT NULL,
  `mm_code` int(11) NOT NULL,
  PRIMARY KEY (`cr_code`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='경력';

-- Dumping data for table rang1536.career: 26 rows
DELETE FROM `career`;
/*!40000 ALTER TABLE `career` DISABLE KEYS */;
INSERT INTO `career` (`cr_code`, `ma_code`, `mi_code`, `cr_data`, `cr_service`, `cr_pastJoinDay`, `cr_pastResignDay`, `cr_responsibility`, `mm_code`) VALUES
	(1, 1, 1, '롯데호텔', '1년', '2015-02-01', '2016-02-01', '하우스키핑', 4),
	(2, 4, 3, '석사,', '1년,', '2016-02-07', '2016-02-08', '조수,', 18),
	(3, 3, 5, '백수,', '26년,', '0000-00-00', '0000-00-00', '없음,', 21),
	(4, 3, 4, '테트리스,', '1년,', '0000-00-00', '0000-00-00', '보조,', 22),
	(5, 3, 4, '테트리스,', '1년,', '0000-00-00', '0000-00-00', '보조,', 23),
	(6, 3, 4, '테트리스,', '1년,', '0000-00-00', '0000-00-00', '보조,', 24),
	(7, 1, 2, 'pc방,요리,', '1년,1년,', '2016-09-07', '2016-09-26', '서빙,주방보조,', 25),
	(8, 2, 2, '니은,기억,', '2,1,', '0000-00-00', '0000-00-00', '니은,기억,', 27),
	(9, 0, 0, '판매1', '21년', '0000-00-00', '0000-00-00', '판매1', 34),
	(10, 3, 6, '이마트보안', '1년', '0000-00-00', '0000-00-00', '보조', 37),
	(11, 1, 1, '스마트1', '1년', '2011-01-01', '2016-02-08', '대리', 2),
	(12, 3, 5, '스마트3', '2년', '2013-02-07', '2016-02-09', '과장', 2),
	(13, 3, 3, '정보처리1', '27년', '2017-03-01', '2017-03-03', '대리', 2),
	(14, 8, 18, '정보처리2', '28년', '2017-03-07', '2017-03-07', '과장', 2),
	(15, 7, 19, '백수', '5년', '2017-03-06', '2017-03-08', '없음', 38),
	(16, 7, 17, '백수1', '6년', '2017-03-14', '2017-03-11', '있음', 38),
	(17, 2, 2, '기아자동차', '1년', '2016-12-01', '2017-03-02', '사원', 39),
	(18, 2, 5, '현대건설', '1년', '2017-03-08', '2017-03-30', '사원', 39),
	(19, 2, 5, '현대건설', '1년', '2017-03-08', '2017-03-30', '사원', 40),
	(20, 2, 5, '현대건설', '1년', '2017-03-08', '2017-03-30', '사원', 41),
	(21, 2, 5, '현대건설', '1년', '2017-03-08', '2017-03-30', '사원', 42),
	(22, 2, 5, '현대건설', '1년', '2017-03-08', '2017-03-30', '사원', 43),
	(23, 2, 5, '현대건설', '1년', '2017-03-08', '2017-03-30', '사원', 44),
	(24, 2, 5, '현대건설', '1년', '2017-03-08', '2017-03-30', '사원', 45),
	(25, 2, 2, '백수왕', '평생', '2017-03-03', '2017-03-04', '없음1', 46),
	(26, 4, 3, '백수황제', '평생', '2017-03-02', '2017-03-07', '없음2', 46);
/*!40000 ALTER TABLE `career` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. commute
DROP TABLE IF EXISTS `commute`;
CREATE TABLE IF NOT EXISTS `commute` (
  `cm_code` int(11) NOT NULL AUTO_INCREMENT,
  `mm_code` int(11) NOT NULL,
  `cm_onTime` time DEFAULT NULL,
  `cm_offTime` time DEFAULT NULL,
  `cm_date` date NOT NULL,
  `cm_exceptionInput` varchar(50) DEFAULT NULL,
  `cm_situation` varchar(20) NOT NULL,
  `cm_exceptionReson` varchar(50) DEFAULT NULL,
  `cm_goOutTime` time DEFAULT NULL,
  `cm_returnTime` time DEFAULT NULL,
  PRIMARY KEY (`cm_code`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='근태';

-- Dumping data for table rang1536.commute: 2 rows
DELETE FROM `commute`;
/*!40000 ALTER TABLE `commute` DISABLE KEYS */;
INSERT INTO `commute` (`cm_code`, `mm_code`, `cm_onTime`, `cm_offTime`, `cm_date`, `cm_exceptionInput`, `cm_situation`, `cm_exceptionReson`, `cm_goOutTime`, `cm_returnTime`) VALUES
	(1, 1, '08:35:00', '05:30:00', '2017-02-01', NULL, '정상', NULL, NULL, NULL),
	(2, 4, '08:50:00', '05:30:00', '2017-02-01', NULL, '정상', NULL, NULL, NULL);
/*!40000 ALTER TABLE `commute` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. contract
DROP TABLE IF EXISTS `contract`;
CREATE TABLE IF NOT EXISTS `contract` (
  `ct_code` int(11) NOT NULL AUTO_INCREMENT,
  `ct_type` varchar(10) NOT NULL,
  PRIMARY KEY (`ct_code`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='계약형태';

-- Dumping data for table rang1536.contract: 8 rows
DELETE FROM `contract`;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
INSERT INTO `contract` (`ct_code`, `ct_type`) VALUES
	(1, '정규직'),
	(2, '계약직'),
	(3, '병력특례'),
	(4, '인턴직'),
	(5, '일용직'),
	(6, '파견'),
	(7, '프리랜서'),
	(8, '연수생');
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. department
DROP TABLE IF EXISTS `department`;
CREATE TABLE IF NOT EXISTS `department` (
  `dp_code` int(11) NOT NULL AUTO_INCREMENT,
  `dp_name` varchar(50) NOT NULL,
  PRIMARY KEY (`dp_code`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='부서';

-- Dumping data for table rang1536.department: 7 rows
DELETE FROM `department`;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` (`dp_code`, `dp_name`) VALUES
	(1, '인사'),
	(2, '홍보'),
	(3, '모바일 개발'),
	(4, '웹개발'),
	(5, '보안'),
	(6, '총무부'),
	(7, '인사부');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. document
DROP TABLE IF EXISTS `document`;
CREATE TABLE IF NOT EXISTS `document` (
  `doc_code` int(11) NOT NULL AUTO_INCREMENT,
  `doc_fileGroup` varchar(50) DEFAULT NULL,
  `doc_fileOri` varchar(50) DEFAULT NULL,
  `doc_fileExtention` varchar(300) DEFAULT NULL,
  `doc_fileName` varchar(100) DEFAULT NULL,
  `doc_filePath` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`doc_code`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='문서';

-- Dumping data for table rang1536.document: 7 rows
DELETE FROM `document`;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
INSERT INTO `document` (`doc_code`, `doc_fileGroup`, `doc_fileOri`, `doc_fileExtention`, `doc_fileName`, `doc_filePath`) VALUES
	(1, '프로젝트 수정', NULL, NULL, NULL, NULL),
	(2, '사원등록', NULL, NULL, NULL, NULL),
	(3, '고과관리', NULL, NULL, NULL, NULL),
	(10, '직원관리', '메서드 호출원리.txt', 'txt', 'c63772f5fe504a078e52145ec70d9324.txt', 'D:/Hong/neon-sts/SmartGroupWareSystem/Smart_Groupware_System/src/main/webapp/WEB-INF/views/approve/file'),
	(7, '급여신청', '6일차.txt', 'txt', 'd41b64a5972c481d8c9f0f666ea83648.txt', 'D:/Hong/neon-sts/SmartGroupWareSystem/Smart_Groupware_System/src/main/webapp/WEB-INF/views/approve/file'),
	(8, '급여신청', '메서드 호출원리.txt', 'txt', 'd2d3e7da212b42e69c71a1ae2a6ea01f.txt', 'D:/Hong/neon-sts/SmartGroupWareSystem/Smart_Groupware_System/src/main/webapp/WEB-INF/views/approve/file'),
	(9, '프로젝트최종', '6일차.txt', 'txt', '44f9e11295464a91b25c19a8c06bfb3e.txt', 'D:/Hong/neon-sts/SmartGroupWareSystem/Smart_Groupware_System/src/main/webapp/WEB-INF/views/approve/file');
/*!40000 ALTER TABLE `document` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. draft
DROP TABLE IF EXISTS `draft`;
CREATE TABLE IF NOT EXISTS `draft` (
  `dft_code` int(11) NOT NULL AUTO_INCREMENT,
  `apr_code` int(11) NOT NULL,
  `doc_code` int(11) NOT NULL,
  `mm_code` int(11) NOT NULL,
  `dft_title` varchar(50) DEFAULT NULL,
  `dft_degree` int(11) DEFAULT NULL,
  `dft_date` datetime NOT NULL,
  `dft_approval1` int(11) DEFAULT NULL,
  `dft_approval2` int(11) DEFAULT NULL,
  `dft_approval3` int(11) DEFAULT NULL,
  `dft_finalState` varchar(50) DEFAULT NULL,
  `dft_check` varchar(10) DEFAULT NULL,
  `dft_fileOri` varchar(500) DEFAULT NULL,
  `dft_fileName` varchar(50) DEFAULT NULL,
  `dft_filePath` varchar(500) DEFAULT NULL,
  `dft_fileExtention` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`dft_code`)
) ENGINE=MyISAM AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COMMENT='기안';

-- Dumping data for table rang1536.draft: 35 rows
DELETE FROM `draft`;
/*!40000 ALTER TABLE `draft` DISABLE KEYS */;
INSERT INTO `draft` (`dft_code`, `apr_code`, `doc_code`, `mm_code`, `dft_title`, `dft_degree`, `dft_date`, `dft_approval1`, `dft_approval2`, `dft_approval3`, `dft_finalState`, `dft_check`, `dft_fileOri`, `dft_fileName`, `dft_filePath`, `dft_fileExtention`) VALUES
	(52, 0, 1, 1, '3명씩데이터입력귀찮', 1, '2017-03-02 10:57:56', 1, 0, 0, '1차결재최종승인', 'true', NULL, NULL, NULL, NULL),
	(63, 0, 5, 5, '디자인다시만들기싫다', 1, '2017-03-03 12:33:00', 1, 3, 4, '1차결재반려', 'true', NULL, NULL, NULL, NULL),
	(54, 0, 2, 2, '데이터를처음부터다시하느라', 2, '2017-03-02 10:57:56', 2, 1, 3, '2차결재반려', 'true', NULL, NULL, NULL, NULL),
	(55, 0, 2, 2, '하하하하집에가고싶군', 2, '2017-03-02 10:57:56', 4, 2, 0, '2차결재반려', 'true', NULL, NULL, NULL, NULL),
	(56, 0, 3, 3, '잠자고싶군', 1, '2017-03-02 10:57:56', 2, 0, 0, '1차결재반려', 'true', NULL, NULL, NULL, NULL),
	(57, 0, 3, 3, '잠이온다', 3, '2017-03-02 10:57:56', 3, 4, 2, '3차결재최종승인', 'true', NULL, NULL, NULL, NULL),
	(59, 0, 4, 4, '히터가돌아간다', 1, '2017-03-02 11:13:30', 2, 3, 3, '1차결재반려', 'true', NULL, NULL, NULL, NULL),
	(60, 0, 4, 4, '사원번호추가해야하는데앞이막막', 2, '2017-03-02 11:13:30', 1, 3, 0, '2차결재최종승인', 'true', NULL, NULL, NULL, NULL),
	(61, 0, 5, 5, '또어떻게해야할지걱정생각이안나', 2, '2017-03-02 11:13:30', 4, 1, 3, '2차결재반려', 'true', NULL, NULL, NULL, NULL),
	(62, 0, 5, 5, '미결재에서최글결재시간갱신안됨', 3, '2017-03-02 11:59:45', 2, 1, 3, '3차미결재대기', 'true', NULL, NULL, NULL, NULL),
	(64, 0, 6, 6, '기안추가디자인및파일select작업', 2, '2017-03-03 12:33:00', 3, 1, 2, '2차결재반려', 'true', NULL, NULL, NULL, NULL),
	(65, 0, 6, 6, '업로드연습', 1, '2017-03-03 15:48:49', 2, 1, 4, '1차미결재대기', 'true', NULL, NULL, NULL, NULL),
	(66, 0, 6, 6, '머리가아프다더이상못함', 2, '2017-03-03 16:23:13', 1, 3, 0, '2차결재최종승인', 'true', NULL, NULL, NULL, NULL),
	(67, 0, 7, 7, '집에가는길에군것질할것같음', 1, '2017-03-03 16:23:13', 1, 2, 0, '1차미결재대기', 'false', NULL, NULL, NULL, NULL),
	(68, 0, 1, 7, '0306일의시작', 1, '2017-03-06 09:25:13', 1, 3, 0, '1차결재반려', 'true', NULL, NULL, NULL, NULL),
	(53, 0, 2, 2, '지겨워입력하는거', 2, '2017-03-02 10:57:56', 1, 4, 0, '2차결재반려', 'true', NULL, NULL, NULL, NULL),
	(51, 0, 1, 1, '배가엄청고프군', 3, '2017-03-02 10:57:56', 2, 3, 4, '3차결재최종승인', 'true', NULL, NULL, NULL, NULL),
	(58, 0, 4, 4, '몇번째인가', 2, '2017-03-02 11:13:30', 1, 2, 0, '2차결재최종승인', 'true', NULL, NULL, NULL, NULL),
	(50, 0, 1, 1, '배가고프군', 3, '2017-03-02 10:57:56', 1, 2, 3, '3차결재최종승인', 'true', NULL, NULL, NULL, NULL),
	(69, 0, 4, 7, '너무길어서안된건가', 2, '2017-03-06 12:20:15', 2, 1, 3, '2차미결재대기', 'true', NULL, '0520a24f24e9412ba911779798efa1fa', 'D:/Hong/neon-sts/SmartGroupWareSystem/Smart_Groupware_System/src/main/webapp/WEB-INF/views/approve/file', NULL),
	(70, 0, 2, 7, '되는가', 2, '2017-03-06 12:33:50', 1, 2, 0, '2차미결재대기', 'true', NULL, '836a87cdf031447cb3d554f2416d08a0.sql', 'D:/Hong/neon-sts/SmartGroupWareSystem/Smart_Groupware_System/src/main/webapp/WEB-INF/views/approve/file', 'sql'),
	(71, 0, 4, 8, '어허허허되라고', 2, '2017-03-06 12:39:52', 1, 3, 4, '2차미결재대기', 'true', NULL, 'a1bb1e45c02e4aad987267642e92fc09.sql', 'D:/Hong/neon-sts/SmartGroupWareSystem/Smart_Groupware_System/src/main/webapp/WEB-INF/views/approve/file', 'sql'),
	(72, 0, 2, 8, '원본이름을찾아서', 1, '2017-03-06 12:43:34', 2, 3, 0, '1차미결재대기', 'true', NULL, '94d1630fe1c04679b0300b50eb625fec.sql', 'D:/Hong/neon-sts/SmartGroupWareSystem/Smart_Groupware_System/src/main/webapp/WEB-INF/views/approve/file', 'sql'),
	(73, 0, 1, 9, '뭐뭐지', 1, '2017-03-06 12:43:34', 1, 4, 2, '1차미결재대기', 'true', NULL, '369a0ea7ecd6499abc6f82e63380cb08.sql', 'D:/Hong/neon-sts/SmartGroupWareSystem/Smart_Groupware_System/src/main/webapp/WEB-INF/views/approve/file', 'sql'),
	(74, 0, 3, 8, '되는가', 2, '2017-03-06 12:55:50', 1, 4, 0, '2차미결재대기', 'true', NULL, '95bc2479da2a4f02a3e2dbac8a75bd5d.sql', 'D:/Hong/neon-sts/SmartGroupWareSystem/Smart_Groupware_System/src/main/webapp/WEB-INF/views/approve/file', 'sql'),
	(75, 0, 5, 9, '하이하이', 1, '2017-03-06 12:58:07', 1, 4, 2, '1차미결재대기', 'true', NULL, 'b38bd3ccac2a47a082e36a8cc4c96ddd.sql', 'D:/Hong/neon-sts/SmartGroupWareSystem/Smart_Groupware_System/src/main/webapp/WEB-INF/views/approve/file', 'sql'),
	(76, 0, 3, 9, '오호호호', 2, '2017-03-06 13:10:06', 2, 3, 0, '2차미결재대기', 'true', NULL, 'f840593024e748dd8227931d64e153dd.sql', 'D:/Hong/neon-sts/SmartGroupWareSystem/Smart_Groupware_System/src/main/webapp/WEB-INF/views/approve/file', 'sql'),
	(77, 0, 4, 9, '되라고', 1, '2017-03-06 13:34:52', 4, 0, 0, '1차결재최종승인', 'true', NULL, 'feb0f9e0dc774a44b6c71e6bc1ca5b86.sql', 'D:/Hong/neon-sts/SmartGroupWareSystem/Smart_Groupware_System/src/main/webapp/WEB-INF/views/approve/file', 'sql'),
	(78, 0, 4, 9, 'ee', 1, '2017-03-06 13:37:00', 4, 0, 0, '1차결재최종승인', 'true', NULL, '4a03f32d6c94472e9110b33102d82a1b.sql', 'D:/Hong/neon-sts/SmartGroupWareSystem/Smart_Groupware_System/src/main/webapp/WEB-INF/views/approve/file', 'sql'),
	(79, 0, 4, 10, '페이징', 1, '2017-03-06 13:38:26', 3, 3, 0, '1차미결재대기', 'true', 'draft.sql', '42f539d7e9dd4faea59ead6da2d1bbcb.sql', 'D:/Hong/neon-sts/SmartGroupWareSystem/Smart_Groupware_System/src/main/webapp/WEB-INF/views/approve/file', 'sql'),
	(80, 0, 3, 10, '배가고프다', 1, '2017-03-06 16:27:56', 1, 4, 0, '1차미결재대기', 'true', 'draft.sql', '4a08250371614b41b8ffb89a295bb5ca.sql', 'D:/Hong/neon-sts/SmartGroupWareSystem/Smart_Groupware_System/src/main/webapp/WEB-INF/views/approve/file', 'sql'),
	(81, 0, 3, 10, '배가고프다', 2, '2017-03-06 16:29:15', 1, 4, 0, '2차미결재대기', 'true', 'draft.sql', 'ef73f92162a543bbb8958cd66336f793.sql', 'D:/Hong/neon-sts/SmartGroupWareSystem/Smart_Groupware_System/src/main/webapp/WEB-INF/views/approve/file', 'sql'),
	(82, 0, 3, 10, '학원에서의업로드', 1, '2017-03-06 16:58:13', 2, 4, 0, '1차미결재대기', 'true', 'dto.png', 'df369f500f9747e1ad2662e5baa4aaf1.png', 'D:/Hong/neon-sts/SmartGroupWareSystem/Smart_Groupware_System/src/main/webapp/WEB-INF/views/approve/file', 'png'),
	(83, 0, 1, 11, '간당하게생각하기', 1, '2017-03-07 10:19:15', 2, 0, 0, '1차미결재대기', 'true', '작업순서.txt', 'ef224d1ebaa94bb19f06cdacbe07f992.txt', 'D:/Hong/neon-sts/SmartGroupWareSystem/Smart_Groupware_System/src/main/webapp/WEB-INF/views/approve/file', 'txt'),
	(84, 0, 10, 11, '테스트란다', 1, '2017-03-07 11:18:18', 2, 1, 0, '1차미결재대기', 'true', '01조_로그인체크후String리턴_조별완벽분석_161005.xlsx', 'b0b7aaea8f8d493c858963ff41fc0d61.xlsx', 'D:/Hong/neon-sts/SmartGroupWareSystem/Smart_Groupware_System/src/main/webapp/WEB-INF/views/approve/file', 'xlsx');
/*!40000 ALTER TABLE `draft` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. employeementInsurance
DROP TABLE IF EXISTS `employeementInsurance`;
CREATE TABLE IF NOT EXISTS `employeementInsurance` (
  `ei_code` int(11) NOT NULL AUTO_INCREMENT,
  `ei_year` int(11) NOT NULL,
  `ei_employee` float NOT NULL,
  `ei_owner1` float NOT NULL,
  `ei_owner2` float NOT NULL,
  `ei_owner3` float NOT NULL,
  `ei_owner4` float NOT NULL,
  PRIMARY KEY (`ei_code`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='고용보험';

-- Dumping data for table rang1536.employeementInsurance: 1 rows
DELETE FROM `employeementInsurance`;
/*!40000 ALTER TABLE `employeementInsurance` DISABLE KEYS */;
INSERT INTO `employeementInsurance` (`ei_code`, `ei_year`, `ei_employee`, `ei_owner1`, `ei_owner2`, `ei_owner3`, `ei_owner4`) VALUES
	(1, 2017, 0.065, 0.025, 0.0025, 0.0025, 0.0025);
/*!40000 ALTER TABLE `employeementInsurance` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. evaluation
DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE IF NOT EXISTS `evaluation` (
  `ev_code` int(11) NOT NULL AUTO_INCREMENT,
  `ev_standard1` int(11) NOT NULL,
  `ev_standard2` int(11) NOT NULL,
  `ev_standard3` int(11) NOT NULL,
  `ev_eval` varchar(100) NOT NULL,
  PRIMARY KEY (`ev_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='평가';

-- Dumping data for table rang1536.evaluation: 0 rows
DELETE FROM `evaluation`;
/*!40000 ALTER TABLE `evaluation` DISABLE KEYS */;
/*!40000 ALTER TABLE `evaluation` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. extraSchedule
DROP TABLE IF EXISTS `extraSchedule`;
CREATE TABLE IF NOT EXISTS `extraSchedule` (
  `es_code` int(11) NOT NULL AUTO_INCREMENT,
  `mm_code` int(11) NOT NULL,
  `es_startDate` date NOT NULL,
  `es_endDate` date DEFAULT NULL,
  `es_costSort` tinyint(1) NOT NULL,
  `es_note` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`es_code`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='근외일정';

-- Dumping data for table rang1536.extraSchedule: 1 rows
DELETE FROM `extraSchedule`;
/*!40000 ALTER TABLE `extraSchedule` DISABLE KEYS */;
INSERT INTO `extraSchedule` (`es_code`, `mm_code`, `es_startDate`, `es_endDate`, `es_costSort`, `es_note`) VALUES
	(1, 1, '2017-02-20', '2017-02-24', 0, '유급휴가');
/*!40000 ALTER TABLE `extraSchedule` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. funds
DROP TABLE IF EXISTS `funds`;
CREATE TABLE IF NOT EXISTS `funds` (
  `fu_code` int(11) NOT NULL AUTO_INCREMENT,
  `pr_code` int(11) DEFAULT NULL,
  `fu_history` varchar(50) NOT NULL,
  `fu_expectedMoney` varchar(50) NOT NULL,
  `fu_usedMoney` int(11) DEFAULT NULL,
  `fu_addMoney` int(11) DEFAULT NULL,
  `fu_addReason` varchar(50) DEFAULT NULL,
  `fu_draftCheck` char(2) DEFAULT NULL,
  PRIMARY KEY (`fu_code`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='자금';

-- Dumping data for table rang1536.funds: 26 rows
DELETE FROM `funds`;
/*!40000 ALTER TABLE `funds` DISABLE KEYS */;
INSERT INTO `funds` (`fu_code`, `pr_code`, `fu_history`, `fu_expectedMoney`, `fu_usedMoney`, `fu_addMoney`, `fu_addReason`, `fu_draftCheck`) VALUES
	(1, NULL, '', '', NULL, NULL, NULL, NULL),
	(2, NULL, '인건비', '400000', NULL, NULL, NULL, NULL),
	(3, NULL, '조사비', '200000', NULL, NULL, NULL, NULL),
	(4, NULL, '자제사용료', '400000', NULL, NULL, NULL, NULL),
	(5, NULL, '', '', NULL, NULL, NULL, NULL),
	(6, NULL, '영화조사비', '300000', NULL, NULL, NULL, NULL),
	(7, NULL, '인건비', '200000', NULL, NULL, NULL, NULL),
	(8, 8, '', '', NULL, NULL, NULL, NULL),
	(9, 8, '조사비', '200000', NULL, NULL, NULL, NULL),
	(10, 8, '인건비', '800000', NULL, NULL, NULL, NULL),
	(11, 9, '', '', NULL, NULL, NULL, NULL),
	(12, 9, '데이터구하기', '50000', NULL, NULL, NULL, NULL),
	(13, 9, '제작비', '50000', NULL, NULL, NULL, NULL),
	(14, 10, '', '', NULL, NULL, NULL, NULL),
	(15, 10, '애완견등록비', '20000', NULL, NULL, NULL, NULL),
	(16, 10, '제작비', '80000', NULL, NULL, NULL, NULL),
	(17, 11, '연구비', '300000', NULL, NULL, NULL, NULL),
	(18, 11, '자제비', '200000', NULL, NULL, NULL, NULL),
	(19, 12, '인건비', '1600000', NULL, NULL, NULL, NULL),
	(20, 12, '설계조사비', '800000', NULL, NULL, NULL, NULL),
	(21, 13, '시장조사', '1000000', NULL, NULL, NULL, NULL),
	(22, 14, '자제구입비', '50000', 50000, NULL, NULL, NULL),
	(23, 14, '인건비', '50000', 30000, NULL, NULL, NULL),
	(24, 14, '간식비', '10000', 5000, NULL, NULL, NULL),
	(25, 14, '비품구입비', '10000', NULL, NULL, NULL, NULL),
	(26, 14, '123123', '21321312', NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `funds` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. incentive
DROP TABLE IF EXISTS `incentive`;
CREATE TABLE IF NOT EXISTS `incentive` (
  `in_code` int(11) NOT NULL AUTO_INCREMENT,
  `re_code` int(11) NOT NULL,
  `mm_code` int(11) NOT NULL,
  `in_kind` varchar(12) NOT NULL,
  `in_bonus` int(11) NOT NULL,
  `in_possible` tinyint(1) NOT NULL,
  `in_group` varchar(20) NOT NULL,
  `in_date` date NOT NULL,
  `in_mmCode` int(11) NOT NULL,
  PRIMARY KEY (`in_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='성과급';

-- Dumping data for table rang1536.incentive: 0 rows
DELETE FROM `incentive`;
/*!40000 ALTER TABLE `incentive` DISABLE KEYS */;
/*!40000 ALTER TABLE `incentive` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. license
DROP TABLE IF EXISTS `license`;
CREATE TABLE IF NOT EXISTS `license` (
  `lc_code` int(11) NOT NULL AUTO_INCREMENT,
  `lc_name` varchar(50) NOT NULL,
  `lc_organization` varchar(50) NOT NULL,
  `lc_type` varchar(30) NOT NULL,
  `lc_note` varchar(100) NOT NULL,
  PRIMARY KEY (`lc_code`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='자격증';

-- Dumping data for table rang1536.license: 14 rows
DELETE FROM `license`;
/*!40000 ALTER TABLE `license` DISABLE KEYS */;
INSERT INTO `license` (`lc_code`, `lc_name`, `lc_organization`, `lc_type`, `lc_note`) VALUES
	(1, '워드 프로세서 1급', '대한상공회의소', '국가기술자격', '사무정보'),
	(4, '유통관리사 1급', '대한상공회의소', '국가기술자격', '유통,마케팅'),
	(2, '컴퓨터활용능력 1급', '대한상공회의소', '국가기술자격', '사무정보'),
	(3, '컴퓨터활용능력 2급', '대한상공회의소', '국가기술자격', '사무정보'),
	(5, '유통관리사 2급', '대한상공회의소', '국가기술자격', '유통,마케팅'),
	(6, '유통관리사 3급', '대한상공회의소', '국가기술자격', '유통,마케팅'),
	(7, '전자상거래관리사 1급', '대한상공희의소', '국가기술자격', '유통,마케팅'),
	(8, '전자상거래관리사 2급', '대한상공회의소', '국가기술자격', '유통,마케팅'),
	(9, '전자상거래운용사', '대한상공회의소', '국가기술자격', '유통,마케팅'),
	(10, '전산회계운용사', '대한상공회의소', '국가기술자격', '회계,세무'),
	(11, '무역영어', '대한상공회의소', '국가공인자격', '외국어,한자'),
	(12, '정보처리기사', '한국산업인력공단', '국가기술자격', '정보처리전산'),
	(13, '정보처리기능사', '한국산업인력공단', '국가기술자격', '정보처리전산'),
	(14, '산업기사', '한국산업인력공단', '국가기술자격', '정보처리전산');
/*!40000 ALTER TABLE `license` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. majorTypeOfBusiness
DROP TABLE IF EXISTS `majorTypeOfBusiness`;
CREATE TABLE IF NOT EXISTS `majorTypeOfBusiness` (
  `ma_code` int(11) NOT NULL AUTO_INCREMENT,
  `ma_type` varchar(60) NOT NULL,
  PRIMARY KEY (`ma_code`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='상위업종';

-- Dumping data for table rang1536.majorTypeOfBusiness: 9 rows
DELETE FROM `majorTypeOfBusiness`;
/*!40000 ALTER TABLE `majorTypeOfBusiness` DISABLE KEYS */;
INSERT INTO `majorTypeOfBusiness` (`ma_code`, `ma_type`) VALUES
	(1, '서비스업'),
	(2, '제조.화학'),
	(3, 'IT·웹·통신'),
	(4, '은행·금융업'),
	(5, '미디어·디자인'),
	(6, '교육업'),
	(7, '의료·제약·복지'),
	(8, '판매·유통'),
	(9, '건설업');
/*!40000 ALTER TABLE `majorTypeOfBusiness` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. memberAchieve
DROP TABLE IF EXISTS `memberAchieve`;
CREATE TABLE IF NOT EXISTS `memberAchieve` (
  `mc_code` int(11) NOT NULL AUTO_INCREMENT,
  `ac_code` int(11) NOT NULL,
  `mc_schoolName` varchar(50) DEFAULT NULL,
  `mc_admissionDate` date DEFAULT NULL,
  `mc_graduationDate` date DEFAULT NULL,
  `mc_major` varchar(20) DEFAULT NULL,
  `mc_jumsu` double DEFAULT NULL,
  `mc_grade` varchar(50) DEFAULT NULL,
  `mm_code` int(11) NOT NULL,
  PRIMARY KEY (`mc_code`)
) ENGINE=MyISAM AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='사원학력';

-- Dumping data for table rang1536.memberAchieve: 39 rows
DELETE FROM `memberAchieve`;
/*!40000 ALTER TABLE `memberAchieve` DISABLE KEYS */;
INSERT INTO `memberAchieve` (`mc_code`, `ac_code`, `mc_schoolName`, `mc_admissionDate`, `mc_graduationDate`, `mc_major`, `mc_jumsu`, `mc_grade`, `mm_code`) VALUES
	(1, 4, 'A대학교', '2010-03-01', '2017-02-01', '경영', 2.5, '', 0),
	(2, 4, 'B대학교', '2010-03-01', '2015-02-01', '영문', 3.8, '', 0),
	(3, 4, 'C대학교', '2009-03-01', '2016-02-01', '경제', 3.3, '', 0),
	(4, 4, 'D대학교', '2012-03-01', '2017-02-01', '통계', 3.7, '', 0),
	(5, 4, 'E대학교', '2009-03-01', '2014-02-01', '법학', 3.7, '', 0),
	(6, 4, 'F대학교', '2010-03-01', '2017-02-01', '전자기계', 2.8, '', 0),
	(7, 4, 'G대학교', '2008-03-01', '2016-02-01', '관광학', 4, '', 0),
	(8, 4, 'T대학교', '2010-03-01', '2015-03-01', '산업디자인', 3.5, '', 0),
	(9, 4, 'Y대학교', '2011-03-01', '2015-03-01', '국문', 4, '', 0),
	(10, 4, 'U대학교', '2011-03-01', '2017-03-01', '일본어', 3.3, '', 0),
	(11, 7, '서울대', '2015-01-01', '2017-01-01', '경제', 4.5, '매우좋음', 17),
	(12, 7, '서울대', '2015-01-01', '2017-01-01', '경제', 4.5, '매우좋음', 18),
	(13, 5, '전북대학교', '2012-01-01', '2016-03-03', '경제학과', 3.5, '보통', 19),
	(14, 5, '전북대학교', '2012-01-01', '2016-01-01', '전자과', 3.5, '그냥그럼', 20),
	(15, 5, '전북대학교', '2012-01-01', '2016-01-01', '전자과', 3.5, '그냥그럼', 21),
	(16, 5, '전북대학교', '2009-01-01', '2017-01-01', '전자컴퓨터', 2.5, '좋음', 22),
	(17, 5, '전북대학교', '2009-01-01', '2017-01-01', '전자컴퓨터', 2.5, '좋음', 23),
	(18, 5, '전북대학교', '2009-01-01', '2017-01-01', '전자컴퓨터', 2.5, '좋음', 24),
	(19, 4, '비전대', '2013-10-28', '2016-12-31', '요리', 3.5, '', 25),
	(20, 3, 'AC고등학교', '2012-01-01', '2015-01-01', '없음', 0, '없음', 26),
	(21, 3, 'AC고등학교', '2012-01-01', '2015-01-01', '없음', 0, '없음', 27),
	(22, 7, '공유대학교', '2011-07-27', '2017-12-31', '경영학과', 4, '매우좋음', 28),
	(23, 7, '공유대학교', '2011-07-27', '2017-12-31', '경영학과', 4, '매우좋음', 29),
	(24, 5, '연영대학교', '2011-01-01', '2017-01-01', '연기', 4.5, '매우좋음', 30),
	(25, 5, '연영대학교', '2011-01-01', '2017-01-01', '연기', 4.5, '매우좋음', 31),
	(26, 5, '연영대학교', '2011-01-01', '2017-01-01', '연기', 4.5, '매우좋음', 32),
	(27, 4, '전문적인대학교', '2009-03-03', '2011-03-03', '몰라전공', 3.3, '몰라몰라', 33),
	(28, 4, '전문적인대학교', '2009-03-03', '2011-03-03', '몰라전공', 3.3, '몰라몰라', 34),
	(29, 5, '중앙대학교', '2010-11-30', '2016-11-30', '연기', 4.5, '좋음', 35),
	(30, 5, '중앙대학교', '2010-11-30', '2016-11-30', '연기', 4.5, '좋음', 36),
	(31, 3, '123', '2017-02-05', '2017-02-14', '21', 321, '123', 37),
	(32, 5, '전북대학교', '2017-03-01', '2017-03-10', '산업전자', 3.8, '보통', 0),
	(33, 5, '전남대학교', '2017-03-01', '2017-03-10', '전자과', 3.8, '보통', 0),
	(34, 5, '전남대학교', '2017-03-01', '2017-03-10', '전자과', 3.8, '보통', 0),
	(35, 5, '전남대학교', '2017-03-01', '2017-03-10', '전자과', 3.8, '보통', 0),
	(36, 5, '전남대학교', '2017-03-01', '2017-03-10', '전자과', 3.8, '보통', 0),
	(37, 5, '전남대학교', '2017-03-01', '2017-03-10', '전자과', 3.8, '보통', 0),
	(38, 5, '전남대학교', '2017-03-01', '2017-03-10', '전자과', 3.8, '보통', 0),
	(39, 5, '김일성대학', '2017-03-02', '2017-03-25', '도박', 4.5, '보통', 46);
/*!40000 ALTER TABLE `memberAchieve` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. memberLicense
DROP TABLE IF EXISTS `memberLicense`;
CREATE TABLE IF NOT EXISTS `memberLicense` (
  `ml_code` int(11) NOT NULL AUTO_INCREMENT,
  `lc_code` int(11) NOT NULL,
  `ml_issueDate` varchar(50) DEFAULT NULL,
  `mm_code` int(11) DEFAULT NULL,
  PRIMARY KEY (`ml_code`)
) ENGINE=MyISAM AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='사원자격증';

-- Dumping data for table rang1536.memberLicense: 44 rows
DELETE FROM `memberLicense`;
/*!40000 ALTER TABLE `memberLicense` DISABLE KEYS */;
INSERT INTO `memberLicense` (`ml_code`, `lc_code`, `ml_issueDate`, `mm_code`) VALUES
	(1, 1, '2016-02-03', 1),
	(2, 2, '2016-04-07', 1),
	(3, 3, '2016-04-07', 1),
	(4, 4, '2016-04-07', 1),
	(5, 5, '2016-02-03', 2),
	(6, 6, '2016-02-03', 2),
	(7, 7, '2016-02-03', 2),
	(8, 8, '2016-02-03', 2),
	(9, 9, '2016-02-03', 3),
	(10, 10, '2016-02-03', 3),
	(11, 11, '2016-02-03', 3),
	(12, 12, '2016-02-03', 4),
	(13, 13, '2016-02-03', 4),
	(14, 14, '2016-02-03', 4),
	(15, 1, '0000-00-00', 18),
	(16, 1, '2017-02-01', 21),
	(17, 1, '2017-02-02', 22),
	(18, 1, '2017-02-02', 23),
	(19, 1, '2017-02-02', 24),
	(20, 13, '2017-02-06', 25),
	(21, 4, '2017-02-08', 27),
	(22, 0, NULL, 30),
	(23, 0, NULL, 31),
	(24, 0, NULL, 32),
	(25, 7, '2012-07-27', 34),
	(26, 0, '2016.11.2', 35),
	(27, 0, '2016.11.2', 36),
	(28, 0, '2017-02-28,', 37),
	(29, 0, NULL, NULL),
	(30, 0, NULL, NULL),
	(31, 0, NULL, NULL),
	(32, 0, NULL, NULL),
	(33, 0, NULL, NULL),
	(34, 0, NULL, NULL),
	(35, 3, '2017-02-01', NULL),
	(36, 0, NULL, NULL),
	(37, 0, NULL, NULL),
	(38, 0, NULL, NULL),
	(39, 0, NULL, NULL),
	(40, 7, '2017-01-01', NULL),
	(41, 10, '2017-01-02', NULL),
	(42, 13, '2017-01-03', NULL),
	(43, 2, '2017-03-01', 46),
	(44, 5, '2017-03-26', 46);
/*!40000 ALTER TABLE `memberLicense` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. memberManagement
DROP TABLE IF EXISTS `memberManagement`;
CREATE TABLE IF NOT EXISTS `memberManagement` (
  `mm_code` int(11) NOT NULL AUTO_INCREMENT,
  `ct_code` int(11) NOT NULL,
  `pt_code` int(11) NOT NULL,
  `dp_code` int(11) NOT NULL,
  `mm_name` varchar(15) NOT NULL,
  `mm_dailyPay` int(11) NOT NULL,
  `mm_joinDate` date NOT NULL,
  `mm_resignDate` date DEFAULT NULL,
  `mm_annualLeave` int(11) NOT NULL,
  `mm_army` int(11) NOT NULL,
  `mm_email` varchar(100) NOT NULL,
  `mm_marriage` int(11) NOT NULL,
  `mm_password` varchar(50) NOT NULL,
  `mm_sign` varchar(200) DEFAULT NULL,
  `mm_address` varchar(100) NOT NULL,
  `mm_tel` varchar(16) NOT NULL,
  `mm_bank` varchar(15) NOT NULL,
  `mm_account` varchar(15) NOT NULL,
  PRIMARY KEY (`mm_code`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='사원관리';

-- Dumping data for table rang1536.memberManagement: 46 rows
DELETE FROM `memberManagement`;
/*!40000 ALTER TABLE `memberManagement` DISABLE KEYS */;
INSERT INTO `memberManagement` (`mm_code`, `ct_code`, `pt_code`, `dp_code`, `mm_name`, `mm_dailyPay`, `mm_joinDate`, `mm_resignDate`, `mm_annualLeave`, `mm_army`, `mm_email`, `mm_marriage`, `mm_password`, `mm_sign`, `mm_address`, `mm_tel`, `mm_bank`, `mm_account`) VALUES
	(1, 1, 1, 4, '방상엽', 100000, '2017-02-01', NULL, 5, 0, 'freebsy@gmail.com', 0, '123456', '', '전주시 서신동', '010-1234-5678', '전북은행', '0123-4567-8912'),
	(2, 1, 1, 4, '고은비', 120000, '2017-02-01', NULL, 5, 0, 'gnb@naver.com', 0, '123456', '', '전주시 서신동', '010-2354-5656', '전북은행', '1235-4567-7897'),
	(3, 1, 1, 4, '홍수아', 110000, '2017-02-02', NULL, 5, 0, 'hsa@naver.com', 0, '123456', NULL, '전주시', '010-3535-4545', '전북은행', '1234-5678-979'),
	(4, 1, 1, 4, '윤재호', 120000, '2017-02-17', NULL, 5, 0, 'yjh@naver.com', 1, '123456', NULL, '전주시 효자동', '010-1256-9797', '전북은행', '6565-4545-797'),
	(5, 1, 1, 4, '김정빈', 90000, '2017-02-22', NULL, 5, 0, 'acac@baber.com', 0, '123456', NULL, '전북대 원룸', '010-4545-6565', '신한은행', '121234345656'),
	(6, 1, 1, 4, '김진남', 90000, '2017-02-22', '2017-02-22', 5, 1, 'acac@baber.com', 1, '123456', NULL, '전북대 원룸', '010-4545-6565', '신한은행', '121234345656'),
	(7, 1, 1, 1, '조민국', 6000, '2015-02-02', NULL, 1, 1, 'jmg@smart.com', 0, '123456', NULL, '전주시 평화동', '010-5454-3445', '농협', '12345678987'),
	(8, 1, 1, 1, '김정빈', 50000, '2016-10-27', NULL, 5, 1, 'kjb@smart.com', 0, '123456', NULL, '전북대 원룸', '010-3434-5454', '신한은행', '2345678974'),
	(9, 2, 2, 2, '123456', 60000, '2016-10-22', NULL, 4, 1, 'asasff@asfaf.com', 0, '123456', NULL, '전주시 서신동 원룸', '010-5454-3449', '농협', '256454654654'),
	(10, 2, 2, 2, '123456', 60000, '2016-10-22', NULL, 4, 1, 'asasff@asfaf.com', 0, '', NULL, '전주시 서신동 원룸', '010-5454-3449', '농협', '256454654654'),
	(11, 2, 2, 2, '123456', 60000, '2016-10-22', NULL, 4, 1, 'asasff@asfaf.com', 0, '', NULL, '전주시 서신동 원룸', '010-5454-3449', '농협', '256454654654'),
	(12, 2, 2, 2, '123456', 60000, '2016-10-22', NULL, 4, 1, 'asasff@asfaf.com', 0, 'asdf', NULL, '전주시 서신동 원룸', '010-5454-3449', '농협', '256454654654'),
	(13, 2, 2, 2, '123456', 60000, '2016-10-22', NULL, 4, 1, 'asasff@asfaf.com', 0, 'dfdf', NULL, '전주시 서신동 원룸', '010-5454-3449', '농협', '256454654654'),
	(14, 2, 2, 2, '123456', 60000, '2016-10-22', NULL, 4, 1, 'asasff@asfaf.com', 0, 'fdag', NULL, '전주시 서신동 원룸', '010-5454-3449', '농협', '256454654654'),
	(15, 2, 2, 2, '123456', 60000, '2016-10-22', NULL, 4, 1, 'asasff@asfaf.com', 0, '1', NULL, '전주시 서신동 원룸', '010-5454-3449', '농협', '256454654654'),
	(16, 2, 2, 2, '123456', 60000, '2016-10-22', NULL, 4, 1, 'asasff@asfaf.com', 0, '1234', NULL, '전주시 서신동 원룸', '010-5454-3449', '농협', '356454654654'),
	(17, 3, 2, 3, '242424', 40000, '2015-02-02', NULL, 50, 1, '24242@smart.com', 1, '123456', NULL, '서울시 개발동', '010-5050-4040', '시티은행', '789987456'),
	(18, 3, 2, 3, '343434', 40000, '2015-02-02', NULL, 50, 1, '24242@smart.com', 1, '', NULL, '서울시 개발동', '010-5050-4040', '시티은행', '789987456'),
	(19, 4, 1, 5, '최유민', 40000, '2013-01-01', NULL, 30, 1, 'cym@smart.com', 0, '1234', NULL, '전주시 서신동 원룸', '010-3333-4444', '농협', '9797954545645'),
	(20, 5, 1, 5, '정상일', 100000, '2017-01-01', NULL, 1, 1, 'jsl@smart.com', 1, '1234', NULL, '전주시 효자동', '010-3939-3939', '농협', '6546556165'),
	(21, 5, 1, 5, '정상일', 100000, '2017-01-01', NULL, 1, 1, 'jsl@smart.com', 1, '1234', NULL, '전주시 효자동', '010-3939-3939', '농협', '6546556165'),
	(22, 3, 2, 4, '이명철', 75000, '2010-12-31', NULL, 55, 1, 'lmh@smart.com', 1, '123456', NULL, '전주시 효자도오오옹', '010-7979-9797', '농협', '4564654654'),
	(23, 3, 2, 4, '이명철1', 75000, '2010-12-31', NULL, 55, 1, 'lmh@smart.com', 1, '', NULL, '전주시 효자도오오옹', '010-7979-9797', '농협', '4564654654'),
	(24, 3, 2, 4, '이명철2', 75000, '2010-12-31', NULL, 55, 1, 'lmh@smart.com', 1, '', NULL, '전주시 효자도오오옹', '010-7979-9797', '농협', '4564654654'),
	(25, 7, 1, 2, '황달규', 80000, '2015-12-30', NULL, 90, 1, 'hmg@smart.com', 0, '123456', NULL, '전주시 효자동 거시기', '010-5656-6565', '농협', '564894646'),
	(26, 2, 1, 2, '김의진', 1000, '2015-11-30', NULL, 13, 0, 'kyj@smart.com', 0, '123456', NULL, '전주시 덕진구', '011-654-7878', '하나은행', '456465461'),
	(27, 2, 1, 2, '김의진', 1000, '2015-11-30', NULL, 13, 0, 'kyj@smart.com', 0, '1234', NULL, '전주시 덕진구', '011-654-7878', '하나은행', '456465461'),
	(28, 5, 5, 6, '공유기', 999999, '2010-12-31', NULL, 0, 0, 'gg@naver.com', 1, '123456', NULL, '서울시 강남구', '010-9999-9999', '신한은행', '45648612365'),
	(29, 5, 5, 6, '공유기', 999999, '2010-12-31', NULL, 0, 0, 'gg@naver.com', 1, '123456', NULL, '서울시 강남구', '010-9999-9999', '신한은행', '45648612365'),
	(30, 1, 4, 1, '송중기', 9500000, '2016-01-01', NULL, 50, 1, 'ssong@naver.com', 0, '123456', NULL, '서울시 강북', '010-3131-4141', '국민은행', '795132165'),
	(31, 1, 4, 1, '송중기1', 9500000, '2016-01-01', NULL, 50, 1, 'ssong11@naver.com', 0, '123456', NULL, '서울시 강북', '010-3131-4141', '국민은행', '795132165'),
	(32, 1, 4, 1, '송중기1', 9500000, '2016-01-01', NULL, 50, 1, 'ssong11@naver.com', 0, '123456', NULL, '서울시 강북', '010-3131-4141', '국민은행', '795132165'),
	(33, 6, 1, 2, '임꺽정', 151515, '2015-01-01', NULL, 31, 1, 'kkk@naver.com', 1, '123456', NULL, '경기도 무슨시 무슨동', '011-654-9465', '기업은행', '778961561'),
	(34, 6, 1, 2, '임꺽정', 151515, '2015-01-01', NULL, 31, 1, 'kkk@naver.com', 1, '123456', NULL, '경기도 무슨시 무슨동', '011-654-9465', '시티은행', '62165413'),
	(35, 1, 3, 6, '고아라', 545000, '2009-02-02', NULL, 50, 0, 'ara@naver.com', 0, '123456', NULL, '서울시 강서구', '019-9754-5644', '우리은행', '789216544'),
	(36, 1, 3, 6, '고아라', 545000, '2009-02-02', NULL, 50, 0, 'ara@naver.com', 0, '123456', NULL, '서울시 강서구', '019-9754-5644', '우리은행', '789216544'),
	(37, 2, 4, 6, '1234561', 1, '2017-02-06', NULL, 1, 0, '1', 0, '1', NULL, '12', '32', '국민은행', '1233123213'),
	(38, 3, 3, 3, '김범수', 954954, '2017-03-09', NULL, 50, 0, 'kkk@naver.com', 0, '123456', NULL, '서울시 행복동', '010-3333-4444', '하나은행', '45671651'),
	(39, 2, 3, 6, '홍인용', 40000, '2017-03-15', NULL, 60, 1, 'hong@smart.com', 1, '123456', NULL, '전주시 효자동 비전대', '010-9546-7546', '농협', '0179216546'),
	(40, 2, 3, 6, '홍인용1', 40000, '2017-03-15', NULL, 60, 1, 'hong1@smart.com', 1, '123456', NULL, '전주시 효자동 비전대', '010-9546-7546', '농협', '0179216546'),
	(41, 2, 3, 6, '홍인용1', 40000, '2017-03-15', NULL, 60, 1, 'hong1@smart.com', 1, '123456', NULL, '전주시 효자동 비전대', '010-9546-7546', '농협', '0179216546'),
	(42, 2, 3, 6, '홍인용1', 40000, '2017-03-15', NULL, 60, 1, 'hong1@smart.com', 1, '123456', NULL, '전주시 효자동 비전대', '010-9546-7546', '농협', '0179216546'),
	(43, 2, 3, 6, '홍인용1', 40000, '2017-03-15', NULL, 60, 1, 'hong1@smart.com', 1, '123456', NULL, '전주시 효자동 비전대', '010-9546-7546', '농협', '0179216546'),
	(44, 2, 3, 6, '홍인용1', 40000, '2017-03-15', NULL, 60, 1, 'hong1@smart.com', 1, '123456', NULL, '전주시 효자동 비전대', '010-9546-7546', '농협', '0179216546'),
	(45, 2, 3, 6, '홍인용1', 40000, '2017-03-15', NULL, 60, 1, 'hong1@smart.com', 1, '123456', NULL, '전주시 효자동 비전대', '010-9546-7546', '농협', '0179216546'),
	(46, 6, 3, 7, '김정남', 1234567, '2017-03-10', NULL, 999, 1, 'nor@th.com', 1, '123456', NULL, '말레이시아 ', '016-4654-7897', '기업은행', '45671216');
/*!40000 ALTER TABLE `memberManagement` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. minorTypeOfBusiness
DROP TABLE IF EXISTS `minorTypeOfBusiness`;
CREATE TABLE IF NOT EXISTS `minorTypeOfBusiness` (
  `mi_code` int(11) NOT NULL AUTO_INCREMENT,
  `mi_type` varchar(60) NOT NULL,
  PRIMARY KEY (`mi_code`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='하위업종';

-- Dumping data for table rang1536.minorTypeOfBusiness: 21 rows
DELETE FROM `minorTypeOfBusiness`;
/*!40000 ALTER TABLE `minorTypeOfBusiness` DISABLE KEYS */;
INSERT INTO `minorTypeOfBusiness` (`mi_code`, `mi_type`) VALUES
	(1, '호텔,여행,항공,외식업,식음료,레저,스포츠,여가'),
	(2, '관리.경비.용역'),
	(3, 'AS,카센터,주유,렌탈,임대'),
	(4, '웨딩,장례,이벤트,뷰티,미용,기타 서비스업'),
	(5, '전기,전자,제어,기계,설비,자동차'),
	(6, '석유,화학,에너지,섬유,의류,패션,화장품,뷰티'),
	(7, '소비재,사무,가구,목재,제지'),
	(8, '농업,어업.광업,임업'),
	(9, '금속,재료,철강,조선,항공,기타제조'),
	(10, '식품가공,개발,반도체,광학,LCD,환경'),
	(11, '솔루션,웹에이젼시,쇼핑몰,오픈마켓,포털,인터넷'),
	(12, '네트워크,통신,모바일,하드웨어,장비,정보보안,게임'),
	(13, '은행,금융,저축,대출,캐피탈,증권,보험,카드,기타금융'),
	(14, '신문,잡지,언론,방송사.케이블,연예,엔터테인먼트'),
	(15, '광고,홍보,전시,영화,배급.음악,공연,예술,문화'),
	(16, '출판,인쇄,사진,캐릭터,애니메이션,디자인,설계'),
	(17, '초중고,대학,학원,어학원,유아,유치원,교재,학습지,전문,기능학원'),
	(18, '의료,제약,보건,바이오,사회복지'),
	(19, '판매,유통,무역,상사,운송,운수,물류'),
	(20, '건설,건축,토목,시공,실내,인테리어,조경,환경,설비'),
	(21, '부동산,임대,중개');
/*!40000 ALTER TABLE `minorTypeOfBusiness` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. nationalHealthInsurance
DROP TABLE IF EXISTS `nationalHealthInsurance`;
CREATE TABLE IF NOT EXISTS `nationalHealthInsurance` (
  `nhi_code` int(11) NOT NULL AUTO_INCREMENT,
  `nhi_year` int(11) NOT NULL,
  `nhi_employee` float NOT NULL,
  `nhi_owner` float NOT NULL,
  `nhi_longEmployee` float NOT NULL,
  `nhi_longOwner` float NOT NULL,
  PRIMARY KEY (`nhi_code`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='국민건강보험';

-- Dumping data for table rang1536.nationalHealthInsurance: 1 rows
DELETE FROM `nationalHealthInsurance`;
/*!40000 ALTER TABLE `nationalHealthInsurance` DISABLE KEYS */;
INSERT INTO `nationalHealthInsurance` (`nhi_code`, `nhi_year`, `nhi_employee`, `nhi_owner`, `nhi_longEmployee`, `nhi_longOwner`) VALUES
	(1, 2017, 0.0306, 0.0306, 0.03275, 0.03275);
/*!40000 ALTER TABLE `nationalHealthInsurance` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. occupationalHealthSafetyInsurance
DROP TABLE IF EXISTS `occupationalHealthSafetyInsurance`;
CREATE TABLE IF NOT EXISTS `occupationalHealthSafetyInsurance` (
  `ohi_code` int(11) NOT NULL AUTO_INCREMENT,
  `ohi_year` int(11) NOT NULL,
  `ohi_extra` float NOT NULL,
  `ohi_help` float NOT NULL,
  PRIMARY KEY (`ohi_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='산재보험';

-- Dumping data for table rang1536.occupationalHealthSafetyInsurance: 0 rows
DELETE FROM `occupationalHealthSafetyInsurance`;
/*!40000 ALTER TABLE `occupationalHealthSafetyInsurance` DISABLE KEYS */;
/*!40000 ALTER TABLE `occupationalHealthSafetyInsurance` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. payContent
DROP TABLE IF EXISTS `payContent`;
CREATE TABLE IF NOT EXISTS `payContent` (
  `pc_code` int(11) NOT NULL AUTO_INCREMENT,
  `mm_code` int(11) NOT NULL,
  `pc_date` date NOT NULL,
  `pc_clasificar` varchar(10) NOT NULL,
  `pc_middleClasificar` varchar(15) NOT NULL,
  `pc_amount` int(11) NOT NULL,
  `pa_mmCode` int(11) NOT NULL,
  PRIMARY KEY (`pc_code`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='급여상세';

-- Dumping data for table rang1536.payContent: 0 rows
DELETE FROM `payContent`;
/*!40000 ALTER TABLE `payContent` DISABLE KEYS */;
/*!40000 ALTER TABLE `payContent` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. pensionInsurance
DROP TABLE IF EXISTS `pensionInsurance`;
CREATE TABLE IF NOT EXISTS `pensionInsurance` (
  `pp_code` int(11) NOT NULL AUTO_INCREMENT,
  `pp_year` int(11) NOT NULL,
  `pp_employee` float NOT NULL,
  `pp_owner` float NOT NULL,
  PRIMARY KEY (`pp_code`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='연금보험';

-- Dumping data for table rang1536.pensionInsurance: 1 rows
DELETE FROM `pensionInsurance`;
/*!40000 ALTER TABLE `pensionInsurance` DISABLE KEYS */;
INSERT INTO `pensionInsurance` (`pp_code`, `pp_year`, `pp_employee`, `pp_owner`) VALUES
	(1, 2017, 0.045, 0.045);
/*!40000 ALTER TABLE `pensionInsurance` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. progress
DROP TABLE IF EXISTS `progress`;
CREATE TABLE IF NOT EXISTS `progress` (
  `pro_code` int(11) NOT NULL AUTO_INCREMENT,
  `dft_code` int(11) NOT NULL,
  `pro_time` datetime DEFAULT NULL,
  `pro_reason` varchar(100) DEFAULT NULL,
  `pro_state` int(11) NOT NULL,
  `pro_personalState` tinyint(1) NOT NULL,
  `pro_turn` int(11) DEFAULT NULL,
  `pro_realTime` datetime DEFAULT NULL,
  `pro_approval` int(11) NOT NULL,
  PRIMARY KEY (`pro_code`)
) ENGINE=MyISAM AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='진행';

-- Dumping data for table rang1536.progress: 35 rows
DELETE FROM `progress`;
/*!40000 ALTER TABLE `progress` DISABLE KEYS */;
INSERT INTO `progress` (`pro_code`, `dft_code`, `pro_time`, `pro_reason`, `pro_state`, `pro_personalState`, `pro_turn`, `pro_realTime`, `pro_approval`) VALUES
	(39, 66, '2017-03-03 16:23:13', '', 1, 1, 2, '2017-03-06 12:58:53', 3),
	(38, 65, '2017-03-03 15:48:49', NULL, 0, 0, 1, NULL, 2),
	(37, 64, '2017-03-03 12:33:00', '123', 2, 0, 2, '2017-03-06 12:58:53', 1),
	(36, 63, '2017-03-03 12:33:00', '디자인걱정', 2, 0, 1, '2017-03-03 12:33:00', 1),
	(35, 62, '2017-03-02 11:59:45', '', 0, 0, 3, '2017-03-06 16:58:13', 3),
	(33, 60, '2017-03-02 11:13:30', '', 1, 1, 2, '2017-03-03 11:18:07', 3),
	(32, 59, '2017-03-02 11:13:30', '반려히터가돌아간다', 2, 0, 1, '2017-03-02 11:13:30', 2),
	(30, 57, '2017-03-02 10:57:56', '', 1, 1, 3, '2017-03-02 11:13:30', 2),
	(31, 58, '2017-03-02 11:13:30', '', 1, 1, 2, '2017-03-06 16:58:13', 2),
	(29, 56, '2017-03-02 10:57:56', '반려시켜주마', 2, 1, 1, '2017-03-02 10:57:56', 2),
	(34, 61, '2017-03-02 11:13:30', '넌반려니까', 2, 0, 2, '2017-03-02 11:13:30', 1),
	(28, 55, '2017-03-02 10:57:56', '아하하하너는반려니까', 2, 1, 2, '2017-03-02 10:57:56', 2),
	(26, 53, '2017-03-02 10:57:56', '반려테스트', 2, 1, 2, '2017-03-03 16:23:13', 4),
	(27, 54, '2017-03-02 10:57:56', '룰룰랄라', 2, 0, 2, '2017-03-02 10:57:56', 1),
	(24, 51, '2017-03-02 10:57:56', '', 1, 1, 3, '2017-03-02 10:57:56', 4),
	(25, 52, '2017-03-02 10:57:56', '', 1, 1, 1, '2017-03-02 10:57:56', 1),
	(23, 50, '2017-03-02 10:57:56', '', 1, 1, 3, '2017-03-02 10:57:56', 3),
	(40, 67, '2017-03-03 16:23:13', NULL, 0, 0, 1, NULL, 1),
	(41, 68, '2017-03-06 09:25:13', '배가고프다', 2, 0, 1, '2017-03-06 16:58:13', 1),
	(42, 69, '2017-03-06 12:20:15', '', 0, 0, 2, '2017-03-06 13:38:26', 1),
	(43, 70, '2017-03-06 12:33:50', '', 0, 0, 2, '2017-03-06 12:58:53', 2),
	(44, 71, '2017-03-06 12:39:52', '', 0, 0, 2, '2017-03-06 16:58:13', 3),
	(45, 72, '2017-03-06 12:43:34', NULL, 0, 0, 1, NULL, 2),
	(46, 73, '2017-03-06 12:43:34', NULL, 0, 0, 1, NULL, 1),
	(47, 74, '2017-03-06 12:55:50', '', 0, 0, 2, '2017-03-06 16:58:13', 4),
	(48, 75, '2017-03-06 12:58:07', NULL, 0, 0, 1, NULL, 1),
	(49, 76, '2017-03-06 13:10:06', '', 0, 0, 2, '2017-03-06 16:58:13', 3),
	(50, 77, '2017-03-06 13:34:52', '', 1, 1, 1, '2017-03-06 16:58:13', 4),
	(51, 78, '2017-03-06 13:37:00', '', 1, 1, 1, '2017-03-06 16:58:13', 4),
	(52, 79, '2017-03-06 13:38:26', NULL, 0, 0, 1, NULL, 3),
	(53, 80, '2017-03-06 16:27:56', NULL, 0, 0, 1, NULL, 1),
	(54, 81, '2017-03-06 16:29:15', '', 0, 0, 2, '2017-03-06 16:58:13', 4),
	(55, 82, '2017-03-06 16:58:13', NULL, 0, 0, 1, NULL, 2),
	(56, 83, '2017-03-07 10:19:15', NULL, 0, 0, 1, NULL, 2),
	(57, 84, '2017-03-07 11:18:18', NULL, 0, 0, 1, NULL, 2);
/*!40000 ALTER TABLE `progress` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. project
DROP TABLE IF EXISTS `project`;
CREATE TABLE IF NOT EXISTS `project` (
  `pr_code` int(11) NOT NULL AUTO_INCREMENT,
  `pr_memberCode` int(11) NOT NULL,
  `dft_code` int(11) NOT NULL,
  `pr_name` varchar(20) NOT NULL,
  `pr_member` int(11) NOT NULL,
  `pr_money` int(11) NOT NULL,
  `pr_goal` varchar(100) NOT NULL,
  `pr_progress` varchar(20) NOT NULL,
  `pr_cate` varchar(20) NOT NULL,
  `pr_restration` date DEFAULT NULL,
  `pr_startDay` date NOT NULL,
  `pr_endDay` date NOT NULL,
  `pr_forProgress` varchar(50) DEFAULT NULL,
  `pr_finishCheck` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`pr_code`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='프로젝트';

-- Dumping data for table rang1536.project: 14 rows
DELETE FROM `project`;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` (`pr_code`, `pr_memberCode`, `dft_code`, `pr_name`, `pr_member`, `pr_money`, `pr_goal`, `pr_progress`, `pr_cate`, `pr_restration`, `pr_startDay`, `pr_endDay`, `pr_forProgress`, `pr_finishCheck`) VALUES
	(1, 100, 200, '도깨비', 4, 0, 'vusdmlwprhd', '모집완료', '개발', NULL, '2017-02-21', '2017-02-28', '승인', '완료'),
	(2, 101, 201, '도깨비2', 4, 100, '사내편의', '모집완료', '연구', NULL, '2017-02-21', '2017-02-28', '승인', '진행'),
	(3, 102, 202, '병원관리', 5, 100, '환자편의제공', '모집완료', '개발', NULL, '2017-02-21', '2017-02-28', '승인', '진행'),
	(4, 103, 203, '여행관리', 4, 1000000, '여행관련정보제공', '모집완료', '개발', NULL, '2017-02-21', '2017-02-28', '승인', NULL),
	(5, 103, 203, '여행가자', 4, 1000000, '여행관련정보제공', '모집중', '개발', NULL, '2017-02-21', '2017-02-28', '승인', '진행'),
	(6, 104, 204, '메가박스', 4, 500000, '영화예매편의제공', '모집완료', '개발', NULL, '2017-02-21', '2017-02-28', '승인', NULL),
	(7, 105, 205, '도까비', 4, 500000, '편의제공', '모집완료', '개발', NULL, '2017-02-02', '2017-02-21', '승인', '완료'),
	(8, 107, 207, 'sw개발', 5, 1000000, '신소프트웨어개발', '모집중', '개발', NULL, '2017-02-21', '2017-02-28', '승인', NULL),
	(9, 108, 208, '강아지구하기', 4, 100000, '애완견보호', '모집완료', '개발', NULL, '2017-02-19', '2017-02-21', '승인', '완료'),
	(10, 110, 210, '애완견찾기', 3, 100000, '애완견찾기프로그램', '모집완료', '개발', NULL, '2017-02-20', '2017-02-28', '승인', NULL),
	(11, 111, 211, '안경만들기', 5, 500000, '가벼운안경만들기', '모집완료', '연구', NULL, '2017-02-02', '2017-02-28', '승인', NULL),
	(12, 112, 212, '스마트그룹웨어', 4, 2400000, '사내편의제공및여러관리기능제공', '모집완료', '개발', NULL, '2017-01-02', '2017-02-28', '승인', NULL),
	(13, 113, 213, 'SNS만들기', 4, 1000000, '더욱나은SNS편의제공', '모집중', '개발', '2017-02-22', '2017-02-23', '2017-02-28', '승인', NULL),
	(14, 35, 214, '현미녹차우리기', 5, 100000, '현미녹차를차가운물에서도 잘 우려내보자', '모집중', '연구', '2017-02-22', '2017-02-25', '2017-03-21', '승인', '대기');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. projectMember
DROP TABLE IF EXISTS `projectMember`;
CREATE TABLE IF NOT EXISTS `projectMember` (
  `pm_code` int(11) NOT NULL AUTO_INCREMENT,
  `pr_code` int(11) DEFAULT NULL,
  `mm_code` int(11) DEFAULT NULL,
  `pm_level` varchar(8) DEFAULT NULL,
  `pm_field` varchar(30) DEFAULT NULL,
  `pm_startDate` date DEFAULT NULL,
  `pm_endDate` date DEFAULT NULL,
  `pm_note` varchar(50) DEFAULT NULL,
  `pm_approval` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`pm_code`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='프로젝트인력';

-- Dumping data for table rang1536.projectMember: 7 rows
DELETE FROM `projectMember`;
/*!40000 ALTER TABLE `projectMember` DISABLE KEYS */;
INSERT INTO `projectMember` (`pm_code`, `pr_code`, `mm_code`, `pm_level`, `pm_field`, `pm_startDate`, `pm_endDate`, `pm_note`, `pm_approval`) VALUES
	(1, 12, 121, '고급', '설계및관리', '2017-01-02', NULL, '팀장', '승인'),
	(2, 13, 113, '고급', 'DB설계', '2017-02-22', NULL, 'DBA출신PM', NULL),
	(3, 14, 114, '중급', '뜨거운물끓이기', '2017-02-22', NULL, '녹차만30년먹음', '승인'),
	(4, 14, 20, '고급', NULL, '2017-03-06', NULL, '녹차만30년먹음', '승인'),
	(5, 14, 321, '중급', NULL, '2017-03-06', NULL, '녹차좋아함', '승인'),
	(6, 14, 323, '중급', NULL, '2017-02-27', NULL, '차연구10년차', '승인'),
	(7, 14, 222, '초급', NULL, '2017-02-27', NULL, '마시는걸좋아함', '승인');
/*!40000 ALTER TABLE `projectMember` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. rankposition
DROP TABLE IF EXISTS `rankposition`;
CREATE TABLE IF NOT EXISTS `rankposition` (
  `pt_code` int(11) NOT NULL AUTO_INCREMENT,
  `pt_name` varchar(10) NOT NULL,
  PRIMARY KEY (`pt_code`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='직급';

-- Dumping data for table rang1536.rankposition: 5 rows
DELETE FROM `rankposition`;
/*!40000 ALTER TABLE `rankposition` DISABLE KEYS */;
INSERT INTO `rankposition` (`pt_code`, `pt_name`) VALUES
	(1, '사원'),
	(2, '대리'),
	(3, '과장'),
	(4, '부장'),
	(5, '사장');
/*!40000 ALTER TABLE `rankposition` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. religion
DROP TABLE IF EXISTS `religion`;
CREATE TABLE IF NOT EXISTS `religion` (
  `no` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`no`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=euckr;

-- Dumping data for table rang1536.religion: 4 rows
DELETE FROM `religion`;
/*!40000 ALTER TABLE `religion` DISABLE KEYS */;
INSERT INTO `religion` (`no`, `name`) VALUES
	(3, '기독교'),
	(1, '무교'),
	(2, '불교'),
	(4, '천주교');
/*!40000 ALTER TABLE `religion` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. reward
DROP TABLE IF EXISTS `reward`;
CREATE TABLE IF NOT EXISTS `reward` (
  `re_code` int(11) NOT NULL AUTO_INCREMENT,
  `mm_code` int(11) NOT NULL,
  `re_grade` char(2) NOT NULL,
  `re_date` varchar(50) NOT NULL,
  `re_document` varchar(200) NOT NULL,
  `re_mmCode` int(11) DEFAULT NULL,
  PRIMARY KEY (`re_code`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='인사고과';

-- Dumping data for table rang1536.reward: 4 rows
DELETE FROM `reward`;
/*!40000 ALTER TABLE `reward` DISABLE KEYS */;
INSERT INTO `reward` (`re_code`, `mm_code`, `re_grade`, `re_date`, `re_document`, `re_mmCode`) VALUES
	(1, 2, 'S', '2016-11-13', '서류.pdf', 3),
	(2, 1, 'A', '2015-03-22', '서류.pdf', 4),
	(3, 7, 'B', '2016-11-10', '서류.pdf', 2),
	(4, 2, 'C', '0000-00-00', '서류.pdf', 8);
/*!40000 ALTER TABLE `reward` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. school
DROP TABLE IF EXISTS `school`;
CREATE TABLE IF NOT EXISTS `school` (
  `no` int(10) NOT NULL AUTO_INCREMENT,
  `graduate` varchar(50) NOT NULL,
  PRIMARY KEY (`no`),
  UNIQUE KEY `graduate` (`graduate`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=euckr;

-- Dumping data for table rang1536.school: 3 rows
DELETE FROM `school`;
/*!40000 ALTER TABLE `school` DISABLE KEYS */;
INSERT INTO `school` (`no`, `graduate`) VALUES
	(1, '고졸'),
	(3, '대졸'),
	(2, '전문대졸');
/*!40000 ALTER TABLE `school` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. skill
DROP TABLE IF EXISTS `skill`;
CREATE TABLE IF NOT EXISTS `skill` (
  `no` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=euckr;

-- Dumping data for table rang1536.skill: 5 rows
DELETE FROM `skill`;
/*!40000 ALTER TABLE `skill` DISABLE KEYS */;
INSERT INTO `skill` (`no`, `name`) VALUES
	(1, 'java'),
	(2, 'html5'),
	(3, 'JSP'),
	(4, 'SQL'),
	(5, 'javascript');
/*!40000 ALTER TABLE `skill` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. staff
DROP TABLE IF EXISTS `staff`;
CREATE TABLE IF NOT EXISTS `staff` (
  `no` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `sn` varchar(50) NOT NULL,
  `graduateday` date NOT NULL,
  `schoolno` int(10) NOT NULL,
  `religionno` int(10) NOT NULL,
  PRIMARY KEY (`no`),
  UNIQUE KEY `sn` (`sn`),
  KEY `FK__school` (`schoolno`),
  KEY `FK__religion` (`religionno`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=euckr;

-- Dumping data for table rang1536.staff: 8 rows
DELETE FROM `staff`;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` (`no`, `name`, `sn`, `graduateday`, `schoolno`, `religionno`) VALUES
	(1, 'jeho', '9111111511111', '2016-12-06', 1, 1),
	(2, 'umin', '9000001546124', '2016-12-06', 1, 3),
	(3, 'suhuk', '1234531123451', '2016-12-06', 1, 3),
	(4, 'gugu', '1234121234512', '2016-12-06', 1, 2),
	(6, 'min', '8000001566874', '2016-12-07', 1, 3),
	(7, 'jehooo', '9012371544444', '2016-12-06', 1, 1),
	(8, 'jehho', '1239081234523', '2016-12-06', 2, 1),
	(9, 'minwoo', '8512122456321', '2018-01-05', 2, 2);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. staffskill
DROP TABLE IF EXISTS `staffskill`;
CREATE TABLE IF NOT EXISTS `staffskill` (
  `no` int(10) NOT NULL AUTO_INCREMENT,
  `staffno` int(10) NOT NULL,
  `skillno` int(10) NOT NULL,
  PRIMARY KEY (`no`),
  KEY `FK__staff` (`staffno`),
  KEY `FK__skill` (`skillno`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=euckr;

-- Dumping data for table rang1536.staffskill: 13 rows
DELETE FROM `staffskill`;
/*!40000 ALTER TABLE `staffskill` DISABLE KEYS */;
INSERT INTO `staffskill` (`no`, `staffno`, `skillno`) VALUES
	(12, 1, 2),
	(11, 1, 1),
	(3, 6, 1),
	(4, 6, 2),
	(14, 2, 3),
	(13, 2, 2),
	(7, 8, 1),
	(8, 8, 3),
	(16, 3, 3),
	(15, 3, 2),
	(17, 4, 3),
	(18, 7, 5),
	(19, 9, 4);
/*!40000 ALTER TABLE `staffskill` ENABLE KEYS */;


-- 테이블 rang1536의 구조를 덤프합니다. wbs
DROP TABLE IF EXISTS `wbs`;
CREATE TABLE IF NOT EXISTS `wbs` (
  `wbs_code` int(11) NOT NULL AUTO_INCREMENT,
  `pr_code` int(11) NOT NULL,
  `wbs_cate` varchar(25) NOT NULL,
  `wbs_name` varchar(50) NOT NULL,
  `wbs_contents` varchar(100) NOT NULL,
  `wbs_startDate` date NOT NULL,
  `wbs_endDate` date DEFAULT NULL,
  `wbs_workingDays` int(11) NOT NULL,
  `wbs_progress` int(11) DEFAULT NULL,
  `wbs_uncompletedReason` varchar(150) DEFAULT NULL,
  `wbs_finalEndDate` date DEFAULT NULL,
  `wbs_status` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`wbs_code`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='작업분해도';

-- Dumping data for table rang1536.wbs: 4 rows
DELETE FROM `wbs`;
/*!40000 ALTER TABLE `wbs` DISABLE KEYS */;
INSERT INTO `wbs` (`wbs_code`, `pr_code`, `wbs_cate`, `wbs_name`, `wbs_contents`, `wbs_startDate`, `wbs_endDate`, `wbs_workingDays`, `wbs_progress`, `wbs_uncompletedReason`, `wbs_finalEndDate`, `wbs_status`) VALUES
	(1, 14, '1', '분석및설계', '요구사항을분석 및 DB설계', '2017-03-01', '2017-03-05', 0, 100, NULL, NULL, '완료'),
	(2, 14, '1.1', '요구사항분석', '요구사항을분석', '2017-03-01', '2017-03-03', 0, 100, NULL, NULL, '완료'),
	(3, 14, '1.2', 'DB설계', '기본테이블을만들고 릴레이션설정.', '2017-03-02', '2017-03-05', 0, 100, NULL, NULL, '완료'),
	(4, 14, '1.3', 'DB셋팅', 'DB에 테이블을 생성하고 예제데이터5개씩 넣기', '2017-03-03', '2017-03-05', 0, 100, NULL, NULL, '완료');
/*!40000 ALTER TABLE `wbs` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
