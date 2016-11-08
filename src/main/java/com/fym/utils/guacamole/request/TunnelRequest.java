package com.fym.utils.guacamole.request;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

public abstract class TunnelRequest {
    Logger logger = LoggerFactory.getLogger(TunnelRequest.class);

    public static final String WIDTH_PARAMETER = "GUAC_WIDTH";
    public static final String HEIGHT_PARAMETER = "GUAC_HEIGHT";
    public static final String DPI_PARAMETER = "GUAC_DPI";
    public static final String AUDIO_PARAMETER = "GUAC_AUDIO";
    public static final String VIDEO_PARAMETER = "GUAC_VIDEO";
    public static final String IMAGE_PARAMETER = "GUAC_IMAGE";

    public abstract String getParameter(String name);
    public abstract List<String> getParameterValues(String name);


    public Integer getIntegerParameter(String name){
        String resultStr = getParameter(name);
        if (resultStr==null) return null;
        Integer result;
        try {
            result = Integer.parseInt(resultStr);
        }catch (NumberFormatException e){
            logger.error("获取参数类型不正确:"+name+" 不能转化为数字类型");
            return null;
        }
        return result;
    }

    public Integer getWidth(){
        return getIntegerParameter(WIDTH_PARAMETER);
    }

    public Integer getHeight(){
        return getIntegerParameter(HEIGHT_PARAMETER);
    }

    public Integer getDPI(){
        return getIntegerParameter(DPI_PARAMETER);
    }

    public List<String> getAudioMimeTypes(){
        return getParameterValues(AUDIO_PARAMETER);
    }

    public List<String> getVideoMimeTypes(){
        return getParameterValues(VIDEO_PARAMETER);
    }

    public List<String> getImageMimeTypes(){
        return getParameterValues(IMAGE_PARAMETER);
    }
}
