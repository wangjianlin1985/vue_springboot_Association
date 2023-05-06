package com.claire.handler;

import com.claire.common.ApiResponse;
import com.claire.common.BaseApiCode;
import com.claire.common.BaseApiCodeImpl;
import com.claire.exception.GeneralException;
import com.claire.exception.NeedLoginException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * <p>
 * GlobalExceptionHandler
 * </p>
 *
 * @author tjx
 * @date 2020/4/11 11:31
 */
@ControllerAdvice
public class GlobalExceptionHandler {

    private static final Logger logger = LoggerFactory.getLogger(GlobalExceptionHandler.class);

    @ResponseBody
    @ExceptionHandler(value = NeedLoginException.class)
    public ApiResponse needLoginExceptionHandler(HttpServletRequest request, HttpServletResponse response, Exception e) {
        if (e instanceof NeedLoginException) {
            logger.error("{} 需要登录,Error:", request.getRequestURI(), e);
            NeedLoginException exp = (NeedLoginException) e;
            return ApiResponse.failed(BaseApiCodeImpl.builder().code(exp.getCode()).build(), e.getMessage());
        }
        return ApiResponse.failed(BaseApiCode.NEED_LOGIN, "需要登录,请先登录");
    }

    @ResponseBody
    @ExceptionHandler(value = Exception.class)
    public ApiResponse globalExceptionHandler(HttpServletRequest request, HttpServletResponse response, Exception e) {
        logger.error("request uri:{} raise exception,Error:", request.getRequestURI(), e);
        if (e instanceof GeneralException) {
            GeneralException exp = (GeneralException) e;
            return ApiResponse.failed(BaseApiCodeImpl.builder().code(exp.getCode()).build(), e.getMessage());
        }
        return ApiResponse.failed("服务器开小差了，请稍后重试!");
    }

}
