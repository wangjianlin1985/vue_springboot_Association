package com.claire.util;

import java.util.Random;

/**
 * 验证码生成工具
 */
public class VerifyCodeUtil {
    public static char[] codeSequence = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
                       'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };

    public static String generateVerifyCode(){
        String str="";
        Random random = new Random();
        for (int i=0;i<4;i++){
            str+=codeSequence[random.nextInt(36)];
        }
        return  str;
    }
}
