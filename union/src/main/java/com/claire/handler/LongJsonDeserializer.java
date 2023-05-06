package com.claire.handler;

import com.claire.exception.GeneralException;
import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;

/**
 * <p>
 * LongJsonDeserializer
 * </p>
 *
 * @author tjx
 * @date 2020/3/9 10:46
 */
public class LongJsonDeserializer extends JsonDeserializer<Long> {

    private static final Logger logger = LoggerFactory.getLogger(LongJsonDeserializer.class);

    @Override
    public Long deserialize(JsonParser jsonParser, DeserializationContext deserializationContext) throws IOException, JsonProcessingException {
        String value = jsonParser.getText();
        try {
            return value == null ? null : Long.parseLong(value);
        } catch (NumberFormatException e) {
            logger.error("解析长整形错误", e);
            throw new GeneralException("参数解析失败");
        }
    }
}
