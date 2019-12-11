package com.krt.gov.device.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.krt.common.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 设备实体类
 *
 * @author liuwei
 * @version 1.0
 * @date 2019年08月12日
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("gov_device")
public class GovDevice extends BaseEntity {

    /**
     * 设备id
     */
    private Long deviceId;
    /**
     * 产品编号
     */
    private Long productId;
    /**
     * 设备名
     */
    private String name;
    /**
     * 设备类型
     */
    private Integer type;
    /**
     * 设备分组
     */
    @TableField(value = "`group`")
    private Integer group;
    /**
     * 信息
     */
    private String info;
    /**
     * 设备在区域图中X轴、Y轴位置
     */
    private Integer x;

    private Integer y;

    /**
     * 设备状态 0 离线 1 停用 2 在线
     */
    private Integer state;

    /**
     * 设备状态 0 关闭 1 开启 2 预警
     */
    private Integer status;

    private String data;

    private String action;

    /**
     *  时间(json字符串action字段)
     */
    @TableField(exist=false)
    private String time;

    private Date actionTime;

    /**
     * 通道
     */
    private String port;

    /**
     * 区域code
     */
    private String area;

    /**
     * 存储品牌数据
     */
    private String brandName;
    /**
     * 存储码库数据
     */
    private String fileName;

    /**
     * 设备所在大厅id
     */
    private Integer hallId;

    /**
     * 空纸距离
     */
    private Integer disEmpty;

    /**
     * 满纸距离
     */
    private Integer disFull;

    /**
     * 纸张百分比
     */
    private BigDecimal disPercent;

    /**
     * 开关类子设备标识
     */
    private String machine;

    /**
     * 采购时间
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date purchasingTime;

    /**
     * 使用年限
     */
    private Integer durableYear;

    /**
     * 保修年限
     */
    private Integer warranty;
}