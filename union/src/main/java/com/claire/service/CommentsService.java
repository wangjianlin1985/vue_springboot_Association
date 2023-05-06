package com.claire.service;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.claire.bean.Comments;
import com.claire.bean.Student;
import com.claire.mapper.CommentsMapper;
import com.claire.util.DataUtils;
import com.claire.util.DateUtils;
import org.springframework.stereotype.Service;

import javax.xml.stream.events.Comment;

@Service
public class CommentsService extends ServiceImpl<CommentsMapper, Comments> {


    /**
     * 返回评论分页数据
     * @param current 页码
     * @param size    每页数量
     * @param comments 评论
     * @return
     */
    public IPage<Comment> getAllComments(Long current,Long size,Comments comments){
        QueryWrapper queryWrapper=new QueryWrapper();
        queryWrapper.eq(comments.getTeamId()!=-1,"team_id",comments.getTeamId());//根据社团id检索
        queryWrapper.like(DataUtils.isNotEmptyStr(comments.getContent()),"content",comments.getContent());
        queryWrapper.like(DataUtils.isNotEmptyStr(comments.getStudentName()),"student_name",comments.getStudentName());
        queryWrapper.orderByDesc("support_count");//根据赞数排列
        return  (IPage<Comment>)baseMapper.selectPage(new Page<>(current,size),queryWrapper);
    }

    /**
     * 根绝评论id删除评论
     * @param id  需要被删除的评论id
     * @return
     */
    public boolean deleteComments(Integer id){
        return baseMapper.deleteById(id)==1;
    }

    /**
     * 点赞+1
     * @param id  被赞的评论id
     * @return
     */
    public boolean addSupport(Integer id){
        Comments comments = baseMapper.selectById(id);
        int supportCount = comments.getSupportCount();
        supportCount+=1;
        comments.setSupportCount(supportCount);
        return baseMapper.updateById(comments)==1;
    }

    /**
     * 回复+1
     * @param id  被回复的评论id
     * @return
     */
    public boolean addReply(Integer id){
        Comments comments = baseMapper.selectById(id);
        int replyCount = comments.getReplyCount();
        replyCount+=1;
        comments.setReplyCount(replyCount);
        return baseMapper.updateById(comments)==1;
    }

    /**
     * 新评论初始化
     * @return 新评论
     */
    public Comments createNew(){
        Comments comments=new Comments();
        comments.setSupportCount(0);
        comments.setReplyCount(0);
        comments.setCreateTime(DateUtils.now());
        return comments;
    }

    /**
     * 新增一条评论
     * @param com 评论对象
     * @param stu 学生对象
     * @return
     */
    public boolean addNewComment(Comments com, Student stu){
        Comments comments=createNew();
        comments.setTeamId(com.getTeamId());
        comments.setContent(com.getContent());
        comments.setStudentId(stu.getId());
        comments.setStudentName(stu.getUsername());
        comments.setAvatar(stu.getAvatar());
        comments.setIsManager(stu.getIsManager());
        return baseMapper.insert(comments)==1;
    }

}
