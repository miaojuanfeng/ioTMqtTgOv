package com.krt.gov.thread.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.krt.common.base.BaseEntity;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

/**
 * 回调列表日志实体类
 * @author 郭明德
 * @version 1.0
 * @date 2019年08月08日
 */
@Data
@NoArgsConstructor
@EqualsAndHashCode(callSuper = false)
@TableName("t_callback_log")
public class TCallbackLog extends BaseEntity {
    /**
     * 回调url
     */
    private String url;
    /**
     * 调用参数
     */
    private String data;

    /**
     * 回调状态：0表未完成，1表已完成，2表超时失败
     */
    private Integer status;

}