package com.fym.entity;

import java.util.Set;

/**
 * 一个权限对应的角色
 */
public class PermissionRole {
    private Permission permission;
    private Set<Role> roles;

    public Permission getPermission() {
        return permission;
    }

    public void setPermission(Permission permission) {
        this.permission = permission;
    }

    public Set<Role> getRoles() {
        return roles;
    }

    public void setRoles(Set<Role> roles) {
        this.roles = roles;
    }
}
