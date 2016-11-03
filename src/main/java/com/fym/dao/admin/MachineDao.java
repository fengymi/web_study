package com.fym.dao.admin;


import com.fym.entity.utils.PageEntity;
import com.fym.utils.data.HashPageData;

import java.util.List;

public interface MachineDao extends BaseOper{

    List<HashPageData> getAllMachines(PageEntity page);

    void add(HashPageData data);

    void delete(HashPageData data);

    void update(HashPageData data);
}
