package com.fym.interceptor.shiro;

import com.alibaba.fastjson.JSON;
import com.fym.entity.Permission;
import com.fym.entity.Role;
import com.fym.entity.User;
import com.fym.service.system.SystemUserService;
import com.fym.service.user.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import javax.annotation.Resource;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/**
 * 用户权限验证
 */

public class UserRealm extends AuthorizingRealm {

    @Resource
    private UserService userService;
    @Resource
    private SystemUserService systemUserService;
    /**
     * 授权操作
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String username = (String) principals.getPrimaryPrincipal();

        Set<Role> roleSet =  systemUserService.getUserPermission(username).getRoleSet();
        //角色名的集合
        Set<String> roles = new HashSet<>();
        //权限名的集合
        Set<String> permissions = new HashSet<>();

        for (Role role : roleSet) {
            roles.add(role.getName());
            Set<Permission> permissionSet = role.getPermissionSet();
            for (Permission permission : permissionSet) {
                permissions.add(permission.getPermissionName());
            }
        }

        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();

        authorizationInfo.addRoles(roles);
        authorizationInfo.addStringPermissions(permissions);

        System.out.println(JSON.toJSONString(authorizationInfo));

        return authorizationInfo;
    }

    /**
     * 身份验证操作
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(
            AuthenticationToken token) throws AuthenticationException {
        String username = (String) token.getPrincipal();
        User user = userService.findUserByUsername(username);

        if(user==null){
            throw new UnknownAccountException("没有找到该账号");
        }
        if("1".equals(user.getLocked())) {
            throw new LockedAccountException(); //帐号锁定
        }

        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(),getName());


        return info;
    }

    @Override
    public String getName() {
        return getClass().getName();
    }

}
