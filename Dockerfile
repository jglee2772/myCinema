FROM eclipse-temurin:17-jdk

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

# 빌드된 파일 확인 및 복사
RUN ls -la build/libs/
RUN cp build/libs/MGcinema-0.0.1-SNAPSHOT.war app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]
