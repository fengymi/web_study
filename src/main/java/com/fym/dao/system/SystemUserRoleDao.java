package com.fym.dao.system;

import com.fym.entity.utils.UserManager;

public interface SystemUserRoleDao{

    void deleteUserRole(UserManager manager);
    void addRoleForUser(UserManager manager);

}
