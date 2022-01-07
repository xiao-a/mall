package com.qfmall.controller;

import com.qfmall.fmmall.entity.User;
import com.qfmall.fmmall.service.UserService;
import com.qfmall.fmmall.vo.ResultVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@ResponseBody
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;

    /**
     * 登录功能
     * @param userName 用户名
     * @param password 密码
     * @return 结果
     */
    @RequestMapping(value = "/login",method = RequestMethod.GET)
    public ResultVo checkLogin(String userName,String password){
        return userService.checkLogin(userName,password);
    }

    /**
     * 注册功能
     * @param user 用户信息
     * @return 结果
     */
    @RequestMapping(value = "/register",method = RequestMethod.POST)
    public ResultVo register(User user){
        return new ResultVo(10000,"SUCCESS",null);
    }
}
