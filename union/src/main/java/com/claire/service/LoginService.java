package com.claire.service;

import com.alibaba.fastjson.JSON;
import com.claire.bean.Student;
import com.claire.bean.StudentLoginLog;
import com.claire.common.ClaireConstant;
import com.claire.dto.SmsSendDto;
import com.claire.exception.GeneralException;
import com.claire.exception.NeedLoginException;
import com.claire.util.*;
import com.claire.vo.StudentLoginVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * LoginService
 * </p>
 *
 * @author tjx
 * @date 2020/4/11 11:05
 */
@Service
public class LoginService {

    @Resource
    private RedisService redisService;
    @Resource
    StudentLoginLogService studentLoginLogService;
    @Resource
    private StudentService studentService;
    @Autowired
    SmsService smsService;

    /**
     * 退出登录
     */
    public void logout(HttpServletRequest request) {
        String userToken = getUserTokenHeader(request);
        String cacheKey = UserTokenUtils.generateUserTokenCacheKey(userToken);
        if (redisService.hasKey(cacheKey)) {
            StudentLoginVo studentLoginVo = getLoginStudentLoginVo(userToken);
            redisService.delete(cacheKey);
            studentLoginLogService.addLoginOutLog(IpUtil.getIP(request), studentLoginVo, IpUtil.getUserAgent(request));
        }
    }

    /**
     * 登录
     *
     * @param loginStu 登录学生信息
     * @return Student
     */
    public StudentLoginVo login(String ip, Student loginStu, String userAgent) {

        if (DataUtils.isEmptyStr(loginStu.getSno())) {
            throw new GeneralException("学号或密码错误，请确认!");
        }
        Student stu = studentService.getStudentBySno(loginStu.getSno());
        if (DataUtils.isNull(stu)) {
            throw new GeneralException("学号或密码错误，请确认!");
        }
        if (PasswordUtil.isNotEqual(loginStu.getPassword(),stu.getPassword())) {
            throw new GeneralException("学号或密码错误，请确认!");
        } else {
            String userToken = UserTokenUtils.generateUserToken();
            StudentLoginVo studentLoginVo = StudentLoginVo.factory(stu, userToken);
            cacheLoginUser(userToken, studentLoginVo);
            studentLoginLogService.addLoginLog(ip, studentLoginVo, userAgent);
            return studentLoginVo;
        }
    }

    /**
     * 缓存登录用户信息到REDIS
     *
     * @param userToken      登录用户userToken
     * @param studentLoginVo 登录用户信息
     */
    private void cacheLoginUser(String userToken, StudentLoginVo studentLoginVo) {
        redisService.set(UserTokenUtils.generateUserTokenCacheKey(userToken), JSON.toJSONString(studentLoginVo),
                ClaireConstant.USER_TOKEN_EXPIRE_TIMEOUT);
    }

    /**
     * 登录用户缓存KEY续时间
     *
     * @param userToken 登录用户userToken
     */
    public void refreshLoginUserExpire(String userToken) {
        String cacheKey = UserTokenUtils.generateUserTokenCacheKey(userToken);
        if (redisService.hasKey(cacheKey)) {
            redisService.expire(cacheKey, ClaireConstant.USER_TOKEN_EXPIRE_TIMEOUT);
        }
    }

    /**
     * 获取登录学生信息
     *
     * @param userToken 登录用户TOKEN
     * @return 登录用户信息
     */
    public StudentLoginVo getLoginStudentLoginVo(String userToken) {
        String cacheStr = redisService.get(UserTokenUtils.generateUserTokenCacheKey(userToken));
        if (DataUtils.isEmptyStr(cacheStr)) {
            throw new NeedLoginException("需要登录，请先登录!");
        }
        try {
            StudentLoginVo studentLoginVo = JSON.parseObject(cacheStr, StudentLoginVo.class);
            return studentLoginVo;
        } catch (Exception e) {
            throw new NeedLoginException("需要登录，请先登录!");
        }
    }

    /**
     * 获取登录学生信息
     *
     * @param userToken 登录用户TOKEN
     * @return 登录用户信息
     */
    public Student getLoginStudent(String userToken) {
        try {
            return getLoginStudentLoginVo(userToken).getStudent();
        } catch (Exception e) {
            throw new NeedLoginException("需要登录，请先登录!");
        }
    }

    /**
     * 从请求中获取USER_TOKEN
     *
     * @param request 请求对象
     * @return String
     */
    public String getUserTokenHeader(HttpServletRequest request) {
        String userToken = request.getParameter(ClaireConstant.USER_TOKEN_HEADER_KEY);
        if (DataUtils.isEmptyStr(userToken)) {
            userToken = request.getHeader(ClaireConstant.USER_TOKEN_HEADER_KEY);
        }
        return userToken;
    }


    /**
     * 忘记密码的时候 ： 发送验证码
     * @param to_email
     * @return
     */
    public String sendVerifyCode(String to_email){
        String emailServiceCode = VerifyCodeUtil.generateVerifyCode();//生成一个随机验证码
        SmsSendDto message = new SmsSendDto();
        message.setSubject("修改密码验证码：");
        message.setTextContent("验证码是:"+emailServiceCode);
        message.setToUser(to_email);
        smsService.sendSimpleTextMail(message);
        return emailServiceCode;
    }


}
