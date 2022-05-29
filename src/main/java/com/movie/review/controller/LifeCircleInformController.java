package com.movie.review.controller;


import com.movie.review.entity.LifeCircleInform;
import com.movie.review.entity.UserInform;
import com.movie.review.service.LifeCircleInformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Miss Chen
 * @since 2022-03-15
 */
@Controller
public class LifeCircleInformController {

    @Autowired
    private LifeCircleInformService lifeCircleInformService;

    @RequestMapping("/pre_my_life")
    public String pre_myLife(HttpSession httpSession, ModelMap modelMap){

        //获取用户名称
        UserInform user = (UserInform) httpSession.getAttribute("user");
        //通过用户名称查询生活圈
        List<LifeCircleInform> lifeCircleByUserName = lifeCircleInformService.getLifeCircleByUserIndex(user.getUserIndex());

        modelMap.addAttribute("lifeCircleByUserName",lifeCircleByUserName);
        return "myLifeCircle";
    }

    @RequestMapping("/add_life_circle")
    public ModelAndView addLifeCircle(HttpServletRequest httpServletRequest){

        String content = httpServletRequest.getParameter("addLifeCircle");
        Integer userIndex = Integer.valueOf(httpServletRequest.getParameter("userIndex"));

        //获取当前时间
        Date date = new Date(System.currentTimeMillis());
        LifeCircleInform lifeCircleInform = new LifeCircleInform(userIndex,content,date);
        lifeCircleInformService.save(lifeCircleInform);

        ModelAndView preMyLifeCircle = new ModelAndView("redirect:/pre_my_life");

        return preMyLifeCircle;
    }

    @RequestMapping("/pre_life_circle")
    public String pre_life_circle(ModelMap modelMap){

        List<LifeCircleInform> allLifeCircle = lifeCircleInformService.getAllLifeCircle();
        modelMap.addAttribute("allLifeCircle",allLifeCircle);

        return "lifeCircle";
    }
}
