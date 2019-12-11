package com.krt.gov.strategy.quartz;

import com.krt.gov.strategy.service.CallBackService;
import com.krt.gov.strategy.service.IDeviceStrategyLinkService;
import com.krt.gov.strategy.service.IGovPushStrategyService;
import com.krt.quartz.entity.Quartz;
import lombok.extern.slf4j.Slf4j;
import org.junit.Test;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author krt
 * @description 设备策略调度
 * @date 2019/8/16 16:04:32
 */
@Component
@Slf4j
public class DeviceStrategyQuartz {

    @Autowired
    private IDeviceStrategyLinkService deviceStrategyLinkService;

    @Autowired
    private CallBackService callBackService;

    @Autowired
    private IGovPushStrategyService govPushStrategyService;

    @Test
    public void process(String strategyId) {
        log.info("DeviceStrategyQuartz data: " + strategyId);
        List<Map> devices = deviceStrategyLinkService.selectDeviceById(Integer.valueOf(strategyId));
        List<Map> swtDevices = new ArrayList<>();
        List<Map> acDevices = new ArrayList<>();
        for (Map device : devices) {
            Integer type = (Integer) device.get("type");
            if (type == 1) {
                swtDevices.add(device);
            } else if (type == 2) {
                acDevices.add(device);
            }
        }
        if (swtDevices.size() > 0) {
            callBackService.swt(swtDevices);
        }
        if (acDevices.size() > 0) {
            callBackService.ac(acDevices);
        }

        //执行了自动策略，如果该设置了推送短信，则推送一条短信给指定用户
        if (swtDevices.size() > 0 || acDevices.size() > 0) {
            govPushStrategyService.sendPushMessage(Integer.valueOf(strategyId));
        }
    }

}
