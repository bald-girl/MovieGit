package com.movie.review.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.movie.review.entity.ReviewInform;
import com.movie.review.mapper.ReviewInformMapper;
import com.movie.review.service.ReviewInformService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Miss Chen
 * @since 2022-03-15
 */
@Service
public class ReviewInformServiceImpl extends ServiceImpl<ReviewInformMapper, ReviewInform> implements ReviewInformService {

    @Autowired
    private ReviewInformService reviewInformService;

    @Override
    public void addReview(Integer movieIndex, String userName, String reviewContent) {

        ReviewInform reviewInform = new ReviewInform(movieIndex,userName,reviewContent);
        reviewInformService.save(reviewInform);

    }
}
