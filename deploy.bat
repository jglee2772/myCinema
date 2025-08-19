@echo off
echo MGcinema 배포 시작...

REM 1. 프로젝트 빌드
echo 프로젝트 빌드 중...
gradlew.bat clean bootJar

REM 2. JAR 파일 확인
if exist "build\libs\MGcinema-0.0.1-SNAPSHOT.jar" (
    echo JAR 파일 생성 완료
) else (
    echo JAR 파일 생성 실패
    pause
    exit /b 1
)

REM 3. 기존 프로세스 종료 (포트 8080 사용 중인 경우)
echo 기존 프로세스 종료 중...
taskkill /f /im java.exe 2>nul

REM 4. 애플리케이션 실행
echo 애플리케이션 시작 중...
start "MGcinema" java -jar -Dspring.profiles.active=prod build\libs\MGcinema-0.0.1-SNAPSHOT.jar

echo 배포 완료! 애플리케이션이 실행 중입니다.
pause
