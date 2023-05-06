package com.claire.common;

import com.claire.bean.Student;
import com.claire.service.LoginService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * BaseController
 * </p>
 *
 * @author tjx
 * @date 2020/4/4 11:27
 */
@SuppressWarnings("unchecked")
public class BaseController {

    @Resource
    private LoginService loginService;

    /**
     * 获取登录用户信息
     *
     * @param request 请求对象
     * @return Student
     */
    protected Student getLoginStudent(HttpServletRequest request) {
        return loginService.getLoginStudent(loginService.getUserTokenHeader(request));
    }

    /**
     * 成功返回数据
     *
     * @return ApiResponse
     */
    protected ApiResponse success() {
        return ApiResponse.success();
    }

    /**
     * 成功返回数据
     *
     * @param data 待返回数据
     * @return ApiResponse
     */
    protected ApiResponse success(Object data) {
        return ApiResponse.success(data);
    }

    /**
     * 成功返回消息
     *
     * @param message 待返回成功消息
     * @return ApiResponse
     */
    protected ApiResponse success(String message) {
        return new ApiResponse(BaseApiCode.SUCCESS, message);
    }

    /**
     * 成功返回数据和消息
     *
     * @param message 待返回消息
     * @param data    带返回数据
     * @return ApiResponse
     */
    protected ApiResponse success(String message, Object data) {
        return new ApiResponse(BaseApiCode.SUCCESS, message, data);
    }

    /**
     * 失败返回
     *
     * @return ApiResponse
     */
    protected ApiResponse failed() {
        return ApiResponse.failed();
    }

    /**
     * 失败返回数据
     *
     * @param data 待返回数据
     * @return ApiResponse
     */
    protected ApiResponse failed(Object data) {
        return ApiResponse.failed(data);
    }

    /**
     * 失败返回消息
     *
     * @param message 待返回成功消息
     * @return ApiResponse
     */
    protected ApiResponse failed(String message) {
        return new ApiResponse(BaseApiCode.FAILED, message);
    }

    /**
     * 失败返回数据和消息
     *
     * @param message 待返回消息
     * @param data    带返回数据
     * @return ApiResponse
     */
    protected ApiResponse failed(String message, Object data) {
        return new ApiResponse(BaseApiCode.FAILED, message, data);
    }

    /**
     * 失败返回数据和消息
     *
     * @param apiCode 状态码
     * @param data    带返回数据
     * @return ApiResponse
     */
    protected ApiResponse failed(BaseApiCode apiCode, Object data) {
        return new ApiResponse(apiCode, apiCode.getCodeMsg(), data);
    }
}
