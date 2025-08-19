# 🚀 빠른 MySQL → PostgreSQL 마이그레이션 가이드

## 방법 1: DBeaver 사용 (추천)

### 1단계: DBeaver 설치
- [DBeaver 다운로드](https://dbeaver.io/download/) (무료)
- 설치 후 실행

### 2단계: MySQL 연결
1. **새 연결** → **MySQL** 선택
2. 연결 정보 입력:
   - Host: `localhost`
   - Port: `3306`
   - Database: `mgcinema`
   - Username: `root`
   - Password: `1234` (또는 실제 비밀번호)

### 3단계: PostgreSQL 연결
1. **새 연결** → **PostgreSQL** 선택
2. 연결 정보 입력:
   - Host: `dpg-d2hvqce3jp1c738rdh7g-a.singapore-postgres.render.com`
   - Port: `5432`
   - Database: `mgcinema`
   - Username: `mgcinema_user`
   - Password: `Hm2WL3hYSIEyXufBA0QkdZ8QmxNz9z0S`

### 4단계: 스키마 생성
1. PostgreSQL 연결에서 **SQL 편집기** 열기
2. `postgresql_schema.sql` 파일 내용 복사하여 실행

### 5단계: 데이터 마이그레이션
1. MySQL에서 각 테이블 데이터 추출:
   ```sql
   -- customer 테이블
   SELECT * FROM customer;
   ```
2. 결과를 CSV로 내보내기
3. PostgreSQL에서 CSV 가져오기

## 방법 2: MySQL Workbench + pgAdmin

### 1단계: MySQL Workbench에서 데이터 추출
1. **Server** → **Data Export**
2. **mgcinema** 데이터베이스 선택
3. **Export to Self-Contained File** 선택
4. **Include Create Schema** 체크
5. **Export** 클릭

### 2단계: pgAdmin에서 데이터 가져오기
1. pgAdmin 설치 및 PostgreSQL 연결
2. 스키마 생성 (`postgresql_schema.sql` 실행)
3. 데이터 가져오기

## 방법 3: 명령줄 도구 (고급)

### MySQL에서 데이터 추출
```bash
# Windows에서
mysqldump -u root -p mgcinema > mgcinema_backup.sql
```

### PostgreSQL에 데이터 가져오기
```bash
# psql 설치 후
psql "postgresql://mgcinema_user:Hm2WL3hYSIEyXufBA0QkdZ8QmxNz9z0S@dpg-d2hvqce3jp1c738rdh7g-a.singapore-postgres.render.com/mgcinema" -f postgresql_schema.sql
```

## 🎯 추천 순서

1. **DBeaver 사용** (가장 쉬움)
2. **MySQL Workbench + pgAdmin** (중간)
3. **명령줄 도구** (고급)

## ⚠️ 주의사항

- 데이터 타입 변환 필요 (MySQL → PostgreSQL)
- 시퀀스 리셋 필요
- 인덱스 재생성 필요

## 🔧 문제 해결

### 연결 오류
- 방화벽 설정 확인
- SSL 연결 필요할 수 있음

### 데이터 타입 오류
- `AUTO_INCREMENT` → `SERIAL`
- `DATETIME` → `TIMESTAMP`
- `TEXT` 타입 호환성 확인

---

**어떤 방법을 선택하시겠습니까?**
