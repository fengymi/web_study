package com.fym.interceptor.shiro;

import com.alibaba.fastjson.JSON;
import com.fym.entity.Permission;
import com.fym.entity.Role;
import com.fym.entity.User;
import com.fym.service.system.SystemMenuService;
import com.fym.service.system.SystemUserService;
import com.fym.service.user.UserService;
import com.fym.utils.component.Constant;
import com.fym.utils.component.MD5Util;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/**
 * 用户权限验证
 */

public class UserRealm extends AuthorizingRealm {
    private Logger logger = Logger.getLogger(UserRealm.class);

    @Resource
    private UserService userService;
    @Resource
    private SystemUserService systemUserService;
    @Resource
    private SystemMenuService systemMenuService;
    /**
     * 授权操作
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

        Set<String> permissions = (Set)getSession().getAttribute(Constant.SESSION_USER_PERMISSION);
        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();

        //只关联了权限和url之间的关系
        if(permissions!=null && permissions.size()>0){
            authorizationInfo.addStringPermissions(permissions);
        }

        return authorizationInfo;
    }

    /**
     * 身份验证操作
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(
            AuthenticationToken token) throws AuthenticationException {
        String username = (String) token.getPrincipal();
        String password = new String((char[])token.getCredentials()); //得到密码

        User user = systemUserService.getUserPermission(username);

        if(user==null){
            throw new UnknownAccountException("没有找到该账号");
        }else if("1".equals(user.getLocked())) {
            throw new LockedAccountException(); //帐号锁定
        }else if (!password.equals(user.getPassword())){
            throw new IncorrectCredentialsException(); //如果密码错误
        }else {
            //登录成功,得到相应的操作菜单和权限
            Set<Role> roles = user.getRoleSet();
            Set<Integer> ids = new HashSet<>();
            Set<String> permissionStr = new HashSet<>();
            for (Role role : roles) {
                Set<Permission> permissions = role.getPermissionSet();
                for (Permission permission : permissions) {
                    ids.add(permission.getId());
                    permissionStr.add(permission.getPermissionName());
                }
            }
            if(ids.size()>=1){
                user.setMenus(systemMenuService.getMenusByPer(ids));
            }
            getSession().setAttribute(Constant.SESSION_USER,user);
            getSession().setAttribute(Constant.SESSION_USER_PERMISSION,permissionStr);
            logger.debug(username+"的权限\r\n"+JSON.toJSONString(permissionStr));

        }

        return new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(),getName());
    }

    @Override
    public String getName() {
        return getClass().getName();
    }

    private Session getSession(){
        return SecurityUtils.getSubject().getSession();
    }

}
