package com.fym.controller.user;


import com.fym.controller.BaseController;
import com.fym.service.system.ServerService;
import com.fym.utils.data.HashPageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
@RequestMapping("/user/machine")
public class UseMachineController extends BaseController{
    @Resource
    private ServerService serverService;

    @RequestMapping("/list")
    public ModelAndView list(){
        ModelAndView mv = new ModelAndView("user/machine_list");
        mv.addObject("title","虚拟机列表");
        mv.addObject("machines",serverService.getCanUseMachines());
        return mv;
    }

    @RequestMapping("/connection")
    public ModelAndView connection(){
        ModelAndView mv = new ModelAndView("user/machine_connection");
        mv.addObject("title","连接虚拟机");
        System.out.println(new HashPageData(getRequest()));
        mv.addObject("clientInfo",new HashPageData(getRequest()));
        return mv;
    }


}
