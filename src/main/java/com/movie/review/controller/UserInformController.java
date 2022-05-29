package com.movie.review.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.movie.review.entity.UserInform;
import com.movie.review.util.NewPopupStyle;
import com.movie.review.service.UserInformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Miss Chen
 * @since 2022-03-15
 */
@Controller
public class UserInformController {

    @Autowired
    private UserInformService userInformService;

    @Autowired
    private RedisTemplate redisTemplate;

    @RequestMapping("/")
    public String index(){
        return "login";
    }

    @RequestMapping("/pre_register")
    public String pre_register(ModelMap modelMap,String error){
        if(error!=null){
            modelMap.addAttribute("error",error);
        }
        return "registered";
    }

    @RequestMapping("/pre_login")
    public String pre_login(){
        return "login";
    }

    @RequestMapping("/update_pwd")
    public String update_pwd(){

        return "login";
    }

    @RequestMapping("/login")
    public ModelAndView login(HttpServletRequest httpServletRequest,
                              HttpSession session,String userNameFromRegister,String userPwdFromRegister) {

        String userName = userNameFromRegister == null ? httpServletRequest.getParameter("userName"):userNameFromRegister;
        String userPwd =  userPwdFromRegister == null ? httpServletRequest.getParameter("userPwd"):userPwdFromRegister;

        ModelAndView pre_login = new ModelAndView("redirect:/pre_login");
        ModelAndView pre_movie_list = new ModelAndView("redirect:/pre_movie_list");

        String key = "userName:"+userName;
        //先从缓存中获取
        UserInform userObj = (UserInform) redisTemplate.opsForValue().get(key);
        NewPopupStyle style = new NewPopupStyle();

        //使用双重锁机制  缓存中没有当前用户
        if(userObj == null){
            //如果缓存为空
            synchronized (this.getClass()){
                //再次查询缓存中是否有记录
                userObj = (UserInform) redisTemplate.opsForValue().get(key);
                //缓存中没有记录
                if(userObj == null){
                    //查询数据库
                    QueryWrapper queryWrapper = new QueryWrapper();
                    queryWrapper.eq("user_name",userName);
                    queryWrapper.eq("user_password",userPwd);

                    //结果不为null则存在
                    if (userInformService.getOne(queryWrapper) != null) {
                        UserInform oneUser = userInformService.getOne(queryWrapper);
                        //添加到缓存
                        redisTemplate.opsForValue().set(key,oneUser);
                        //添加session
                        session.setAttribute("user",oneUser);
                        return pre_movie_list;
                    }else {
                        style.new_style("账号或密码错误！");
                        return pre_login;
                    }
                }else {
                    System.out.println("select redis");
                    session.setAttribute("user",userObj);
                    return pre_movie_list;
                }
            }
        }else if(userObj.getUserPassword().equals(userPwd)){
            System.out.println("select redis");
            session.setAttribute("user",userObj);
            return pre_movie_list;
        }

        style.new_style("账号或密码错误！");
        return pre_login;
    }

    @RequestMapping(value = "/register")
    public ModelAndView register(HttpServletRequest httpServletRequest,
                                 HttpSession session) {
        //获取用户输入的账号密码
        String userName = httpServletRequest.getParameter("userName");
        UserInform byName = userInformService.getByName(userName);

        NewPopupStyle style = new NewPopupStyle();

        ModelAndView registerError = new ModelAndView("redirect:/pre_register");
        if(byName == null){
            String userPwd = httpServletRequest.getParameter("userPwd");
            UserInform newUser = new UserInform(userName,userPwd);

            if(userInformService.save(newUser)){
                //用户注册成功 ----> 将用户名和密码存到session ----> 供jsp页面使用
                session.setAttribute("userName", newUser.getUserName());
                session.setAttribute("userPwd", newUser.getUserPassword());

                //注册成功 ---> 自动登录:将用户id和pwd传给login方法 login方法进行登录
                ModelAndView modelLogin = new ModelAndView("redirect:/login");
                //拼接参数-->用户注册成功-->数据库自增得到的id
                modelLogin.addObject("userNameFromRegister",newUser.getUserName());
                modelLogin.addObject("userPwdFromRegister",newUser.getUserPassword());

                //注册成功--->直接调用登录方法 进行登录
                return modelLogin;
            }
            //注册失败 回到注册页
            registerError.addObject("error","registerError");
            style.new_style("注册失败!");
            return registerError;
        }
        registerError.addObject("error","registerError");
        style.new_style("用户名已存在，请修改！");

        return registerError;
    }
    @RequestMapping(value = "/pre_update")
    public String pre_update() {
        return "update";
    }

    @RequestMapping(value = "/update")
    public ModelAndView update(HttpServletRequest httpServletRequest) {
        //获取用户输入的账号密码
        String userName = httpServletRequest.getParameter("userName");
        String userPwd = httpServletRequest.getParameter("userPwd");
        String userNewPwd = httpServletRequest.getParameter("userNewPwd");
        String key = "userName:"+userName;

        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("user_name",userName);
        queryWrapper.eq("user_password",userPwd);

        NewPopupStyle style = new NewPopupStyle();

        if(userInformService.getOne(queryWrapper) != null){//用户原密码输入正确
            //修改密码
            UserInform newUser = new UserInform(userInformService.getOne(queryWrapper).getUserIndex(),userName,userNewPwd);

            if(userInformService.saveOrUpdate(newUser)){//修改数据库成功
                //修改缓存
                redisTemplate.opsForValue().set(key,newUser);
                style.new_style("修改成功，立即登录！");
                ModelAndView modelLogin = new ModelAndView("redirect:/pre_login");
                return modelLogin;
            }

        }
        //原密码错误
        style.new_style("账号或密码错误！");
        return new ModelAndView("redirect:/pre_update");

    }
}
