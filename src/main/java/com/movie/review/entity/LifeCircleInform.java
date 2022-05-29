package com.movie.review.entity;

import java.io.Serializable;
import java.util.Date;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.springframework.format.annotation.DateTimeFormat;

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
public class LifeCircleInform implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "life_circle_index", type = IdType.AUTO)
    private Integer lifeCircleIndex;

    private Integer lifeCircleUser;

    private String lifeCircleContent;

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date lifeCircleDate;

    @TableField(exist = false)
    private String userName;


    public LifeCircleInform(Integer lifeCircleUser, String lifeCircleContent, Date lifeCircleDate) {
        this.lifeCircleUser = lifeCircleUser;
        this.lifeCircleContent = lifeCircleContent;
        this.lifeCircleDate = lifeCircleDate;
    }
}
