package com.krt.gov.smsLog.service;

import com.krt.gov.smsLog.entity.GovSmsLog;
import com.krt.common.base.IBaseService;


/**
 * 短信发送日志服务接口层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月12日
 */
public interface IGovSmsLogService extends IBaseService<GovSmsLog>{

    /**
     * 添加推送短信日志
     * @param type 1预警短信、2推送短信
     * @param id 预警短信时为warningId,推送短信时为pushId
     * @param phone
     * @param content
     */
    void addSmsLog(Integer type, Integer id, String phone, String content,String staffName);
}
