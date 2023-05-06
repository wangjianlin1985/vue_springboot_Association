package com.claire.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.claire.bean.Apply;
import com.claire.mapper.ApplyMapper;
import com.claire.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ApplyService extends ServiceImpl<ApplyMapper, Apply> {

    @Autowired
    private TeamMemberService teamMemberService;

    /**
     * 新建一个申请
     * @param aly
     * @return
     */
    public boolean createNewApply(Apply aly){

        Apply apply=createNew();//新建一个申请
        apply.setApplyFromId(aly.getApplyFromId());//申请人id
        apply.setApplyUsername(aly.getApplyUsername());
        apply.setApplyToId(aly.getApplyToId());//申请的社团id
        apply.setReason(aly.getReason());//申请理由
        apply.setContactWay(aly.getContactWay());

        return baseMapper.insert(apply)==1;
    }

    /**
     * 新建一个默认的请求
     * @return
     */
    public Apply createNew(){
        Apply apply=new Apply();
        apply.setCreateTime(DateUtils.now());
        apply.setIsPass(0);
        return apply;
    }

    /**
     * 管理员 获取 想要加入该社团的 申请信息
     * @param current
     * @param size
     * @param studentId
     * @return
     */
    public IPage<Apply> getApply(Long current,Long size,Integer studentId){
        Integer teamId=teamMemberService.getTeamIdByStudentId(studentId);//管理的社团id
        QueryWrapper<Apply> queryWrapper= new QueryWrapper<>();
        queryWrapper.eq("apply_to_id",teamId);
        queryWrapper.orderByDesc("create_time");//按时间排序
        return  baseMapper.selectPage(new Page<Apply>(current,size),queryWrapper);
    }

    /**
     * 普通用户根据自己的id  查看自己的申请消息
     * @param current
     * @param size
     * @param studentId
     * @return
     */
    public IPage<Apply> getApplyById(Long current,Long size,Integer studentId){
        QueryWrapper<Apply> queryWrapper= new QueryWrapper<>();
        queryWrapper.eq("apply_from_id",studentId);
        queryWrapper.orderByDesc("create_time");//按时间排序
        return baseMapper.selectPage(new Page<Apply>(current,size),queryWrapper);
    }


    /**
     * 通过申请
     * @param apply
     * @return
     */
    public boolean passApply(Apply apply){
        apply.setIsPass(2);//表示通过申请
        baseMapper.updateById(apply);
        return teamMemberService.insertMember(apply);
    }

    /**
     * 拒绝申请
     * @param apply
     * @return
     */
    public boolean rejectApply(Apply apply){
        apply.setIsPass(1);//拒绝申请
        return baseMapper.updateById(apply)==1;
    }

    /**
     * 删除申请
     * @param apply
     * @return
     */
    public boolean deleteApply(Apply apply){
        return baseMapper.deleteById(apply.getId())==1;
    }

}
