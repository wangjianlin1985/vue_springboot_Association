package com.claire.bean;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.claire.handler.LongJsonDeserializer;
import com.claire.handler.LongJsonSerializer;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * <p>
 *
 * </p>
 *
 * @author tjx
 * @since 2020-04-13
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("student_login_log")
public class StudentLoginLog implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * ID
     */
    @JsonSerialize(using = LongJsonSerializer.class)
    @JsonDeserialize(using = LongJsonDeserializer.class)
    @TableField("id")
    private Long id;

    /**
     * 学生ID
     */
    @JsonSerialize(using = LongJsonSerializer.class)
    @JsonDeserialize(using = LongJsonDeserializer.class)
    @TableField("student_id")
    private Long studentId;

    /**
     * 登录TOKEN
     */
    @TableField("user_token")
    private String userToken;

    /**
     * 登录时间
     */
    @TableField("create_time")
    private LocalDateTime createTime;

    /**
     * 操作类型：1-登录，-1-登出
     */
    @TableField("oper_type")
    private Integer opType;

    /**
     * 登录IP
     */
    @TableField("ip")
    private String ip;

    /**
     * 登录UserAgentInfo
     */
    @TableField("user_agent")
    private String userAgent;

    /**
     * 操作系统信息
     */
    @TableField("os_version")
    private String osVersion;

    /**
     * 浏览器信息
     */
    @TableField("browser_version")
    private String browserVersion;


}
