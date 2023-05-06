package com.claire.constant;

/**
 * <p>
 * LoginOpTypeEnum
 * </p>
 *
 * @author tjx
 * @date 2020/4/13 14:50
 */
public enum LoginOpTypeEnum {

    /**
     * 登入
     */
    LOGIN(1, "登录"),
    /**
     * 登出
     */
    LOGOUT(-1, "登出");


    private int opType;

    private String opTypeStr;

    LoginOpTypeEnum(int opType, String opTypeStr) {
        this.opType = opType;
        this.opTypeStr = opTypeStr;
    }

    public int getOpType() {
        return opType;
    }

    public String getOpTypeStr() {
        return opTypeStr;
    }
}
