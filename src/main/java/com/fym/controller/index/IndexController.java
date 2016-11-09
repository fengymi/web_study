package com.fym.controller.index;

import com.fym.context.SessionManager;
import com.fym.controller.BaseController;
import com.fym.utils.data.HashPageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
@RequestMapping("/index")
public class IndexController extends BaseController{
    @Resource
    private SessionManager sessionManager;

    @RequestMapping("")
    public ModelAndView index(){
        ModelAndView mv = new ModelAndView("index");
        mv.addObject("user","admin");
        getSession().setAttribute("user","admin");
        return mv;
    }

    @RequestMapping("/admin")
    public String admin(){
        return "admin/login";
    }
    @RequestMapping("/admin_auth")
    public ModelAndView adminAuth(){
        ModelAndView mv = new ModelAndView("redirect:/admin/home");
        boolean success = true;

        if(success){ //登录成功
            return mv;
        }

        mv.setViewName("admin/login");
        return mv;
    }

    @RequestMapping(value = "/get_user_num",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public Object getUserNum(){
        HashPageData pageData = new HashPageData();
        pageData.put("visitorNum",sessionManager.getVisitorNum());
        pageData.put("userNum",sessionManager.getUserNum());
        pageData.put("connectionNum",sessionManager.getConnectionNum());
        return pageData;
    }

    @RequestMapping("/login")
    public String login(){
        return "user/login";
    }

    @RequestMapping("/auth")
    public ModelAndView loginAuth(){
        ModelAndView mv = new ModelAndView("user/home");
        boolean success = true;

        if(success){ //登录成功
            return mv;
        }

        mv.setViewName("user/login");
        return mv;
    }
}
