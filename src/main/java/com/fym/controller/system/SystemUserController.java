package com.fym.controller.system;

import com.alibaba.fastjson.JSON;
import com.fym.controller.BaseController;
import com.fym.entity.Role;
import com.fym.entity.User;
import com.fym.entity.utils.PageEntity;
import com.fym.entity.utils.UserManager;
import com.fym.service.system.SystemRoleService;
import com.fym.service.system.SystemUserService;
import com.fym.utils.component.OperObject;
import com.fym.utils.data.HashPageData;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

@Controller
@RequestMapping("/system/user")
public class SystemUserController extends BaseController{

    @Resource
    private SystemUserService systemUserService;
    @Resource
    private SystemRoleService systemRoleService;

    @RequestMapping("/list")
    public ModelAndView list(){
        ModelAndView mv = new ModelAndView("system/sys_user");
        mv.addObject("title","系统用户管理");
        mv.addObject("role_id",getRequest().getParameter("role_id"));
        mv.addObject("is_sys","0".equals(getRequest().getParameter("is_sys"))?0:1);
        return mv;
    }
    @RequestMapping("/list_common")
    public ModelAndView listCommon(){
        ModelAndView mv = new ModelAndView("system/common_user");
        mv.addObject("title","普通用户管理");
        mv.addObject("role_id",getRequest().getParameter("role_id"));
        return mv;
    }

    @RequestMapping("/manager")
    public ModelAndView manager(){
        ModelAndView mv = new ModelAndView("system/user_manager");
        mv.addObject("title","用户管理");
        User user = systemUserService.getSystemUser(getRequest().getParameter("user_id"));
        if(user==null) return mv;

        mv.addObject("user",user);
        String oldRolesId = "";//记录原来有的角色id
        Iterator<Role> userRole = null;

        List<HashPageData> roles = systemRoleService.getSystemRole(new PageEntity().setExtend("available",1).setNotPage(true));
        Set<HashPageData> sysRoles = new HashSet<>();
        Set<HashPageData> oRoles = new HashSet<>();
        for (HashPageData role : roles) {//区分系统角色和普通角色
            //每次重新得到遍历对象
            if (user.getRoleSet()!=null&&user.getRoleSet().size()>0){
                userRole = user.getRoleSet().iterator();
            }
            while (userRole!=null&&userRole.hasNext()){
                Role uRole = userRole.next();
                if(uRole.getId().equals(Integer.parseInt(role.get("role_id").toString()))){
                    role.put("isIn",true);
                    oldRolesId += uRole.getId()+",";
                    userRole.remove();
                    break;
                }
            }
            if("1".equals(role.get("is_sys"))){
                sysRoles.add(role);
            }else {
                oRoles.add(role);
            }

        }
        if(oldRolesId.length()>0){
            oldRolesId = oldRolesId.substring(0,oldRolesId.length()-1);
        }
        mv.addObject("oldRolesId",oldRolesId);
        mv.addObject("sysRoles",sysRoles);
        mv.addObject("oRoles",oRoles);
        return mv;
    }
    @RequestMapping(value = "/update_user",produces="application/text;charset=UTF-8")
    @ResponseBody
    public Object updateUser(UserManager userManager){
        systemUserService.updateUser(userManager);
        return "修改成功";
    }

    @RequestMapping("/get_data")
    @ResponseBody
    public Object getList(){
        String role_id = getRequest().getParameter("role_id");
        String is_sys = getRequest().getParameter("is_sys");
        if(is_sys==null){
            is_sys = "1";//系统用户
        }
        return JSON.toJSON(new PageInfo<>(systemUserService.getSystemUsers(getPage().setExtend("role_id",role_id).setExtend("is_sys",is_sys))));
    }

    @RequestMapping("/edit_data")
    @ResponseBody
    public Object edit(){
        systemUserService.editUsers(getOper(), OperObject.OPER_SYSTEM_USER);
        return true;
    }

}
