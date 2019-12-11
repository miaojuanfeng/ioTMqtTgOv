package com.krt.gov.strategy.mapper;

import com.krt.common.base.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import com.krt.gov.strategy.entity.GovPushStaff;
import org.apache.ibatis.annotations.Param;

/**
 * 推送人员设置映射层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月13日
 */
@Mapper
public interface GovPushStaffMapper extends BaseMapper<GovPushStaff>{

    /**
     * 根据PushId删除
     * @param pushId
     */
    void deleteStaffByPushId(@Param("pushId") String pushId);

    /**
     * 根据pushId 和 staffId 查找推送人员
     * @param pushId
     * @param staffId
     * @return
     */
    GovPushStaff selectOneStaff(@Param("pushId") String pushId, @Param("staffId") String staffId);
}
