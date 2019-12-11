package com.krt.gov.strategy.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.krt.common.base.IBaseService;
import com.krt.gov.strategy.entity.DeviceStrategy;

import java.util.List;
import java.util.Map;


/**
 * 设备动作策略服务接口层
 *
 * @author 缪隽峰
 * @version 1.0
 * @date 2019年07月11日
 */
public interface IDeviceStrategyService extends IBaseService<DeviceStrategy>{
    List<Map> selectManualStrategy(String area);
    List<Map> selectManualDevice(Integer strategyId);
    IPage selectStrategyPage(Map para);
}
