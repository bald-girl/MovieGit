package com.movie.review.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.movie.review.entity.AdminInform;
import com.movie.review.service.AdminInformService;
import com.movie.review.util.NewPopupStyle;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;

@Controller
public class AdminInformController {

    @Autowired
    private AdminInformService adminInformService;


    @Autowired
    private RedisTemplate redisTemplate;

    @RequestMapping("/admin")
    private String admin(){
        return "adminLogin";
    }

    @RequestMapping("/admin_login")
    private ModelAndView admin_login(HttpServletRequest httpServletRequest){

        Integer adminId = Integer.valueOf(httpServletRequest.getParameter("adminId"));
        String adminPwd = httpServletRequest.getParameter("adminPwd");

        ModelAndView previous = new ModelAndView("redirect:/previous");
        ModelAndView pre_feedback = new ModelAndView("redirect:/pre_allReport");

        NewPopupStyle style = new NewPopupStyle();

        //先从缓存中获取
        String key = "adminId:"+adminId;
        AdminInform adminObj = (AdminInform) redisTemplate.opsForValue().get(key);
        //使用双重锁机制  缓存中没有当前用户
        if(adminObj == null){
            synchronized (this.getClass()){
                adminObj = (AdminInform)redisTemplate.opsForValue().get(key);
                if(adminObj == null){//缓存中没有
                    //查数据库
                    QueryWrapper queryWrapper = new QueryWrapper();
                    queryWrapper.eq("admin_index",adminId);
                    queryWrapper.eq("admin_password",adminPwd);
                    if(adminInformService.getOne(queryWrapper) != null){//数据库中有
                        AdminInform oneAdmin = adminInformService.getOne(queryWrapper);
                        //存到缓存
                        redisTemplate.opsForValue().set(key,oneAdmin);
                        return pre_feedback;
                    }else {
                        style.new_style("账号或密码错误！");
                        return previous;
                    }
                }else {
                    System.out.println("select redis");
                    return pre_feedback;
                }
            }
        }else if(adminObj.getAdminPassword().equals(adminPwd)){
            System.out.println("select redis");
            return pre_feedback;
        }
        style.new_style("账号或密码错误！");
        return previous;
    }




}
