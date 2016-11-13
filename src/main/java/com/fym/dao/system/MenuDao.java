package com.fym.dao.system;

import com.fym.dao.base.BaseOper;
import com.fym.entity.Menu;
import com.fym.entity.utils.PageEntity;
import com.fym.utils.data.HashPageData;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Set;

public interface MenuDao extends BaseOper {

    List<HashPageData> getAllMenu(PageEntity data);
    List<Menu> getMenus(@Param("ids") Set ids);

    int add(HashPageData data);

    void delete(HashPageData data);

    void update(HashPageData data);
}
