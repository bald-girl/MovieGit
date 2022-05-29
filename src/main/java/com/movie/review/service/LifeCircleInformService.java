package com.movie.review.service;

import com.movie.review.entity.LifeCircleInform;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Miss Chen
 * @since 2022-03-15
 */
public interface LifeCircleInformService extends IService<LifeCircleInform> {
    List<LifeCircleInform> getLifeCircleByUserIndex(Integer userIndex);
    List<LifeCircleInform> getAllLifeCircle();
}
