# MG Cinema 웹사이트

Spring Boot 기반의 영화관 웹사이트로, 영화 예매, 스토어, 관리자 기능을 포함한 종합적인 영화관 서비스 플랫폼입니다.

## 🚀 주요 기능

- **영화 예매**: 실시간 좌석 예매 시스템
- **스토어**: 팝콘, 음료, 기프트카드 등 상품 판매
- **영화 차트**: 예매율 기반 영화 순위
- **리뷰 시스템**: 영화 평점 및 댓글
- **관리자 기능**: 영화/상품/스케줄 관리
- **마이페이지**: 예매/구매 내역 관리

## 🛠️ 기술 스택

- **Backend**: Spring Boot 3.3.2, Java 17, MyBatis
- **Database**: MySQL (개발), PostgreSQL (프로덕션)
- **Frontend**: JSP, CSS3, JavaScript, jQuery
- **Build Tool**: Gradle
- **Deployment**: Render

## 📁 프로젝트 구조

```
src/main/java/com/cinema/
├── home/          # 홈페이지, 로그인, 회원가입
├── chart/         # 영화 차트, 리뷰 시스템
├── cinema/        # 극장 정보, 상영 스케줄
├── ticket/        # 영화 예매 시스템
├── store/         # 스토어, 장바구니, 결제
├── management/    # 관리자 기능
├── mypage/        # 마이페이지
└── service/       # 고객센터, FAQ
```

## 🚀 배포 환경

### 개발 환경
- **포트**: 8081
- **데이터베이스**: MySQL (로컬)
- **프로파일**: dev

### 프로덕션 환경 (Render)
- **포트**: 10000
- **데이터베이스**: PostgreSQL (Render)
- **프로파일**: prod

## 🔧 환경 설정

### 개발 환경 실행
```bash
# 기본 설정 (dev 프로파일)
./gradlew bootRun

# 특정 프로파일로 실행
./gradlew bootRun --args='--spring.profiles.active=dev'
```

### 프로덕션 환경 실행
```bash
# 빌드
./gradlew build -x test

# 실행
java -jar build/libs/MGcinema-0.0.1-SNAPSHOT.jar --spring.profiles.active=prod
```

## 📊 데이터베이스

### 주요 테이블
- `customer`: 회원 정보
- `movie`: 영화 정보
- `schedules`: 상영 스케줄
- `moviepay`: 영화 예매 내역
- `item`: 스토어 상품
- `cart`: 장바구니
- `review`: 영화 리뷰

## 🔐 보안 설정

- **reCAPTCHA**: 봇 방지
- **세션 관리**: 로그인 상태 관리
- **입력 검증**: 서버 사이드 검증
- **에러 정보 숨김**: 프로덕션 환경에서 스택 트레이스 비표시

## 📝 환경 변수 (Render)

다음 환경 변수를 Render 대시보드에서 설정해야 합니다:

- `SPRING_PROFILES_ACTIVE`: prod
- `SERVER_PORT`: 10000
- `DATABASE_URL`: PostgreSQL 연결 URL
- `DATABASE_USERNAME`: 데이터베이스 사용자명
- `DATABASE_PASSWORD`: 데이터베이스 비밀번호

## 🐛 문제 해결

### 일반적인 문제들

1. **데이터베이스 연결 실패**
   - 환경 변수 확인
   - 데이터베이스 서버 상태 확인

2. **빌드 실패**
   - Java 17 설치 확인
   - Gradle 캐시 정리: `./gradlew clean`

3. **JSP 렌더링 오류**
   - JSP 의존성 확인
   - 뷰 리졸버 설정 확인

## 📞 지원

문제가 발생하면 이슈를 등록해 주세요.

## 📄 라이선스

이 프로젝트는 교육 목적으로 제작되었습니다.
