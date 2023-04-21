package com.cc.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * (StudytimeDb)表实体类
 *
 * @author makejava
 * @since 2023-04-19 21:15:20
 */
@SuppressWarnings("serial")
@Data
@AllArgsConstructor
@NoArgsConstructor
public class StudyTime {

    private Integer id;

    private String userAccount;

    private String startTime;
    //一段自习的时间，单位是分钟

    private Double min;
}

