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
 * 评论表
 */
@TableName("comments")
@Data
public class Comments implements Serializable {

    @TableId(type = IdType.AUTO)
    private Integer id;//留言id

    private Integer teamId;//社团id
    private Integer studentId;//留言的学生id
    private String studentName;//留言的学生姓名
    private Integer avatar;//用户头像
    private Integer isManager;//是否是管理员
    private String content;//评论的内容
    private Integer supportCount;//获得的赞的数量
    private Integer replyCount;//获得的回复的数量

    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField("create_time")
    private LocalDateTime createTime;//留言时间

}
