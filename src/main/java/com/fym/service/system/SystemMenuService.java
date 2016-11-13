package com.fym.service.system;

import com.fym.dao.system.MenuDao;
import com.fym.entity.Menu;
import com.fym.entity.utils.OperEntity;
import com.fym.entity.utils.PageEntity;
import com.fym.utils.component.OperObject;
import com.fym.utils.data.HashPageData;
import com.github.pagehelper.PageHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Set;

@Service
public class SystemMenuService {
    private final Logger logger = LoggerFactory.getLogger(SystemMenuService.class);
    @Resource
    private MenuDao menuDao;
    @Resource
    private OperObject operObject;


    public List<Menu> getMenusByPer(Set ids){
        return menuDao.getMenus(ids);
    }
    /**
     * 获取菜单
     * @param page 分页信息
     * @return 该页数据
     */
    public List<HashPageData> getMenus(PageEntity page){
        List<HashPageData> menus = null;
        if(page!=null)
            PageHelper.startPage(page.getPageNum(), page.getPageSize());
        try {
            menus = menuDao.getAllMenu(page);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return menus;
    }

    /**
     * 简单操作
     * @param oper 操作参数
     * @param operType 操作类型
     */
    public void edit(OperEntity oper, int operType){
        operObject.editObject(oper,operType);
    }
}
