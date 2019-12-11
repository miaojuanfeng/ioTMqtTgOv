package com.krt.gov.group.entity;

import com.krt.common.base.BaseEntity;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.TableField;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 设备分组实体类
 *
 * @author 刘威
 * @version 1.0
 * @date 2019年10月14日
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("gov_group")
public class GovGroup extends BaseEntity {

    /**
     * 组名
     */
    private String groupName;

    /**
     * 图标
     */
    private String icon;

    /**
     * 是否允许修改删除分组 0:不可以 1:可以
     */
    private Integer modifiable;

}