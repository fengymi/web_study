package com.fym.dao.system;

import com.fym.dao.base.BaseOper;
import com.fym.entity.utils.PageEntity;
import com.fym.utils.data.HashPageData;

import java.util.List;

public interface MachineUserDao extends BaseOper {


    @Override
    int add(HashPageData data);

    @Override
    void delete(HashPageData data);

    @Override
    void update(HashPageData data);

    List<HashPageData> getAllMachineUsers(PageEntity page);
}
