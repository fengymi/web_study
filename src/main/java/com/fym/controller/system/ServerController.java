package com.fym.controller.system;

import com.alibaba.fastjson.JSON;
import com.fym.context.ProxyServer;
import com.fym.controller.BaseController;
import com.fym.service.system.ServerService;
import com.fym.utils.component.OperObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
@RequestMapping("/system/server")
public class ServerController extends BaseController{

    @Resource
    private ServerService serverService;

    @RequestMapping("/list")
    public ModelAndView list(){
        ModelAndView mv = new ModelAndView("system/server");
        mv.addObject("title","代理服务器");
        return mv;
    }

    @RequestMapping("/get_data")
    @ResponseBody
    public Object getList(){
        return JSON.toJSON(serverService.getServers(getPage()));
    }

    @RequestMapping("/edit_data")
    @ResponseBody
    public Object edit(){
        serverService.editServers(getOper(), OperObject.OPER_SERVER);
        return true;
    }

    /**
     * 重置代理服务器
     * @return 重置
     */
    @RequestMapping("/reset")
    @ResponseBody
    public Object reset(){
        ProxyServer.getProxy().reset();
        return true;
    }


}
