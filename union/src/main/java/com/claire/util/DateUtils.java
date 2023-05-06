package com.claire.util;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeFormatterBuilder;
import java.time.temporal.ChronoField;

/**
 * <p>
 * DateUtils
 * </p>
 *
 * @author tjx
 * @date 2020/4/13 14:13
 */
public class DateUtils {

    private static final LocalDate EMPTY_DATE = LocalDate.ofEpochDay(0);
    private static final LocalTime EMPTY_TIME = LocalTime.of(0, 0, 0);
    private static final LocalDateTime EMPTY_DATE_TIME = LocalDateTime.of(EMPTY_DATE, EMPTY_TIME);
    private static final LocalDate MAX_DATE = LocalDate.of(9999, 12, 31);
    private static final DateTimeFormatter DATE_TIME_NO_SPACE = new DateTimeFormatterBuilder().appendPattern("yyyyMMddHHmmss").toFormatter();
    private static final DateTimeFormatter MYSQL_DATE_TIME = new DateTimeFormatterBuilder().appendPattern("yyyy-MM-dd HH:mm:ss").toFormatter();
    private static final DateTimeFormatter[] COMMON_DATE_FORMATS = new DateTimeFormatter[]{
            DateTimeFormatter.ISO_LOCAL_DATE_TIME,
            DATE_TIME_NO_SPACE,
            new DateTimeFormatterBuilder().appendPattern("yyyy-MM-dd[ HH:mm:ss]")
                    .parseDefaulting(ChronoField.HOUR_OF_DAY, 0)
                    .parseDefaulting(ChronoField.MINUTE_OF_HOUR, 0)
                    .parseDefaulting(ChronoField.SECOND_OF_MINUTE, 0)
                    .toFormatter(),

    };

    /**
     * 返回当前时间
     *
     * @return LocalDateTime
     */
    public static LocalDateTime now() {
        return LocalDateTime.now();
    }

    /**
     * 返回当天时间
     *
     * @return LocalDate
     */
    public static LocalDate today() {
        return LocalDate.now();
    }

    public static LocalDateTime endOfDay(LocalDate date) {
        return date.atTime(23, 59, 59);
    }

    public static LocalDateTime startOfDay(LocalDate date) {
        return date.atTime(00, 00, 00);
    }

    public static LocalDate parseDate(String dateString) {
        return parseDateTime(dateString).toLocalDate();
    }

    public static LocalDateTime parseDateTime(String dateString) {
        dateString = DataUtils.limitLength(dateString.trim(), 19);
        return parseDateTime(dateString, COMMON_DATE_FORMATS);
    }

    private static LocalDateTime parseDateTime(String dateString, DateTimeFormatter[] dateTimeFormatters) {
        for (DateTimeFormatter formatter : dateTimeFormatters) {
            try {
                return LocalDateTime.parse(dateString, formatter);
            } catch (RuntimeException ignored) {
            }
        }
        return EMPTY_DATE_TIME;
    }
}
