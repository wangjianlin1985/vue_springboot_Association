package com.claire.bean;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 回复表
 */
@TableName("reply")
@Data
public class Reply implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer id;//回复id
    private Integer studentId;//发表回复的学生id
    private String studentName;//发表回复的学生姓名
    private Integer avatar;//用户头像
    private Integer isManager;//是否是管理员
    private String content;//回复的内容
    private Integer toWhich;//针对的评论id
    private Integer supportCount;//获得的赞的数量

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField("create_time")
    private LocalDateTime createTime;//发表时间
}
