package com.claire.service;

import com.claire.config.ConfigInfo;
import com.claire.dto.SmsSendDto;
import com.claire.exception.GeneralException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import sun.security.krb5.Config;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

/**
 * <p>
 * SmsService
 * </p>
 *
 * @author jackcooperz
 * @date 2020/4/28 12:38
 */
@Service
public class SmsService {

    private static final Logger logger = LoggerFactory.getLogger(SmsService.class);

    @Autowired
    private JavaMailSender javaMailSender;
    @Autowired
    private ConfigInfo configInfo;

    /**
     * 发送文本类邮件
     */
    public void sendSimpleTextMail(SmsSendDto smsSendDto) {
        try {
            SimpleMailMessage simpleMailMessage = new SimpleMailMessage();
            simpleMailMessage.setFrom(configInfo.getEmailFromUser());
            simpleMailMessage.setTo(smsSendDto.getToUser());
            simpleMailMessage.setSubject(smsSendDto.getSubject());
            simpleMailMessage.setText(smsSendDto.getTextContent());
            javaMailSender.send(simpleMailMessage);
        } catch (Exception e) {
            logger.error("sendSimpleTextMail failed,Error:",e);
            throw new GeneralException("邮件发送失败，请稍后重试");
        }
    }

    /**
     * 发送Html类型邮件
     */
    public void sendMimeTextMail(SmsSendDto smsSendDto) {
        try {
            MimeMessage message = javaMailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setFrom(configInfo.getEmailFromUser());
            helper.setTo(smsSendDto.getToUser());
            helper.setSubject(smsSendDto.getSubject());
            helper.setText(smsSendDto.getTextContent(), true);
            javaMailSender.send(message);
        } catch (MessagingException e) {
            logger.error("sendMimeTextMail failed,Error:",e);
            throw new GeneralException("邮件发送失败，请稍后重试");
        }
    }


}
