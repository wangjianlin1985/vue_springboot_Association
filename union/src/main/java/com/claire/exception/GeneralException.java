package com.claire.exception;

import com.claire.common.BaseApiCode;
import org.apache.logging.log4j.Level;

/**
 * <p>
 * GeneralException
 * </p>
 *
 * @author tjx
 * @date 2020/4/11 9:38
 */
public class GeneralException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    protected Object data = "";

    protected int code = BaseApiCode.FAILED.getCode();

    protected Level logLevel = Level.ERROR;

    public Object getData() {
        return data;
    }

    public int getCode() {
        return code;
    }

    public GeneralException(String message) {
        super(message);
    }

    public Level getLogLevel() {
        return logLevel;
    }

    public GeneralException(String message, Object data) {
        super(message);
        this.data = data;
    }

    public GeneralException(int code, String message, Object data) {
        super(message);
        this.code = code;
        this.data = data;
    }

}
