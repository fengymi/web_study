package com.fym.controller.system;

import com.alibaba.fastjson.JSON;
import com.fym.controller.BaseController;
import com.fym.service.system.ServerService;
import com.fym.utils.config.Constant;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
@RequestMapping("/system/permission")
public class PermissionController extends BaseController{

    @Resource
    private ServerService serverService;

    @RequestMapping("/list")
    public ModelAndView list(){
        ModelAndView mv = new ModelAndView("system/machine_user");
        mv.addObject("title","虚拟机登录账号");
        mv.addObject("machine_id",getRequest().getParameter("machine_id"));
        return mv;
    }

    @RequestMapping("/get_data")
    @ResponseBody
    public Object getList(){
        String machine_id = getRequest().getParameter("machine_id");
        return JSON.toJSON(serverService.getMachineUsers(getPage().setExtend("machine_id",machine_id)));
    }

    @RequestMapping("/edit_data")
    @ResponseBody
    public Object edit(){
        serverService.editServers(getOper(), Constant.OPER_MACHINE_USER);
        return true;
    }
}
