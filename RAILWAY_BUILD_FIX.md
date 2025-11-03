# Railway 빌드 오류 해결 가이드

## 문제
```
Error: Unable to access jarfile build/libs/MGcinema-0.0.1-SNAPSHOT.jar
```

## 원인
- Nixpacks가 빌드 명령어를 제대로 실행하지 않음
- JAR 파일이 생성되지 않았거나 잘못된 위치에 생성됨

## 해결 방법

### 방법 1: Nixpacks 설정 (권장)

`nixpacks.toml` 파일이 생성되었습니다. Railway가 자동으로 이 파일을 인식합니다.

**Railway 대시보드에서:**
1. 서비스 → Settings 탭
2. "Clear build cache" 클릭
3. "Redeploy" 클릭

### 방법 2: Railway.json 확인

`railway.json`에 `buildCommand`가 추가되었습니다:
```json
{
  "build": {
    "builder": "NIXPACKS",
    "buildCommand": "./gradlew bootJar -x test"
  }
}
```

### 방법 3: 환경 변수 확인

Railway Variables 탭에서 다음 확인:
- `SPRING_PROFILES_ACTIVE=prod`
- `DATABASE_URL=...`
- `DATABASE_USERNAME=...`
- `DATABASE_PASSWORD=...`

## 빌드 로그 확인

Railway → Deployments → 로그에서 다음 확인:

1. **Gradle 실행 확인**
   ```
   ./gradlew bootJar -x test
   ```

2. **빌드 성공 확인**
   ```
   BUILD SUCCESSFUL
   ```

3. **JAR 파일 생성 확인**
   ```
   build/libs/MGcinema-0.0.1-SNAPSHOT.jar
   ```

4. **오류가 있다면**
   - 로그의 오류 메시지 확인
   - 의존성 다운로드 실패 시 재배포
   - 메모리 부족 시 Railway 플랜 업그레이드 고려

## 대안: Dockerfile 사용

Nixpacks가 계속 실패하면 Dockerfile 사용:

1. Railway → Settings → Service Type → "Dockerfile"
2. Dockerfile 사용 (이미 프로젝트에 있음)

또는 `railway.json`에서:
```json
{
  "build": {
    "builder": "DOCKERFILE",
    "dockerfilePath": "Dockerfile"
  }
}
```

## 추가 문제 해결

### 문제: JAR 파일이 생성되지만 실행 실패

**확인 사항:**
1. Java 버전 호환성 (Java 17 필요)
2. 메모리 부족
3. 데이터베이스 연결 실패

**로그 확인:**
```
Started MGcinemaApplication
```

### 문제: 빌드는 성공하지만 JAR가 없음

`build.gradle`에 `bootJar` 태스크가 실행되도록 확인:
```gradle
tasks.bootJar {
    enabled = true
    archiveFileName = "MGcinema-0.0.1-SNAPSHOT.jar"
}
```

또는 WAR 파일로 실행:
```json
"startCommand": "java -jar build/libs/MGcinema-0.0.1-SNAPSHOT.war"
```

## 최종 확인

배포 후 Railway Logs에서:
1. ✅ `BUILD SUCCESSFUL` 메시지
2. ✅ `Started MGcinemaApplication` 메시지
3. ✅ 데이터베이스 연결 성공 메시지
4. ✅ 애플리케이션 URL 생성 (예: `mgcinema.railway.app`)

