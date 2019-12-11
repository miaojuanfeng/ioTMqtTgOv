package com.krt.gov.warning.entity;

import com.krt.common.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 设备预警规则关联的设备实体类
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月12日
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("gov_device_warning_link")
public class GovDeviceWarningLink extends BaseEntity {

    /**
     * 设备预警规则主键，gov_device_warning.id
     */
    private Integer warningId;

    /**
     * 设备主键，gov_device.id
     */
    private Integer deviceId;

    /**
     * 设备名称
     */
    private String deviceName;
}