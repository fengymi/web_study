package com.fym.dao.system;

import com.fym.dao.base.BaseOper;
import com.fym.entity.Role;
import com.fym.entity.utils.PageEntity;
import com.fym.utils.data.HashPageData;

import java.util.List;

public interface SystemRoleDao extends BaseOper {

    List<HashPageData> getAllRoles(PageEntity page);
    Role getRole(Object roleId);

    int add(HashPageData data);
    void delete(HashPageData data);
    void update(HashPageData data);

}
