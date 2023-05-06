package com.claire.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.claire.bean.CreateTeam;
import com.claire.mapper.CreateTeamMapper;
import com.claire.util.DataUtils;
import com.claire.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CreateTeamService extends ServiceImpl<CreateTeamMapper, CreateTeam> {

    @Autowired
    private StudentService studentService;

    @Autowired
    private TeamService teamService;

    /**
     * 发起 创建一个社团的请求
     * @param createT
     * @return
     */
    public boolean createNewTeamApply(CreateTeam createT){
        CreateTeam createTeam=createNew();//新建一个申请
        createTeam.setApplyFromId(createT.getApplyFromId());//申请人id
        createTeam.setApplyToName(createT.getApplyToName());//申请创建的社团名称
        createTeam.setTeamType(createT.getTeamType());//社团类别
        createTeam.setReason(createT.getReason());//创建理由
        createTeam.setContactWay(createT.getContactWay());//联系方式

        return baseMapper.insert(createTeam)==1;
    }

    /**
     * 创建一个默认的 创建社团申请
     * @return
     */
    public CreateTeam createNew(){
        CreateTeam createTeam=new CreateTeam();
        createTeam.setCreateTime(DateUtils.now());
        createTeam.setIsPass(0);//默认未处理
        return createTeam;
    }

    /**
     * 管理页返回请求消息
     * @param current
     * @param size
     * @param createTeam
     * @return
     */
    public IPage<CreateTeam> getCreateApply(Long current,Long size,CreateTeam createTeam){
        QueryWrapper queryWrapper=new QueryWrapper();
        queryWrapper.like(DataUtils.isNotEmptyStr(createTeam.getApplyToName()),"apply_to_name",createTeam.getApplyToName());
        queryWrapper.eq(createTeam.getTeamType()!=0,"team_type",createTeam.getTeamType());
        queryWrapper.eq(createTeam.getIsPass()!=-1,"is_pass",createTeam.getIsPass());
        return baseMapper.selectPage(new Page<>(current,size),queryWrapper);
    }

    /**
     * 通过申请
     * @param applyId
     * @return
     */
    public boolean passCreateTeamApply(Integer applyId){
        CreateTeam createTeam=baseMapper.selectById(applyId);//得到请求
        studentService.toBeManager(createTeam.getApplyFromId());//更新该成员为管理员
        createTeam.setIsPass(2);//通过申请
        baseMapper.updateById(createTeam);//更新状态
        return teamService.createNewTeam(createTeam);
    }

    /**
     * 拒绝申请
     * @param applyId
     * @return
     */
    public boolean refuseCreateTeamApply(Integer applyId){
        CreateTeam createTeam=baseMapper.selectById(applyId);//得到请求
        createTeam.setIsPass(1);//拒绝申请
        return baseMapper.updateById(createTeam)==1;//更新状态
    }

    /**
     * 删除申请
     * @param applyId
     * @return
     */
    public boolean deleteCreateTeamApply(Integer applyId){
        return baseMapper.deleteById(applyId)==1;
    }

}
