package com.fym.interceptor;

import com.alibaba.fastjson.JSON;
import com.fym.utils.data.HashPageData;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 全局拦截器
 */
public class GlobalInterceptor extends HandlerInterceptorAdapter {

    private Logger logger= Logger.getLogger(this.getClass());
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        String method= request.getMethod();
        String contextPath=request.getContextPath();
        String path=request.getServletPath();
        if(!path.startsWith("/static")){
            HashPageData data = new HashPageData(request);
            logger.info(method+"---"+contextPath+path);
            logger.info("param:"+ JSON.toJSONString(data));
        }
        return super.preHandle(request, response, handler);
    }
}
