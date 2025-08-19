# MySQL → PostgreSQL 데이터 마이그레이션 가이드

## 1단계: PostgreSQL 스키마 생성

### Render PostgreSQL에 접속
```bash
# Render PostgreSQL 연결 정보
Host: dpg-d2hvqce3jp1c738rdh7g-a.singapore-postgres.render.com
Database: mgcinema
Username: mgcinema_user
Password: Hm2WL3hYSIEyXufBA0QkdZ8QmxNz9z0S
```

### 스키마 생성
1. **pgAdmin** 또는 **DBeaver** 같은 도구로 Render PostgreSQL에 연결
2. `postgresql_schema.sql` 파일을 실행하여 테이블 생성

또는 명령줄에서:
```bash
psql "postgresql://mgcinema_user:Hm2WL3hYSIEyXufBA0QkdZ8QmxNz9z0S@dpg-d2hvqce3jp1c738rdh7g-a.singapore-postgres.render.com/mgcinema" -f postgresql_schema.sql
```

## 2단계: Python 마이그레이션 스크립트 실행

### 필요한 패키지 설치
```bash
pip install mysql-connector-python psycopg2-binary
```

### 스크립트 실행
```bash
python migrate_data.py
```

## 3단계: 수동 마이그레이션 (대안)

만약 Python 스크립트가 작동하지 않으면:

### 1. MySQL에서 데이터 추출
```sql
-- 각 테이블별로 INSERT 문 생성
SELECT CONCAT('INSERT INTO customer VALUES (', id, ', ''', uid, ''', ''', passwd, ''', ''', realname, ''', ''', nickname, ''', ''', email, ''', ''', region, ''', ''', favorite, ''', ''', mobile, ''', ''', tellecom, ''', ''', created, ''', ''', updated, ''', ''', birthday, ''', ''', profileimg, ''');') 
FROM customer;
```

### 2. PostgreSQL에 데이터 삽입
- 생성된 INSERT 문들을 PostgreSQL에서 실행

## 4단계: 데이터 검증

### 테이블별 데이터 확인
```sql
-- PostgreSQL에서 각 테이블의 행 수 확인
SELECT 'customer' as table_name, COUNT(*) as row_count FROM customer
UNION ALL
SELECT 'movie', COUNT(*) FROM movie
UNION ALL
SELECT 'moviepay', COUNT(*) FROM moviepay
UNION ALL
SELECT 'moviedelete', COUNT(*) FROM moviedelete;
```

## 5단계: 애플리케이션 재배포

데이터 마이그레이션이 완료되면:

1. **렌더 환경변수 확인**
   - `DATABASE_URL`: `jdbc:postgresql://dpg-d2hvqce3jp1c738rdh7g-a.singapore-postgres.render.com:5432/mgcinema`
   - `DATABASE_USERNAME`: `mgcinema_user`
   - `DATABASE_PASSWORD`: `Hm2WL3hYSIEyXufBA0QkdZ8QmxNz9z0S`

2. **애플리케이션 재배포**
   - 렌더 대시보드에서 "Manual Deploy" → "Deploy latest commit"

## 문제 해결

### 연결 오류
- 방화벽 설정 확인
- SSL 연결 필요할 수 있음

### 데이터 타입 오류
- MySQL의 `AUTO_INCREMENT` → PostgreSQL의 `SERIAL`
- `DATETIME` → `TIMESTAMP`
- `TEXT` 타입 호환성 확인

### 시퀀스 오류
```sql
-- PostgreSQL에서 시퀀스 리셋
SELECT setval('customer_id_seq', (SELECT MAX(id) FROM customer));
SELECT setval('movie_id_seq', (SELECT MAX(id) FROM movie));
-- 기타 테이블들도 동일하게 처리
```
