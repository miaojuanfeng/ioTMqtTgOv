package com.krt.gov.strategy.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.krt.common.util.StringUtils;
import com.krt.gov.device.entity.GovDevice;
import com.krt.gov.device.service.IGovDeviceService;
import com.krt.gov.strategy.service.CallBackService;
import com.krt.gov.thread.CallbackThread;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

@Service
public class CallBackServiceImpl implements CallBackService {

    private static final String URL_AC = "http://localhost:32003/iot-cloud/api/cmd/ac";
    private static final String URL_SWT = "http://localhost:32003/iot-cloud/api/cmd/swt";

    @Autowired
    private IGovDeviceService deviceService;

    @Override
    public void swt(List<Map> devices){
        Integer deviceLen = devices.size();
        if( deviceLen > 0 ) {
            List<GovDevice> deviceList = new ArrayList<>();
            String[] ids = new String[deviceLen];
            String[] ctrl = new String[deviceLen];
            String[] onOff = new String[deviceLen];
            String[] time = new String[deviceLen];

            for (int i = 0; i < deviceLen; i++) {
                JSONObject action = JSONObject.parseObject(String.valueOf(devices.get(i).get("action")));
                ids[i] = String.valueOf(devices.get(i).get("deviceId"));
                ctrl[i] = String.valueOf(devices.get(i).get("port"));
                onOff[i] = action.getString("onOff");
                time[i] = action.getString("time");

                action.put("onOff", onOff[i]);
                GovDevice updateDevice = new GovDevice();
                updateDevice.setId(Integer.valueOf(String.valueOf(devices.get(i).get("dId"))));
                updateDevice.setAction(action.toString());
//                updateDevice.setStatus(Integer.valueOf(onOff[i])==0?1:0);
                deviceList.add(updateDevice);
            }

            IdentityHashMap map = new IdentityHashMap();
            map.put("deviceId", StringUtils.join(ids, ","));
            map.put("ctrl", StringUtils.join(ctrl, ","));
            map.put("onOff", StringUtils.join(onOff, ","));
            map.put("time", StringUtils.join(time, ","));

            CallbackThread.add(URL_SWT, map);

            if( deviceList.size() > 0 ){
                deviceService.updateBatchByIdPort(deviceList);
            }
        }
    }

    @Override
    public void ac(List<Map> devices) {
        Integer deviceLen = devices.size();
        if( deviceLen > 0 ) {
            List<GovDevice> deviceList = new ArrayList<>();
            String[] ids = new String[deviceLen];
            String[] power = new String[deviceLen];
            String[] mode = new String[deviceLen];
            String[] tem = new String[deviceLen];
            String[] windSpeed = new String[deviceLen];
            for (int i = 0; i < deviceLen; i++) {
                JSONObject action = JSONObject.parseObject(String.valueOf(devices.get(i).get("action")));
                ids[i]       = String.valueOf(devices.get(i).get("deviceId"));
                mode[i]      = action.getString("mode");
                tem[i]       = String.valueOf(Integer.valueOf(action.getString("temp"))-16);
                power[i]     = action.getString("onOff");
                windSpeed[i] = "0";

                action.put("onOff", power[i]);
                GovDevice updateDevice = new GovDevice();
                updateDevice.setId(Integer.valueOf(String.valueOf(devices.get(i).get("dId"))));
                updateDevice.setAction(action.toString());
                updateDevice.setStatus(Integer.valueOf(power[i])==0?1:0);
                deviceList.add(updateDevice);
            }

            IdentityHashMap map = new IdentityHashMap();
            map.put("deviceId", StringUtils.join(ids, ","));
            map.put("power", StringUtils.join(power, ","));
            map.put("mode", StringUtils.join(mode, ","));
            map.put("temp", StringUtils.join(tem, ","));
            map.put("windSpeed", StringUtils.join(windSpeed, ","));

            CallbackThread.add(URL_AC, map);

            if( deviceList.size() > 0 ){
                deviceService.updateBatchByIdPort(deviceList);
            }
        }
    }
}
