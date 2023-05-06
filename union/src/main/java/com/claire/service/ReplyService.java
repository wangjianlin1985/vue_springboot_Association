package com.claire.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.claire.bean.Reply;
import com.claire.bean.Student;
import com.claire.mapper.ReplyMapper;
import com.claire.util.DataUtils;
import com.claire.util.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReplyService extends ServiceImpl<ReplyMapper, Reply> {

    @Autowired
    private CommentsService commentsService;

    /**
     * 返回回复分页数据
     * @param current 页码
     * @param size    每页数量
     * @param reply 评论
     * @return
     */
    public IPage<Reply> getAllReply(Long current, Long size, Reply reply){
        QueryWrapper queryWrapper=new QueryWrapper();
        queryWrapper.eq(reply.getToWhich()!=-1,"to_which",reply.getToWhich());//根据被回复的评论id 检索
        queryWrapper.like(DataUtils.isNotEmptyStr(reply.getStudentName()),"student_name",reply.getStudentName());
        queryWrapper.like(DataUtils.isNotEmptyStr(reply.getContent()),"content",reply.getContent());
        queryWrapper.orderByDesc("create_time");//根据赞数排列
        return baseMapper.selectPage(new Page<>(current,size),queryWrapper);
    }

    /**
     * 根绝回复id删除回复
     * @param id  需要被删除的回复id
     * @return
     */
    public boolean deleteReply(Integer id){
        return baseMapper.deleteById(id)==1;
    }

    /**
     * 点赞+1
     * @param id  被赞的回复id
     * @return
     */
    public boolean addSupportCount(Integer id){
        Reply reply=baseMapper.selectById(id);
        int supportCount=reply.getSupportCount();
        supportCount+=1;
        reply.setSupportCount(supportCount);
        return baseMapper.updateById(reply)==1;
    }

    /**
     * 初始化回复
     * @return 回复对象
     */
    public Reply createNew(){
        Reply reply=new Reply();
        reply.setSupportCount(0);
        reply.setCreateTime(DateUtils.now());
        return reply;
    }

    /**
     * 新增一条回复
     * @param re 回复对象
     * @param stu  回复人
     * @return
     */
    public boolean addNewReply(Reply re, Student stu){
        Reply reply=createNew();
        reply.setStudentId(stu.getId());
        reply.setStudentName(stu.getUsername());
        reply.setAvatar(stu.getAvatar());
        reply.setContent(re.getContent());
        reply.setToWhich(re.getToWhich());
        commentsService.addReply(re.getToWhich());
        return baseMapper.insert(reply)==1;
    }
}
