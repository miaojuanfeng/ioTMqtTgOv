package com.krt.api.controller.html;

import com.alibaba.fastjson.JSONObject;
import com.krt.common.annotation.KrtIgnoreAuth;
import com.krt.common.bean.ReturnBean;
import com.krt.common.validator.Assert;
import com.krt.gov.device.service.IGovDeviceService;
import com.krt.gov.device.service.IGovDeviceTypeService;
import com.krt.gov.group.service.IGovGroupService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 郭明德
 * @description 设备管理接口
 * @date 2019/8/20 20:46
 */
@Slf4j
@Controller
@RequestMapping("api/device")
@Api(tags = "C、设备管理接口")
public class DeviceManageApi {
    @Autowired
    private IGovGroupService govGroupService;

    @Autowired
    private IGovDeviceService govDeviceService;

    @KrtIgnoreAuth
    @GetMapping("group")
    @ApiOperation(value = "设备分组列表")
    @ResponseBody
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", dataType = "Long", name = "area", value = "区域编码",required = true),
            @ApiImplicitParam(paramType = "query", dataType = "Long", name = "hallId", value = "大厅ID",required = true)
    })
    public ReturnBean ClassList(String area,Integer hallId) {
        Assert.isBlank(area, "area不能为空");
        Assert.isNull(hallId, "hallId不能为空");

        Map map = new HashMap(2);
        //获取设备类型数据
        List list = govGroupService.selectDeviceGroup(area,hallId);
        map.put("group",list);
        //温度值
        map.put("temperature", 28);
        //湿度值
        map.put("humidity", 70);
        return ReturnBean.ok(map);
    }


    @KrtIgnoreAuth
    @GetMapping("list")
    @ApiOperation(value = "根据条件查设备列表")
    @ResponseBody
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", dataType = "Long", name = "area", value = "区域编码",required = true),
            @ApiImplicitParam(paramType = "query", dataType = "Long", name = "hallId", value = "设备所在大厅ID",required = true),
            @ApiImplicitParam(paramType = "query", dataType = "Long", name = "groupId", value = "分组ID 不传为全部",required = false),
            @ApiImplicitParam(paramType = "query", dataType = "Long", name = "status", value = "状态 0关闭 1开启 2故障 不传为全部",required = false)
    })
    public ReturnBean DeviceBatchOpen(String area,Integer hallId,Integer status,Integer groupId) {
        Assert.isBlank(area, "area不能为空");
        Assert.isNull(hallId, "hallId不能为空");
        List list = govDeviceService.listDevicesForDeviceApi(area, hallId, status, groupId);
        return ReturnBean.ok(list);
    }

}
