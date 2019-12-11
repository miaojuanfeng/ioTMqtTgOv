package com.krt.gov.thread.service.impl;

import com.krt.common.base.BaseServiceImpl;
import com.krt.gov.thread.entity.TCallbackLog;
import com.krt.gov.thread.mapper.TCallbackLogMapper;
import com.krt.gov.thread.service.ITCallbackLogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;


/**
 * 回调列表日志服务接口实现层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年08月08日
 */
@Service
public class TCallbackLogServiceImpl extends BaseServiceImpl<TCallbackLogMapper, TCallbackLog> implements ITCallbackLogService {

    @Resource
    private TCallbackLogMapper tCallbackLogMapper;

    /**
     * 插入一条回调日志
     * @param map
     */
    @Override
    public void insertByMap(Map map) {
        tCallbackLogMapper.insertByMap(map);
    }

}
