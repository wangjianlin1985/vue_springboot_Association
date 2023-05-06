package com.claire.vo;

import com.claire.bean.Student;
import lombok.Data;

import java.io.Serializable;

/**
 * <p>
 * StudentLoginVo 学生登录信息
 * </p>
 *
 * @author tjx
 * @date 2020/4/11 9:52
 */
@Data
public class StudentLoginVo implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 登录学生信息
     */
    private Student student;

    /**
     * 登录Token
     */
    private String userToken;

    public static StudentLoginVo factory(Student student, String userToken) {
        StudentLoginVo studentLoginVo = new StudentLoginVo();
        studentLoginVo.setStudent(student);
        studentLoginVo.setUserToken(userToken);
        return studentLoginVo;
    }


}
