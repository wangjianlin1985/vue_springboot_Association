package com.claire;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.claire.bean.Student;
import com.claire.dto.SmsSendDto;
import com.claire.mapper.StudentMapper;
import com.claire.service.SmsService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;


@SpringBootTest
class UnionbackApplicationTests {

    @Test
    void contextLoads() {
    }

    @Autowired
    private StudentMapper studentMapper;
    @Test
    public void getAllStu(){

        IPage<Student> studentIPage=studentMapper.selectPage(
                new Page(1,10),null
        );
        System.out.println(studentIPage);
    }

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    /**
     * 使用stringRedisTemplate
     * redis数据类型：String 、List、Set、ZSet、Hash
     */
    @Test
    public void test1(){
//        ValueOperations<String,String> stringStringValueOperations= stringRedisTemplate.opsForValue();
//        ListOperations<String,String> listOperations= stringRedisTemplate.opsForList();
        stringRedisTemplate.opsForValue().set("username","admin");
        System.out.println(stringRedisTemplate.opsForValue().get("username"));
    }

    @Autowired
    SmsService smsService;

    @Test
    public void sendEmail(){
       String emailServiceCode = "1234";
        SmsSendDto message = new SmsSendDto();
        message.setSubject("注册验证码");
         message.setTextContent("注册验证码是：" + emailServiceCode);
         message.setToUser("2502202498@qq.com");
        smsService.sendMimeTextMail(message);
    }


}
