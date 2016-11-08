package com.fym.controller.system;

import com.alibaba.fastjson.JSON;
import com.fym.controller.BaseController;
import com.fym.entity.PermissionRole;
import com.fym.entity.Role;
import com.fym.entity.utils.PageEntity;
import com.fym.entity.utils.PermissionManager;
import com.fym.service.system.SystemPermissionService;
import com.fym.service.system.SystemRoleService;
import com.fym.utils.component.CalcTools;
import com.fym.utils.component.OperObject;
import com.fym.utils.data.HashPageData;
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
@RequestMapping("/system/permission")
public class PermissionController extends BaseController{

    @Resource
    private SystemPermissionService systemPermissionService;
    @Resource
    private SystemRoleService systemRoleService;

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
        PermissionRole permission = systemPermissionService.getPermission(permissionId);
        if(permission==null) return mv;
        List<HashPageData> roles = systemRoleService.getSystemRole(new PageEntity().setExtend("available",1).setNotPage(true));
        Set<HashPageData> sysRoles = new HashSet<>();
        Set<HashPageData> oRoles = new HashSet<>();
        //计算已选和未选角色
        String oldRolesId = "";
        Iterator<Role> permissionRole = null;
        for (HashPageData role : roles) {
            if(permission.getRoles()!=null&&permission.getRoles().size()>0){
                permissionRole = permission.getRoles().iterator();
            }
            oldRolesId += CalcTools.getSelectedIds(permissionRole,role);
            if("1".equals(role.get("is_sys"))){
                sysRoles.add(role);
            }else {
                oRoles.add(role);
            }
        }
        if(oldRolesId.length()>0){
            oldRolesId = oldRolesId.substring(0,oldRolesId.length()-1);
        }
        mv.addObject("permission",permission.getPermission());
        mv.addObject("oldRolesId",oldRolesId);
        mv.addObject("sysRoles",sysRoles);
        mv.addObject("oRoles",oRoles);
//        mv.addObject("roles",roles);
        return mv;
    }
    @RequestMapping(value = "/update",produces="application/text;charset=UTF-8")
    @ResponseBody
    public Object update(PermissionManager manager){
        systemPermissionService.update(manager);
        return "修改成功";
    }

    @RequestMapping("/edit_data")
    @ResponseBody
    public Object edit(){
        systemPermissionService.edit(getOper(), OperObject.OPER_SYSTEM_PERMISSION);
        return true;
    }
}