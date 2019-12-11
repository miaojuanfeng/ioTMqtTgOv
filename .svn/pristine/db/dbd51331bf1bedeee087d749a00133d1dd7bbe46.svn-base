package com.krt.gov.strategy.service;

import com.krt.gov.strategy.entity.GovPushStrategy;
import com.krt.common.base.IBaseService;


/**
 * 推送规则_相关策略服务接口层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月13日
 */
public interface IGovPushStrategyService extends IBaseService<GovPushStrategy>{

    void deleteStrategyByPushId(String pushId);

    /**
     * 执行了条件策略后,如果设置了推送短信，则推送一条短信给指定用户
     * @param strategyId
     * @return
     */
    void sendPushMessage(Integer strategyId);

}
