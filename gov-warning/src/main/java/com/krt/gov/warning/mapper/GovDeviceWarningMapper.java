package com.krt.gov.warning.mapper;

import com.krt.common.base.BaseMapper;
import org.apache.ibatis.annotations.Mapper;
import com.krt.gov.warning.entity.GovDeviceWarning;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 * 设备预警设置映射层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月10日
 */
@Mapper
public interface GovDeviceWarningMapper extends BaseMapper<GovDeviceWarning>{
    /**
     * 根据预警设备类型查询预警类型
     * @param code 预警设备类型code
     * @return
     */
    List<Map> selectWarnTypeByCode(String code);

    /**
     * 修改设备预警状态
     * @param status 修改后的状态
     * @param id 预警设备id
     */
    void updateStatusById(@Param("status") String status, @Param("id") String id);

    /**
     * 根据字典code 查找字典name
     * @param code
     * @return
     */
    String selectDicByCode(String code);

    /**
     * 查找gov_device_warning表
     * @param id
     * @return
     */
    GovDeviceWarning selectAllById(Integer id);

    /**
     * 根据warnId查找关联的设备
     * @param warnId
     * @return
     */
    List<Map> selectLinkByWarnId(@Param("warnId") String warnId);

    /**
     * 根据warnId查找关联的人员
     * @param warnId
     * @return
     */
    List<Map> selectStaffByWarnId(@Param("warnId") String warnId);

    /**
     * 根据warnId查找预警时间段
     * @param warnId
     * @return
     */
    List<Map> selectTimeByWarnId(@Param("warnId") String warnId);

    /**
     * 保存关联设备的数量和推送人员名称
     * @param linkNum
     * @param staffName
     * @param warnId
     * @return
     */
    int saveDevAndStaff(@Param("linkNum") String linkNum, @Param("staffName") String staffName, @Param("warnId") String warnId);

    /**
     * 根据设备id,温度,湿度获得需要发出警报的设备对应的手机号和需要发送的信息
     * @param deviceId
     * @param temp
     * @param humi
     * @return
     */
    List<Map> selectWarningPhoneInfo(@Param("deviceId") Long deviceId, @Param("temp") Integer temp, @Param("humi") Integer humi);

    /**
     * 开关查预警电话和短信信息
     * @param deviceId
     * @param port1
     * @param port2
     * @param port3
     * @param port4
     * @param port5
     * @return
     */
    List<Map> getWarningPhoneBySwitch(@Param("deviceId") String deviceId,@Param("port1") Integer port1,@Param("port2") Integer port2,@Param("port3") Integer port3,@Param("port4") Integer port4,@Param("port5") Integer port5);
}
