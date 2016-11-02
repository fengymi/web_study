package com.fym.utils.shiro;

import com.fym.entity.Permission;
import com.fym.entity.Role;
import com.fym.entity.User;
import com.fym.service.user.UserService;
import org.apache.shiro.authc.*;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/**
 * 用户权限验证
 */

public class UserRealm extends AuthorizingRealm {

    @Autowired
    private UserService userService;
    /**
     * 授权操作
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        String username = (String) principals.getPrimaryPrincipal();

        Set<Role> roleSet =  userService.findUserByUsername(username).getRoleSet();
        //角色名的集合
        Set<String> roles = new HashSet<String>();
        //权限名的集合
        Set<String> permissions = new HashSet<String>();

        Iterator<Role> it = roleSet.iterator();
        while(it.hasNext()){
            roles.add(it.next().getName());
            for(Permission per:it.next().getPermissionSet()){
                permissions.add(per.getName());
            }
        }

        SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();

        authorizationInfo.addRoles(roles);
        authorizationInfo.addStringPermissions(permissions);


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
            //木有找到用户
            throw new UnknownAccountException("没有找到该账号");
        }
		/* if(Boolean.TRUE.equals(user.getLocked())) {
	            throw new LockedAccountException(); //帐号锁定
	        } */

        /**
         * 交给AuthenticatingRealm使用CredentialsMatcher进行密码匹配，如果觉得人家的不好可以在此判断或自定义实现
         */
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(user.getUsername(), user.getPassword(),getName());


        return info;
    }

    @Override
    public String getName() {
        return getClass().getName();
    }

}
