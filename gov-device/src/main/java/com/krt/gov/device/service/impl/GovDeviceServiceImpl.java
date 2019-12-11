package com.krt.gov.device.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.krt.common.base.BaseServiceImpl;
import com.krt.common.bean.PageHelper;
import com.krt.common.bean.Query;
import com.krt.gov.common.constant.CommonApiConst;
import com.krt.gov.common.utils.CommonUtil;
import com.krt.gov.device.entity.GovDevice;
import com.krt.gov.device.mapper.GovDeviceMapper;
import com.krt.gov.device.service.IGovDeviceService;
import com.krt.gov.hall.entity.GovHall;
import com.krt.gov.hall.mapper.GovHallMapper;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import static com.krt.gov.device.constant.DeviceConstant.*;


/**
 * 设备服务接口实现层
 *
 * @author liuwei
 * @version 1.0
 * @date 2019年08月12日
 */
@Service
public class GovDeviceServiceImpl extends BaseServiceImpl<GovDeviceMapper, GovDevice> implements IGovDeviceService {

    @Resource
    private GovDeviceMapper govDeviceMapper;

    @Resource
    private GovHallMapper govHallMapper;

    /**
     * 根据设备id 获取设备的区域位置信息
     *
     * @param id
     * @return
     */
    @Override
    public Map selectDevPosition(Integer id) {
        return govDeviceMapper.selectDevPosition(id);
    }

    /**
     * 设置设备的区域位置坐标
     *
     * @param x
     * @param y
     * @param id
     */
    @Override
    public void updateDevPosition(Integer x, Integer y, Integer id) {
        govDeviceMapper.updateDevPosition(x, y, id);
    }

    @Override
    public void updateStateByDeviceId(GovDevice device) {
        govDeviceMapper.updateStateByDeviceId(device);
    }

    @Override
    public void updateStatusByDeviceId(Long deviceId, Integer port1, Integer port2, Integer port3, Integer port4, Integer port5) {
        govDeviceMapper.updateStatusByDeviceId(deviceId, port1, port2, port3, port4, port5);
    }

    @Override
    public void updateDataByDeviceId(Long deviceId, String data) {
        govDeviceMapper.updateDataByDeviceId(deviceId, data);
    }

    @Override
    public void offLineAllDevice() {
        govDeviceMapper.offLineAllDevice();
    }


    @Override
    public List listDevicesForDeviceApi(String area, Integer hallId, Integer status, Integer groupId) {
        List<Map> list = govDeviceMapper.listDevicesByHallId(area, hallId, status, groupId);
        for (Map map :
                list) {
            JSONObject action = JSONObject.parseObject(map.get("action") + "");
            if (action != null) {
                map.put("action", action);
                map.put("onOff", Integer.valueOf(action.getString("onOff")));
            }
            map.put("icon", CommonUtil.getIconUrl(map.get("icon") + ""));
        }

        return list;
    }


    @Override
    public JSONObject selectAllDevices(String area, Integer hallId) {
        //所有设备信息
        List<Map> maps = govDeviceMapper.selectAllDevices(area, hallId);
        //设备状态
        Map deviceStatus = govDeviceMapper.selectDeviceStatus(area, hallId);
        //大厅信息
        GovHall govHall = govHallMapper.selectById(hallId);

        //解决数字带引号问题
        Integer total = Integer.parseInt(deviceStatus.get("total") + "");
        deviceStatus.put("total", total);

        //创建list集合保存设备
        List list = new ArrayList();
        for (Map map : maps) {
            JSONObject action = JSONObject.parseObject((String) map.get("action"));
            if (action != null) {
                map.put("onOff", Integer.valueOf(action.getString("onOff")));
            }
            map.remove("action");
            //将坐标缩小1百倍
            if (map.get("xaxis") != null) {
                Double x = Double.parseDouble((map.get("xaxis") + ""));
                Double xaxis = x / 100;
                map.put("xaxis", xaxis);
            } else {
                map.put("xaxis", 0);
            }
            if (map.get("yaxis") != null) {
                Double y = Double.parseDouble((map.get("yaxis") + ""));
                Double yaxis = y / 100;
                map.put("yaxis", yaxis);
            } else {
                map.put("yaxis", 0);
            }
            map.put("icon", CommonUtil.getIconUrl(map.get("icon") + ""));
            //将map转为JSONObject
            JSONObject jsonObject = JSONObject.parseObject(JSON.toJSONString(map));
            list.add(jsonObject);
        }
        //将设备集合保存到设备信息map中,并将map转为json对象
        deviceStatus.put("equipment_icon", list);
        JSONObject deviceJSONObject = JSONObject.parseObject(JSON.toJSONString(deviceStatus));
        deviceJSONObject.put("layout_img", CommonUtil.getLayoutUrl(govHall.getLayout()));
        return deviceJSONObject;
    }

