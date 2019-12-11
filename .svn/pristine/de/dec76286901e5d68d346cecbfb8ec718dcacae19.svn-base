package com.krt.gov.strategy.service.impl;

import com.krt.gov.strategy.entity.GovPushStaff;
import com.krt.gov.strategy.entity.GovPushStrategy;
import org.springframework.stereotype.Service;
import com.krt.gov.strategy.entity.GovPush;
import com.krt.gov.strategy.mapper.GovPushMapper;
import com.krt.gov.strategy.service.IGovPushService;
import com.krt.common.base.BaseServiceImpl;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * 推送规则设置服务接口实现层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月13日
 */
@Service
public class GovPushServiceImpl extends BaseServiceImpl<GovPushMapper, GovPush> implements IGovPushService {

    @Resource
    private GovPushMapper govPushMapper;

    /**
     * 根据推送id 修改推送信息状态
     * @param status
     * @param id
     */
    @Override
    public void updateStatusById(String status, String id){
        govPushMapper.updateStatusById(status, id);
    }

    /**
     * 根据推送规则id 查询关联策略
     * @param id
     * @return
     */
    @Override
    public List<GovPushStrategy> selectPushStrategyById(String id){
        return govPushMapper.selectPushStrategyById(id);
    }

    /**
     * 根据推送规则id 查询关联的人员
     * @param id
     * @return
     */
    @Override
    public List<GovPushStaff> selectPushStaffById(String id){
        return govPushMapper.selectPushStaffById(id);
    }

    /**
     * 保存策略名称和推送人员名字
     * @param strategyName
     * @param staffName
     * @param pushId
     */
    @Override
    public void saveStrategyAndStaff(String strategyName, String staffName, String pushId){
        govPushMapper.saveStrategyAndStaff(strategyName, staffName, pushId);
    }

}
