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
 * 活动表
 */
@TableName("activity")
@Data
public class Activity implements Serializable {

    @TableId(type = IdType.AUTO)
    private Integer id;//活动id
    private Integer teamId;//举办活动的社团id
    private String teamname;//社团名称
    private String activityName;//活动名称
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @TableField("create_time")
    private LocalDateTime createTime;
    private String address;//活动地点
    private int money;//经费
    private String summary;//活动简介
    private String description;//活动详情
    private String photos;//活动图片

}
