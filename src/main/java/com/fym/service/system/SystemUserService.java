package com.fym.service.system;

import com.fym.dao.system.SystemRoleDao;
import com.fym.dao.system.SystemUserDao;
import com.fym.entity.utils.PageEntity;
import com.fym.utils.data.HashPageData;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SystemUserService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private SystemRoleDao systemRoleDao;
    @Resource
    private SystemUserDao systemUserDao;

    public List<HashPageData> getSystemUsers(PageEntity page){
        List<HashPageData> systemUsers = null;
        PageHelper.startPage(page.getPageNum(), page.getPageSize());

        try {
            systemUsers = systemUserDao.getAllUsers(page);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return systemUsers;

    }

    public List<HashPageData> getSystemRole(PageEntity page){
        List<HashPageData> roles = null;
        if(page!=null)
            PageHelper.startPage(page.getPageNum(), page.getPageSize());
        try {
            roles = systemRoleDao.getAllRoles(page);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return roles;

    }
}
