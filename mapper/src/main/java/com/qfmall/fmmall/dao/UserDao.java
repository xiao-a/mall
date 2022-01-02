package com.qfmall.fmmall.dao;

import com.qfmall.fmmall.entity.User;

public interface UserDao {
    public User queryUserByName(String name);
}
