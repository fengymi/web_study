package com.fym.controller.index;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class HomeController {

    @RequestMapping("")
    public ModelAndView index(){
        ModelAndView mv = new ModelAndView("index");
        mv.addObject("title","在线学习");
        return mv;
    }
}
