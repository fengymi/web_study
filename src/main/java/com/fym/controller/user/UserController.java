package com.fym.controller.user;

import com.fym.controller.BaseController;
import com.fym.entity.User;
import com.fym.service.system.SystemUserService;
import com.fym.utils.component.Constant;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@RequestMapping("/user")
public class UserController extends BaseController {

    @Resource
    private SystemUserService systemUserService;

    @RequestMapping("/index")
    public String index(){
        return "index";
    }

    @RequestMapping(value = "/chang_password",produces="application/json;charset=UTF-8",method = RequestMethod.POST)
    @ResponseBody
    public Object changePassword(String password){
        Integer userId = Integer.parseInt(((User)(getSession().getAttribute(Constant.SESSION_USER))).getId());
        return systemUserService.changePassword(password,userId);
    }
}
