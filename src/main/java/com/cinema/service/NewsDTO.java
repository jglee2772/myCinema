package com.cinema.service;

import lombok.Data;
import java.time.LocalDate;
import com.fasterxml.jackson.annotation.JsonFormat;

@Data
public class NewsDTO {
    private Long id;
    private String title;
    private String content;
    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate createdAt;
    private int views;
    private String selected;    
}
