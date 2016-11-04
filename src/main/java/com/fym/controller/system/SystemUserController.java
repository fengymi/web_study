package com.fym.controller.system;

import com.alibaba.fastjson.JSON;
import com.fym.controller.BaseController;
import com.fym.service.system.SystemUserService;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
@RequestMapping("/system/user")
public class SystemUserController extends BaseController{

    @Resource
    private SystemUserService systemUserService;

    @RequestMapping("/list")
    public ModelAndView list(){
        ModelAndView mv = new ModelAndView("system/sys_user");
        mv.addObject("title","系统用户管理");
        mv.addObject("role__id",getRequest().getParameter("role__id"));
        return mv;
    }

    @RequestMapping("/get_data")
    @ResponseBody
    public Object getList(){
        return JSON.toJSON(new PageInfo<>(systemUserService.getSystemUsers(getPage())));
    }

    @RequestMapping("/edit_data")
    @ResponseBody
    public Object edit(){
        //serverService.editServers(getOper(), Constant.OPER_MACHINE_USER);
        return true;
    }

}
