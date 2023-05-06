package com.claire.common;

import lombok.Builder;
import lombok.Data;

/**
 * <p>
 * BaseApiCodeImpl
 * </p>
 *
 * @author tjx
 * @date 2020/4/4 12:06
 */
@Data
@Builder
public class BaseApiCodeImpl implements ApiCode {

    private Integer code;

    private String codeMsg;


    @Override
    public int getCode() {
        return this.code;
    }

    @Override
    public String getCodeMsg() {
        return this.codeMsg;
    }
}
