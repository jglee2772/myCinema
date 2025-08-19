-- PlanetScale 데이터베이스에 데이터 임포트용 스크립트
-- 기존 mgcinema.sql 파일의 내용을 PlanetScale에 맞게 수정

-- 1. 데이터베이스 선택 (PlanetScale에서는 자동으로 선택됨)
-- USE mgcinema;

-- 2. 테이블 생성 (기존 스키마 그대로 사용)
-- customer 테이블
CREATE TABLE `customer` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(20) NOT NULL,
  `passwd` varchar(20) NOT NULL,
  `realname` varchar(32) DEFAULT NULL,
  `nickname` varchar(10) DEFAULT NULL,
  `email` varchar(32) DEFAULT NULL,
  `region` varchar(40) DEFAULT NULL,
  `favorite` varchar(40) DEFAULT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `tellecom` varchar(15) DEFAULT NULL,
  `created` varchar(32) DEFAULT NULL,
  `updated` varchar(32) DEFAULT NULL,
  `birthday` varchar(15) DEFAULT NULL,
  `profileimg` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `unique_uid` (`uid`),
  UNIQUE KEY `unique_nickname` (`nickname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- movie 테이블
CREATE TABLE `movie` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `mname` varchar(32) DEFAULT NULL,
  `age` varchar(20) NOT NULL,
  `runningtime` varchar(10) DEFAULT NULL,
  `hit` varchar(32) DEFAULT NULL,
  `reservation` float DEFAULT NULL,
  `imagepath` text,
  `director` varchar(30) DEFAULT NULL,
  `cast` varchar(30) DEFAULT NULL,
  `genre` varchar(30) DEFAULT NULL,
  `releasedate` varchar(20) DEFAULT NULL,
  `movieinfo` text,
  `avgrate` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- moviepay 테이블
CREATE TABLE `moviepay` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `random_id` varchar(100) DEFAULT NULL,
  `customer_id` varchar(100) DEFAULT NULL,
  `movie_name` varchar(100) DEFAULT NULL,
  `room_name` varchar(100) DEFAULT NULL,
  `totalprice` varchar(100) DEFAULT NULL,
  `runningtime` varchar(100) DEFAULT NULL,
  `seat` varchar(100) DEFAULT NULL,
  `totalpeople` varchar(100) DEFAULT NULL,
  `datetime` varchar(30) DEFAULT NULL,
  `begintime` varchar(100) DEFAULT NULL,
  `endtime` varchar(100) DEFAULT NULL,
  `created` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- moviedelete 테이블
CREATE TABLE `moviedelete` (
  `id` int NOT NULL AUTO_INCREMENT,
  `random_id` varchar(100) DEFAULT NULL,
  `customer_id` varchar(100) DEFAULT NULL,
  `movie_name` varchar(100) DEFAULT NULL,
  `room_name` varchar(100) DEFAULT NULL,
  `totalprice` varchar(100) DEFAULT NULL,
  `runningtime` varchar(100) DEFAULT NULL,
  `seat` varchar(100) DEFAULT NULL,
  `totalpeople` varchar(100) DEFAULT NULL,
  `datetime` varchar(30) DEFAULT NULL,
  `begintime` varchar(100) DEFAULT NULL,
  `endtime` varchar(100) DEFAULT NULL,
  `created` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- 기타 필요한 테이블들도 추가...
-- (기존 mgcinema.sql 파일의 모든 테이블을 여기에 추가)

-- 3. 데이터 삽입
-- (기존 mgcinema.sql 파일의 INSERT 문들을 여기에 추가)

-- 4. 인덱스 생성
CREATE INDEX idx_customer_uid ON customer(uid);
CREATE INDEX idx_moviepay_customer_id ON moviepay(customer_id);
CREATE INDEX idx_moviedelete_customer_id ON moviedelete(customer_id);
