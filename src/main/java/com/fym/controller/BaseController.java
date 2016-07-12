package com.fym.controller;

import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 基本的controller，所有的controller应该从该类继承
 */
public class BaseController {

    /**
     * 获取当前请求的request
     * @return request
     */
    protected HttpServletRequest getRequest(){
        return ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
    }

    /**
     * 获取session
     * @return session
     */
    protected HttpSession getSession(){
        return getRequest().getSession();
    }

    /**
     * 获取根目录
     * @return 根目录
     */
    protected String getBasePath(){
        HttpServletRequest request = getRequest();
        return request.getScheme()+"://"+ request.getServerName()+":"+ request.getServerPort()+request.getContextPath();
    }
}
