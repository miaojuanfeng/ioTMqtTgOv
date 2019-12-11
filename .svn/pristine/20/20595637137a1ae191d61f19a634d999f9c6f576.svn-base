package com.krt.gov.group.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.krt.gov.common.utils.CommonUtil;
import com.krt.gov.device.mapper.GovDeviceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.krt.gov.group.entity.GovGroup;
import com.krt.gov.group.mapper.GovGroupMapper;
import com.krt.gov.group.service.IGovGroupService;
import com.krt.common.base.BaseServiceImpl;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * 设备分组服务接口实现层
 *
 * @author 刘威
 * @version 1.0
 * @date 2019年10月14日
 */
@Service
public class GovGroupServiceImpl extends BaseServiceImpl<GovGroupMapper, GovGroup> implements IGovGroupService {
    @Resource
    private GovDeviceMapper govDeviceMapper;

    @Override
    public List selectDeviceGroup(String area,Integer hallId) {
        List<Map> list = baseMapper.selectDeviceGroups(area,hallId);
        for (Map map :
                list) {
            map.put("total", Integer.parseInt(map.get("total") + ""));
            map.put("earlyWarning", Integer.parseInt(map.get("earlyWarning") + ""));
            map.put("opened", Integer.parseInt(map.get("opened") + ""));
            map.put("icon", CommonUtil.getIconUrl(map.get("icon")+""));
            map.remove("closed");
        }
        Map totalMap = govDeviceMapper.selectDeviceStatus(area,hallId);
        totalMap.put("total", Integer.parseInt(totalMap.get("total") + ""));
        totalMap.put("groupName","全部设备");
        totalMap.put("icon",CommonUtil.getIconUrl("strategy.png"));
        totalMap.remove("closed");
        list.add(0,totalMap);
        return list;
    }

    @Override
    public List selectDeviceGroupsHallData(String area) {
        List<Map> list = baseMapper.selectDeviceGroups(area,null);
        for (Map map :
                list) {
            map.put("total", Integer.parseInt(map.get("total") + ""));
            map.put("earlyWarning", Integer.parseInt(map.get("earlyWarning") + ""));
            map.put("opened", Integer.parseInt(map.get("opened") + ""));
            map.put("closed", Integer.parseInt(map.get("closed") + ""));
            map.put("icon", CommonUtil.getIconUrl(map.get("icon")+""));
        }
        return list;
    }
}
