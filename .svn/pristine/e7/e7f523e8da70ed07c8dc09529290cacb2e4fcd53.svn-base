package com.krt.gov.strategy.mapper;

import com.krt.common.base.BaseMapper;
import com.krt.gov.strategy.entity.GovPushStaff;
import com.krt.gov.strategy.entity.GovPushStrategy;
import org.apache.ibatis.annotations.Mapper;
import com.krt.gov.strategy.entity.GovPush;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 推送规则设置映射层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月13日
 */
@Mapper
public interface GovPushMapper extends BaseMapper<GovPush>{

    /**
     * 根据推送id 修改推送信息状态
     * @param status
     * @param id
     */
    void updateStatusById(@Param("status") String status, @Param("id") String id);

    /**
     * 根据推送规则id 查询 推送规则
     * @param id
     * @return
     */
    List<GovPushStrategy> selectPushStrategyById(@Param("id") String id);

    /**
     * 根据推送规则id 查询关联的人员
     * @param id
     * @return
     */
    List<GovPushStaff> selectPushStaffById(@Param("id") String id);

    /**
     * 保存策略名称和推送人员名字
     * @param strategyName
     * @param staffName
     * @param pushId
     */
    void saveStrategyAndStaff(@Param("strategyName") String strategyName, @Param("staffName") String staffName, @Param("pushId") String pushId);

}
