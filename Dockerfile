FROM openjdk:11-jre-slim

WORKDIR /app

# Gradle wrapper와 소스 코드 복사
COPY . .

# gradlew에 실행 권한 부여
RUN chmod +x ./gradlew

# Gradle Wrapper JAR 파일 권한 확인
RUN ls -la gradle/wrapper/

# Gradle 빌드 실행 (더 자세한 로그와 함께)
RUN ./gradlew build --info --stacktrace

# JAR 파일을 app.jar로 복사
RUN cp build/libs/MGcinema-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
