-- MGcinema 데이터베이스 마이그레이션 스크립트
-- 로컬 MySQL에서 클라우드 MySQL로 데이터 이전용

-- 1. 데이터베이스 생성
CREATE DATABASE IF NOT EXISTS mgcinema;
USE mgcinema;

-- 2. 테이블 생성 (기존 스키마 기반)
-- customer 테이블
CREATE TABLE customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    uid VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    realname VARCHAR(100) NOT NULL,
    nickname VARCHAR(100),
    profileimg TEXT,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- movie 테이블
CREATE TABLE movie (
    id INT AUTO_INCREMENT PRIMARY KEY,
    mname VARCHAR(32),
    age VARCHAR(20),
    runningtime VARCHAR(10),
    hit VARCHAR(32),
    reservation FLOAT,
    imagepath TEXT,
    director VARCHAR(30),
    cast VARCHAR(30),
    genre VARCHAR(30),
    releasedate VARCHAR(20),
    movieinfo TEXT,
    avgrate DOUBLE
);

-- moviepay 테이블
CREATE TABLE moviepay (
    id INT AUTO_INCREMENT PRIMARY KEY,
    random_id VARCHAR(100),
    customer_id VARCHAR(100),
    movie_name VARCHAR(100),
    room_name VARCHAR(100),
    totalprice VARCHAR(100),
    runningtime VARCHAR(100),
    seat VARCHAR(100),
    totalpeople VARCHAR(100),
    datetime VARCHAR(30),
    begintime VARCHAR(100),
    endtime VARCHAR(100),
    created VARCHAR(100)
);

-- moviedelete 테이블
CREATE TABLE moviedelete (
    id INT AUTO_INCREMENT PRIMARY KEY,
    random_id VARCHAR(100),
    customer_id VARCHAR(100),
    movie_name VARCHAR(100),
    room_name VARCHAR(100),
    totalprice VARCHAR(100),
    runningtime VARCHAR(100),
    seat VARCHAR(100),
    totalpeople VARCHAR(100),
    datetime VARCHAR(30),
    begintime VARCHAR(100),
    endtime VARCHAR(100),
    created VARCHAR(100)
);

-- 기타 필요한 테이블들도 추가...

-- 3. 샘플 데이터 삽입 (테스트용)
INSERT INTO customer (uid, password, realname, nickname) VALUES 
('test@test.com', 'password123', '테스트사용자', '테스터');

-- 4. 인덱스 생성
CREATE INDEX idx_customer_uid ON customer(uid);
CREATE INDEX idx_moviepay_customer_id ON moviepay(customer_id);
CREATE INDEX idx_moviedelete_customer_id ON moviedelete(customer_id);
