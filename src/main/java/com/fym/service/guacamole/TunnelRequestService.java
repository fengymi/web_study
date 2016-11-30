package com.fym.service.guacamole;

import com.fym.context.ProxyServer;
import com.fym.controller.guacamole.DesignGuacamoleHTTPTunnel;
import com.fym.entity.ProxyServerEntity;
import com.fym.service.system.ServerService;
import com.fym.utils.component.Constant;
import com.fym.utils.data.HashPageData;
import com.fym.utils.data.PageDataUtils;
import com.fym.utils.guacamole.request.TunnelRequest;
import org.glyptodon.guacamole.net.GuacamoleSocket;
import org.glyptodon.guacamole.net.GuacamoleTunnel;
import org.glyptodon.guacamole.net.InetGuacamoleSocket;
import org.glyptodon.guacamole.net.SSLGuacamoleSocket;
import org.glyptodon.guacamole.protocol.ConfiguredGuacamoleSocket;
import org.glyptodon.guacamole.protocol.GuacamoleClientInformation;
import org.glyptodon.guacamole.protocol.GuacamoleConfiguration;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TunnelRequestService {
    private Logger logger = LoggerFactory.getLogger(TunnelRequestService.class);

    @Resource
    private ServerService serverService;

    public GuacamoleTunnel createTunnel(HashPageData request){
        HashPageData machineUser = serverService.getLoginInfo(request);
        if(machineUser==null) return null;
        //客户端信息(宽,高等信息)
        GuacamoleClientInformation clientInfo = getClientInformation(request);
        //配置连接信息
        GuacamoleConfiguration config = getConfig(machineUser);
        //获取代理服务器信息
        ProxyServerEntity proxyServer = ProxyServer.getProxy().getProxyServer();

        GuacamoleSocket socket = null;
        try {
            InetGuacamoleSocket inetGuacamoleSocket = new InetGuacamoleSocket(proxyServer.getHost(), proxyServer.getPort());
            socket = new ConfiguredGuacamoleSocket(inetGuacamoleSocket,config,clientInfo);
        }catch (Exception g){
            serverService.changeUsed(machineUser.get("mu_id"), Constant.MACHINE_USER_USE);
            logger.error(g.getMessage());
        }
        return socket==null?null:new DesignGuacamoleHTTPTunnel(socket,machineUser);
    }

    /**
     * 建立client基本信息
     * @param clientInfo 请求参数
     * @return 客户端信息
     */
    private GuacamoleClientInformation getClientInformation(HashPageData clientInfo){
        PageDataUtils utils = new PageDataUtils(clientInfo);
        // 创建client信息
        GuacamoleClientInformation info = new GuacamoleClientInformation();
        // 设置宽度
        Integer width = utils.getToInt(TunnelRequest.WIDTH_PARAMETER);
        if (width != null)
            info.setOptimalScreenWidth(width);
        // 设置高度
        Integer height = utils.getToInt(TunnelRequest.HEIGHT_PARAMETER);
        if (height != null)
            info.setOptimalScreenHeight(height);
        // 设置分辨率
        Integer dpi = utils.getToInt(TunnelRequest.DPI_PARAMETER);
        if (dpi != null)
            info.setOptimalResolution(dpi);
        // 声音媒体类型
        List<String> audioMimeTypes = utils.getToList(TunnelRequest.AUDIO_PARAMETER);
        if (audioMimeTypes != null)
            info.getAudioMimetypes().addAll(audioMimeTypes);
        // 视频
        List<String> videoMimeTypes = utils.getToList(TunnelRequest.VIDEO_PARAMETER);
        if (videoMimeTypes != null)
            info.getVideoMimetypes().addAll(videoMimeTypes);
        // 图片
        List<String> imageMimeTypes =utils.getToList(TunnelRequest.IMAGE_PARAMETER);
        if (imageMimeTypes != null)
            info.getImageMimetypes().addAll(imageMimeTypes);
        return info;
    }

    /**
     * 配置连接账号及虚拟机信息
     * @param userInfo 账号和虚拟机信息
     * @return 连接配置
     */
    private GuacamoleConfiguration getConfig(HashPageData userInfo){
        GuacamoleConfiguration config = new GuacamoleConfiguration();
        config.setProtocol(userInfo.getString("protocol").toLowerCase());
        config.setParameter("hostname", userInfo.getString("host"));
        config.setParameter("port", userInfo.getString("port"));
        config.setParameter("username", userInfo.getString("username"));
        config.setParameter("password", userInfo.getString("password"));
        config.setParameter("name", userInfo.getString("name"));
        config.setParameter("security", "tls");
        config.setParameter("ignore-cert","true"); // RDP协议忽略证书（win10）
        return config;
    }
}
