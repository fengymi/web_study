package com.fym.controller.admin;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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
}
