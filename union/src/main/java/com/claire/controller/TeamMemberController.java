package com.claire.controller;

import com.claire.bean.Student;
import com.claire.bean.TeamMember;
import com.claire.common.ApiResponse;
import com.claire.common.BaseController;
import com.claire.service.TeamMemberService;
import org.omg.PortableInterceptor.INACTIVE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * 社团成员管理
 * @author tjx
 */
@RestController
@RequestMapping("/teamMember")
public class TeamMemberController extends BaseController {

    @Autowired
    private TeamMemberService teamMemberService;

    /**
     * 判断某个同学是否在这个社团
     * @param teamMember
     * @param request
     * @return
     */
    @RequestMapping(value = "/isInTeam",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    public ApiResponse isInTeam(@RequestBody TeamMember teamMember, HttpServletRequest request){
        Student student=getLoginStudent(request);//获取当前用户
        return success(teamMemberService.isInThisTeam(student.getId(),teamMember.getTeamId()));
    }

    /**
     * 管理页获取关联表数据
     * @param current 当前页
     * @param size 条数
     * @param teamMember 检索条件
     * @return
     */
    @RequestMapping(value = "/getManageTM",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    public ApiResponse getManageTM(Long current,Long size,@RequestBody TeamMember teamMember){
        return success(teamMemberService.getManageTeamMember(current,size,teamMember));
    }

    /**
     * 删除关联
     * @param s_id 学生id
     * @param t_id  社团id
     * @return 是否删除成功
     */
    @RequestMapping("/deleteRelate")
    public ApiResponse deleteRelate(@RequestParam Integer s_id, @RequestParam Integer t_id){
        return success(teamMemberService.deleteRelate(s_id,t_id));
    }

}
