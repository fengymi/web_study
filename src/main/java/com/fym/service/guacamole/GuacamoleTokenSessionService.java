package com.fym.service.guacamole;

import com.fym.service.system.ServerService;
import com.fym.utils.component.Constant;
import com.fym.utils.data.HashPageData;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

@Service
public class GuacamoleTokenSessionService{
    private final Logger logger = LoggerFactory.getLogger(GuacamoleTokenSessionService.class);

    private static final Map<String,HashPageData> tunnelUsers = new ConcurrentHashMap<>();
    @Resource
    private ServerService serverService;

    public int getNum(){
        return tunnelUsers.size();
    }
    public void addTunnelUser(String tunnelId,HashPageData user){
        tunnelUsers.put(tunnelId,user);
        serverService.changeUsed(user.get("mu_id"), Constant.MACHINE_USER_USED);
        logger.debug(user.getString("username")+" 连接成功");
    }
    public HashPageData getTunnerUser(String tunnelId){
        return tunnelUsers.get(tunnelId);
    }
    public HashPageData remove(String tunnelId){
        HashPageData user = tunnelUsers.remove(tunnelId);
        if(user!=null) {
            serverService.changeUsed(user.get("mu_id"), Constant.MACHINE_USER_USE);
            logger.debug(user.getString("username")+" 断开连接");
        }
        return user;
    }
    public HashPageData removeByValue(String tunnelId){
        return tunnelUsers.remove(tunnelId);
    }
}
