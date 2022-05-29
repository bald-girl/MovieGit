package com.movie.review.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author Miss Chen
 * @since 2022-03-15
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReviewInform implements Serializable {

    private static final long serialVersionUID = 1L;

    private Integer reviewMovieIndex;

    private String reviewUser;

    private Double reviewScore;

    private String reviewContent;

    //数据库中无此属性
    @TableId(value = "review_index", type = IdType.AUTO)
    private Long reviewIndex;

    public ReviewInform(Integer reviewMovieIndex, String reviewUser,  String reviewContent) {
        this.reviewMovieIndex = reviewMovieIndex;
        this.reviewUser = reviewUser;
        this.reviewContent = reviewContent;
    }
}
