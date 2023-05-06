package com.claire.aspect;

import com.claire.annotation.RequireLogin;
import com.claire.bean.Student;
import com.claire.exception.GeneralException;
import com.claire.exception.NeedLoginException;
import com.claire.service.LoginService;
import com.claire.util.DataUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;

/**
 * <p>
 * RequireLoginAspect
 * </p>
 *
 * @author tjx
 */
@Component
@Aspect
public class RequireLoginAspect {

    private static final Logger logger = LoggerFactory.getLogger(RequireLoginAspect.class);

    @Resource
    private LoginService loginService;

    @Pointcut("@annotation(com.claire.annotation.RequireLogin)")
    public void annotationPointCut() {
    }

    @Around("annotationPointCut()")
    public Object doAround(ProceedingJoinPoint joinPoint) throws Throwable {
        ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
        if (DataUtils.isNull(requestAttributes)) {
            logger.error("requestAttributes is null");
            throw new GeneralException("服务器开小差了，请稍后重试");
        }
        HttpServletRequest request = requestAttributes.getRequest();
        String methodName = joinPoint.getSignature().getName();
        Class<?> classTarget = joinPoint.getTarget().getClass();
        Class<?>[] par = ((MethodSignature) joinPoint.getSignature()).getParameterTypes();
        Method objMethod = classTarget.getMethod(methodName, par);
        RequireLogin requireLogin = objMethod.getAnnotation(RequireLogin.class);
        String token = loginService.getUserTokenHeader(request);
        if (DataUtils.isNotNull(requireLogin) && requireLogin.required()) {
            Student student = loginService.getLoginStudent(token);
            if (DataUtils.isNull(student)) {
                logger.error("need login for ip:{}", request.getRemoteHost());
                throw new NeedLoginException("需要登录，请先登录");
            }
        }
        if(DataUtils.isNotEmptyStr(token)){
            loginService.refreshLoginUserExpire(token);
        }
        return joinPoint.proceed();
    }

}
