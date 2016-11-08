package com.fym.service.guacamole;

import com.fym.utils.guacamole.request.TunnelRequest;
import org.glyptodon.guacamole.net.GuacamoleTunnel;
import org.glyptodon.guacamole.protocol.GuacamoleClientInformation;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TunnelRequestService {

    public GuacamoleTunnel createTunnel(TunnelRequest request){
        GuacamoleClientInformation info = getClientInformation(request);
        return null;
    }

    /**
     * 建立client基本信息
     * @param request 请求参数
     * @return 客户端信息
     */
    private GuacamoleClientInformation getClientInformation(TunnelRequest request){
        // 创建client信息
        GuacamoleClientInformation info = new GuacamoleClientInformation();
        // 设置宽度
        Integer width = request.getWidth();
        if (width != null)
            info.setOptimalScreenWidth(width);
        // 设置高度
        Integer height = request.getHeight();
        if (height != null)
            info.setOptimalScreenHeight(height);
        // 设置分辨率
        Integer dpi = request.getDPI();
        if (dpi != null)
            info.setOptimalResolution(dpi);
        // 声音媒体类型
        List<String> audioMimeTypes = request.getAudioMimeTypes();
        if (audioMimeTypes != null)
            info.getAudioMimetypes().addAll(audioMimeTypes);
        // 视频
        List<String> videoMimeTypes = request.getVideoMimeTypes();
        if (videoMimeTypes != null)
            info.getVideoMimetypes().addAll(videoMimeTypes);
        // 图片
        List<String> imageMimeTypes = request.getImageMimeTypes();
        if (imageMimeTypes != null)
            info.getImageMimetypes().addAll(imageMimeTypes);
        return info;
    }
}
