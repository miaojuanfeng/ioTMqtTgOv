package com.krt.gov.strategy.service.impl;

import com.krt.common.base.BaseServiceImpl;
import com.krt.gov.strategy.entity.GovPushStaff;
import com.krt.gov.strategy.mapper.GovPushStaffMapper;
import com.krt.gov.strategy.service.IGovPushStaffService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;


/**
 * 推送人员设置服务接口实现层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月13日
 */
@Service
public class GovPushStaffServiceImpl extends BaseServiceImpl<GovPushStaffMapper, GovPushStaff> implements IGovPushStaffService {

    @Resource
    GovPushStaffMapper govPushStaffMapper;

    /**
     * 插入关联人员，返回插入的id
     * @param govPushStaff
     * @return
     */
    @Override
    public int insertOneStaff(GovPushStaff govPushStaff) {
        return govPushStaffMapper.insert(govPushStaff);
    }

    /**
     * 根据pushId删除
     * @param pushId
     */
    @Override
    public void deleteStaffByPushId(String pushId) {
        govPushStaffMapper.deleteStaffByPushId(pushId);
    }

    /**
     * 根据pushId 和 staffId 查找推送人员
     * @param pushId
     * @param staffId
     * @return
     */
    @Override
    public GovPushStaff selectOneStaff(String pushId, String staffId){
        return govPushStaffMapper.selectOneStaff(pushId, staffId);
    }

}
