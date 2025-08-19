#!/usr/bin/env python3
"""
간단한 MySQL → PostgreSQL 마이그레이션 스크립트
"""

import subprocess
import sys
import os

def run_command(command):
    """명령어 실행"""
    try:
        result = subprocess.run(command, shell=True, capture_output=True, text=True)
        if result.returncode == 0:
            print(f"✅ 성공: {command}")
            return result.stdout
        else:
            print(f"❌ 실패: {command}")
            print(f"오류: {result.stderr}")
            return None
    except Exception as e:
        print(f"❌ 예외: {e}")
        return None

def check_python_packages():
    """Python 패키지 확인"""
    print("🔍 Python 패키지 확인 중...")
    
    # MySQL 커넥터 확인
    try:
        import mysql.connector
        print("✅ mysql-connector-python 설치됨")
    except ImportError:
        print("❌ mysql-connector-python 설치 필요")
        return False
    
    # PostgreSQL 커넥터 확인
    try:
        import psycopg2
        print("✅ psycopg2-binary 설치됨")
    except ImportError:
        print("❌ psycopg2-binary 설치 필요")
        return False
    
    return True

def install_packages():
    """패키지 설치"""
    print("📦 패키지 설치 중...")
    
    packages = [
        "mysql-connector-python",
        "psycopg2-binary"
    ]
    
    for package in packages:
        print(f"설치 중: {package}")
        result = run_command(f"pip install {package}")
        if result is None:
            print(f"❌ {package} 설치 실패")
            return False
    
    return True

def main():
    """메인 함수"""
    print("🚀 MySQL → PostgreSQL 마이그레이션 시작")
    print("=" * 50)
    
    # 1. 패키지 확인
    if not check_python_packages():
        print("\n📦 패키지 설치를 시도합니다...")
        if not install_packages():
            print("❌ 패키지 설치 실패. 수동으로 설치해주세요:")
            print("pip install mysql-connector-python psycopg2-binary")
            return
        
        # 다시 확인
        if not check_python_packages():
            print("❌ 패키지 설치 후에도 확인 실패")
            return
    
    print("\n✅ 모든 패키지가 준비되었습니다!")
    print("\n다음 단계:")
    print("1. MySQL 연결 정보 확인")
    print("2. PostgreSQL 연결 정보 확인")
    print("3. 마이그레이션 실행")
    
    # 사용자 입력 받기
    print("\n" + "=" * 50)
    print("MySQL 연결 정보를 입력해주세요:")
    mysql_host = input("MySQL Host (기본값: localhost): ") or "localhost"
    mysql_user = input("MySQL User (기본값: root): ") or "root"
    mysql_password = input("MySQL Password: ")
    mysql_database = input("MySQL Database (기본값: mgcinema): ") or "mgcinema"
    
    print("\nPostgreSQL 연결 정보:")
    print("Host: dpg-d2hvqce3jp1c738rdh7g-a.singapore-postgres.render.com")
    print("Database: mgcinema")
    print("Username: mgcinema_user")
    print("Password: Hm2WL3hYSIEyXufBA0QkdZ8QmxNz9z0S")
    
    confirm = input("\n마이그레이션을 시작하시겠습니까? (y/N): ")
    if confirm.lower() != 'y':
        print("❌ 마이그레이션이 취소되었습니다.")
        return
    
    # 마이그레이션 실행
    print("\n🔄 마이그레이션 시작...")
    
    # migrate_data.py 실행
    if os.path.exists("migrate_data.py"):
        print("기존 마이그레이션 스크립트를 실행합니다...")
        result = run_command("python migrate_data.py")
        if result:
            print("✅ 마이그레이션 완료!")
        else:
            print("❌ 마이그레이션 실패")
    else:
        print("❌ migrate_data.py 파일을 찾을 수 없습니다.")

if __name__ == "__main__":
    main()
