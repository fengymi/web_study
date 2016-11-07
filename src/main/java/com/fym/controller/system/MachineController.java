package com.fym.controller.system;

import com.alibaba.fastjson.JSON;
import com.fym.controller.BaseController;
import com.fym.service.system.ServerService;
import com.fym.utils.component.OperObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

/**
 * 虚拟机
 */
@Controller
@RequestMapping("/system/machine")
public class MachineController extends BaseController{

    @Resource
    private ServerService serverService;

    @RequestMapping("/list")
    public ModelAndView list(){
        ModelAndView mv = new ModelAndView("system/machine");
        mv.addObject("title","远程虚拟机");
        return mv;
    }

    @RequestMapping("/get_data")
    @ResponseBody
    public Object getList(){
        return JSON.toJSON(serverService.getMachines(getPage()));
    }

    @RequestMapping("/get_select")
    @ResponseBody
    public Object getSelect(){
        return JSON.toJSON(serverService.getMachines());
    }

    @RequestMapping("/edit_data")
    @ResponseBody
    public Object edit(){
        serverService.editServers(getOper(), OperObject.OPER_MACHINE);
        return true;
    }

}
