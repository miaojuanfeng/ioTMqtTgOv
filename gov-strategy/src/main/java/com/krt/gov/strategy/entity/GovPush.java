package com.krt.gov.strategy.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.krt.common.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 推送规则设置实体类
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月13日
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("gov_push")
public class GovPush extends BaseEntity {

    /**
     * 短信模板
     */
    private String smsMode;

    /**
     * 策略名称（方便显示）
     */
    private String strategyName;

    /**
     * 推送人（方便显示）
     */
    private String pusher;

    /**
     * 状态：1启用、2停用
     */
    private Integer status;

    /**
     * 区域
     */
    private String area;

}