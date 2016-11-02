package com.fym.dao.user;

import com.fym.entity.User;

public interface UserDao {

    User findUserByUsername(String username);
}
