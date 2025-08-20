

<!-- 푸터까지 포함 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>HIII CINEMA - 홈페이지</title>
    <!-- 절대 경로로 CSS 파일 링크 -->
    <link rel="stylesheet" href="/homepage_css/homepage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick-theme.min.css">
    
    <!-- 인라인 CSS 추가 (정적 리소스 로드 실패 시 대비) -->
    <style>
        /* 전체 페이지 레이아웃 */
        body {
            margin: 0;
            padding: 0;
            background-color: #000000;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            overflow-x: hidden;
        }

        /* 메인 콘텐츠 영역 */
        .main-content {
            flex: 1;
            width: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 120px;
        }

        /* 슬라이더를 전체 화면에 맞게 조정 */
        .promo-container {
            flex: 1;
            width: 100%;
            max-width: 100vw;
            height: calc(100vh - 250px);
            overflow: hidden;
            position: relative;
            margin: 0 auto;
            padding: 20px 0;
            box-sizing: border-box;
        }

        .image-slide {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 0;
            margin: 0;
            padding: 0;
            max-width: 100%;
            max-height: 100%;
            display: block;
        }

        /* slick-carousel 기본 스타일 */
        .slick-slide {
            height: 100%;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .slick-track {
            display: flex;
            align-items: center;
            height: 100%;
        }

        .slick-list {
            height: 100%;
            overflow: hidden;
        }

        /* 슬라이더 컨테이너 */
        .slider {
            width: 100%;
            height: 100%;
            position: relative;
        }
    </style>
</head>
<body>
    <%@ include file="/WEB-INF/views/header/header.jsp" %> <!-- 헤더 포함 -->
    
    <!-- 메인 콘텐츠 영역 -->
    <main class="main-content">
        <div class="promo-container">
            <div class="slider">
                <div><img src="/homepage_image/image_05.jpg" alt="Promotion 5" class="image-slide" /></div>
                <div><img src="/homepage_image/image_06.jpg" alt="Promotion 6" class="image-slide" /></div>
                <div><img src="/homepage_image/로비2.jpeg" alt="Promotion 7" class="image-slide" /></div>
                <div><img src="/homepage_image/image_08.jpg" alt="Promotion 8" class="image-slide" /></div>
            </div>
        </div>
    </main>
    
    <%@ include file="/WEB-INF/views/footer/footer.jsp" %> <!-- 푸터 포함 -->

</body>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.8.1/slick.min.js"></script>
    <script>
        $(document).ready(function() {
            $('.slider').slick({
                dots: false,
                infinite: true,
                speed: 1500,
                slidesToShow: 1,
                slidesToScroll: 1,
                autoplay: true,
                autoplaySpeed: 5000,
                arrows: false,
                fade: true, // 페이드 효과로 전환
                cssEase: 'linear', // 선형 전환
                adaptiveHeight: false, // 고정 높이 사용
                responsive: true // 반응형 활성화
            });
        });
    </script>
</html> 


  