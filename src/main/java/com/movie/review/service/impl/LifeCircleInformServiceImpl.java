package com.movie.review.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.movie.review.entity.LifeCircleInform;
import com.movie.review.entity.UserInform;
import com.movie.review.mapper.LifeCircleInformMapper;
import com.movie.review.service.LifeCircleInformService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.movie.review.service.UserInformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author Miss Chen
 * @since 2022-03-15
 */
@Service
public class LifeCircleInformServiceImpl extends ServiceImpl<LifeCircleInformMapper, LifeCircleInform> implements LifeCircleInformService {

    @Autowired
    private LifeCircleInformService lifeCircleInformService;

    @Autowired
    private UserInformService userInformService;

    @Override
    public List<LifeCircleInform> getLifeCircleByUserIndex(Integer userIndex) {

        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("life_circle_user",userIndex);
        List<LifeCircleInform> lifeCircleList = lifeCircleInformService.list(queryWrapper);
        return lifeCircleList;

    }

    @Override
    public List<LifeCircleInform> getAllLifeCircle() {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.orderByDesc("life_circle_date");
        List<LifeCircleInform> allLifeCircle = lifeCircleInformService.list(queryWrapper);

        for(LifeCircleInform lifeCircle :allLifeCircle){
            Integer userIndex = lifeCircle.getLifeCircleUser();
            String userName = userInformService.getById(userIndex).getUserName();
            lifeCircle.setUserName(userName);
        }

        return allLifeCircle;
    }
}
