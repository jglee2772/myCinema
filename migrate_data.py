#!/usr/bin/env python3
"""
MySQL에서 PostgreSQL로 데이터 마이그레이션 스크립트
"""

import mysql.connector
import psycopg2
import sys
from datetime import datetime

# MySQL 연결 설정
MYSQL_CONFIG = {
    'host': 'localhost',
    'user': 'root',
    'password': '1234',  # 실제 MySQL 비밀번호로 변경
    'database': 'mgcinema'
}

# PostgreSQL 연결 설정 (Render)
POSTGRES_CONFIG = {
    'host': 'dpg-d2hvqce3jp1c738rdh7g-a.singapore-postgres.render.com',
    'database': 'mgcinema',
    'user': 'mgcinema_user',
    'password': 'Hm2WL3hYSIEyXufBA0QkdZ8QmxNz9z0S'
}

def connect_mysql():
    """MySQL 연결"""
    try:
        conn = mysql.connector.connect(**MYSQL_CONFIG)
        print("MySQL 연결 성공")
        return conn
    except Exception as e:
        print(f"MySQL 연결 실패: {e}")
        return None

def connect_postgres():
    """PostgreSQL 연결"""
    try:
        conn = psycopg2.connect(**POSTGRES_CONFIG)
        print("PostgreSQL 연결 성공")
        return conn
    except Exception as e:
        print(f"PostgreSQL 연결 실패: {e}")
        return None

def migrate_table(mysql_conn, postgres_conn, table_name, columns):
    """테이블 데이터 마이그레이션"""
    try:
        # MySQL에서 데이터 조회
        mysql_cursor = mysql_conn.cursor()
        mysql_cursor.execute(f"SELECT * FROM {table_name}")
        rows = mysql_cursor.fetchall()
        
        if not rows:
            print(f"{table_name}: 데이터 없음")
            return
        
        # PostgreSQL에 데이터 삽입
        postgres_cursor = postgres_conn.cursor()
        
        # 컬럼 수에 맞는 플레이스홀더 생성
        placeholders = ','.join(['%s'] * len(columns))
        columns_str = ','.join(columns)
        
        insert_query = f"INSERT INTO {table_name} ({columns_str}) VALUES ({placeholders})"
        
        # 시퀀스 리셋 (SERIAL 컬럼이 있는 경우)
        if 'id' in columns:
            postgres_cursor.execute(f"SELECT setval('{table_name}_id_seq', 1, false)")
        
        # 데이터 삽입
        postgres_cursor.executemany(insert_query, rows)
        postgres_conn.commit()
        
        print(f"{table_name}: {len(rows)}개 행 마이그레이션 완료")
        
    except Exception as e:
        print(f"{table_name} 마이그레이션 실패: {e}")
        postgres_conn.rollback()

def main():
    """메인 마이그레이션 함수"""
    print("MySQL → PostgreSQL 데이터 마이그레이션 시작")
    
    # 연결
    mysql_conn = connect_mysql()
    postgres_conn = connect_postgres()
    
    if not mysql_conn or not postgres_conn:
        print("데이터베이스 연결 실패")
        sys.exit(1)
    
    # 마이그레이션할 테이블과 컬럼 정의
    tables = {
        'customer': ['id', 'uid', 'passwd', 'realname', 'nickname', 'email', 'region', 'favorite', 'mobile', 'tellecom', 'created', 'updated', 'birthday', 'profileimg'],
        'movie': ['id', 'mname', 'age', 'runningtime', 'hit', 'reservation', 'imagepath', 'director', 'cast', 'genre', 'releasedate', 'movieinfo', 'avgrate'],
        'moviepay': ['id', 'random_id', 'customer_id', 'movie_name', 'room_name', 'totalprice', 'runningtime', 'seat', 'totalpeople', 'datetime', 'begintime', 'endtime', 'created'],
        'moviedelete': ['id', 'random_id', 'customer_id', 'movie_name', 'room_name', 'totalprice', 'runningtime', 'seat', 'totalpeople', 'datetime', 'begintime', 'endtime', 'created'],
        'appearance_info': ['id', 'moviename', 'prod', 'actor', 'image_path'],
        'cart': ['id', 'customer_id', 'item_id', 'qty', 'total', 'created', 'cust_id'],
        'chartarray': ['id', 'text'],
        'commentarray': ['id', 'text'],
        'faq': ['id', 'selected', 'title', 'content', 'created_at', 'views'],
        'inquiry': ['id', 'customer_id', 'title', 'content', 'answer', 'created', 'ancreated', 'current'],
        'item': ['id', 'item_name', 'price', 'discount_price', 'composition', 'origin', 'image_path', 'item_type', 'period', 'best_id'],
        'news': ['id', 'selected', 'title', 'content', 'created_at', 'views'],
        'review': ['id', 'moviechart', 'content', 'writer', 'created_at', 'liked', 'customer_uid', 'updated_at', 'rate'],
        'room': ['id', 'Sname', 'seatlevel', 'seatinfo_id', 'adult_price', 'young_price'],
        'schedules': ['id', 'movie_id', 'room_id', 'moviedate', 'begintime', 'endtime', 'lestseat', 'a_price', 'y_price', 'timetype'],
        'seatinfo': ['id', 'sname', 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'allseat'],
        'storepay': ['id', 'customer_id', 'random_id', 'item_name', 'totalprice', 'created', 'updated'],
        'storepaydelete': ['id', 'customer_id', 'random_id', 'item_name', 'totalprice', 'created', 'updated']
    }
    
    # 각 테이블 마이그레이션
    for table_name, columns in tables.items():
        print(f"\n{table_name} 테이블 마이그레이션 중...")
        migrate_table(mysql_conn, postgres_conn, table_name, columns)
    
    # 연결 종료
    mysql_conn.close()
    postgres_conn.close()
    
    print("\n마이그레이션 완료!")

if __name__ == "__main__":
    main()
