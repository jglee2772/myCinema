#!/bin/bash

echo "PlanetScale에 데이터 임포트 시작..."

# PlanetScale 연결 정보 (실제 정보로 변경 필요)
PLANETSCALE_HOST="your-host.aws.connect.psdb.cloud"
PLANETSCALE_DATABASE="mgcinema"
PLANETSCALE_USERNAME="your-username"
PLANETSCALE_PASSWORD="your-password"

# SSL 설정
SSL_MODE="VERIFY_IDENTITY"

echo "데이터베이스 연결 중..."
echo "Host: $PLANETSCALE_HOST"
echo "Database: $PLANETSCALE_DATABASE"
echo "Username: $PLANETSCALE_USERNAME"

# 데이터 임포트 실행
mysql -h "$PLANETSCALE_HOST" \
      -u "$PLANETSCALE_USERNAME" \
      -p"$PLANETSCALE_PASSWORD" \
      --ssl-mode="$SSL_MODE" \
      "$PLANETSCALE_DATABASE" < mgcinema.sql

if [ $? -eq 0 ]; then
    echo "데이터 임포트 성공!"
else
    echo "데이터 임포트 실패. 오류를 확인하세요."
    exit 1
fi
