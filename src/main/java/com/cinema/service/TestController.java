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
}
