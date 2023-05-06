package com.claire.controller;

import com.claire.bean.Comments;
import com.claire.bean.Student;
import com.claire.common.ApiResponse;
import com.claire.common.BaseController;
import com.claire.service.CommentsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/comments")
public class CommentsController extends BaseController {

    @Autowired
    private CommentsService commentsService;

    /**
     * 返回评论分页数据
     * @param current 页码
     * @param size    每页数量
     * @param comments 评论
     * @return
     */
    @RequestMapping(value = "/getComments",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    public ApiResponse getComments(Long current, Long size, @RequestBody Comments comments){
        return success(commentsService.getAllComments(current,size,comments));
    }

    /**
     * 根绝评论id删除评论
     * @param id  需要被删除的评论id
     * @return
     */
    @RequestMapping("/deleteComment")
    public ApiResponse deleteComment(Integer id){
        return success(commentsService.deleteComments(id));
    }

    /**
     * 点赞+1
     * @param id  被赞的评论id
     * @return
     */
    @RequestMapping("/addSupport")
    public ApiResponse addSupport(Integer id){
        return success(commentsService.addSupport(id));
    }

    /**
     * 新增一条评论
     * @param com  评论对象
     * @param request 请求
     * @return
     */
    @RequestMapping(value = "/addNewComment",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    public ApiResponse addNewComment(@RequestBody Comments com, HttpServletRequest request){
        Student stu=getLoginStudent(request);
        return success(commentsService.addNewComment(com,stu));
    }

}
