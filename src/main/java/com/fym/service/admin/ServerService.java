package com.fym.service.admin;

import com.alibaba.fastjson.JSON;
import com.fym.dao.admin.MachineDao;
import com.fym.dao.admin.ServerDao;
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
    private MachineDao machineDao;
    @Resource
    private ServerDao serverDao;

    public HashPageData getAllMachines(){
        HashPageData machines = new HashPageData();

        machines.put("servers", JSON.toJSON(serverDao.getAllServers()));
        machines.put("machines",JSON.toJSON(machineDao.getAllMachines()));

        return machines;
    }
    public PageInfo getServers(int pageNum,int pageSize){
        List<HashPageData> servers = null;
        PageHelper.startPage(pageNum, pageSize);

        try {
            servers = serverDao.getAllServers();
        } catch (Exception e) {
            logger.error(e.getMessage());
        }
        PageInfo<HashPageData> pageInfo = new PageInfo<>(servers);
        System.out.println(pageInfo);
        return pageInfo;
    }
}
