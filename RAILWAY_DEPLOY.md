# Railway 배포 가이드

## 1. Railway 프로젝트 생성

1. [Railway](https://railway.app)에 접속하여 로그인
2. "New Project" 클릭
3. "Deploy from GitHub repo" 선택하여 저장소 연결

## 2. MySQL 데이터베이스 추가

1. Railway 대시보드에서 "New" → "Database" → "Add MySQL" 선택
2. 생성된 MySQL 서비스의 연결 정보 확인
3. MySQL 연결 정보:
   - 호스트: `containers-us-west-xxx.railway.app`
   - 포트: `3306`
   - 데이터베이스명: `railway`
   - 사용자명: `root`
   - 비밀번호: Railway에서 제공

## 3. 환경 변수 설정

Railway 대시보드에서 애플리케이션 서비스의 환경 변수를 설정:

### 필수 환경 변수
```
SPRING_PROFILES_ACTIVE=prod
SERVER_PORT=8080

# MySQL 연결 정보 (Railway MySQL 서비스의 Variables 탭에서 확인)
DATABASE_URL=jdbc:mysql://containers-us-west-xxx.railway.app:3306/railway?useSSL=true&serverTimezone=UTC&allowPublicKeyRetrieval=true
DATABASE_USERNAME=root
DATABASE_PASSWORD=[Railway에서 제공한 비밀번호]
```

### MySQL URL 형식
```
jdbc:mysql://[호스트]:[포트]/[데이터베이스명]?useSSL=true&serverTimezone=UTC&allowPublicKeyRetrieval=true
```

## 4. 빌드 설정

Railway는 자동으로 Gradle 프로젝트를 감지하고 빌드합니다:
- 빌드 명령: `./gradlew build -x test`
- 시작 명령: `java -jar build/libs/MGcinema-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod`

## 5. 데이터베이스 마이그레이션

로컬 MySQL에서 Railway MySQL로 데이터를 마이그레이션:

1. 로컬 MySQL에서 데이터 덤프:
```bash
mysqldump -u root -p mgcinema > mgcinema_dump.sql
```

2. Railway MySQL에 데이터베이스 생성:
```sql
CREATE DATABASE railway CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE railway;
```

3. 덤프 파일 import:
```bash
mysql -h [Railway 호스트] -P 3306 -u root -p railway < mgcinema_dump.sql
```

또는 Railway MySQL의 Query 탭에서 직접 SQL 실행

## 6. 배포 확인

1. Railway 대시보드에서 배포 상태 확인
2. 생성된 도메인으로 접속 (예: `mgcinema.railway.app`)
3. 애플리케이션 로그 확인

## 7. 문제 해결

### 데이터베이스 연결 실패
- 환경 변수 확인 (특히 DATABASE_URL 형식)
- MySQL 서비스가 실행 중인지 확인
- 방화벽/네트워크 설정 확인

### 빌드 실패
- Java 17 설치 확인 필요 (Railway는 자동으로 설치)
- Gradle 래퍼 권한 확인: `chmod +x gradlew`

### 포트 설정 오류
- Railway는 자동으로 PORT 환경 변수를 제공
- `application-prod.properties`에서 `${SERVER_PORT:8080}` 사용

## 8. Railway MySQL 연결 정보 가져오기

Railway 대시보드에서:
1. MySQL 서비스 클릭
2. "Variables" 탭에서 연결 정보 확인
3. 또는 "Connect" 탭에서 연결 문자열 확인

## 참고 사항

- Railway는 자동으로 HTTPS 인증서를 제공합니다
- 무료 플랜에서는 일정 시간 비활성 시 서비스가 중지될 수 있습니다
- 로그는 Railway 대시보드에서 확인할 수 있습니다

