package com.claire.bean;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@TableName("student")
@Data
public class Student implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(type = IdType.AUTO)
    private Integer id;
    @TableField("s_no")
    private String sno;
    private String username;
    private String password;
    private Integer avatar;
    private String introduce;
    /**
     * 0-不是 1-是 2-系统管理
     */
    private Integer isManager;
    private String phone;
    private String email;
    /**
     * 0男 1女
     */
    private Boolean sex;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField("create_time")
    private LocalDateTime createTime;
}
