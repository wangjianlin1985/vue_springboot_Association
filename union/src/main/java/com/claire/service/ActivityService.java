package com.claire.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.claire.bean.Activity;
import com.claire.mapper.ActivityMapper;
import com.claire.util.DataUtils;
import org.springframework.stereotype.Service;

@Service
public class ActivityService  extends ServiceImpl<ActivityMapper, Activity> {


    /**
     * 获取活动 列表
     * @param current
     * @param size
     * @param teamId
     * @return
     */
    public IPage<Activity> getAllActivity(Long current,Long size,Integer teamId){
        QueryWrapper<Activity> queryWrapper= new QueryWrapper<>();
        if(teamId>0){
            queryWrapper.eq("team_id",teamId);
        }
        queryWrapper.orderByDesc("create_time");//按时间排序
        return baseMapper.selectPage(new Page<>(current,size),queryWrapper);
    }

    /**
     * 根据活动id  获取活动详情
     * @param activityId
     * @return
     */
    public Activity getActivityById(Integer activityId){
        return baseMapper.selectById(activityId);
    }

    /**
     * 按条件查询 返回活动列列表
     * @param current
     * @param size
     * @param act
     * @return
     */
    public IPage<Activity> getManageActivity(Long current,Long size,Activity act){
        QueryWrapper<Activity> queryWrapper=new QueryWrapper<>();
        queryWrapper.like(DataUtils.isNotEmptyStr(act.getTeamname()),"teamname",act.getTeamname());
        queryWrapper.like(DataUtils.isNotEmptyStr(act.getActivityName()),"activity_name",act.getActivityName());
        queryWrapper.orderByDesc("create_time");//按时间排序
        return baseMapper.selectPage(new Page<>(current,size),queryWrapper);
    }

    /**
     * 根据id删除id
     * @param actId
     * @return
     */
    public boolean deleteActivity(Integer actId){
        return baseMapper.deleteById(actId)==1;
    }

    /**
     * 新增一条活动
     * @param ac
     * @return
     */
    public boolean addNewActivity(Activity ac){
        return baseMapper.insert(ac)==1;
    }

}
