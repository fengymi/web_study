package com.fym.context;

import com.fym.entity.ProxyServerEntity;
import com.fym.service.system.ServerService;
import com.fym.utils.component.SpringBeanGetter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

/**
 * 代理服务器选择
 */
public class ProxyServer {
    private final Logger logger = LoggerFactory.getLogger(ProxyServer.class);

    private static ProxyServer proxyServer;
    private ServerService serverService;
    private List<ProxyServerEntity> servers;
    private int index;

    private ProxyServer(){}

    public static ProxyServer getProxy(){
        if(proxyServer==null){
            synchronized (ProxyServer.class){
                if(proxyServer == null){
                    proxyServer = new ProxyServer();
                }
            }
        }
        return proxyServer;
    }

    /**
     * 初始化
     */
    protected void init(){
        serverService = SpringBeanGetter.getBean(ServerService.class);
        initProxy();
    }

    /**
     * 重置代理服务器
     */
    public void reset(){
        initProxy();
    }


    /**
     * 获取代理服务器算法,达到负载均衡
     * @return 可用代理服务器
     */
    public ProxyServerEntity getProxyServer(){
        if(servers==null||servers.size()==0) {
            logger.info("代理服务器不存在");
            return null;
        }
        return servers.get((index++)%servers.size());
    }

    /**
     * 初始化代理服务器
     */
    private void initProxy(){
        logger.debug("开始初始化代理服务器");
        index = 0;
        servers = serverService.getCanUseServers();
        if (servers==null||servers.size()==0){
            logger.error("代理服务器不存在,将无法使用虚拟机");
        }
        logger.debug("代理服务器初始化完成");
    }
}
