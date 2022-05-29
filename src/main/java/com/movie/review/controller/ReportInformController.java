package com.movie.review.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.movie.review.entity.ReportInform;
import com.movie.review.util.NewPopupStyle;
import com.movie.review.service.ReportInfromService;
import com.movie.review.service.ReviewInformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class ReportInformController {

    @Autowired
    private ReportInfromService reportInfromService;

    @Autowired
    private ReviewInformService reviewInformService;

    @RequestMapping("/pre_allReport")
    public String pre_allReport(ModelMap modelMap){

        List<ReportInform> reportList = reportInfromService.list();
        modelMap.addAttribute("reportList",reportList);
        return "allReport";
    }

    @RequestMapping("/deal_with_report")
    public ModelAndView deal_with_report(HttpServletRequest httpServletRequest){

        ModelAndView allReport = new ModelAndView("redirect:/pre_allReport");

        String isCompliance = httpServletRequest.getParameter("isCompliance");
        Integer reportId = Integer.valueOf(httpServletRequest.getParameter("reportId"));
        Integer reviewId = Integer.valueOf(httpServletRequest.getParameter("reviewId"));
        //先从举报表中删除该记录
        QueryWrapper queryWrapper = new QueryWrapper();
        queryWrapper.eq("report_index",reportId);

        QueryWrapper queryWrapper2 = new QueryWrapper();
        queryWrapper2.eq("review_index",reviewId);

       reportInfromService.remove(queryWrapper);
        if(isCompliance.equals("不合规")){
            //不合规-->删除该评论
            reviewInformService.remove(queryWrapper2);
        }
        return allReport;
    }

    @RequestMapping("/add_report")
    @ResponseBody
    public String add_report(HttpServletRequest httpServletRequest){
        //举报的评论的 内容、索引
        String reviewContent = httpServletRequest.getParameter("reviewContent");
        Integer reviewId = Integer.valueOf(httpServletRequest.getParameter("reviewId"));
        ReportInform reportInform = new ReportInform(reviewContent,reviewId);

        NewPopupStyle style = new NewPopupStyle();

        if(reportInfromService.save(reportInform)){
            style.new_style("举报成功！");
        }else {
            style.new_style("举报失败！");
        }
        return "history.go(-1);</script>";
    }

}
