package com.krt.gov.operationLog.entity;

import com.krt.common.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 用户操作日志实体类
 *
 * @author 刘威
 * @version 1.0
 * @date 2019年10月29日
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("gov_operation_log")
public class GovOperationLog extends BaseEntity {

    /**
     * 操作人名称
     */
    private String username;

    /**
     * 设备ID
     */
    private Long deviceId;

    /**
     * 设备名
     */
    private String deviceName;

    /**
     * 产品ID
     */
    private Long productId;

    /**
     * 串口
     */
    private String port;

    /**
     * 操作内容
     */
    private String action;

    /**
     * 用户ID
     */
    private Integer inserter;

}