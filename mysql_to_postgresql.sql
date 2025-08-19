-- MySQL에서 PostgreSQL로 데이터 마이그레이션 스크립트
-- 기존 mgcinema.sql 파일을 PostgreSQL 문법으로 변환

-- 1. 테이블 생성 (PostgreSQL 문법)
-- customer 테이블
CREATE TABLE customer (
    id SERIAL PRIMARY KEY,
    uid VARCHAR(20) NOT NULL UNIQUE,
    passwd VARCHAR(20) NOT NULL,
    realname VARCHAR(32),
    nickname VARCHAR(10) UNIQUE,
    email VARCHAR(32),
    region VARCHAR(40),
    favorite VARCHAR(40),
    mobile VARCHAR(11),
    tellecom VARCHAR(15),
    created VARCHAR(32),
    updated VARCHAR(32),
    birthday VARCHAR(15),
    profileimg VARCHAR(255)
);

-- movie 테이블
CREATE TABLE movie (
    id SERIAL PRIMARY KEY,
    mname VARCHAR(32),
    age VARCHAR(20) NOT NULL,
    runningtime VARCHAR(10),
    hit VARCHAR(32),
    reservation FLOAT,
    imagepath TEXT,
    director VARCHAR(30),
    cast VARCHAR(30),
    genre VARCHAR(30),
    releasedate VARCHAR(20),
    movieinfo TEXT,
    avgrate DOUBLE PRECISION NOT NULL
);

-- moviepay 테이블
CREATE TABLE moviepay (
    id SERIAL PRIMARY KEY,
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
    id SERIAL PRIMARY KEY,
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
-- (기존 mgcinema.sql 파일의 모든 테이블을 PostgreSQL 문법으로 변환)

-- 2. 인덱스 생성
CREATE INDEX idx_customer_uid ON customer(uid);
CREATE INDEX idx_moviepay_customer_id ON moviepay(customer_id);
CREATE INDEX idx_moviedelete_customer_id ON moviedelete(customer_id);

-- 3. 시퀀스 설정 (SERIAL 대신 명시적 시퀀스 사용 시)
-- SELECT setval('customer_id_seq', (SELECT MAX(id) FROM customer));
-- SELECT setval('movie_id_seq', (SELECT MAX(id) FROM movie));
-- SELECT setval('moviepay_id_seq', (SELECT MAX(id) FROM moviepay));
-- SELECT setval('moviedelete_id_seq', (SELECT MAX(id) FROM moviedelete));
