package com.krt.gov.strategy.mapper;


import com.krt.common.base.BaseMapper;
import com.krt.gov.strategy.entity.DeviceStrategy;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 设备动作策略映射层
 *
 * @author 缪隽峰
 * @version 1.0
 * @date 2019年07月11日
 */
@Mapper
@Repository
public interface DeviceStrategyMapper extends BaseMapper<DeviceStrategy> {
    /**
     * 策略关联推送获取非手动策略列表
     * @return
     */
    List <DeviceStrategy> selectStrategyPage(Map para);

    List<Map> selectManualStrategy(String area);

    List<Map> selectManualDevice(@Param("strategyId") Integer strategyId);

}
