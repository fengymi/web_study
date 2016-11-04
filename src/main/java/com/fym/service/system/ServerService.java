package com.fym.service.system;

import com.fym.dao.base.BaseOper;
import com.fym.dao.system.MachineDao;
import com.fym.dao.system.MachineUserDao;
import com.fym.dao.system.ServerDao;
import com.fym.entity.utils.OperEntity;
import com.fym.entity.utils.PageEntity;
import com.fym.utils.config.Constant;
import com.fym.utils.data.HashPageData;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ServerService {
    private Logger logger = Logger.getLogger(this.getClass());

    @Resource
    private MachineUserDao machineUserDao;
    @Resource
    private MachineDao machineDao;
    @Resource
    private ServerDao serverDao;


    public PageInfo getMachineUsers(PageEntity page){
        List<HashPageData> machines = null;
        PageHelper.startPage(page.getPageNum(), page.getPageSize());

        try {
            machines = machineUserDao.getAllMachineUsers(page);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return new PageInfo<>(machines);
    }
    /**
     * 获取虚拟机列表
     * @param page 分页信息
     * @return 该页数据
     */
    public PageInfo getMachines(PageEntity page){
        List<HashPageData> machines = null;
        PageHelper.startPage(page.getPageNum(), page.getPageSize());

        try {
            machines = machineDao.getAllMachines(page);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return new PageInfo<>(machines);
    }
    public List<HashPageData> getMachines(){
        return machineDao.getAllMachines(null);
    }
    /**
     * 获取服务器列表
     * @param page 分页信息
     * @return 该页数据
     */
    public PageInfo getServers(PageEntity page){
        List<HashPageData> servers = null;
        PageHelper.startPage(page.getPageNum(), page.getPageSize());

        try {
            servers = serverDao.getAllServers(page);
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        return new PageInfo<>(servers);
    }
    /**
     * 变更服务器
     * @param oper 操作参数
     * @param operType 操作类型
     */
    public void editServers(OperEntity oper,int operType){
        BaseOper operDao;
        switch (operType){
            case Constant.OPER_SERVER:
                operDao = serverDao;
                break;
            case Constant.OPER_MACHINE:
                operDao = machineDao;
                break;
            case Constant.OPER_MACHINE_USER:
                operDao = machineUserDao;
                break;
            default:
                operDao = serverDao;
                break;
        }
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
