package com.fym.service.admin;

import com.alibaba.fastjson.JSON;
import com.fym.dao.admin.MachineDao;
import com.fym.dao.admin.ServerDao;
import com.fym.utils.data.HashPageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class ServerService {

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
}
