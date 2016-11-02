package com.fym.controller.user;

import com.fym.controller.BaseController;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/user")
public class UserController extends BaseController {


    @RequestMapping("/index")
    public String index(){
        return "index";
    }
}
