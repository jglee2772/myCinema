# 🚀 DBeaver를 사용한 MySQL → PostgreSQL 마이그레이션 가이드

## 📋 준비사항

### 1. DBeaver 설치
- [DBeaver 다운로드](https://dbeaver.io/download/) 클릭
- **Community Edition** (무료) 선택
- Windows용 다운로드 및 설치

## 🔧 단계별 마이그레이션

### 1단계: DBeaver 실행 및 MySQL 연결

1. **DBeaver 실행**
2. **새 연결** 클릭
3. **MySQL** 선택
4. 연결 정보 입력:
   ```
   Host: localhost
   Port: 3306
   Database: mgcinema
   Username: root
   Password: 1234 (또는 실제 비밀번호)
   ```
5. **Test Connection** 클릭하여 연결 확인
6. **Finish** 클릭

### 2단계: PostgreSQL 연결

1. **새 연결** 클릭
2. **PostgreSQL** 선택
3. 연결 정보 입력:
   ```
   Host: dpg-d2hvqce3jp1c738rdh7g-a.singapore-postgres.render.com
   Port: 5432
   Database: mgcinema
   Username: mgcinema_user
   Password: Hm2WL3hYSIEyXufBA0QkdZ8QmxNz9z0S
   ```
4. **Driver Properties** 탭에서:
   - `ssl` = `true`
   - `sslmode` = `require`
5. **Test Connection** 클릭하여 연결 확인
6. **Finish** 클릭

### 3단계: PostgreSQL 스키마 생성

1. PostgreSQL 연결에서 **SQL 편집기** 열기 (Ctrl+Shift+SQL)
2. 아래 스키마 내용을 복사하여 붙여넣기:

```sql
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
```

3. **Execute SQL Script** 버튼 클릭 (Ctrl+Enter)

### 4단계: 데이터 마이그레이션

#### 방법 A: 테이블별 데이터 복사 (추천)

1. **MySQL 연결**에서 테이블 선택
2. **데이터 탭** 클릭
3. **Export Data** 클릭
4. **CSV** 형식 선택
5. 파일 저장 (예: `customer_data.csv`)
6. **PostgreSQL 연결**에서 해당 테이블 선택
7. **데이터 탭** 클릭
8. **Import Data** 클릭
9. 저장한 CSV 파일 선택
10. **Import** 클릭

#### 방법 B: SQL INSERT 문 생성

1. MySQL에서 테이블 선택
2. **SQL 편집기** 열기
3. `SELECT * FROM 테이블명;` 실행
4. 결과를 **CSV로 내보내기**
5. PostgreSQL에서 **SQL 편집기** 열기
6. CSV 데이터를 INSERT 문으로 변환하여 실행

### 5단계: 시퀀스 리셋

PostgreSQL에서 각 테이블의 시퀀스를 리셋해야 합니다:

```sql
-- customer 테이블 시퀀스 리셋
SELECT setval('customer_id_seq', (SELECT MAX(id) FROM customer));

-- movie 테이블 시퀀스 리셋
SELECT setval('movie_id_seq', (SELECT MAX(id) FROM movie));

-- moviepay 테이블 시퀀스 리셋
SELECT setval('moviepay_id_seq', (SELECT MAX(id) FROM moviepay));

-- moviedelete 테이블 시퀀스 리셋
SELECT setval('moviedelete_id_seq', (SELECT MAX(id) FROM moviedelete));

-- 나머지 테이블들도 동일하게...
```

## ⚠️ 주의사항

1. **데이터 타입 변환**: MySQL과 PostgreSQL의 데이터 타입이 다를 수 있습니다
2. **NULL 값 처리**: NULL 값이 포함된 데이터는 주의해서 처리
3. **문자 인코딩**: UTF-8 인코딩 확인
4. **외래 키 제약**: 데이터 마이그레이션 후 외래 키 제약 추가

## 🔧 문제 해결

### 연결 오류
- SSL 설정 확인
- 방화벽 설정 확인
- 포트 번호 확인

### 데이터 타입 오류
- `AUTO_INCREMENT` → `SERIAL`
- `DATETIME` → `TIMESTAMP`
- `TEXT` 타입 호환성 확인

### 시퀀스 오류
- 시퀀스 리셋 필요
- 중복 키 오류 시 시퀀스 값 조정

---

**이 가이드를 따라하시면 안전하게 마이그레이션할 수 있습니다!**
