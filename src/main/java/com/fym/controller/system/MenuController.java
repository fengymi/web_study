package com.fym.controller.system;

import com.alibaba.fastjson.JSON;
import com.fym.controller.BaseController;
import com.fym.service.system.SystemMenuService;
import com.fym.utils.component.OperObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;

@Controller
@RequestMapping("/system/menu")
public class MenuController extends BaseController{
    @Resource
    private SystemMenuService systemMenuService;

    @RequestMapping("/list")
    public ModelAndView list(){
        ModelAndView mv = new ModelAndView("system/sys_menu");
        mv.addObject("title","系统菜单管理");
        return mv;
    }

    @RequestMapping("/get_data")
    @ResponseBody
    public Object getList(){
        return JSON.toJSON(systemMenuService.getMenus(getPage()));
    }
    @RequestMapping(value = "/get_select",produces = "application/json;charset=UTF-8")
    @ResponseBody
    public String getSelect(){
        return JSON.toJSONString(systemMenuService.getMenus(null));
    }

    @RequestMapping("/edit_data")
    @ResponseBody
    public Object edit(){
        systemMenuService.edit(getOper(), OperObject.OPER_MENU);
        return true;
    }
}
