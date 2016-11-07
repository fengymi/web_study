package com.fym.controller.user;

import com.fym.controller.BaseController;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController {


    @RequestMapping("/index")
    public String index(){
        return "index";
    }
}
