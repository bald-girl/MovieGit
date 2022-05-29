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
public class MovieInform implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "movie_index", type = IdType.AUTO)
    private Integer movieIndex;

    private String movieName;

    private String movieType;

    private String movieDirector;

    private String movieStarring;

    private Long movieEvaluateNumber;

    private Double movieScore;

    private String movieCountry;

    private String movieYear;

    private String movieImg;


}
