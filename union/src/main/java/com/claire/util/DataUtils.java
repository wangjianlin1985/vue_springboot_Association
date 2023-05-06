package com.claire.util;

import org.springframework.util.StringUtils;

/**
 * <p>
 * DataUtils
 * </p>
 *
 * @author tjx
 * @date 2020/4/11 9:35
 */
public class DataUtils {

    public static boolean isNotEmptyStr(String originalStr) {
        return !isEmptyStr(originalStr);
    }

    public static boolean isEmptyStr(String originalStr) {
        return StringUtils.isEmpty(originalStr);
    }

    public static boolean isNull(Object originalData) {
        return originalData == null;
    }

    public static boolean isNotNull(Object originalData) {
        return !isNull(originalData);
    }

    public static boolean isEqual(Object sourceData, Object targetData) {
        return sourceData.equals(targetData);
    }

    public static boolean isNotEqual(Object sourceData, Object targetData) {
        return !isEqual(sourceData, targetData);
    }

    public static String limitLength(String str, int length) {
        if (isEmptyStr(str)) {
            return str;
        }
        return str.length() > length ? str.substring(0, length) : str;
    }
}
