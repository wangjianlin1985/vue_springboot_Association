package com.claire.controller;

import com.claire.bean.Student;
import com.claire.common.ApiResponse;
import com.claire.common.BaseController;
import com.claire.exception.GeneralException;
import com.claire.service.StudentService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * 学生controller
 *
 * @author tjx
 */
@Slf4j
@RestController
@RequestMapping("/student")
public class StudentController extends BaseController {

    @Autowired
    private StudentService studentService;

    /***
     * 按条件  分页 返回学生数据
     * @param current
     * @param size
     * @param student
     * @return
     */
    @RequestMapping(value = "/getAllStudent",method = RequestMethod.POST,produces = "application/json;charset=UTF-8")
    public ApiResponse getAllStudent(Long current,Long size,@RequestBody Student student){
        return success(studentService.getAllStudent(current,size,student));
    }

    /**
     * 根绝id查找学生
     *
     * @param id
     * @return
     */
    @RequestMapping("/getStudentById")
    public ApiResponse getStudentById(@RequestParam Integer id) {
        return success(studentService.getStudentById(id));
    }

    /**
     * 注册
     *
     * @param student
     * @return
     */
    @RequestMapping(value = "/register", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public ApiResponse registerStu(@RequestBody Student student) {
        try {
            return success(studentService.register(student));
        } catch (GeneralException e) {
            log.error("register failed,Error:", e);
            return failed(e.getMessage());
        } catch (Exception e) {
            log.error("register failed,Error:", e);
            return failed("注册失败，请稍后重试");
        }

    }

    /**
     * 修改用户信息
     * @param student
     * @return
     */
    @RequestMapping(value = "/update", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
    public ApiResponse updateStudent(@RequestBody Student student){
        return success(studentService.modifyStudent(student));
    }

    /**
     * 删除用户
     * @param studentId
     * @return
     */
    @RequestMapping("/deleteStu")
    public ApiResponse deleteStudent(@RequestParam Integer studentId){
        return success(studentService.deleteOneStudent(studentId));
    }

    /**
     * 重置密码
     * @param s_no
     * @param password
     * @return
     */
    @RequestMapping("/updatePassword")
    public ApiResponse updatePassword(@RequestParam String s_no,@RequestParam String password){
        return success(studentService.updatePassword(s_no,password));
    }

}
