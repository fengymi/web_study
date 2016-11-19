package com.fym.controller.admin;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Random;

@Controller
@RequestMapping("/admin")
public class AdminController {


    @RequestMapping("/home")
    public String home(){
        return "admin/home";
    }
    @RequestMapping("/index")
    public String index(){
        return "admin/index";
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
