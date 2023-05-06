package com.claire.util;

import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.claire.common.ClaireConstant;

/**
 * <p>
 * UserTokenUtils：生成token令牌的工具类
 * </p>
 *
 * @author tjx
 * @date 2020/4/11 9:54
 */
public class UserTokenUtils {

    /**
     * UUID作为user-token
     *
     * @return String
     */
    public static String generateUserToken() {
        return IdWorker.get32UUID();
    }

    /**
     * 生成用户TOKEN缓存KEY
     *
     * @param userToken 用户TOKEN
     * @return String
     */
    public static String generateUserTokenCacheKey(String userToken) {
        return String.format("%s%s", ClaireConstant.USER_TOKEN_CACHE_KEY_PREFIX, userToken);
    }
}
