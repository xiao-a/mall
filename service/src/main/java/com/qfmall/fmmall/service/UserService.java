package com.qfmall.fmmall.service;

import com.qfmall.fmmall.entity.User;
import com.qfmall.fmmall.vo.ResultVo;

public interface UserService {
    /**
     * 登录
     * @param userName 用户名
     * @param password 密码
     * @return 结果
     */
    public ResultVo checkLogin(String userName, String password);
}
