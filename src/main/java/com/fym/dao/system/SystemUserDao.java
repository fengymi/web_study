package com.fym.dao.system;

import com.fym.dao.base.BaseOper;
import com.fym.entity.User;
import com.fym.entity.utils.PageEntity;
import com.fym.utils.data.HashPageData;

import java.util.List;

public interface SystemUserDao extends BaseOper {

    List<HashPageData> getAllUsers(PageEntity page);

    User getUserAndRole(Object userId);

    List<HashPageData> getUsersByRole(PageEntity page);

    User getByUsername(String username);

    User findPermission(String username);

    int registerUser(HashPageData data);

    int add(HashPageData data);
    void delete(HashPageData data);
    void update(HashPageData data);

    void changePassword(String password,Integer userId);

}
