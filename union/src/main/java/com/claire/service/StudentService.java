package com.claire.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.claire.bean.Student;
import com.claire.constant.IntBooleanEnum;
import com.claire.exception.GeneralException;
import com.claire.mapper.StudentMapper;
import com.claire.util.DataUtils;
import com.claire.util.DateUtils;
import com.claire.util.PasswordUtil;
import org.springframework.stereotype.Service;

/**
 * @author tjx
 * @date 2020/4/7 16:19
 */
@Service
public class StudentService extends ServiceImpl<StudentMapper, Student> {

    /**
     * 分页查询用户列表
     * @param current
     * @param size
     * @param stu
     * @return
     */
    public IPage<Student> getAllStudent(Long current,Long size,Student stu){
        QueryWrapper<Student> queryWrapper=new QueryWrapper<>();
        queryWrapper.like(DataUtils.isNotEmptyStr(stu.getSno()),"s_no",stu.getSno());//按学号查询
        queryWrapper.like(DataUtils.isNotEmptyStr(stu.getUsername()),"username",stu.getUsername());//按用户名查询
        if(stu.getIsManager()!=-1){//管理员
            queryWrapper.eq("is_manager",stu.getIsManager());
        }

        return baseMapper.selectPage(new Page<Student>(current,size),queryWrapper);
    }

    /**
     * 根据学生id返回学生信息
     */
    public Student getStudentById(Integer id) {
        return baseMapper.selectById(id);
    }

    /**
     * 称为管理员
     * @param id
     */
    public void toBeManager(Integer id){
        Student stu=getStudentById(id);
        stu.setIsManager(1);
        baseMapper.updateById(stu);
    }

    /**
     * 根据学号获取学生
     *
     * @param sno 学号
     * @return Student
     */
    public Student getStudentBySno(String sno) {
        LambdaQueryWrapper<Student> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(Student::getSno, sno) ;

        return baseMapper.selectOne(queryWrapper);
    }


    /**
     * 注册
     *
     * @param stu 学生信息
     * @return boolean
     */
    public boolean register(Student stu) {
        //校验必填参数
        validate(stu);
        //校验用户学号唯一性
        validateUserExists(stu.getSno());
        //注册新账号
        String sno = stu.getSno();
        String username = stu.getUsername();
        String password = stu.getPassword();

        Student student = createNew();
        student.setUsername(username);
        student.setSno(sno);
        student.setPassword(PasswordUtil.getSHA256(password));
        return baseMapper.insert(student) == 1;
    }

    private void validateUserExists(String sno) {
        //用户已存在
        if (DataUtils.isNotNull(getStudentBySno(sno))) {
            throw new GeneralException("此学号已注册账号，请勿重复注册!");
        }
    }

    private Student createNew() {
        Student student = new Student();
        student.setCreateTime(DateUtils.now());
        student.setIsManager(IntBooleanEnum.FALSE.getCode());
        return student;
    }

    private void validate(Student student) {
        if (DataUtils.isEmptyStr(student.getSno())) {
            throw new GeneralException("学号为空");
        }
        if (DataUtils.isEmptyStr(student.getUsername())) {
            throw new GeneralException("用户名为空");
        }
        if (DataUtils.isEmptyStr(student.getPassword())) {
            throw new GeneralException("密码为空");
        }
    }

    /**
     * 根据用户id修改用户信息
     * @param stu
     * @return
     */
    public boolean modifyStudent(Student stu){
        String password = stu.getPassword();
        if(password.length()<=16){
            stu.setPassword(PasswordUtil.getSHA256(password));
        }
        return baseMapper.updateById(stu)==1;
    }

    /**
     * 根据ID 删除一个用户
     * @param stuId
     * @return
     */
    public boolean deleteOneStudent(Integer stuId){
        return baseMapper.deleteById(stuId)==1;
    }

    /**
     * 根据学号  重置密码
     * @param s_no
     * @param password
     * @return
     */
    public boolean updatePassword(String s_no,String password){
        QueryWrapper queryWrapper=new QueryWrapper();
        queryWrapper.eq(s_no!="","s_no",s_no);
        Student stu=baseMapper.selectOne(queryWrapper);
        stu.setPassword(PasswordUtil.getSHA256(password));
        return baseMapper.updateById(stu)==1;
    }
}
