package com.fym.service.user;


import com.fym.dao.system.SystemUserDao;
import com.fym.entity.User;
import com.fym.utils.data.HashPageData;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserService {

    @Resource
    private SystemUserDao systemUserDao;

    public User getUser(){
        return null;
    }

    public User findUserByUsername(String username){
        return systemUserDao.getByUsername(username);
    }
    public int registerUser(HashPageData user){
        return systemUserDao.registerUser(user);
    }
}
