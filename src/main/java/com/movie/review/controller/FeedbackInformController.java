package com.movie.review.controller;

import com.movie.review.entity.FeedbackInform;
import com.movie.review.util.NewPopupStyle;
import com.movie.review.service.FeedbackInformService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class FeedbackInformController {
    @Autowired
    private FeedbackInformService feedbackInformService;

    @RequestMapping("/pre_feedback")
    public String pre_feedback(){
        return "addFeedback";
    }

    @RequestMapping("/add_feedback")
    public ModelAndView add_feedback(HttpServletRequest httpServletRequest){
        String w3lMessage = httpServletRequest.getParameter("w3lMessage");
        FeedbackInform feedback = new FeedbackInform(w3lMessage);

        //弹窗提示
        NewPopupStyle style = new NewPopupStyle();
        //返回上一页
        ModelAndView previous = new ModelAndView("redirect:/previous2");
        if(feedbackInformService.save(feedback)){
            style.new_style("提交成功");
            return previous;
        }
        style.new_style("提交失败");
        return previous;
    }

    /**
     * 后台---获取用户反馈信息
     * @param modelMap
     * @return
     */
    @RequestMapping("/pre_allFeedback")
    public String pre_backstage(ModelMap modelMap){
        List<FeedbackInform> feedbackList = feedbackInformService.list();
        modelMap.addAttribute("feedbackList",feedbackList);
        return "allFeedback";
    }

    /**
     * 当出现弹窗提示后 返回到上一页
     * @return
     */
    @RequestMapping("/previous")
    @ResponseBody
    public String previous(){
        return "<script>history.go(-1);</script>";
    }

    @RequestMapping("/previous2")
    @ResponseBody
    public String previous2(){
//        返回到上两页
        return "<script>history.go(-2);</script>";
    }

}
