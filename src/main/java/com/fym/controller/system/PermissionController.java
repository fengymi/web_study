package com.fym.controller.system;

import com.alibaba.fastjson.JSON;
import com.fym.controller.BaseController;
import com.fym.service.system.SystemPermissionService;
import com.fym.utils.component.OperObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
@RequestMapping("/system/permission")
public class PermissionController extends BaseController{

    @Resource
    private SystemPermissionService systemPermissionService;

    @RequestMapping("/list")
    public ModelAndView list(){
        ModelAndView mv = new ModelAndView("system/sys_permission");
        mv.addObject("title","权限管理");
        mv.addObject("role_id",getRequest().getParameter("role_id"));
        mv.addObject("available",getRequest().getParameter("available"));
        return mv;
    }

    @RequestMapping("/get_data")
    @ResponseBody
    public Object getList(){
        String role_id = getRequest().getParameter("role_id");
        return JSON.toJSON(systemPermissionService.getSystemPermission(getPage().setExtend("role_id",role_id)));
    }

    @RequestMapping("/manager")
    public ModelAndView manager(){
        ModelAndView mv = new ModelAndView("system/permission_manager");
        mv.addObject("title","权限管理");
        Object permissionId = getRequest().getParameter("permission_id");


        return mv;
    }

    @RequestMapping("/edit_data")
    @ResponseBody
    public Object edit(){
        systemPermissionService.edit(getOper(), OperObject.OPER_SYSTEM_PERMISSION);
        return true;
    }
}
