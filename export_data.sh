#!/bin/bash

echo "로컬 MySQL 데이터 내보내기 시작..."

# 현재 날짜로 백업 파일명 생성
BACKUP_DATE=$(date +%Y%m%d_%H%M%S)
BACKUP_FILE="mgcinema_backup_${BACKUP_DATE}.sql"

# 전체 데이터베이스 백업
mysqldump -u root -p1234 mgcinema > $BACKUP_FILE

echo "백업 완료: $BACKUP_FILE"

# 개별 테이블별 백업 (선택사항)
echo "개별 테이블 백업 중..."

mysqldump -u root -p1234 mgcinema customer > customer_backup_${BACKUP_DATE}.sql
mysqldump -u root -p1234 mgcinema movie > movie_backup_${BACKUP_DATE}.sql
mysqldump -u root -p1234 mgcinema moviepay > moviepay_backup_${BACKUP_DATE}.sql
mysqldump -u root -p1234 mgcinema moviedelete > moviedelete_backup_${BACKUP_DATE}.sql

echo "개별 테이블 백업 완료!"
echo "백업 파일들:"
ls -la *_backup_${BACKUP_DATE}.sql
