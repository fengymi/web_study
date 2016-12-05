package com.fym.task;

import com.fym.service.user.UserCountService;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;

@Component
public class UserNumTask {
    @Resource
    private UserCountService userCountService;

    public void setUserCount(){
        userCountService.setCount();
    }
}
