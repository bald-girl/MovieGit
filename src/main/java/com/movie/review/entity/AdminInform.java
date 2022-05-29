package com.movie.review.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class AdminInform implements Serializable {

    private static final long serialVersionUID = 1L;
    private Integer adminIndex;
    private String adminPassword;

}
