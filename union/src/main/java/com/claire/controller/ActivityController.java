package com.claire.controller;

import com.claire.bean.Activity;
import com.claire.common.ApiResponse;
import com.claire.common.BaseController;
import com.claire.service.ActivityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 活动管理
 *
 * @author tjx
 */
@RestController
@RequestMapping("/activity")
public class ActivityController extends BaseController {

    @Autowired
    private ActivityService activityService;

    /**
     * 获取活动列表  可选条件：社团id
     * @param current
     * @param size
     * @param teamId
     * @return
     */
    @RequestMapping(value="/getActivity",method = RequestMethod.GET)
    public ApiResponse getActivity(@RequestParam Long current,@RequestParam Long size,@RequestParam Integer teamId){
        return success(activityService.getAllActivity(current, size, teamId));
    }

    /**
     * 根据id获取活动
     * @param activityId
     * @return
     */
    @RequestMapping(value="/getActivityById",method = RequestMethod.GET)
    public ApiResponse getActivityById(@RequestParam Integer activityId){
        return success(activityService.getActivityById(activityId));
    }

    /**
     * 管理页根据查询条件返回活动
     * @param current
     * @param size
     * @param activity
     * @return
     */
    @RequestMapping(value = "/getManageActivity",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    public ApiResponse getManageActivity(Long current, Long size,@RequestBody Activity activity){
        return success(activityService.getManageActivity(current,size,activity));
    }

    /**
     * 根据id删除活动
     * @param actId
     * @return
     */
    @RequestMapping("/deleteActivity")
    public ApiResponse deleteAct(@RequestParam Integer actId){
        return success(activityService.deleteActivity(actId));
    }

    /**
     * 新增一条活动记录
     * @param ac
     * @return
     */
    @RequestMapping(value = "/addNewAc",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    public ApiResponse addNewActivity(@RequestBody Activity ac){
        return success(activityService.addNewActivity(ac));
    }
}
