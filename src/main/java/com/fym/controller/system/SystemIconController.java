package com.fym.controller.system;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/system/icon")
public class SystemIconController {

    @RequestMapping("")
    public ModelAndView iconList(){
        ModelAndView mv = new ModelAndView("system/system_icons");
        mv.addObject("title","拾取图标");
        return mv;
    }
}
