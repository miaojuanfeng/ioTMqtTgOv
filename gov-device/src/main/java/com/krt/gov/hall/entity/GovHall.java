package com.krt.gov.hall.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.krt.common.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 大厅实体类
 *
 * @author 刘威
 * @version 1.0
 * @date 2019年10月11日
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("gov_hall")
public class GovHall extends BaseEntity {

    /**
     * 大厅名称
     */
    private String name;

    /**
     * 地区code
     */
    private String area;

    /**
     * 楼层code
     */
    private String floorCode;

    /**
     * 楼层名
     */
    private String floorName;

    /**
     * 布局图
     */
    private String layout;

}