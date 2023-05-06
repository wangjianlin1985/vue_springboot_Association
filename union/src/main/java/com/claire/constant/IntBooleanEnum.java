package com.claire.constant;

/**
 * Int boolean常量标识
 *
 * @author tjx
 */
public enum IntBooleanEnum {
    /**
     * 真
     */
    TRUE(1, "是"),
    /**
     * 假
     */
    FALSE(0, "否"),

    /**
     * 超级管理员
     */
    SUPER(2,"管理") ;


    private int code;

    private String codeMsg;

    IntBooleanEnum(int code, String codeMsg) {
        this.code = code;
        this.codeMsg = codeMsg;
    }

    public int getCode() {
        return code;
    }

    public String getCodeMsg() {
        return codeMsg;
    }
}
