package com.movie.review.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.movie.review.entity.UserInform;
import com.movie.review.mapper.UserInformMapper;
import com.movie.review.service.UserInformService;
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
public class UserInformServiceImpl extends ServiceImpl<UserInformMapper, UserInform> implements UserInformService {

    @Autowired
    private UserInformService userInformService;
    @Override
    public UserInform getByName(String userName) {
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("user_name",userName);
        UserInform oneUserByName = userInformService.getOne(queryWrapper);
        return oneUserByName;
    }
}
