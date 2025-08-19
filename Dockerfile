FROM openjdk:11-jre-slim

WORKDIR /app

# Gradle wrapper와 소스 코드 복사
COPY . .

# Gradle 빌드 실행
RUN ./gradlew build

# JAR 파일을 app.jar로 복사
RUN cp build/libs/MGcinema-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
