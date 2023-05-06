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
 * 创建社团申请表
 */
@TableName("create_team")
@Data
public class CreateTeam implements Serializable {

    @TableId(type = IdType.AUTO)
    private Integer id;//申请表id
    @TableField("apply_from_id")
    private Integer applyFromId;//申请人id
    @TableField("apply_to_name")
    private String applyToName;//申请创建的社团名称
    private Integer teamType;//社团类别
    private String reason;//创建理由
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField("create_time")
    private LocalDateTime createTime;
    private String contactWay;//联系方式
    private Integer isPass;//是否通过该请求  0未处理 1拒绝 2通过
}
