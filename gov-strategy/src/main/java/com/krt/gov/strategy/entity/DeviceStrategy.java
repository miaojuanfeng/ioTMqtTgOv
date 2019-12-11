package com.krt.gov.strategy.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.krt.common.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 设备动作策略实体类
 *
 * @author 缪隽峰
 * @version 1.0
 * @date 2019年07月11日
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("gov_device_strategy")
public class DeviceStrategy extends BaseEntity {

    /**
     * 策略类型code，字典：普通手动执行策略、定时自动执行策略、条件触发执行策略
     */
    private Integer strategyTypeCode;

    /**
     * 策略类型名
     */
    private String strategyTypeName;

    /**
     * 定时执行时间，格式：08:30
     */
    private String runningTime;

    /**
     * 星期几定时执行
     */
    private String week;

    /**
     * 节假日是否执行：1节假日+工作日、2仅工作日、3仅节假日
     */
    private Integer isHoliday;

    /**
     * 策略状态：0 禁用 1 启用
     */
    private Integer status;

    /**
     * 定时器id
     */
//    private String quartz;

    /**
     * 区域
     */
    private String area;

}