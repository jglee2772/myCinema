<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Header Component</title>
    <link rel="stylesheet" href="/Header_css/Header.css">
    
    <!-- 인라인 CSS 추가 (정적 리소스 로드 실패 시 대비) -->
    <style>
        html, body {
            margin: 0;
            padding: 0;
            line-height: 1.4;
            text-align: center;
            box-sizing: border-box;
            background-color: #000000;
        }

        /* 헤더 설정 */
        .header {
            background: linear-gradient(to top, 
                #000000, 
                #475f77 
            );
            color: #ffffff;
            width: 100%;
            height: auto;
            padding-top: 40px;
            display: flex;
            flex-direction: column;
            align-items: center;
            position: relative;
            box-sizing: border-box;
        }

        /* HIII CINEMA 로고 */
        .logo {
            position: absolute;
            left: 50%;
            transform: translateX(-50%);
            margin: 0;
            font-size: 45px;
            color: #ffffff;
            text-align: center;
        }

        .logo a {
            color: #ffffff;
            text-decoration: none;
        }

        /* 내비게이션 바 설정 */
        .navbar2 {
            width: 100%;
            display: flex;
            margin-top: 30px;
            justify-content: flex-end;
            margin-right: 100px;
            box-sizing: border-box;
        }

        .navbar1 {
            width: 100%;
            display: flex;
            justify-content: center;
            margin-top: 70px;
            box-sizing: border-box;
        }

        /* 내비게이션 링크 설정 */
        .nav-links {
            list-style-type: none;
            margin: 0;
            padding: 0;
            display: flex;
            align-items: center;
        }

        .nav-links li {
            margin: 0 15px;
        }

        .navbar1 .nav-links li {
            padding-left: 25px;
            padding-right: 25px;
            font-size: 20px;
        }

        .nav-links a {
            color: #ffffff;
            text-decoration: none;
            font-size: 16px;
        }

        .nav-links a:hover {
            color: #ffd700;
        }
    </style>
</head>
<body>
    <header class="header">
    	<h1 class="logo"><a href="/">HIII CINEMA</a></h1>
        <div class="navbar2">
        	<ul class="nav-links">
            	${sessionScope.linkstr}
                <li><a href="/myhome">My페이지</a></li>
                <li><a href="/serviceHome">고객센터</a></li>
            </ul>
        </div>
        <div class="navbar1">
        	<ul class="nav-links">
				<li><a href="/chart" class="hover-icon icon-chart">영화</a></li>
				<li><a href="/cinema" class="hover-icon icon-cinema">극장</a></li>
				<li><a href="/ticket" class="hover-icon icon-ticket">예매</a></li>
				<li><a href="/store" class="hover-icon icon-store">스토어</a></li>
            </ul>
        </div>
    </header>
</body>
</html>
