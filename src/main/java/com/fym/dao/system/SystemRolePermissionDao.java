package com.fym.dao.system;

import com.fym.entity.utils.RoleManager;

public interface SystemRolePermissionDao {

    void addPermissions(RoleManager roleManager);
    void delPermissions(RoleManager roleManager);
}
