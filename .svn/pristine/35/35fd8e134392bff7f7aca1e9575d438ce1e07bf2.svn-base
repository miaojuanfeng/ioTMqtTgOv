package com.krt.gov.warning.service;

import com.krt.gov.warning.entity.GovDeviceWarning;
import com.krt.common.base.IBaseService;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 设备预警设置服务接口层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月10日
 */
public interface IGovDeviceWarningService extends IBaseService<GovDeviceWarning>{

    List<Map> selectWarnTypeByCode(String code);

    void updateStatusById(String status, String id);

    String selectDicByCode(String code);

    GovDeviceWarning selectAllById(Integer id);

    List<Map> selectLinkByWarnId(String warnId);

    List<Map> selectStaffByWarnId(String warnId);

    List<Map> selectTimeByWarnId(String warnId);

    int saveDevAndStaff(String linkNum, String staffName, String warnId);

    /**
     * 根据设备id,温度,湿度获得需要发出警报的设备对应的手机号和需要发送的信息
     * @param deviceId
     * @param temp
     * @param humi
     * @return
     */
    List selectWarningPhoneInfo(Long deviceId, Integer temp, Integer humi);

    /**
     * 开关查预警电话和短信信息
     */
    List<Map> getWarningPhoneBySwitch(String deviceId,Integer port1,Integer port2,Integer port3,Integer port4,Integer port5);

}
