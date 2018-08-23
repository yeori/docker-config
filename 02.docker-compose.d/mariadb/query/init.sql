/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


CREATE DATABASE IF NOT EXISTS `petdb` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `petdb`;

CREATE TABLE IF NOT EXISTS `lost_pet` (
  `seq` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `owner` varchar(50) NOT NULL,
  `pet_breed` varchar(20) NOT NULL,
  `lat` decimal(18,15) NOT NULL,
  `lng` decimal(18,15) NOT NULL,
  `lost_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `title` varchar(250) NOT NULL,
  `desc` varchar(4000) NOT NULL,
  `reward` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`seq`),
  KEY `fk_lost_pet_owner` (`owner`),
  CONSTRAINT `fk_lost_pet_owner` FOREIGN KEY (`owner`) REFERENCES `users` (`email`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='잃어버린 유기동물 등록';

CREATE TABLE IF NOT EXISTS `pets` (
  `pet_name` varchar(50) NOT NULL,
  `pet_type` varchar(20) NOT NULL,
  `pet_code` varchar(20) DEFAULT NULL COMMENT '공공api에서 kindCd값',
  UNIQUE KEY `pet_code` (`pet_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `stray_pet` (
  `seq` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `desertion_no` bigint(20) unsigned NOT NULL,
  `care_addr` varchar(250) NOT NULL,
  `lat` decimal(18,15) NOT NULL,
  `lng` decimal(18,15) NOT NULL,
  `care_nm` varchar(50) NOT NULL COMMENT '보호소 이름',
  `care_tel` varchar(20) NOT NULL COMMENT '보호소 전화번호',
  `charge_nm` varchar(20) NOT NULL COMMENT '담당자 이름',
  `animal_img` varchar(300) NOT NULL COMMENT '유기동물 사진 url',
  `happen_dt` char(8) NOT NULL COMMENT '접수일(YYYYMMDD)',
  `happen_place` varchar(200) NOT NULL COMMENT '발견장소',
  `kind_cd` varchar(30) NOT NULL COMMENT '품종( [개] 말티즈)',
  `sex_cd` char(1) NOT NULL COMMENT '성별',
  `notice_sdt` char(8) NOT NULL,
  `notice_edt` char(8) NOT NULL,
  `notice_no` varchar(50) NOT NULL COMMENT '공고번호(경기-수원-2018-00782)',
  `office_tel` varchar(20) NOT NULL COMMENT '담당자 연락처',
  PRIMARY KEY (`seq`),
  UNIQUE KEY `desertion_no` (`desertion_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3814 DEFAULT CHARSET=utf8 COMMENT='신고된 유기 동물';

CREATE TABLE IF NOT EXISTS `users` (
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

