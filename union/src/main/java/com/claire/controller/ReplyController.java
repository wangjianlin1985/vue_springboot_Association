package com.claire.controller;

import com.claire.bean.Reply;
import com.claire.bean.Student;
import com.claire.common.ApiResponse;
import com.claire.common.BaseController;
import com.claire.service.ReplyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/reply")
public class ReplyController extends BaseController {
    @Autowired
    private ReplyService replyService;

    /**
     * 返回回复分页数据
     * @param current 页码
     * @param size    每页数量
     * @param reply 评论
     * @return
     */
    @RequestMapping(value = "/getReply",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    public ApiResponse getReply(Long current, Long size, @RequestBody Reply reply){
        return success(replyService.getAllReply(current,size,reply));
    }

    /**
     * 根绝回复id删除回复
     * @param id  需要被删除的回复id
     * @return
     */
    @RequestMapping("/deleteReply")
    public ApiResponse deleteReply(@RequestParam Integer id){
        return success(replyService.deleteReply(id));
    }

    /**
     * 点赞+1
     * @param id  被赞的回复id
     * @return
     */
    @RequestMapping("/addSupport")
    public ApiResponse addSupport(@RequestParam Integer id){
        return success(replyService.addSupportCount(id));
    }

    /**
     * 新增一条回复
     * @param rep  回复
     * @param request  请求
     * @return
     */
    @RequestMapping(value = "/addNewReply",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    public ApiResponse addNewReply(@RequestBody Reply rep, HttpServletRequest request){
        Student stu=getLoginStudent(request);
        return success(replyService.addNewReply(rep,stu));
    }
}
