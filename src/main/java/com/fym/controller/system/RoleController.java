package com.fym.controller.system;

import com.alibaba.fastjson.JSON;
import com.fym.controller.BaseController;
import com.fym.entity.Permission;
import com.fym.entity.Role;
import com.fym.entity.utils.PageEntity;
import com.fym.entity.utils.RoleManager;
import com.fym.service.system.SystemPermissionService;
import com.fym.service.system.SystemRoleService;
import com.fym.utils.component.OperObject;
import com.fym.utils.data.HashPageData;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.Iterator;
import java.util.List;

@Controller
@RequestMapping("/system/role")
public class RoleController extends BaseController{

    @Resource
    private SystemRoleService systemRoleService;
    @Resource
    private SystemPermissionService systemPermissionService;

    @RequestMapping("/list")
    public ModelAndView list(){
        ModelAndView mv = new ModelAndView("system/sys_role");
        mv.addObject("title","系统角色管理");
        return mv;
    }

    @RequestMapping("/manager")
    public ModelAndView manager(){
        ModelAndView mv = new ModelAndView("system/role_manager");
        mv.addObject("title","角色管理");
        Object roleId = getRequest().getParameter("role_id");
        Role role = systemRoleService.getRole(roleId);
        if(role == null) return mv;

        List<HashPageData> permissions = systemPermissionService.getSystemPermission(new PageEntity().setExtend("roleId",roleId).setExtend("p_available",1).setNotPage(true));
        String oldPermissions = "";
        Iterator<Permission> userPermission = null;
        for (HashPageData permission : permissions) {
            //每次重新得到遍历对象
            if (role.getPermissionSet()!=null&&role.getPermissionSet().size()>0){
                userPermission = role.getPermissionSet().iterator();
            }
            while (userPermission!=null&&userPermission.hasNext()){
                Permission p = userPermission.next();
                if(p.getId().equals(Integer.parseInt(permission.get("permission_id").toString()))){
                    permission.put("isIn",true);
                    userPermission.remove();
                    oldPermissions += p.getId()+",";
                    break;
                }
            }
        }

        if(oldPermissions.length()>0){
            oldPermissions = oldPermissions.substring(0,oldPermissions.length()-1);
        }
        mv.addObject("role",role);
        mv.addObject("oldPermissions",oldPermissions);
        mv.addObject("permissions",permissions);
        return mv;
    }

    @RequestMapping(value = "/update",produces="application/text;charset=UTF-8")
    @ResponseBody
    public Object update(RoleManager roleManager){
        System.out.println(JSON.toJSONString(roleManager));
        System.out.println(roleManager.getDelPermissionsStr());
        systemRoleService.update(roleManager);
        return "修改成功";
    }

    @RequestMapping("/get_data")
    @ResponseBody
    public Object getList(){
        return JSON.toJSON(systemRoleService.getSystemRole(getPage()));
    }

    @RequestMapping("/edit_data")
    @ResponseBody
    public Object edit(){
        systemRoleService.edit(getOper(), OperObject.OPER_SYSTEM_ROLE);
        return true;
    }
}
