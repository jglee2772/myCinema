#!/bin/bash

echo "MGcinema 배포 시작..."

# 1. 프로젝트 빌드
echo "프로젝트 빌드 중..."
./gradlew clean bootJar

# 2. JAR 파일 확인
if [ -f "build/libs/MGcinema-0.0.1-SNAPSHOT.jar" ]; then
    echo "JAR 파일 생성 완료"
else
    echo "JAR 파일 생성 실패"
    exit 1
fi

# 3. 기존 프로세스 종료 (포트 8080 사용 중인 경우)
echo "기존 프로세스 종료 중..."
pkill -f "MGcinema-0.0.1-SNAPSHOT.jar" || true

# 4. 애플리케이션 실행
echo "애플리케이션 시작 중..."
nohup java -jar -Dspring.profiles.active=prod build/libs/MGcinema-0.0.1-SNAPSHOT.jar > app.log 2>&1 &

echo "배포 완료! 애플리케이션이 백그라운드에서 실행 중입니다."
echo "로그 확인: tail -f app.log"
echo "프로세스 확인: ps aux | grep MGcinema"
