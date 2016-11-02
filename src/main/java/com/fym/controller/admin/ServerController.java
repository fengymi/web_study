package com.fym.controller.admin;

import com.fym.service.admin.ServerService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
@RequestMapping("/admin/server")
public class ServerController {

    @Resource
    private ServerService serverService;

    @RequestMapping("/list")
    public ModelAndView list(){
        ModelAndView mv = new ModelAndView("admin/server");
        mv.addObject("machine",serverService.getAllMachines());
        System.out.println(mv);
        return mv;
    }
}
