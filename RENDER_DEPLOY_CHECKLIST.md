# 렌더 배포 체크리스트

## ✅ 사전 준비사항

### 1. 클라우드 데이터베이스 설정
- [ ] PlanetScale 또는 Railway에서 MySQL 데이터베이스 생성
- [ ] 데이터베이스 연결 정보 확인 (URL, 사용자명, 비밀번호)
- [ ] 로컬 데이터를 클라우드로 마이그레이션

### 2. 프로젝트 설정 확인
- [ ] `application-prod.properties` 파일이 올바르게 설정됨
- [ ] `render.yaml` 파일이 프로젝트 루트에 있음
- [ ] `.gitignore` 파일이 적절히 설정됨

### 3. GitHub 업로드
- [ ] 프로젝트를 GitHub 저장소에 업로드
- [ ] 모든 파일이 올바르게 커밋됨

## 🚀 렌더 배포 단계

### 1. 렌더 계정 설정
- [ ] [render.com](https://render.com)에서 계정 생성
- [ ] GitHub 계정 연결

### 2. 웹 서비스 생성
- [ ] "New Web Service" 클릭
- [ ] GitHub 저장소 연결
- [ ] 설정:
  - **Name**: mgcinema
  - **Environment**: Java
  - **Build Command**: `./gradlew build`
  - **Start Command**: `java -jar build/libs/MGcinema-0.0.1-SNAPSHOT.jar`

### 3. 환경변수 설정
- [ ] **SPRING_PROFILES_ACTIVE**: `prod`
- [ ] **SERVER_PORT**: `10000`
- [ ] **DATABASE_URL**: 클라우드 MySQL 연결 URL
- [ ] **DATABASE_USERNAME**: 데이터베이스 사용자명
- [ ] **DATABASE_PASSWORD**: 데이터베이스 비밀번호

### 4. 배포 확인
- [ ] 빌드가 성공적으로 완료됨
- [ ] 애플리케이션이 정상적으로 시작됨
- [ ] 데이터베이스 연결이 정상적으로 작동함
- [ ] 웹사이트가 정상적으로 접속됨

## 🔧 문제 해결

### 빌드 실패 시
- 로그 확인
- Java 버전 확인 (Java 11 필요)
- 의존성 문제 확인

### 데이터베이스 연결 실패 시
- 환경변수 설정 확인
- 데이터베이스 URL 형식 확인
- 방화벽 설정 확인

### 애플리케이션 시작 실패 시
- 포트 설정 확인
- JSP 설정 확인
- 로그 확인

## 📝 참고사항

- 렌더는 무료 플랜에서 15분 동안 요청이 없으면 서비스가 슬립 모드로 전환됨
- 첫 요청 시 약간의 지연이 있을 수 있음
- HTTPS가 자동으로 설정됨
