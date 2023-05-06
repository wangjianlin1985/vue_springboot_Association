package com.claire.common;

import lombok.Data;


/**
 * @author tjx
 **/
@SuppressWarnings("unchecked")
@Data
public class ApiResponse<T> implements java.io.Serializable {

    /**
     * 状态码
     */
    private int code;

    /**
     * 错误消息
     */
    private String msg;

    /**
     * 消息响应的对象，例如：列表
     */
    private T data;

    /**
     * 时间戳
     */
    private long time;

    public ApiResponse() {
        super();
    }


    public ApiResponse(ApiCode apiCode, String msg, T data) {
        this.code = apiCode.getCode();
        this.msg = msg;
        this.data = data;
        this.time = System.currentTimeMillis();
    }

    public ApiResponse(ApiCode apiCode, T data) {
        this.code = apiCode.getCode();
        this.msg = apiCode.getCodeMsg();
        this.data = data;
        this.time = System.currentTimeMillis();
    }

    public static ApiResponse success(Object data) {
        return new ApiResponse(BaseApiCode.SUCCESS, BaseApiCode.SUCCESS.getCodeMsg(), data);
    }

    public static ApiResponse success() {
        return new ApiResponse(BaseApiCode.SUCCESS, BaseApiCode.SUCCESS.getCodeMsg(), "");
    }


    public static ApiResponse failed(ApiCode code, String msg) {
        return new ApiResponse(code, msg, "");
    }

    public static ApiResponse failed(String msg) {
        return new ApiResponse(BaseApiCode.FAILED, msg, "");
    }

    public static ApiResponse failed() {
        return new ApiResponse(BaseApiCode.FAILED, BaseApiCode.FAILED.getCodeMsg(), "");
    }

    public static ApiResponse failed(Object data) {
        return new ApiResponse(BaseApiCode.FAILED, BaseApiCode.FAILED.getCodeMsg(), data);
    }
}
