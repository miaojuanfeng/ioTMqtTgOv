package com.krt.gov.thread.service;

import com.krt.common.base.IBaseService;
import com.krt.gov.thread.entity.TCallbackLog;

import java.util.Map;


/**
 * 回调列表日志服务接口层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年08月08日
 */
public interface ITCallbackLogService extends IBaseService<TCallbackLog> {

    // 插入一条日志
    void insertByMap(Map map);

}
