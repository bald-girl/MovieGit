package com.movie.review.service.impl;

import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.movie.review.entity.FeedbackInform;
import com.movie.review.mapper.FeedbackInformMapper;
import com.movie.review.service.FeedbackInformService;
import org.springframework.stereotype.Service;

@Service
public class FeedbackInformServiceImpl extends ServiceImpl<FeedbackInformMapper,FeedbackInform> implements FeedbackInformService {
}
