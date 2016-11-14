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

    /**
     * 修改某个用户使用状态
     * @param muId 虚拟机用户id
     * @param status 状态
     */
    void updateUse(Object muId,int status);

    /**
     * 初始化时重置账号使用状态
     */
    void initUse();

    List<HashPageData> getAllMachineUsers(PageEntity page);

    HashPageData getOneUser(HashPageData data);

}
