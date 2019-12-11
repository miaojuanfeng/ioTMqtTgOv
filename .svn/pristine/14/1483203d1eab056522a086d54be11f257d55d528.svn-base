package com.krt.gov.strategy.service.impl;

import com.krt.gov.common.service.MessageService;
import com.krt.gov.smsLog.service.IGovSmsLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.krt.gov.strategy.entity.GovPushStrategy;
import com.krt.gov.strategy.mapper.GovPushStrategyMapper;
import com.krt.gov.strategy.service.IGovPushStrategyService;
import com.krt.common.base.BaseServiceImpl;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 推送规则_相关策略服务接口实现层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月13日
 */
@Service
public class GovPushStrategyServiceImpl extends BaseServiceImpl<GovPushStrategyMapper, GovPushStrategy> implements IGovPushStrategyService {

    @Resource
    GovPushStrategyMapper strategyMapper;

    @Autowired
    private MessageService messageService;

    @Resource
    private IGovSmsLogService govSmsLogService;

    /**
     * 删除策略
     *
     * @param pushId
     */
    @Override
    public void deleteStrategyByPushId(String pushId) {
        strategyMapper.deleteStrategyByPushId(pushId);
    }

    @Override
    public void sendPushMessage(Integer strategyId) {
        List<Map> maps = strategyMapper.selectByStrategyId(strategyId);
        for (Map map :
                maps) {
            Integer pushId = Integer.parseInt(map.get("pushId") + "");
            String smsMode = map.get("smsMode") + "";
            String staffPhone = map.get("staffPhone") + "";
            String staffName = map.get("staffName") + "";
            messageService.sendMsg(staffPhone,smsMode);

            //添加短信日志
            govSmsLogService.addSmsLog(2, pushId, staffPhone, smsMode, staffName);
        }
    }


}
