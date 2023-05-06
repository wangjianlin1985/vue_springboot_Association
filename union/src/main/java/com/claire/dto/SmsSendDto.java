package com.claire.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * <p>
 * SmsSendDto
 * </p>
 *
 * @author jackcooperz
 * @date 2020/4/28 12:39
 */
@Data
public class SmsSendDto implements Serializable {

    private static final long serialVersionUID = 1L;

    private String fromUser;

    private String toUser;

    private String subject;

    private String textContent;

}
