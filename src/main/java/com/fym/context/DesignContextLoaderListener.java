package com.fym.context;

import com.fym.utils.component.Constant;
import com.fym.utils.component.SpringBeanGetter;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.ServletContextEvent;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class DesignContextLoaderListener extends ContextLoaderListener implements HttpSessionListener,HttpSessionAttributeListener {


    private SessionManager sessionManager;

    public DesignContextLoaderListener() {
        super();
    }

    public DesignContextLoaderListener(WebApplicationContext context) {
        super(context);
    }

    @Override
    public void contextInitialized(ServletContextEvent event) {
        //spring初始化
        super.contextInitialized(event);
        ApplicationContext applicationContext = (ApplicationContext) event.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
        sessionManager = applicationContext.getBean(SessionManager.class);
        //初始化springBean获取器
        SpringBeanGetter.setContext(applicationContext);
        //初始化代理服务器
        ProxyServer.getProxy().init();
        //设置文件主机
        event.getServletContext().setAttribute(Constant.FILE_HOST_NAME,(Constant.FILE_HOST+":"+Constant.FILE_PORT));
    }

    @Override
    public void sessionCreated(HttpSessionEvent httpSessionEvent) {
        sessionManager.addNum(SessionManager.VISITOR);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent httpSessionEvent) {
        sessionManager.delNum(SessionManager.VISITOR);
    }

    @Override
    public void attributeAdded(HttpSessionBindingEvent httpSessionBindingEvent) {
        if(Constant.SESSION_USER.equals(httpSessionBindingEvent.getName())) {
            sessionManager.addNum(SessionManager.USER);
        }
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent httpSessionBindingEvent) {
        if(Constant.SESSION_USER.equals(httpSessionBindingEvent.getName())) {
            sessionManager.delNum(SessionManager.USER);
        }
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent httpSessionBindingEvent) {

    }
}
