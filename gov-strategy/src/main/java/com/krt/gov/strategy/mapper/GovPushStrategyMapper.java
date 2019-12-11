package com.krt.gov.strategy.mapper;

import com.krt.common.base.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import com.krt.gov.strategy.entity.GovPushStrategy;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 推送规则_相关策略映射层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月13日
 */
@Mapper
public interface GovPushStrategyMapper extends BaseMapper<GovPushStrategy>{

    /**
     * 根据pushId删除
     * @param pushId
     */
    void deleteStrategyByPushId(String pushId);

    /**
     * 查询策略绑定的推送信息
     * @param strategyId
     * @return
     */
    List<Map> selectByStrategyId(Integer strategyId);
}
