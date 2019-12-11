package com.krt.gov.strategy.entity;

import com.krt.common.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 设备动作策略_触发条件实体类
 *
 * @author 缪隽峰
 * @version 1.0
 * @date 2019年07月12日
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("gov_device_strategy_require")
public class DeviceStrategyRequire extends BaseEntity {

    /**
     * 策略id，gov_device_strategy.id
     */
    private Integer strategyId;

    /**
     * 设备id（仅支持环境感测类设备），gov_device.id
     */
    private Integer deviceId;

    /**
     * 设备名称
     */
    private String deviceName;

    /**
     * 预警条件
     */
    private String requires;

    /**
     * 预警条件，存json，温度（湿度）低于（高于）xx,且持续xx分钟
     */
    private String requiresDetails;

    /**
     * 最高温度和最低温度设定
     */
    private Integer tempH;
    private Integer tempL;
    private Integer humiH;
    private Integer humiL;

    /**
     * 开关
     */
    private Integer onOff;

}