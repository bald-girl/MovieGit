package com.movie.review.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.movie.review.entity.ReportInform;
import com.movie.review.mapper.ReportInformMapper;
import com.movie.review.service.ReportInfromService;
import org.springframework.stereotype.Service;

@Service
public class ReportInformServiceImpl extends ServiceImpl<ReportInformMapper, ReportInform> implements ReportInfromService {
}
