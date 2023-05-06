package com.claire.config;

import lombok.Data;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

/**
 * <p>
 * ConfigInfo
 * </p>
 *
 * @author jackcooperz
 * @date 2020/4/28 13:25
 */
@Configuration
@Data
public class ConfigInfo {

    @Value("${spring.mail.username}")
    private String emailFromUser;
}
