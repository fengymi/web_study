package com.fym.context;

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
        SpringBeanGetter.setContext(applicationContext);
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
        sessionManager.addNum(SessionManager.USER);
    }

    @Override
    public void attributeRemoved(HttpSessionBindingEvent httpSessionBindingEvent) {
        sessionManager.delNum(SessionManager.USER);
    }

    @Override
    public void attributeReplaced(HttpSessionBindingEvent httpSessionBindingEvent) {

    }
}
