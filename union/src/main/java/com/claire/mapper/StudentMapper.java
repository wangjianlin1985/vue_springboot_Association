package com.claire.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.claire.bean.Student;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface StudentMapper extends BaseMapper<Student> {

    /**
     * 根据 s_no获取 student
     * @param sNo
     * @return
     */
    @Select("select * from student where s_no=#{sno}")
    Student getStudentBySno(String sNo);


    /**
     * 新增一个新用户
     * @param sno
     * @param username
     * @param password
     * @return
     */
    @Insert("INSERT INTO student(s_no,username,password,avatar,is_manager) VALUES (#{sno},#{username},#{password},1,0)")
    Boolean addNewStu(String sno,String username,String password);
}
