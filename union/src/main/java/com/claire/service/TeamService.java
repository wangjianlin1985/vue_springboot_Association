package com.claire.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.claire.bean.CreateTeam;
import com.claire.bean.Team;
import com.claire.mapper.TeamMapper;
import com.claire.util.DataUtils;
import com.claire.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

/**
 * <p>
 * TeamService
 * </p>
 *
 * @author tjx
 * @date 2020/4/7 16:19
 */
@Service
public class TeamService extends ServiceImpl<TeamMapper, Team> {



    /**
     * 分页查询社团
     * @param current  分页参数
     * @param size     分页参数
     * @param name     社团名称（模糊查询）
     */
    public IPage<Team> getTeams(Long current,Long size,String name){
        QueryWrapper<Team> queryWrapper= new QueryWrapper<>();
        queryWrapper.like("teamname",name);
        queryWrapper.orderByDesc("persons");//按照人数排序
        return baseMapper.selectPage(new Page<Team>(current,size),queryWrapper);
    }

    /**
     * 根据社团Id获取社团
     * @param id
     * @return Team
     */
    public Team getTeam(Integer id){
        return baseMapper.selectById(id);
    }


    /**
     * 根据学生Id获取社团
     * @param id
     * @return Team
     */
    public List<Team> getTeamByStudentId(Integer studentId){
        QueryWrapper<Team> queryWrapper= new QueryWrapper<>();
        queryWrapper.eq("team_manager_id",studentId);
        return baseMapper.selectList(queryWrapper);
    }



    /**
     * 根据社团类型查找社团
     * @param types
     * @return
     */
    public IPage<Team> getTeamsByType(String types){

        QueryWrapper<Team> queryWrapper= new QueryWrapper<>();
        for (int i=0;i<types.length();i++){
            queryWrapper.or().eq("type",Integer.parseInt(types.substring(i,i+1)));
        }
        queryWrapper.orderByDesc("persons");//按照人数排序
        return baseMapper.selectPage(new Page<Team>(1,9),queryWrapper);
    }

    /**
     * 通过teamid 找到team 并使成员数+1
     * @param teamId
     */
    public void addPerson(Integer teamId){
        Team team=baseMapper.selectById(teamId);
        Integer persons=team.getPersons();
        persons++;
        team.setPersons(persons);
        baseMapper.updateById(team);
    }

    /**
     * 按照条件返回分页数据
     * @param current
     * @param size
     * @param team
     * @return
     */
    public IPage<Team> getAllTeam(Long current,Long size,Team team){
        QueryWrapper<Team> queryWrapper=new QueryWrapper<>();
        queryWrapper.like(DataUtils.isNotEmptyStr(team.getTeamname()),"teamname",team.getTeamname());//按社团名称查询
        queryWrapper.eq(team.getType()>0,"type",team.getType());//按照社团类型查找
        queryWrapper.eq(team.getLevel()>0,"level",team.getLevel());//按照等级查找
        queryWrapper.orderByDesc("persons");//按照人数排序
        return baseMapper.selectPage(new Page<Team>(current,size),queryWrapper);
    }

    /**
     * 创建一个新的社团
     * @param createTeam 创建社团申请
     * @return
     */
    public boolean createNewTeam(CreateTeam createTeam){
        Team team = new Team();
        team.setTeamname(createTeam.getApplyToName());//社团名称
        team.setPersons(1);
        team.setTeamManagerId(createTeam.getApplyFromId());//管理员id
        team.setType(createTeam.getTeamType());//社团类别
        team.setContact(createTeam.getContactWay());//联系方式
        team.setCreateTime(DateUtils.now());
        team.setLevel(1);
        return baseMapper.insert(team)==1;
    }

    /**
     * 更新社团信息：编辑
     * @param team
     * @return
     */
    public boolean updateTeamInfo(Team team){
        return baseMapper.updateById(team)==1;
    }

    /**
     * 判断当前登录用户 是否是该社团的管理员
     * @param studentId
     * @param teamId
     * @return
     */
    public boolean isThisManager(Integer studentId,Integer teamId){
        Team team = baseMapper.selectById(teamId);//获取到当前社团id
        return team.getTeamManagerId()==studentId;
    }

}
