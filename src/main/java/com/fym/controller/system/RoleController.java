package com.fym.controller.system;

import com.alibaba.fastjson.JSON;
import com.fym.controller.BaseController;
import com.fym.service.system.ServerService;
import com.fym.service.system.SystemUserService;
import com.fym.utils.config.Constant;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
@RequestMapping("/system/role")
public class RoleController extends BaseController{

    @Resource
    private SystemUserService systemUserService;

    @RequestMapping("/list")
    public ModelAndView list(){
        ModelAndView mv = new ModelAndView("system/sys_role");
        mv.addObject("title","系统角色管理");
        return mv;
    }

    @RequestMapping("/get_data")
    @ResponseBody
    public Object getList(){
        return JSON.toJSON(systemUserService.getSystemRole(getPage()));
    }

    @RequestMapping("/edit_data")
    @ResponseBody
    public Object edit(){
        //serverService.editServers(getOper(), Constant.OPER_MACHINE_USER);
        return true;
    }
}
