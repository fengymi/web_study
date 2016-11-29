package com.fym.service.system;

import com.fym.dao.system.SystemPermissionDao;
import com.fym.dao.system.SystemRoleDao;
import com.fym.dao.system.SystemUserDao;
import com.fym.dao.system.SystemUserRoleDao;
import com.fym.entity.User;
import com.fym.entity.utils.OperEntity;
import com.fym.entity.utils.PageEntity;
import com.fym.entity.utils.UserManager;
import com.fym.utils.component.Constant;
import com.fym.utils.component.MD5Util;
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
public class SystemUserService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Resource
    private SystemUserDao systemUserDao;
    @Resource
    private SystemUserRoleDao systemUserRoleDao;
    @Resource
    private OperObject operObject;

    /**
     * 获取系统用户
     * @param page 分页信息
     * @return 用户
     */
    public List<HashPageData> getSystemUsers(PageEntity page){
        List<HashPageData> systemUsers = null;
        PageHelper.startPage(page.getPageNum(), page.getPageSize());

        try {
            systemUsers = systemUserDao.getUsersByRole(page);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return systemUsers;
    }
    public User getSystemUser(Object userId){
        return (userId==null)?null:systemUserDao.getUserAndRole(userId);
    }

    /**
     * 获取用户的权限
     * @param username 用户名
     * @return 用户和权限信息
     */
    public User getUserPermission(String username){
        return systemUserDao.findPermission(username);
    }
    /**
     * 修改用户信息
     * @param manager 用户信息
     */
    @Transactional
    public void updateUser(UserManager manager){
        HashPageData hash = new HashPageData();
        hash.put("nickname",manager.getNickname());
        hash.put("locked",manager.getLocked());
        hash.put("id",manager.getUserId());

        systemUserDao.update(hash);
        if(manager.getDelRoles().length>0)
            systemUserRoleDao.deleteUserRole(manager);
        if(manager.getAddRoles().length>0)
            systemUserRoleDao.addRoleForUser(manager);
    }

    public HashPageData changePassword(String password,Integer userId){
        if(password==null||password.trim().equals("")){
            return passwordInfo(Constant.PASSWORD_NULL);
        }

        return passwordInfo(systemUserDao.changePassword(MD5Util.MD5(password),userId));
    }

    private HashPageData passwordInfo(int result){
        HashPageData resultInfo = new HashPageData();
        switch (result){
            case Constant.SUCCESS_CODE:
                resultInfo.put("result",true);
                resultInfo.put("message","修改成功");
                break;
            case Constant.PASSWORD_NULL:
                resultInfo.put("result",false);
                resultInfo.put("message","密码不能为空");
                break;
            case Constant.NO_USER:
                resultInfo.put("result",false);
                resultInfo.put("message","用户不存在");
                break;
            default:
                resultInfo.put("result",false);
                resultInfo.put("message","发生错误");
                break;
        }
        return resultInfo;
    }

    /**
     * 简单操作
     * @param oper 操作参数
     * @param operType 操作类型
     */
    public void editUsers(OperEntity oper, int operType){
        operObject.editObject(oper,operType);
    }
}
