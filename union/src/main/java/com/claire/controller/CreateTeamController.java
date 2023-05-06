package com.claire.controller;

import com.claire.bean.CreateTeam;
import com.claire.bean.Student;
import com.claire.common.ApiResponse;
import com.claire.common.BaseController;
import com.claire.service.CreateTeamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/createTeam")
public class CreateTeamController extends BaseController {

    @Autowired
    private CreateTeamService createTeamService;

    /**
     * 发起一个创建  新社团的  请求
     * @param createTeam
     * @param request
     * @return
     */
    @RequestMapping(value = "/createTeamApply",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    public ApiResponse createNewTeamApply(@RequestBody CreateTeam createTeam, HttpServletRequest request){
        Student student=getLoginStudent(request);//获取当前用户
        createTeam.setApplyFromId(student.getId());//获取当前用户id
        return success(createTeamService.createNewTeamApply(createTeam));
    }

    /**
     * 管理页获取所有请求
     * @param current
     * @param size
     * @param createTeam
     * @return
     */
    @RequestMapping(value = "/getAllCreateApply",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    public ApiResponse getAllCreateApply(Long current,Long size,@RequestBody CreateTeam createTeam){
        return success(createTeamService.getCreateApply(current,size,createTeam));
    }

    /**
     * 通过创建社团的申请
     * @param applyId  申请id
     * @return
     */
    @RequestMapping("/passCreateTeamApply")
    public ApiResponse passCreateTeamApply(@RequestParam Integer applyId){
        return success(createTeamService.passCreateTeamApply(applyId));
    }

    /**
     * 拒绝创建社团的申请
     * @param applyId  申请id
     * @return
     */
    @RequestMapping("/refuseCreateTeamApply")
    public ApiResponse refuseCreateTeamApply(@RequestParam Integer applyId){
        return success(createTeamService.refuseCreateTeamApply(applyId));
    }

    /**
     * 删除创建社团的申请
     * @param applyId  申请id
     * @return
     */
    @RequestMapping("/deleteCreateTeamApply")
    public ApiResponse deleteCreateTeamApply(@RequestParam Integer applyId){
        return success(createTeamService.deleteCreateTeamApply(applyId));
    }

}
