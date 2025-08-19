FROM eclipse-temurin:17-jre

WORKDIR /app

# Gradle 설치
RUN apt-get update && apt-get install -y wget unzip && \
    wget https://services.gradle.org/distributions/gradle-8.5-bin.zip && \
    unzip gradle-8.5-bin.zip && \
    mv gradle-8.5 /opt/gradle && \
    rm gradle-8.5-bin.zip && \
    apt-get remove -y wget unzip && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

# Gradle 환경변수 설정
ENV PATH="/opt/gradle/bin:${PATH}"

# 소스 코드 복사
COPY . .

# Gradle 빌드 실행
RUN gradle build

# JAR 파일을 app.jar로 복사
RUN cp build/libs/MGcinema-0.0.1-SNAPSHOT.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
