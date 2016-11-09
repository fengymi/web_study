package com.fym.utils.component;

import org.springframework.context.ApplicationContext;

/**
 * 使servlet能获取spring对象
 */
public class SpringBeanGetter {
    private static ApplicationContext context;

    public static void setContext(ApplicationContext context){
        SpringBeanGetter.context = context;
    }

    public static  <T> T getBean(Class<T> var1){
        return context.getBean(var1);
    }
    public static Object getByName(String name){
        return context.getBean(name);
    }
}
