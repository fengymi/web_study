package com.fym.utils.component;

import com.fym.dao.base.BaseOper;
import com.fym.dao.system.*;
import com.fym.entity.utils.OperEntity;
import org.springframework.stereotype.Service;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import java.util.HashMap;
import java.util.Map;

@Service
public class OperObject {

    @Resource
    private MachineUserDao machineUserDao;
    @Resource
    private MachineDao machineDao;
    @Resource
    private ServerDao serverDao;
    @Resource
    private SystemUserDao systemUserDao;
    @Resource
    private SystemRoleDao systemRoleDao;
    @Resource
    private SystemPermissionDao systemPermissionDao;

    //操作对象类型
    public static final int OPER_SERVER = 100; //代理服务器
    public static final int OPER_MACHINE = 101; //虚拟机
    public static final int OPER_MACHINE_USER = 102; //虚拟机登录账号
    public static final int OPER_SYSTEM_USER = 103; //系统用户
    public static final int OPER_SYSTEM_ROLE = 104; //系统角色
    public static final int OPER_SYSTEM_PERMISSION = 105; //系统权限

    private static final Map<Integer,BaseOper> operDaos = new HashMap<>();

    @PostConstruct
    private void init(){
        operDaos.put(OPER_SERVER,serverDao);
        operDaos.put(OPER_MACHINE,machineDao);
        operDaos.put(OPER_MACHINE_USER,machineUserDao);
        operDaos.put(OPER_SYSTEM_USER,systemUserDao);
        operDaos.put(OPER_SYSTEM_ROLE,systemRoleDao);
        operDaos.put(OPER_SYSTEM_PERMISSION,systemPermissionDao);
    }

    private BaseOper getOperDao(int oper){
        return operDaos.get(oper);
    }
    /**
     * 简单增删改
     * @param oper 操作参数
     * @param operType 操作类型
     */
    public void editObject(OperEntity oper, int operType){
        BaseOper operDao = getOperDao(operType);
        switch (oper.getOper()){
            case "del":
                operDao.delete(oper.getData());
                break;
            case "edit":
                operDao.update(oper.getData());
                break;
            case "add":
                operDao.add(oper.getData());
                break;
        }
    }
}
