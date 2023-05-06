package com.claire.service;

import cn.hutool.http.useragent.UserAgent;
import cn.hutool.http.useragent.UserAgentUtil;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.claire.bean.Student;
import com.claire.bean.StudentLoginLog;
import com.claire.constant.LoginOpTypeEnum;
import com.claire.mapper.StudentLoginLogMapper;
import com.claire.util.DateUtils;
import com.claire.vo.StudentLoginVo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author tjx
 * @since 2020-04-13
 */
@Service
public class StudentLoginLogService extends ServiceImpl<StudentLoginLogMapper, StudentLoginLog> {

    /**
     * 添加登入记录
     */
    @Transactional(rollbackFor = Exception.class)
    public StudentLoginLog addLoginLog(String ip, StudentLoginVo studentLoginVo, String userAgent) {
        StudentLoginLog studentLoginLog = createNew();
        studentLoginLog.setIp(ip);
        studentLoginLog.setStudentId(Long.valueOf(studentLoginVo.getStudent().getId()));
        studentLoginLog.setUserAgent(userAgent);
        studentLoginLog.setOpType(LoginOpTypeEnum.LOGIN.getOpType());
        UserAgent userAgentInfo = UserAgentUtil.parse(userAgent);
        studentLoginLog.setOsVersion(userAgentInfo.getOs().getName());
        studentLoginLog.setBrowserVersion(userAgentInfo.getBrowser().getName());
        studentLoginLog.setUserToken(studentLoginVo.getUserToken());
        baseMapper.insert(studentLoginLog);
        return studentLoginLog;
    }

    /**
     * 添加登出记录
     */
    public StudentLoginLog addLoginOutLog(String ip, StudentLoginVo studentLoginVo, String userAgent) {
        StudentLoginLog studentLoginLog = createNew();
        studentLoginLog.setIp(ip);
        studentLoginLog.setStudentId(Long.valueOf(studentLoginVo.getStudent().getId()));
        studentLoginLog.setUserAgent(userAgent);
        studentLoginLog.setOpType(LoginOpTypeEnum.LOGOUT.getOpType());
        UserAgent userAgentInfo = UserAgentUtil.parse(userAgent);
        studentLoginLog.setOsVersion(userAgentInfo.getOs().getName());
        studentLoginLog.setBrowserVersion(userAgentInfo.getBrowser().getName());
        baseMapper.insert(studentLoginLog);
        return studentLoginLog;
    }

    private StudentLoginLog createNew() {
        StudentLoginLog studentLoginLog = new StudentLoginLog();
        studentLoginLog.setId(IdWorker.getId());
        studentLoginLog.setCreateTime(DateUtils.now());
        return studentLoginLog;
    }

}
