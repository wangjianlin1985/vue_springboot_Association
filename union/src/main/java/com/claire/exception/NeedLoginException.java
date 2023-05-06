package com.claire.exception;

import com.claire.common.BaseApiCode;

/**
 * <p>
 * NeedLoginException
 * </p>
 *
 * @author tjx
 * @date 2020/4/11 10:57
 */
public class NeedLoginException extends GeneralException {

    public NeedLoginException(String message) {
        super(message);
        this.code = BaseApiCode.NEED_LOGIN.getCode();
    }
}
