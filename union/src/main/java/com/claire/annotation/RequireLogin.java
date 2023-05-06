package com.claire.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * <p>
 * RequireLogin:注入当前登录用户注解
 * </p>
 *
 * @author tjx
 * @date 2020/4/11 11:15
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)//运行时有效
public @interface RequireLogin {

    /**
     * 必须登录 默认true
     *
     * @return boolean
     */
    boolean required() default true;


}