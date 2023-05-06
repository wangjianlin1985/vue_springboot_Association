package com.claire.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.claire.bean.Apply;
import com.claire.bean.Team;
import com.claire.bean.TeamMember;
import com.claire.mapper.TeamMemberMapper;
import com.claire.util.DataUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class TeamMemberService extends ServiceImpl<TeamMemberMapper, TeamMember> {

    @Autowired
    private TeamService teamService;

    /**
     * 判断某名学生是否已经存在于某个社团中
     * @param teamId
     * @param studentId
     * @return
     */
    public boolean isInThisTeam(Integer studentId,Integer teamId){
        QueryWrapper<TeamMember> queryWrapper= new QueryWrapper<>();
        queryWrapper.eq("student_id",studentId);
        queryWrapper.eq("team_id",teamId);
        if(baseMapper.selectCount(queryWrapper)>0){
            return true;
        }
        return  false;
    }

    /**
     * 根据学生id 获取到该学生管理的社团id
     * @param studentId
     * @return
     */
    public Integer getTeamIdByStudentId(Integer studentId){
        QueryWrapper<TeamMember> queryWrapper= new QueryWrapper<>();
        queryWrapper.eq("student_id",studentId);
        queryWrapper.eq("is_manager",1);
        //TeamMember tm = baseMapper.selectOne(queryWrapper);
        List<Team>  teamList = teamService.getTeamByStudentId(studentId);
        return teamList.get(0).getId();
    }

    /**
     * 通过申请， 关联表插入一条新数据
     * @param apply
     * @return
     */
    public boolean insertMember(Apply apply){
        QueryWrapper<TeamMember> queryWrapper= new QueryWrapper<>();
        queryWrapper.eq("team_id",apply.getApplyToId());
        TeamMember teamMember=new TeamMember();
        teamMember.setStudentId(apply.getApplyFromId());
        teamMember.setIsManager(0);
        teamMember.setStudentName(apply.getApplyUsername());
        teamMember.setTeamId(apply.getApplyToId());
        //teamMember.setTeamName(baseMapper.selectOne(queryWrapper).getTeamName());
        teamMember.setTeamName(teamService.getTeam(apply.getApplyToId()).getTeamname());
        teamService.addPerson(apply.getApplyToId());//该社团成员数+1
        return baseMapper.insert(teamMember)==1;
    }

    /**
     * 管理页获取关联表
     * @param current
     * @param size
     * @param tm
     * @return
     */
    public IPage<TeamMember> getManageTeamMember(Long current,Long size,TeamMember tm){
        QueryWrapper queryWrapper=new QueryWrapper();
        queryWrapper.like(DataUtils.isNotEmptyStr(tm.getTeamName()),"team_name",tm.getTeamName());
        queryWrapper.like(DataUtils.isNotEmptyStr(tm.getStudentName()),"student_name",tm.getStudentName());
        return baseMapper.selectPage(new Page<>(current,size),queryWrapper);
    }

    /**
     * 删除关联
     * @param stuId 学生id
     * @param teamId  社团id
     * @return 布尔值
     */
    public boolean deleteRelate(Integer stuId,Integer teamId){
        QueryWrapper queryWrapper=new QueryWrapper();
        queryWrapper.eq("student_id",stuId);
        queryWrapper.eq("team_id",teamId);
        return baseMapper.delete(queryWrapper)==1;
    }

}
