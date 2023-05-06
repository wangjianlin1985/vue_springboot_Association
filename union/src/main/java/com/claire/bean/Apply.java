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
 * 申请入团
 */
@TableName("apply")
@Data
public class Apply implements Serializable {

    @TableId(type = IdType.AUTO)
    private Integer id;//申请表id
    @TableField("apply_from_id")
    private Integer applyFromId;//申请人id
    @TableField("apply_username")
    private String applyUsername;//申请人姓名
    @TableField("apply_to_id")
    private Integer applyToId;//申请的社团id
    private String reason;//申请理由
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField("create_time")
    private LocalDateTime createTime;//申请时间
    private String contactWay;//联系方式
    private Integer isPass;//是否通过  0：待处理 1：拒绝  2：通过
}
