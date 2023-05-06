package com.claire.bean;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@TableName("team")
@Data
public class Team implements Serializable {
    @TableId(type = IdType.AUTO)
    private Integer id;//社团id
    private String teamname;//社团名称
    private String theme;//社团宗旨
    private String description;//社团描述
    private Integer persons;//社团人数
    private Integer teamManagerId;//社团社长id
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createTime;//社团创建时间
    private Integer type;//类别（1思想理论  2文艺体育  3就业创业  4公益服务 5学术科研  6网络信息）
    private Integer level;//等级
    private String themeImg;//图片
    private String contact;//社团联系方式：qq群或者wechat

}
