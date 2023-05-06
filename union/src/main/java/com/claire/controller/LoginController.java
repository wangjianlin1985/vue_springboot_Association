package com.claire.controller;

import com.claire.annotation.RequireLogin;
import com.claire.bean.Student;
import com.claire.common.ApiResponse;
import com.claire.common.BaseController;
import com.claire.exception.GeneralException;
import com.claire.service.LoginService;
import com.claire.util.IpUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * LoginController
 * </p>
 *
 * @author tjx
 * @date 2020/4/13 15:14
 */
@Slf4j
@RestController
public class LoginController extends BaseController {

    @Resource
    private LoginService loginService;


    /**
     * 登录
     */
    @RequestMapping(value = "/login", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public ApiResponse loginBySno(@RequestBody Student student, HttpServletRequest request) {
        try {
            return success(loginService.login(IpUtil.getIP(request), student, IpUtil.getUserAgent(request)));
        } catch (GeneralException e) {
            log.error("login failed,error:", e);
            return failed(e.getMessage());
        } catch (Exception e) {
            log.error("login failed,error:", e);
            return failed("登录失败，请稍后重试!");
        }
    }

    @RequestMapping("/getLoginUser")
    @RequireLogin
    public ApiResponse getLoginUserInfo(HttpServletRequest request){
        return success(getLoginStudent(request));
    }


    /**
     * 退出登录
     */
    @RequestMapping(value = "/logout")
    public ApiResponse logout(HttpServletRequest request) {
        loginService.logout(request);
        return success("退出登录");
    }

    /**
     * 忘记密码的时候发送验证码
     * @param to_email
     */
    @RequestMapping(value = "/sendEmail")
    public ApiResponse sendEmail(@RequestParam String to_email){
        return success(loginService.sendVerifyCode(to_email));
    }

}
