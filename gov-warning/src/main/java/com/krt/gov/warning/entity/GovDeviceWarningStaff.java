package com.krt.gov.warning.entity;

import com.krt.common.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 预警规则_推送人员实体类
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月11日
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("gov_device_warning_staff")
public class GovDeviceWarningStaff extends BaseEntity {

    /**
     * 设备预警规则主键，gov_device_warning.id
     */
    private Integer warningId;

    /**
     * 人员姓名
     */
    private String staffName;

    /**
     * 人员标识
     */
    private String staffUuid;

    /**
     * 手机号码
     */
    private String staffPhone;

}