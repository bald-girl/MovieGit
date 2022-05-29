package com.movie.review.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ReportInform implements Serializable {

    private Integer reportIndex;
    private String reportContent;
    private String reportIsCompliance;
    //外键
    private Integer reviewId;

    public ReportInform(String reportContent,Integer reviewId) {
        this.reportContent = reportContent;
        this.reviewId = reviewId;
    }
}
