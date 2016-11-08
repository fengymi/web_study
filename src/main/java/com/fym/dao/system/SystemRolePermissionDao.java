package com.fym.dao.system;

import com.fym.entity.utils.PermissionManager;
import com.fym.entity.utils.RoleManager;

public interface SystemRolePermissionDao {
    /**
     * 根据角色增删权限
     * @param roleManager 角色
     */
    void addPermissions(RoleManager roleManager);
    void delPermissions(RoleManager roleManager);

    /**
     * 根据权限增删角色
     * @param permissionManager 权限
     */
    void addRoles(PermissionManager permissionManager);
    void delRoles(PermissionManager permissionManager);
}
