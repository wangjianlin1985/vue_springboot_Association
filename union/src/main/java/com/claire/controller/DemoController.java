package com.claire.controller;

import com.claire.annotation.RequireLogin;
import com.claire.bean.Student;
import com.claire.common.ApiResponse;
import com.claire.common.BaseController;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * DemoController
 * </p>
 *
 * @author tjx
 * @date 2020/4/11 11:27
 */
@RestController
@RequestMapping(value = "/api/demo")
public class DemoController extends BaseController {

    /**
     * 登录拦截demo
     *
     * @return
     */
    @GetMapping("/test")
    @RequireLogin
    public ApiResponse testLogin(HttpServletRequest request) {
        // 获取登录用户信息demo
        return success(getLoginStudent(request));
    }

    @PostMapping("/apply-team")
    public ApiResponse applyTeam(String teamId,HttpServletRequest request){
        //当前登录用户信息
        Student student = getLoginStudent(request);

        //todo
        return success();


    }


}
