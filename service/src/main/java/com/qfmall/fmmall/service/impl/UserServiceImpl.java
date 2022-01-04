package com.qfmall.fmmall.service.impl;

import com.qfmall.fmmall.dao.UserDao;
import com.qfmall.fmmall.entity.User;
import com.qfmall.fmmall.service.UserService;
import com.qfmall.fmmall.vo.ResultVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;

    /**
     * 登录
     * @param userName 用户名
     * @param password 密码
     * @return 结果
     */
    @Override
    public ResultVo checkLogin(String userName, String password) {
        // 1.根据用户名查询用户信息
        User user = userDao.queryUserByName(userName);
        // 2.判断是否存在
        if (user == null) {
            return new ResultVo(10001,"用户信息不存在",null);
        }else {
            if (password.equals(user.getUserPassword())) {
                return new ResultVo(10000,"登录成功",user);
            }else {
                return new ResultVo(10002,"登录失败",null);
            }
        }
    }
}
