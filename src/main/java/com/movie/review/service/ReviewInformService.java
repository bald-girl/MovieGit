package com.movie.review.service;

import com.movie.review.entity.ReviewInform;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Miss Chen
 * @since 2022-03-15
 */
public interface ReviewInformService extends IService<ReviewInform> {

    void addReview(Integer movieIndex, String userName, String reviewContent);

}
