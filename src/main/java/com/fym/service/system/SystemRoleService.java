package com.fym.service.system;


import com.fym.dao.system.SystemRoleDao;
import com.fym.dao.system.SystemRolePermissionDao;
import com.fym.entity.Role;
import com.fym.entity.utils.OperEntity;
import com.fym.entity.utils.PageEntity;
import com.fym.entity.utils.RoleManager;
import com.fym.entity.utils.UserManager;
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
public class SystemRoleService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private SystemRoleDao systemRoleDao;
    @Resource
    private SystemRolePermissionDao systemRolePermissionDao;
    @Resource
    private OperObject operObject;

    /**
     * 获取系统角色
     * @param page 分页信息
     * @return 角色
     */
    public List<HashPageData> getSystemRole(PageEntity page){
        List<HashPageData> roles = null;
        if(page!=null&&!page.isNotPage())
            PageHelper.startPage(page.getPageNum(), page.getPageSize());
        try {
            roles = systemRoleDao.getAllRoles(page);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return roles;
    }
    /**
     * 修改角色信息
     * @param manager 角色信息
     */
    @Transactional
    public void update(RoleManager manager){
        HashPageData hash = new HashPageData();
        hash.put("role_name",manager.getRole_name());
        hash.put("available",manager.getAvailable());
        hash.put("is_sys",manager.getIsSys());
        hash.put("id",manager.getRoleId());

        systemRoleDao.update(hash);
        if(manager.getDelPermissions().length>0)
            systemRolePermissionDao.delPermissions(manager);
        if(manager.getAddPermissions().length>0)
            systemRolePermissionDao.addPermissions(manager);
    }
    /**
     * 获取某个角色
     * @param roleId 角色id
     * @return 角色信息
     */
    public Role getRole(Object roleId){
        return roleId==null?null:systemRoleDao.getRole(roleId);
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
