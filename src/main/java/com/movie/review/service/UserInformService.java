package com.movie.review.service;

import com.movie.review.entity.UserInform;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Mapper;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author Miss Chen
 * @since 2022-03-15
 */
@Mapper
public interface UserInformService extends IService<UserInform> {
        UserInform getByName(String userName);
}
