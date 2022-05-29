package com.movie.review.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class FeedbackInform implements Serializable {
    private static final long serialVersionUID = 1L;

    @TableId(value = "feedback_index", type = IdType.AUTO)
    private Integer feedbackIndex;

    private String feedbackContent;

    public FeedbackInform(String feedbackContent) {
        this.feedbackContent = feedbackContent;
    }
}
