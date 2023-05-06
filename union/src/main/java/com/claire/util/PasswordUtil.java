package com.claire.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * <p>
 * PasswordUtil
 * </p>
 *
 * @author tjx
 * @date 2020/4/13 14:15
 */
public class PasswordUtil {

    public static void main(String[] args) {
        System.out.println(getSHA256("123456"));
    }

    /**
     * 校验用户密码
     *
     * @param originalStr
     * @param encodePass
     * @return
     */
    public static boolean isEqual(String originalStr, String encodePass) {
        return getSHA256(originalStr).equals(encodePass);
    }

    /**
     * 校验用户密码
     *
     * @param originalStr
     * @param encodePass
     * @return
     */
    public static boolean isNotEqual(String originalStr, String encodePass) {
        return !isEqual(originalStr,encodePass);
    }

    /**
     * 利用java原生的类实现SHA256加密
     *
     * @param str 加密后的报文
     * @return String
     */
    public static String getSHA256(String str) {
        MessageDigest messageDigest;
        String encodestr = "";
        try {
            messageDigest = MessageDigest.getInstance("SHA-256");
            messageDigest.update(str.getBytes("UTF-8"));
            encodestr = byte2Hex(messageDigest.digest());
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return encodestr;
    }

    /**
     * 将byte转为16进制
     *
     * @param bytes
     * @return
     */
    private static String byte2Hex(byte[] bytes) {
        StringBuffer stringBuffer = new StringBuffer();
        String temp = null;
        for (int i = 0; i < bytes.length; i++) {
            temp = Integer.toHexString(bytes[i] & 0xFF);
            if (temp.length() == 1) {
                //1得到一位的进行补0操作
                stringBuffer.append("0");
            }
            stringBuffer.append(temp);
        }
        return stringBuffer.toString();
    }
}
