package com.movie.review.controller;


import com.movie.review.service.ReviewInformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author Miss Chen
 * @since 2022-03-15
 */
@Controller
public class ReviewInformController {

    @Autowired
    private ReviewInformService reviewInformService;

    @RequestMapping("/addReview")
    public ModelAndView addReview(HttpServletRequest httpServletRequest){

        Integer movieIndex = Integer.valueOf(httpServletRequest.getParameter("movieIndex"));
        String userName = httpServletRequest.getParameter("userName");
        String reviewContent = httpServletRequest.getParameter("reviewContent");

        reviewInformService.addReview(movieIndex,userName,reviewContent);

        ModelAndView movieDetails = new ModelAndView("redirect:/movie_details");
        movieDetails.addObject("movieIndex",movieIndex);

        return movieDetails;
    }
}
