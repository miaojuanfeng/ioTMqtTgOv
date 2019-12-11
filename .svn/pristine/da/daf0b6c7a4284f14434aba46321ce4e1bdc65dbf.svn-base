package com.krt.gov.device.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.krt.common.base.BaseServiceImpl;
import com.krt.gov.common.utils.CommonUtil;
import com.krt.gov.device.entity.GovDeviceType;
import com.krt.gov.device.mapper.GovDeviceTypeMapper;
import com.krt.gov.device.service.IGovDeviceTypeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


/**
 * 设备类型服务接口实现层
 *
 * @author liuwei
 * @version 1.0
 * @date 2019年08月12日
 */
@Service
public class GovDeviceTypeServiceImpl extends BaseServiceImpl<GovDeviceTypeMapper, GovDeviceType> implements IGovDeviceTypeService {

    @Resource
    private GovDeviceTypeMapper govDeviceTypeMapper;

    /**
     * 获取设备类型
     *
     * @return
     */
    @Override
    public List<GovDeviceType> selectAllDeviceTypes() {
        return govDeviceTypeMapper.selectAllDeviceTypes();
    }

    /**
     * 设备管理接口查询设备类别
     * @param area
     * @return
     */
    @Override
    public List<JSONObject> selectDeviceTypes(String area) {
        List<Map> maps = govDeviceTypeMapper.selectDeviceTypes(area);

        //添加全部设备信息并将map类型转为JSONObject类型
        ArrayList<JSONObject> jsonObjects = new ArrayList<>();
        int totalSum = 0;
        int openedSum = 0;
        int alarmedSum = 0;
        for (Map map : maps) {
            map.remove("closed");

            Integer total = Integer.parseInt(map.get("total") + "");
            Integer opened = Integer.parseInt(map.get("opened") + "");
            Integer alarmed = Integer.parseInt(map.get("alarmed") + "");
            map.put("total", total);
            map.put("opened", opened);
            map.put("alarmed", alarmed);
            map.put("icon", CommonUtil.getIconUrl("device.png"));

            //统计设备、开机设备,故障设备总数
            totalSum += total;
            openedSum += opened;
            alarmedSum += alarmed;
            //将Map转为JSONObject
            JSONObject jsonObject = JSONObject.parseObject(JSON.toJSONString(map));
            jsonObjects.add(jsonObject);
        }
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("id", 0);
        jsonObject.put("name", "全部设备");
        jsonObject.put("total", totalSum);
        jsonObject.put("opened", openedSum);
        jsonObject.put("alarmed", alarmedSum);
        jsonObject.put("icon", CommonUtil.getIconUrl("device.png"));
        jsonObjects.add(0, jsonObject);
        return jsonObjects;
    }

    @Override
    public List<JSONObject> selectDeviceTypesHallData(String area) {
        List<Map> maps = govDeviceTypeMapper.selectDeviceTypes(area);

        //添加全部设备信息并将map类型转为JSONObject类型
        ArrayList<JSONObject> jsonObjects = new ArrayList<>();
        for (Map map : maps) {
            //解决数字出现引号问题
            Integer total = Integer.parseInt(map.get("total") + "");
            Integer opened = Integer.parseInt(map.get("opened") + "");
            Integer alarmed = Integer.parseInt(map.get("alarmed") + "");
            Integer closed = Integer.parseInt(map.get("closed") + "");
            if( Integer.valueOf(String.valueOf(map.get("id"))) == 1 ) {
                map.put("icon", CommonUtil.getIconUrl("light.png"));
                map.put("color", "#FDF3C0");
            }else if( Integer.valueOf(String.valueOf(map.get("id"))) == 2 ) {
                map.put("icon", CommonUtil.getIconUrl("ac.png"));
                map.put("color", "#E1DAFF");
            }
            map.put("total", total);
            map.put("opened", opened);
            map.put("alarmed", alarmed);
            map.put("closed", closed);

            //将Map转为JSONObject
            JSONObject jsonObject = JSONObject.parseObject(JSON.toJSONString(map));
            jsonObjects.add(jsonObject);
        }
        return jsonObjects;
    }
}
