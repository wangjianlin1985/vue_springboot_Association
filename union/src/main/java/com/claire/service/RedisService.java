package com.claire.service;

import com.claire.exception.GeneralException;
import com.claire.util.DataUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import java.util.Set;
import java.util.concurrent.TimeUnit;

/**
 * <p>
 * RedisService
 * </p>
 *
 * @author tjx
 */
@Component
public class RedisService {

    private static final Logger logger = LoggerFactory.getLogger(RedisService.class);


    @Autowired
    private StringRedisTemplate redisTemplate;

    /**
     * 设置缓存生效时间
     *
     * @param key  键
     * @param time 时间(秒)
     * @return boolean
     */
    @SuppressWarnings("unchecked")
    public boolean expire(String key, long time) {
        try {
            if (time > 0) {
                redisTemplate.expire(key, time, TimeUnit.SECONDS);
            }
            return true;
        } catch (Exception e) {
            logger.error("RedisService.expire failed,key:{},time:{}", key, time, e);
            throw new GeneralException("设置超时失败");
        }
    }

    /**
     * 获取key过期时间
     *
     * @param key 键
     * @return 时间（秒） 0表示永久有效
     */
    @SuppressWarnings("unchecked")
    public long getExpire(String key) {
        return redisTemplate.getExpire(key, TimeUnit.SECONDS);
    }

    /**
     * 判断缓存key是否存在
     *
     * @param key 键
     * @return boolean
     */
    @SuppressWarnings("unchecked")
    public boolean hasKey(String key) {
        try {
            return redisTemplate.hasKey(key);
        } catch (Exception e) {
            logger.error("RedisService.hasKey failed,key:{},Error:", key, e);
            throw new GeneralException("验证key失败");
        }
    }

    public void set(String key, String value) {
        try {
            redisTemplate.opsForValue().set(key, value);
        } catch (Exception e) {
            logger.error("RedisService.set failed,key:{},Error:", key, e);
            throw new GeneralException("cache redis failed");
        }
    }

    public void set(String key, String value, long timeOut) {
        try {
            redisTemplate.opsForValue().set(key, value);
            if (DataUtils.isNotNull(timeOut) && timeOut > 0) {
                expire(key, timeOut);
            }
        } catch (Exception e) {
            logger.error("RedisService.set failed,key:{},Error:", key, e);
            throw new GeneralException("cache redis failed");
        }
    }

    public String get(String key) {
        try {
            return redisTemplate.opsForValue().get(key);
        } catch (Exception e) {
            logger.error("RedisService.get failed,key:{},Error:", key, e);
            throw new GeneralException("cache redis failed");
        }
    }


    /**
     * 获取Set
     *
     * @param key 键
     * @return Set<String>
     */
    @SuppressWarnings("unchecked")
    public Set<String> sGet(String key) {
        try {
            return redisTemplate.opsForSet().members(key);
        } catch (Exception e) {
            logger.error("RedisService.sGet failed,key:{},Error:", key, e);
            return null;
        }
    }

    /**
     * 验证value是否存在key所在set集合中
     *
     * @param key   键
     * @param value 值
     * @return boolean true-存在，false-不存在
     */
    public boolean sHasKey(String key, String value) {
        try {
            return redisTemplate.opsForSet().isMember(key, value);
        } catch (Exception e) {
            logger.error("RedisService.sHasKey failed,key:{},value:{},Error:", key, value, e);
            throw new GeneralException("verify set key failed");
        }
    }

    /**
     * 将set数据加入缓存
     *
     * @param key    键
     * @param time   值
     * @param values 值 可多个
     * @return 成功个数
     */
    @SuppressWarnings("unchecked")
    public long sSetAndTime(String key, long time, String... values) {
        try {
            Long count = redisTemplate.opsForSet().add(key, values);
            if (time > 0) {
                expire(key, time);
            }
            return count;
        } catch (Exception e) {
            logger.error("RedisService.sSetAndTime failed,Key:{},time:{},values:{},Error:", key, time, values, e);
            return 0;
        }
    }

    public void delete(String key) {
        try {
            redisTemplate.delete(key);
        } catch (Exception e) {
            logger.error("delete failed,Error:", e);
        }
    }

}
