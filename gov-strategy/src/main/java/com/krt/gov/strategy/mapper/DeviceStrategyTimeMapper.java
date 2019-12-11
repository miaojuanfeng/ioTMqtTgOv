package com.krt.gov.strategy.mapper;

import com.krt.common.base.BaseMapper;
import com.krt.gov.strategy.entity.DeviceStrategyTime;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

/**
 * 设备动作策略_时间映射层
 *
 * @author 刘威
 * @version 1.0
 * @date 2019年09月03日
 */
@Mapper
public interface DeviceStrategyTimeMapper extends BaseMapper<DeviceStrategyTime> {

    List selectByStrategyId(Integer strategyId);

    void deleteByStrategyId(Integer strategyId);
}
