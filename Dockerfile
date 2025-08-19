FROM openjdk:17-jre-slim

WORKDIR /app

# Gradle wrapper와 소스 코드 복사
COPY . .

# gradlew에 실행 권한 부여
RUN chmod +x ./gradlew

# Gradle 빌드 실행
RUN ./gradlew build

# JAR 파일을 app.jar로 복사
RUN cp build/libs/MGcinema-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
