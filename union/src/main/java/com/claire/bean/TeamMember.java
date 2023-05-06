package com.claire.bean;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@TableName("team_member")
@Data
public class TeamMember implements Serializable {
    @TableField("student_id")
    private Integer studentId;//学生id
    @TableField("is_manager")
    private Integer isManager;//是否是管理员  0不是  1是
    private String studentName;//学生姓名
    @TableField("team_id")
    private Integer teamId;//社团id
    private String teamName;//社团名称
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField("create_time")
    private LocalDateTime createTime;
}
