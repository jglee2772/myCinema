package com.cinema.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class TestController {
    
    @Autowired
    private NewsDAO newsDAO;
    
    @GetMapping("/test/news")
    public String testNews() {
        try {
            System.out.println("=== 테스트 뉴스 조회 시작 ===");
            
            // 총 뉴스 수 확인
            int totalCount = newsDAO.getTotalNewsCount();
            System.out.println("총 뉴스 수: " + totalCount);
            
            // 뉴스 목록 조회
            List<NewsDTO> newsList = newsDAO.getAllNews(5, 0);
            System.out.println("뉴스 목록 조회 완료: " + (newsList != null ? newsList.size() : "null") + "개");
            
            if (newsList != null && !newsList.isEmpty()) {
                System.out.println("첫 번째 뉴스 제목: " + newsList.get(0).getTitle());
                System.out.println("첫 번째 뉴스 ID: " + newsList.get(0).getId());
            }
            
            return "테스트 성공 - 총 뉴스 수: " + totalCount + ", 조회된 뉴스 수: " + (newsList != null ? newsList.size() : 0);
            
        } catch (Exception e) {
            System.err.println("=== 테스트 뉴스 조회 실패 ===");
            e.printStackTrace();
            return "테스트 실패: " + e.getMessage();
        }
    }
    
    @GetMapping("/test/static")
    public String testStatic() {
        return """
            <!DOCTYPE html>
            <html>
            <head>
                <title>정적 리소스 테스트</title>
                <style>
                    body { font-family: Arial, sans-serif; margin: 20px; }
                    .test-section { margin: 20px 0; padding: 10px; border: 1px solid #ccc; }
                    .success { color: green; }
                    .error { color: red; }
                </style>
            </head>
            <body>
                <h1>정적 리소스 테스트</h1>
                
                <div class="test-section">
                    <h2>CSS 파일 테스트</h2>
                    <p>아래 링크들이 정상적으로 작동하는지 확인하세요:</p>
                    <ul>
                        <li><a href="/Header_css/Header.css" target="_blank">Header CSS</a></li>
                        <li><a href="/homepage_css/homepage.css" target="_blank">Homepage CSS</a></li>
                    </ul>
                </div>
                
                <div class="test-section">
                    <h2>이미지 파일 테스트</h2>
                    <p>아래 이미지들이 정상적으로 표시되는지 확인하세요:</p>
                    <ul>
                        <li><a href="/homepage_image/image_05.jpg" target="_blank">Image 05</a></li>
                        <li><a href="/homepage_image/image_06.jpg" target="_blank">Image 06</a></li>
                        <li><a href="/homepage_image/로비2.jpeg" target="_blank">로비2</a></li>
                    </ul>
                </div>
                
                <div class="test-section">
                    <h2>직접 이미지 표시</h2>
                    <img src="/homepage_image/image_05.jpg" alt="Test Image" style="max-width: 300px;">
                </div>
            </body>
            </html>
            """;
    }
}
