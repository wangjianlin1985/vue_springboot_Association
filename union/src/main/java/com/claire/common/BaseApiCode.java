package com.claire.common;


/**
 * @author tjx
 **/
public enum BaseApiCode implements ApiCode<Enum> {

    /**
     * 操作成功
     */
    SUCCESS(0, "操作成功"),
    FAILED(-1, "操作失败"),
    SYSTEM_EXCEPTION(500, "System Error"),
    VALID_ERROR(-1001, "验证失败"),
    OBJECT_NOT_EXISTS(-1002, "对象不存在"),
    OBJECT_HAS_EXISTS(-1003, "对象已存在"),
    NEED_LOGIN(401, "需要登录"),
    RESOURCE_NOT_FOUND(404, "Not Found");

    /**
     * 错误码
     */
    private int code;

    /**
     * 错误Msg
     */
    private String codeMsg;

    private BaseApiCode(int code, String codeMsg) {
        this.code = code;
        this.codeMsg = codeMsg;
    }

    @Override
    public int getCode() {
        return this.code;
    }

    @Override
    public String getCodeMsg() {
        return this.codeMsg;
    }
}