    /**
     * 设备布局接口根据id查询设备详情信息
     *
     * @param id
     * @return
     */
    @Override
    public JSONObject selectDeviceById(Integer id) {
        Map map = govDeviceMapper.selectDeviceById(id);
        if (map == null) {
            return new JSONObject();
        }

        map.put("actionLimit", CommonApiConst.ACTION_LIMIT);
        if (map.get("action") != null) {
            String actionStr = (String) map.get("action");
            JSONObject actionJson = JSONObject.parseObject(actionStr);
            map.put("action", actionJson);
        }
        if (map.get("info") != null) {
            String infoStr = (String) map.get("info");
            JSONObject infoJson = JSONObject.parseObject(infoStr);
            infoJson.remove("sweepingWind");
            infoJson.remove("function");
            infoJson.remove("sensitivity");
            map.put("info", infoJson);
        }
        if (map.get("data") != null) {
            String actionStr = (String) map.get("data");
            JSONObject actionJson = JSONObject.parseObject(actionStr);
            map.put("data", actionJson);
        }
        JSONObject jsonObject = JSONObject.parseObject(JSON.toJSONString(map));
        return jsonObject;
    }

    /**
     * 平台大厅设备状态查询
     *
     * @return
     */
    @Override
    public JSONObject selectDeviceStatus(String area) {
        Map deviceStatus = govDeviceMapper.selectDeviceStatus(area, null);
        //解决出现引号问题
        Integer total = Integer.parseInt(deviceStatus.get("total") + "");
        deviceStatus.put("total", total);
        JSONObject jsonObject = JSONObject.parseObject(JSON.toJSONString(deviceStatus));
        return jsonObject;
    }

    @Override
    public void updateBatchByIdPort(List<GovDevice> device) {
        govDeviceMapper.updateBatchByIdPort(device);
    }


    @Override
    public void changeAirConditioningStatus(Long deviceId, Integer temp, Integer humi) {
        Integer id = govDeviceMapper.getWarningDeviceIdByTH(deviceId, temp, humi);
        //存在需要预警的设备
        if (id != null) {
            //满足预警的前置条件设备，status修改状态为2(预警状态)
            govDeviceMapper.updateStatus(2, id);
        } else {
            //如果不满足预警条件，当前设备status又为2，说明预警结束，修改status为action中onOff的开关状态
            List<GovDevice> govDevices = govDeviceMapper.selectByDeviceId(deviceId + "");
            if (govDevices.size() == 1) {
                Integer status = govDevices.get(0).getStatus();
                if (status == 2) {
                    String action = govDevices.get(0).getAction();
                    if (action != null || action.equals("")) {
                        Integer integer = govDevices.get(0).getId();
                        JSONObject object = JSONObject.parseObject(action);
                        String onOff = object.getString("onOff");
                        govDeviceMapper.updateStatus(Integer.parseInt(onOff), integer);
                    }

                }

            }

        }

    }

