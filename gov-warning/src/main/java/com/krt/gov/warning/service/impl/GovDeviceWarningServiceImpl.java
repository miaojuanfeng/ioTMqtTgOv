package com.krt.gov.warning.service.impl;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;
import com.krt.gov.warning.entity.GovDeviceWarning;
import com.krt.gov.warning.mapper.GovDeviceWarningMapper;
import com.krt.gov.warning.service.IGovDeviceWarningService;
import com.krt.common.base.BaseServiceImpl;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;


/**
 * 设备预警设置服务接口实现层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月10日
 */
@Service
public class GovDeviceWarningServiceImpl extends BaseServiceImpl<GovDeviceWarningMapper, GovDeviceWarning> implements IGovDeviceWarningService {

    @Resource
    private GovDeviceWarningMapper warningMapper;

    /**
     * 根据预警设备类型查询预警类型
     * @param code 预警设备类型code
     * @return
     */
    @Override
    public List<Map> selectWarnTypeByCode(String code) {
        return warningMapper.selectWarnTypeByCode(code);
    }

    /**
     * 修改设备预警状态
     * @param status 修改后的状态
     * @param id 预警设备id
     */
    @Override
    public void updateStatusById(String status, String id) {
        warningMapper.updateStatusById(status, id);
    }

    /**
     * 根据字典code 查找字典name
     * @param code
     * @return
     */
    @Override
    public String selectDicByCode(String code) {
        return warningMapper.selectDicByCode(code);
    }

    /**
     * 查找gov_device_warning表
     * @param id
     * @return
     */
    @Override
    public GovDeviceWarning selectAllById(Integer id) {
        return warningMapper.selectAllById(id);
    }

    /**
     * 根据warnId查找关联的设备
     * @param warnId
     * @return
     */
    @Override
    public List<Map> selectLinkByWarnId(String warnId) {
        return warningMapper.selectLinkByWarnId(warnId);
    }

    /**
     * 根据warnId查找关联的人员
     * @param warnId
     * @return
     */
    @Override
    public List<Map> selectStaffByWarnId(String warnId) {
        return warningMapper.selectStaffByWarnId(warnId);
    }

    /**
     * 根据warnId查找预警时间段
     * @param warnId
     * @return
     */
    @Override
    public List<Map> selectTimeByWarnId(String warnId){
        return warningMapper.selectTimeByWarnId(warnId);
    }

    /**
     * 保存关联设备的数量和推送人员名称
     * @param linkNum
     * @param staffName
     * @param warnId
     * @return
     */
    @Override
    public int saveDevAndStaff(String linkNum, String staffName, String warnId){
        return warningMapper.saveDevAndStaff(linkNum, staffName, warnId);
    }

    /**
     * 根据设备id,温度,湿度获得需要发出警报的设备对应的手机号和需要发送的信息
     * @param deviceId
     * @param temp
     * @param humi
     * @return
     */
    @Override
    public List selectWarningPhoneInfo(Long deviceId, Integer temp, Integer humi) {
        return warningMapper.selectWarningPhoneInfo(deviceId, temp, humi);
    }

    /**
     * 开关查预警电话和短信信息
     */
    @Override
    public List<Map> getWarningPhoneBySwitch(String deviceId,Integer port1,Integer port2,Integer port3,Integer port4,Integer port5) {
        return warningMapper.getWarningPhoneBySwitch(deviceId, port1, port2, port3, port4, port5);
    }


}
