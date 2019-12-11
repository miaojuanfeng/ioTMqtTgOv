package com.krt.gov.strategy.entity;

import com.krt.common.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 推送规则_相关策略实体类
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月13日
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("gov_push_strategy")
public class GovPushStrategy extends BaseEntity {

    /**
     * 推送规则id，gov_push.id
     */
    private Integer pushId;

    /**
     * 策略id，gov_device_strategy.id
     */
    private Integer strategyId;

    /**
     * 策略名称
     */
    private String strategyName;

    /**
     * 策略类型名（方便显示）
     */
    private String strategyTypeName;

}