    @Override
    public void changeSwitchStatus(Long deviceId, Integer port1, Integer port2, Integer port3, Integer port4, Integer port5) {
        //满足预警条件的开关id
        List<Integer> warningSwitchId = govDeviceMapper.getWarningSwitchId(deviceId, port1, port2, port3, port4, port5);
        //在所有启用的预警规则中关联的当前deviceId对应的开关
        List<Integer> idList = govDeviceMapper.selectSwitchIdOnWarning(deviceId);
        for (Integer id :
                warningSwitchId) {
            //满足预警的前置条件设备，status修改状态为2(预警状态)
            govDeviceMapper.updateStatus(2, id);
            //排除满足预警条件的开关id
            idList.remove(id);
        }

        //如果不满足预警条件，当前设备status又为2，说明预警结束，修改status为action中onOff的开关状态
        for (Integer integer :
                idList) {
            GovDevice govDevice = govDeviceMapper.selectById(integer);
            if (govDevice.getStatus() == 2) {
                String action = govDevice.getAction();
                JSONObject object = JSONObject.parseObject(action);
                govDeviceMapper.updateStatus(Integer.parseInt(object.getString("onOff")), integer);
            }
        }
    }

    /**
     * 根据设备类型和品牌选择码库
     *
     * @return
     */
    @Override
    public IPage selectCodeBank(Map para) {
        Query query = new Query(para);
        Page page = query.getPage();
        PageHelper.startPage(page);
        List list = govDeviceMapper.selectCodeBank(para);
        page.setRecords(list);
        return page;
    }

    @Override
    public void emptyPaperInitialization(Integer id) {
        String data = baseMapper.getData(id);
        JSONObject jsonObject = JSONObject.parseObject(data);
        String string = jsonObject.get("DIS").toString();
        int dis = (int) Double.parseDouble(string);
        baseMapper.emptyPaperInitialization(id, dis);
    }

    @Override
    public void fullPaperInitialization(Integer id) {
        String data = baseMapper.getData(id);
        JSONObject jsonObject = JSONObject.parseObject(data);
        String string = jsonObject.get("DIS").toString();
        int dis = (int) Double.parseDouble(string);
        baseMapper.fullPaperInitialization(id, dis);
    }

    @Override
    public void resetPaperInitialization(Integer id) {
        baseMapper.resetPaperInitialization(id);
    }

    @Override
    public Double getDisPercent(Integer id) {
        double d = 0.0;
        GovDevice govDevice = baseMapper.getPrinterInfo(id);
        JSONObject jsonObject = JSONObject.parseObject(govDevice.getData());
        //判断是否是热敏打印机
        if ("30".equals(jsonObject.get("CMD") + "")) {
            int disFull = govDevice.getDisFull();
            int disEmpty = govDevice.getDisEmpty();
            if (disEmpty != 0 && disFull != 0 && disEmpty > disFull) {
                String string = jsonObject.get("DIS").toString();
                int dis = (int) Double.parseDouble(string);
                d = (double) (disEmpty - dis) / (disEmpty - disFull);
            }

        }
        //四舍五入保留两位小数
        d = (double) Math.round(d * 100) / 100;
        return d;
    }

    @Override
    public GovDevice getPrinterInfo(Integer id) {
        return baseMapper.getPrinterInfo(id);
    }

    @Override
    public Integer updatePrinterInfo(GovDevice govDevice) {
        return baseMapper.updatePrinterInfo(govDevice.getMachine(), govDevice.getDeviceId(), govDevice.getData());
    }

    @Override
    public boolean deviceCheck(GovDevice govDevice) {
        if (TYPE_AIRCONDITIONING.equals(govDevice.getType())) {
            //空调类型时
            List<GovDevice> deviceList = baseMapper.selectByDeviceId(govDevice.getDeviceId() + "");
            //该deviceId存在
            if (deviceList.size() > 0) {
                if (deviceList.size() == 1 && govDevice.getId() != null) {
                    //修改时
                    if ((govDevice.getId()).equals(deviceList.get(0).getId())) {
                        return true;
                    } else {
                        return false;
                    }
                } else {
                    //添加时
                    return false;
                }
            }

        } else if (TYPE_SWITCH.equals(govDevice.getType())) {
            GovDevice device = null;
            //开关类型时
            if (PORT_ELEC_METER.equals(govDevice.getPort()) || PORT_PRINTER.equals(govDevice.getPort())) {
                //非IO类子设备
                device = baseMapper.getNonIoDevice(govDevice.getDeviceId(), govDevice.getPort(), govDevice.getMachine());
            } else {
                //IO类子设备
                device = baseMapper.getIoDevice(govDevice.getDeviceId(), govDevice.getPort());
            }

            //判断时候允许添加修改
            if (device == null) {
                return true;
            }

            //添加时
            if (govDevice.getId() == null) {
                return false;
            }

            //修改时可以相同
            if ((govDevice.getId()).equals(device.getId())) {
                return true;
            }
        }

        //其他情况
        return false;
    }


