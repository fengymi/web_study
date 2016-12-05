package com.fym.controller.admin;


import com.fym.service.user.UserCountService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.Random;

@Controller
@RequestMapping("/admin")
public class AdminController {
    @Resource
    private UserCountService userCountService;


    @RequestMapping("/home")
    public String home(){
        return "admin/home";
    }
    @RequestMapping("/index")
    public ModelAndView index(){
        ModelAndView mv = new ModelAndView("admin/index");
        mv.addObject("userNum",userCountService.getAll());
        return mv;
    }

    @RequestMapping("/get_info")
    @ResponseBody
    public float[] getInfo(){
        float[] systemInfo = new float[60];
        for (int i = 0; i < systemInfo.length; i++) {
            systemInfo[i] = new Random().nextFloat()*100;
        }
        return systemInfo;
    }
}
