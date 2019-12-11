package com.krt.gov.smsLog.entity;

import com.krt.common.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
    import java.util.Date;
    import org.springframework.format.annotation.DateTimeFormat;

/**
 * 短信发送日志实体类
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月12日
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("gov_sms_log")
public class GovSmsLog extends BaseEntity {

    /**
     * 类别：1预警短信、2推送短信
     */
    private Integer type;

    /**
     * 设备预警规则主键，gov_device_warning.id
     */
    private Integer warningId;

    /**
     * 推送规则表主键，gov_push.id
     */
    private Integer pushId;

    /**
     * 短信内容
     */
    private String smsContent;

    /**
     * 姓名
     */
    private String staffName;

    /**
     * 手机号
     */
    private String staffPhone;

    /**
     * 短信发送时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date sendTime;

}