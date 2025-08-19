-- PostgreSQL용 MGcinema 데이터베이스 스키마
-- MySQL에서 PostgreSQL로 변환

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

-- appearance_info 테이블
CREATE TABLE appearance_info (
    id BIGSERIAL PRIMARY KEY,
    moviename VARCHAR(100),
    prod VARCHAR(100),
    actor VARCHAR(100),
    image_path VARCHAR(100)
);

-- cart 테이블
CREATE TABLE cart (
    id SERIAL PRIMARY KEY,
    customer_id VARCHAR(50),
    item_id INTEGER,
    qty VARCHAR(20),
    total INTEGER NOT NULL,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    cust_id INTEGER NOT NULL
);

-- chartarray 테이블
CREATE TABLE chartarray (
    id SERIAL PRIMARY KEY,
    text VARCHAR(128)
);

-- commentarray 테이블
CREATE TABLE commentarray (
    id SERIAL PRIMARY KEY,
    text VARCHAR(128)
);

-- faq 테이블
CREATE TABLE faq (
    id BIGSERIAL PRIMARY KEY,
    selected VARCHAR(20) NOT NULL,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    views INTEGER DEFAULT 0
);

-- inquiry 테이블
CREATE TABLE inquiry (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    title VARCHAR(100),
    content VARCHAR(3000),
    answer VARCHAR(5000),
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    ancreated TIMESTAMP,
    current VARCHAR(10) DEFAULT '답변대기'
);

-- item 테이블
CREATE TABLE item (
    id SERIAL PRIMARY KEY,
    item_name VARCHAR(32),
    price VARCHAR(32),
    discount_price VARCHAR(32),
    composition VARCHAR(32),
    origin VARCHAR(32),
    image_path VARCHAR(60),
    item_type VARCHAR(255),
    period VARCHAR(100),
    best_id INTEGER
);

-- news 테이블
CREATE TABLE news (
    id BIGSERIAL PRIMARY KEY,
    selected VARCHAR(20),
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    created_at DATE,
    views INTEGER DEFAULT 0
);

-- review 테이블
CREATE TABLE review (
    id SERIAL PRIMARY KEY,
    moviechart INTEGER,
    content TEXT,
    writer VARCHAR(30),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    liked INTEGER DEFAULT 0,
    customer_uid VARCHAR(128),
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    rate INTEGER NOT NULL
);

-- room 테이블
CREATE TABLE room (
    id SERIAL PRIMARY KEY,
    Sname VARCHAR(32),
    seatlevel VARCHAR(10),
    seatinfo_id INTEGER,
    adult_price INTEGER,
    young_price INTEGER
);

-- schedules 테이블
CREATE TABLE schedules (
    id SERIAL PRIMARY KEY,
    movie_id INTEGER NOT NULL,
    room_id INTEGER NOT NULL,
    moviedate DATE NOT NULL,
    begintime VARCHAR(10) NOT NULL,
    endtime VARCHAR(10) NOT NULL,
    lestseat INTEGER,
    a_price INTEGER,
    y_price INTEGER,
    timetype VARCHAR(30)
);

-- seatinfo 테이블
CREATE TABLE seatinfo (
    id SERIAL PRIMARY KEY,
    sname VARCHAR(30),
    A INTEGER,
    B INTEGER,
    C INTEGER,
    D INTEGER,
    E INTEGER,
    F INTEGER,
    G INTEGER,
    H INTEGER,
    I INTEGER,
    J INTEGER,
    K INTEGER,
    L INTEGER,
    M INTEGER,
    N INTEGER,
    O INTEGER,
    allseat INTEGER
);

-- storepay 테이블
CREATE TABLE storepay (
    id SERIAL PRIMARY KEY,
    customer_id VARCHAR(255),
    random_id VARCHAR(100),
    item_name TEXT,
    totalprice INTEGER,
    created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- storepaydelete 테이블
CREATE TABLE storepaydelete (
    id SERIAL PRIMARY KEY,
    customer_id VARCHAR(255),
    random_id VARCHAR(100),
    item_name VARCHAR(255),
    totalprice INTEGER,
    created TIMESTAMP,
    updated TIMESTAMP
);

-- 인덱스 생성
CREATE INDEX idx_customer_uid ON customer(uid);
CREATE INDEX idx_moviepay_customer_id ON moviepay(customer_id);
CREATE INDEX idx_moviedelete_customer_id ON moviedelete(customer_id);
CREATE INDEX idx_cart_customer_id ON cart(customer_id);
CREATE INDEX idx_cart_item_id ON cart(item_id);
CREATE INDEX idx_inquiry_customer_id ON inquiry(customer_id);
CREATE INDEX idx_review_moviechart ON review(moviechart);
CREATE INDEX idx_schedules_movie_id ON schedules(movie_id);
CREATE INDEX idx_schedules_room_id ON schedules(room_id);
CREATE INDEX idx_storepay_customer_id ON storepay(customer_id);
CREATE INDEX idx_storepay_random_id ON storepay(random_id);
