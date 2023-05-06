package com.claire.common;

/**
 * <p>
 * ClaireConstant
 * </p>
 *
 * @author tjx
 * @date 2020/4/11 10:13
 */
public class ClaireConstant {

    /**
     * 登录缓存KEY前缀
     */
    public static final String USER_TOKEN_CACHE_KEY_PREFIX = "claire:login_user_token:";

    /**
     * 登录TOKEN超时时间 7天
     */
    public static final long USER_TOKEN_EXPIRE_TIMEOUT = 7 * 24 * 60 * 60;

    /**
     * 请求头TOKEN存放KEY
     */
    public static final String USER_TOKEN_HEADER_KEY = "ClaireAuthorization";
}
