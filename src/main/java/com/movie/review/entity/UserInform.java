package com.movie.review.entity;

import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

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
public class UserInform implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "user_index", type = IdType.AUTO)
    private Integer userIndex;

    private String userName;

    private String userPassword;

    public UserInform(String userName, String userPassword) {
        this.userName = userName;
        this.userPassword = userPassword;
    }

}
