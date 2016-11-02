package com.fym.controller.admin;

import com.alibaba.fastjson.JSON;
import com.fym.service.admin.ServerService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
        mv.addObject("title","服务器列表");
        return mv;
    }

    @RequestMapping("/get_data")
    @ResponseBody
    public Object getList(int pageNum,int pageSize){
        return JSON.toJSON(serverService.getServers(pageNum,pageSize));
    }
}
