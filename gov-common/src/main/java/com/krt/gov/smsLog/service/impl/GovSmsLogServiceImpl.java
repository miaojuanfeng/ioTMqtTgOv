package com.krt.gov.smsLog.service.impl;

import com.krt.common.base.BaseServiceImpl;
import com.krt.gov.smsLog.entity.GovSmsLog;
import com.krt.gov.smsLog.mapper.GovSmsLogMapper;
import com.krt.gov.smsLog.service.IGovSmsLogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Date;


/**
 * 短信发送日志服务接口实现层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月12日
 */
@Service
public class GovSmsLogServiceImpl extends BaseServiceImpl<GovSmsLogMapper, GovSmsLog> implements IGovSmsLogService {
    @Resource
    private GovSmsLogMapper govSmsLogMapper;

    @Override
    public void addSmsLog(Integer type, Integer id, String phone, String content, String staffName) {
        //预警短信
        if (type == 1) {
            GovSmsLog govSmsLog = new GovSmsLog();
            govSmsLog.setType(type);
            govSmsLog.setWarningId(id);
            govSmsLog.setStaffPhone(phone);
            govSmsLog.setSmsContent(content);
            govSmsLog.setStaffName(staffName);
            govSmsLog.setSendTime(new Date());
            govSmsLogMapper.insert(govSmsLog);
        } else {
            //推送短信
            GovSmsLog govSmsLog = new GovSmsLog();
            govSmsLog.setType(type);
            govSmsLog.setPushId(id);
            govSmsLog.setStaffPhone(phone);
            govSmsLog.setSmsContent(content);
            govSmsLog.setStaffName(staffName);
            govSmsLog.setSendTime(new Date());
            govSmsLogMapper.insert(govSmsLog);
        }
    }
}
