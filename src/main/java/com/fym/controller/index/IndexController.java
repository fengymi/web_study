package com.fym.controller.index;

import com.fym.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/index")
public class IndexController extends BaseController{

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
        ModelAndView mv = new ModelAndView("admin/home");
        boolean success = true;

        if(success){ //登录成功
            return mv;
        }

        mv.setViewName("admin/login");
        return mv;
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