    @Override
    public List<GovDevice> listDevicesByGroupId(String area, Integer groupId) {
        return baseMapper.listDevicesByGroupId(area, groupId);
    }

    @Override
    public void updateAmmeterData(Integer error, String data, Long deviceId, String port, String machine) {
        GovDevice govDevice = new GovDevice();
        if (error == 0) {
            //设备数据正确
            govDevice.setData(data);
            govDevice.setStatus(1);
        } else {
            //设备数据错误
            govDevice.setStatus(2);
        }
        baseMapper.update(govDevice, new UpdateWrapper<GovDevice>().eq("device_id", deviceId).eq("port", port).eq("machine", machine));
    }

    @Override
    public void updateInfraredFlowData(String data, Long productId, Long deviceId) {
        JSONObject newDataJsonObj = JSONObject.parseObject(data);
        //获取前一条红外人流监控数据
        GovDevice device =
                baseMapper.selectOne(new QueryWrapper<GovDevice>().last("limit 1").eq("device_id", deviceId).eq("product_id", productId).eq(
                        "machine", newDataJsonObj.get("MACHINE") + ""));
        if (device != null && !"".equals(device.getData())) {
            JSONObject oldDataJsonObj = JSONObject.parseObject(device.getData());

            //统计正反向人流量
            int oldPosNum = Integer.parseInt(oldDataJsonObj.get("POS_NUM") + "");
            int oldNegNum = Integer.parseInt(oldDataJsonObj.get("NEG_NUM") + "");

            int newPosNum = Integer.parseInt(newDataJsonObj.get("POS_NUM") + "");
            int newNegNum = Integer.parseInt(newDataJsonObj.get("NEG_NUM") + "");
            int newRst = Integer.parseInt(newDataJsonObj.get("RST") + "");

            if (oldPosNum >= newPosNum || oldNegNum >= newNegNum) {
                //当出现人流量值小于前值时，判断RST值是否小于前值，如果是当前的人流量总数应加上前面人流量总数的基数
                int oldRst = Integer.parseInt(oldDataJsonObj.get("RST") + "");

                if (oldRst >= newRst) {
                    newPosNum += oldPosNum;
                    newNegNum += oldNegNum;
                }
            }

            //统计人通过时速度快慢
            int fast = Integer.parseInt(oldDataJsonObj.get("FAST") + "");
            int medium = Integer.parseInt(oldDataJsonObj.get("MEDIUM") + "");
            int slow = Integer.parseInt(oldDataJsonObj.get("SLOW") + "");

            //本次人通过的时间
            int time = Integer.parseInt(newDataJsonObj.get("TIME") + "");
            if (time < 200) {
                //快速
                fast++;
            } else if (time > 1000) {
                //慢速
                slow++;
            } else {
                //中速
                medium++;
            }

            JSONObject jsonObject = new JSONObject();
            jsonObject.put("RST", newRst);
            jsonObject.put("FAST", fast);
            jsonObject.put("MEDIUM", medium);
            jsonObject.put("SLOW", slow);
            jsonObject.put("POS_NUM", newPosNum);
            jsonObject.put("NEG_NUM", newNegNum);
            GovDevice govDevice = new GovDevice();
            govDevice.setData(jsonObject.toJSONString());

            baseMapper.update(govDevice, new UpdateWrapper<GovDevice>().eq("device_id", deviceId).eq("product_id", productId).eq("machine", newDataJsonObj.get("MACHINE") + ""));
        }
    }
}
