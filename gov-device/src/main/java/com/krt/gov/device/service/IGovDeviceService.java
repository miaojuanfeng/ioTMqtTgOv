package com.krt.gov.device.service;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.krt.common.base.IBaseService;
import com.krt.gov.device.entity.GovDevice;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;


/**
 * 设备服务接口层
 *
 * @author liuwei
 * @version 1.0
 * @date 2019年08月12日
 */
public interface IGovDeviceService extends IBaseService<GovDevice> {

    /**
     * 根据设备id 获取设备的区域位置信息
     *
     * @param id
     * @return
     */
    Map selectDevPosition(Integer id);

    /**
     * 设置设备的区域位置坐标
     *
     * @param x
     * @param y
     * @param id
     */
    void updateDevPosition(Integer x, Integer y, Integer id);

    void updateStateByDeviceId(GovDevice device);

    void updateStatusByDeviceId(Long deviceId, Integer port1, Integer port2, Integer port3, Integer port4, Integer port5);

    void updateDataByDeviceId(Long deviceId, String data);

    void offLineAllDevice();


    /**
     * 设备管理接口查询设备列表
     *
     * @param area
     * @param hallId
     * @param status
     * @param groupId
     * @return
     */
    List listDevicesForDeviceApi(String area, Integer hallId, Integer status, Integer groupId);

    /**
     * 设备布局接口查询所有设备
     *
     * @return
     */
    JSONObject selectAllDevices(String area, Integer hallId);

    /**
     * 设备布局接口根据id查询设备详情信息
     *
     * @param id
     * @return
     */
    JSONObject selectDeviceById(Integer id);

    /**
     * 平台大厅设备状态查询
     *
     * @return
     */
    JSONObject selectDeviceStatus(String area);

    void updateBatchByIdPort(List<GovDevice> device);

    /**
     * 根据当前温湿度改变设备状态
     *
     * @param deviceId
     * @param temp
     * @param humi
     */
    void changeAirConditioningStatus(Long deviceId, Integer temp, Integer humi);

    /**
     * 根据当前开关信息改变开关状态
     *
     * @param deviceId
     * @param port1
     * @param port2
     * @param port3
     * @param port4
     * @param port5
     */
    void changeSwitchStatus(Long deviceId, Integer port1, Integer port2, Integer port3, Integer port4, Integer port5);

    IPage selectCodeBank(Map para);

    /**
     * 热敏打印机空纸初始化
     *
     * @param id
     */
    void emptyPaperInitialization(Integer id);

    /**
     * 热敏打印机满纸初始化
     *
     * @param id
     */
    void fullPaperInitialization(Integer id);

    /**
     * 热敏打印机重置
     *
     * @param id
     */
    void resetPaperInitialization(Integer id);

    Double getDisPercent(Integer id);

    /**
     * 获取打印机信息
     *
     * @param id
     * @return
     */
    GovDevice getPrinterInfo(Integer id);

    /**
     * 更新打印机信息
     *
     * @param govDevice machine 打印机标识 deviceId 设备id data 打印机数据
     */
    Integer updatePrinterInfo(GovDevice govDevice);

    /**
     * 开关类型非IO类设备校验(通过deviceId、port和machine可以确定一台子设备)
     * 开关类型IO类设备校验(通过deviceId、port可以确定一台子设备)
     * 空调类型(通过deviceId可以确定一台设备)
     * 不同类型的设备deviceId不能相同(开关类型非IO类设备和开关类型IO类设备属于同一种设备类型deviceId可以相同)
     *
     * @param govDevice type:设备的类型 deviceId:设备id port:子设备类型 machine:开关类子设备标识
     * @return true表示通过检查, 可以进行添加或修改
     */
    boolean deviceCheck(GovDevice govDevice);

    /**
     * 分组查询设备
     *
     * @param area
     * @param groupId
     * @return
     */
    List<GovDevice> listDevicesByGroupId(String area, Integer groupId);

    /**
     * 更新电表数据
     * @param error 错误信息，0表示正确读取，1表示无法读取
     * @param data    设备数据
     * @param deviceId 设备ID
     * @param port    子设备端口
     * @param machine 子设备标识
     */
    void updateAmmeterData(Integer error,String data, Long deviceId, String port, String machine);

    /**
     * 更新红外人流监控数据
     * @param data 设备数据
     * @param productId 产品编号
     * @param deviceId 设备编号
     */
    void updateInfraredFlowData(String data, Long productId, Long deviceId);
}
