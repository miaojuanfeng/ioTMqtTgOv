package com.krt.gov.strategy.entity;

import com.krt.common.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 设备动作策略_关联设备实体类
 *
 * @author 缪隽峰
 * @version 1.0
 * @date 2019年07月11日
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("gov_device_strategy_link")
public class DeviceStrategyLink extends BaseEntity {

    /**
     * 策略id，gov_device_strategy.id
     */
    private Integer strategyId;

    /**
     * 设备id，gov_device.id
     */
    private Integer deviceId;

    /**
     * 设备名称
     */
    private String deviceName;

    /**
     * 设备行为：目前主要是开关机
     */
    private String action;

    /**
     * 行为中文描述
     */
    private String actionDetails;
}