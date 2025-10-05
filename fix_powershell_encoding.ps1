# PowerShell 한글 인코딩 문제 해결 스크립트
# 이 스크립트를 실행하면 PowerShell에서 한글이 제대로 표시됩니다.

# 1. 코드 페이지를 UTF-8로 설정
chcp 65001

# 2. PowerShell 출력 인코딩 설정
$OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::InputEncoding = [System.Text.Encoding]::UTF8

# 3. PowerShell 기본 인코딩 설정
$PSDefaultParameterValues['*:Encoding'] = 'utf8'

# 4. 현재 설정 확인
Write-Host "=== PowerShell 인코딩 설정 완료 ===" -ForegroundColor Green
Write-Host "코드 페이지: $(chcp)" -ForegroundColor Yellow
Write-Host "출력 인코딩: $($OutputEncoding.EncodingName)" -ForegroundColor Yellow
Write-Host "콘솔 출력 인코딩: $([Console]::OutputEncoding.EncodingName)" -ForegroundColor Yellow
Write-Host "콘솔 입력 인코딩: $([Console]::InputEncoding.EncodingName)" -ForegroundColor Yellow

# 5. 한글 테스트
Write-Host "한글 테스트: 안녕하세요! MG Cinema 프로젝트입니다." -ForegroundColor Cyan
Write-Host "경로 테스트: C:\Users\이정건\Desktop\myCinema" -ForegroundColor Cyan

Write-Host "`n=== 설정이 완료되었습니다! ===" -ForegroundColor Green
Write-Host "이제 PowerShell에서 한글이 제대로 표시됩니다." -ForegroundColor Green
