package com.krt.gov.device.entity;

import com.krt.common.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
    import java.util.Date;
    import org.springframework.format.annotation.DateTimeFormat;

/**
 * 设备类型实体类
 *
 * @author liuwei
 * @version 1.0
 * @date 2019年08月12日
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("gov_device_type")
public class GovDeviceType extends BaseEntity {

    /**
     * 设备类型名
     */
    private String name;

}