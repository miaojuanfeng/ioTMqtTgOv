package com.krt.gov.strategy.service;

import com.krt.gov.strategy.entity.GovPush;
import com.krt.common.base.IBaseService;
import com.krt.gov.strategy.entity.GovPushStaff;
import com.krt.gov.strategy.entity.GovPushStrategy;

import java.util.List;
import java.util.Map;


/**
 * 推送规则设置服务接口层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月13日
 */
public interface IGovPushService extends IBaseService<GovPush>{

    void updateStatusById(String status, String id);

    List<GovPushStrategy> selectPushStrategyById(String id);

    List<GovPushStaff> selectPushStaffById(String id);

    void saveStrategyAndStaff(String strategyName, String staffName, String pushId);
}
