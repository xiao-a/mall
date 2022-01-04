package com.qfmall.controller;

import com.qfmall.fmmall.service.UserService;
import com.qfmall.fmmall.vo.ResultVo;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;

@Controller
@ResponseBody
@RequestMapping("/user")
public class UserController {
    @Resource
    private UserService userService;

    @RequestMapping("/login")
    public ResultVo checkLogin(String userName,String password){
        return userService.checkLogin(userName,password);
    }
}
