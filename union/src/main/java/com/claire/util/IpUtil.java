package com.claire.util;

import cn.hutool.http.useragent.UserAgent;
import cn.hutool.http.useragent.UserAgentUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;

/**
 * <p>
 * IpUtils
 * </p>
 *
 * @author tjx
 * @date 2019/8/28 16:43
 */
public class IpUtil {


    private static final Logger logger = LoggerFactory.getLogger(IpUtil.class);

    public static final String UN_KNOWN = "unknown";

    public static final String LOCAL_IP = "0:0:0:0:0:0:0:1";

    public static final String LOCAL_IP_STR = "127.0.0.1";

    public static final String[] ADDR_HEADER = {"X-Forwarded-For", "Proxy-Client-IP", "WL-Proxy-Client-IP", "X-Real-IP"};


    public static final String USER_AGENT = "user-agent";

    public static String getUserAgent(HttpServletRequest request) {
        return request.getHeader(USER_AGENT);
    }


    public static String getIP(HttpServletRequest request) {
        String ip = null;
        if (request instanceof HttpServletRequest) {
            HttpServletRequest hsr = (HttpServletRequest) request;
            for (String header : ADDR_HEADER) {
                if (StringUtils.isEmpty(ip) || UN_KNOWN.equalsIgnoreCase(ip)) {
                    ip = hsr.getHeader(header);
                } else {
                    break;
                }
            }
        }
        if (StringUtils.isEmpty(ip) || UN_KNOWN.equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        } else if (ip != null) {
            // 对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按','分割
            int i = ip.indexOf(",");
            if (i > 0) {
                ip = ip.substring(0, i);
            }
        }
        if (!checkIP(ip)) {
            ip = LOCAL_IP_STR;
        }
        if (LOCAL_IP.equals(ip)) {
            ip = LOCAL_IP_STR;
        }
        return ip;
    }

    private static boolean checkIP(String ip) {
        if (ip == null || ip.length() == 0 || UN_KNOWN.equalsIgnoreCase(ip)) {
            return false;
        }
        return true;
    }
}
