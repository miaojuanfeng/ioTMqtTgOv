package com.krt.gov.warning.entity;

import com.krt.common.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 设备预警时间设置实体类
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月15日
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("gov_device_warning_time")
public class GovDeviceWarningTime extends BaseEntity {

    /**
     * 设备预警规则主键，gov_device_warning.id
     */
    private Integer warningId;

    /**
     * 预警开始时间，格式：08:10
     */
    private String sTime;

    /**
     * 预警结束时间，格式：12:10
     */
    private String fTime;

}