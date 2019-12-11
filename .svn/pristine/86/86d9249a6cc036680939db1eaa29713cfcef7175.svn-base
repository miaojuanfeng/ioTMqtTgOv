package com.krt.gov.warning.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.krt.common.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 设备预警设置实体类
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月10日
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("gov_device_warning")
public class GovDeviceWarning extends BaseEntity {
    /**
     * id
     */
    private Integer id;

    /**
     * 属性类型code
     */
    private String attrTypeCode;

    /**
     * 属性类型名
     */
    private String attrTypeName;

    /**
     * 短信模板
     */
    private String smsMode;

    /**
     * 预警时间-星期几（星期一至星期天：1至7）
     */
    private String week;

    /**
     * 节假日是否预警
     */
    private Integer isHoliday;

    /**
     * 状态：1启用、2禁用
     */
    private Integer status;

    /**
     * 温湿度传感器字段
     */
    private Integer tempL;
    private Integer tempH;
    private Integer humiL;
    private Integer humiH;

    /**
     * 终端应用传感器
     */
    private Integer power;

    /**
     * 推送人信息
     */
    @TableField(exist=false)
    private String pushManJsonStr;

    /**
     * 关联设备信息
     */
    @TableField(exist=false)
    private String linkDeviceJsonStr;

    /**
     * 预警信息
     */
    @TableField(exist=false)
    private String timeJsonStr;

    /**
     * 区域
     */
    private String area;
}