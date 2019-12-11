package com.krt.gov.strategy.entity;

import com.krt.common.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 推送人员设置实体类
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月13日
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("gov_push_staff")
public class GovPushStaff extends BaseEntity {

    /**
     * 推送规则id，gov_push.id
     */
    private Integer pushId;

    /**
     * 人员标识
     */
    private String staffUuid;

    /**
     * 人员姓名
     */
    private String staffName;

    /**
     * 手机号码
     */
    private String staffPhone;

}