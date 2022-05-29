package com.movie.review.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.movie.review.entity.MovieInform;
import com.movie.review.entity.ReviewInform;
import com.movie.review.service.MovieInformService;
import com.movie.review.service.ReviewInformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;
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
public class MovieInformController {

    @Autowired
    private MovieInformService movieInformService;

    @Autowired
    private ReviewInformService reviewInformService;


    @RequestMapping("/pre_movie_list")
    public String pre_movie_list(ModelMap modelMap){

        //评分前十
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.orderByDesc("movie_score");
        queryWrapper.last("limit 10");
        List<MovieInform> top10Movies = movieInformService.list(queryWrapper);
        modelMap.addAttribute("top10Movies",top10Movies);

        //大陆热度前十
        QueryWrapper queryWrapper2 = new QueryWrapper();
        queryWrapper2.like("movie_country","%中国大陆%");
        queryWrapper2.orderByDesc("movie_evaluate_number");
        queryWrapper2.last("limit 10");
        List<MovieInform> hot10Movies = movieInformService.list(queryWrapper2);
        modelMap.addAttribute("hot10Movies",hot10Movies);

        //国外热度前十
        QueryWrapper queryWrapper3 = new QueryWrapper();
        queryWrapper3.notLike("movie_country","%中国大陆%");
        queryWrapper3.orderByDesc("movie_evaluate_number");
        queryWrapper3.last("limit 10");
        List<MovieInform> hot10Movies2 = movieInformService.list(queryWrapper3);
        modelMap.addAttribute("hot10Movies2",hot10Movies2);

        //获取所有类型
        QueryWrapper queryWrapper4 = new QueryWrapper();
        queryWrapper4.select("DISTINCT movie_type");
        List<MovieInform> typeList =  movieInformService.list(queryWrapper4);
        modelMap.addAttribute("typeList",typeList);

        //获取所有年代值
        QueryWrapper queryWrapper5 = new QueryWrapper();
        queryWrapper5.select("DISTINCT movie_year");
        List<MovieInform> yearList =  movieInformService.list(queryWrapper5);
        modelMap.addAttribute("yearList",yearList);

        //获取所有国家
        QueryWrapper queryWrapper6 = new QueryWrapper();
        queryWrapper6.select("DISTINCT movie_country");
        List<MovieInform> countryList =  movieInformService.list(queryWrapper6);
        modelMap.addAttribute("countryList",countryList);

        List<MovieInform> movieInformList = movieInformService.list();
        modelMap.addAttribute("allMovies",movieInformList);

        return "index";
    }


    @RequestMapping("/select")
    public String select(HttpServletRequest httpServletRequest,ModelMap modelMap){

        String type = httpServletRequest.getParameter("type");
        String year = httpServletRequest.getParameter("year");
        String country = httpServletRequest.getParameter("country");

        QueryWrapper queryWrapper = new QueryWrapper();
        if(type!=null){
            queryWrapper.like("movie_type","%"+type+"%");
        }
        if(year!=null){
            queryWrapper.like("movie_year","%"+year+"%");
        }
        if(country!=null){
            queryWrapper.like("movie_country","%"+country+"%");
        }

        //根据条件搜索电影信息
        List<MovieInform> selectList = movieInformService.list(queryWrapper);
        modelMap.addAttribute("selectList",selectList);

        return "selectList";
    }

    @RequestMapping("/selectOne")
    public String selectOne(HttpServletRequest httpServletRequest,ModelMap modelMap){

        String movieName = httpServletRequest.getParameter("movieName");
        PrintWriter out = null;
        QueryWrapper queryWrapper = new QueryWrapper();
        if(movieName!=null){
            queryWrapper.like("movie_name","%"+movieName+"%");
        }

        //根据名称搜索电影信息  可能存在重名，所以存在list中  模糊查询
        List<MovieInform> selectList = movieInformService.list(queryWrapper);
        modelMap.addAttribute("selectList",selectList);

        return "selectList";
    }

    @RequestMapping("/all_movies")
    public String all_movies(ModelMap modelMap){

        //查询所有电影
        List<MovieInform> allMovies = movieInformService.list();
        modelMap.addAttribute("selectList",allMovies);

        return "selectList";
    }

    @RequestMapping("/movie_details")
    public String movie_details(ModelMap modelMap,HttpServletRequest httpServletRequest, HttpSession httpSession,Integer movieIndex){

        Integer index = movieIndex == null ? Integer.valueOf(httpServletRequest.getParameter("index")):movieIndex;

        //查询电影详情
        MovieInform movieById = movieInformService.getById(index);
        //查询电影评价
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("review_movie_index",index);
        List<ReviewInform> reviewByMovieId = reviewInformService.list(queryWrapper);

        //传给前端页面
        httpSession.setAttribute("movieById",movieById);
        modelMap.addAttribute("reviewByMovieId",reviewByMovieId);
        modelMap.addAttribute("reviewNums",reviewByMovieId.size());

        return "movieDetails";
    }


}
