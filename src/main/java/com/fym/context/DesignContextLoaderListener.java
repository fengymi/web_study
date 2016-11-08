package com.fym.context;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.WebApplicationContext;

import javax.servlet.ServletContextEvent;

public class DesignContextLoaderListener extends ContextLoaderListener {
    public DesignContextLoaderListener() {
        super();
    }

    public DesignContextLoaderListener(WebApplicationContext context) {
        super(context);
    }

    @Override
    public void contextInitialized(ServletContextEvent event) {
        System.out.println("开始初始化");
        super.contextInitialized(event);
        System.out.println("初始化结束");
        ApplicationContext applicationContext = (ApplicationContext) event.getServletContext().getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
        System.out.println(applicationContext.getApplicationName());
    }

    @Override
    public void contextDestroyed(ServletContextEvent event) {
        super.contextDestroyed(event);
    }
}
