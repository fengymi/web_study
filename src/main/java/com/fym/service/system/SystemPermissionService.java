package com.fym.service.system;

import com.fym.dao.system.SystemPermissionDao;
import com.fym.dao.system.SystemRolePermissionDao;
import com.fym.entity.PermissionRole;
import com.fym.entity.utils.OperEntity;
import com.fym.entity.utils.PageEntity;
import com.fym.entity.utils.PermissionManager;
import com.fym.utils.component.OperObject;
import com.fym.utils.data.HashPageData;
import com.github.pagehelper.PageHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
public class SystemPermissionService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Resource
    private SystemPermissionDao systemPermissionDao;
    @Resource
    private SystemRolePermissionDao systemRolePermissionDao;
    @Resource
    private OperObject operObject;

    /**
     * 获取系统权限
     * @param page 分页信息
     * @return 权限
     */
    public List<HashPageData> getSystemPermission(PageEntity page){
        List<HashPageData> permissions = null;
        if(page!=null&&!page.isNotPage())
            PageHelper.startPage(page.getPageNum(), page.getPageSize());
        try {
            permissions = systemPermissionDao.getAllPermissions(page);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return permissions;
    }
    public PermissionRole getPermission(Object permissionId){
        return (permissionId==null)?null:systemPermissionDao.getPermissionAndRoles(permissionId);
    }

    @Transactional
    public void update(PermissionManager manager){
        HashPageData hash = new HashPageData();
        hash.put("permission_name",manager.getPermissionName());
        hash.put("p_available",manager.getAvailable());
        hash.put("url",manager.getUrl());
        hash.put("id",manager.getPermissionId());

        systemPermissionDao.update(hash);
        if(manager.getDelRoles().length>0)
            systemRolePermissionDao.delRoles(manager);
        if(manager.getAddRoles().length>0)
            systemRolePermissionDao.addRoles(manager);
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
