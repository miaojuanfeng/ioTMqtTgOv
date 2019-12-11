package com.krt.gov.operationLog.service.impl;

import com.krt.common.session.SessionUser;
import com.krt.common.util.SerializeUtils;
import com.krt.common.util.ShiroUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import com.krt.gov.operationLog.entity.GovOperationLog;
import com.krt.gov.operationLog.mapper.GovOperationLogMapper;
import com.krt.gov.operationLog.service.IGovOperationLogService;
import com.krt.common.base.BaseServiceImpl;

import java.util.Date;


/**
 * 用户操作日志服务接口实现层
 *
 * @author 刘威
 * @version 1.0
 * @date 2019年10月29日
 */
@Service
public class GovOperationLogServiceImpl extends BaseServiceImpl<GovOperationLogMapper, GovOperationLog> implements IGovOperationLogService {

    private final static Logger logger = LoggerFactory.getLogger(GovOperationLogServiceImpl.class);

    @Override
    public void insertLog(Long deviceId, Long productId, String deviceName, String port, String action) {
        try{
            GovOperationLog govOperationLog = new GovOperationLog();
            govOperationLog.setAction(action);
            govOperationLog.setDeviceId(deviceId);
            govOperationLog.setDeviceName(deviceName);
            govOperationLog.setProductId(productId);
            govOperationLog.setPort(port);
            govOperationLog.setInsertTime(new Date());

            SessionUser sessionUser = ShiroUtils.getSessionUser();
            govOperationLog.setUsername(sessionUser.getUsername());
            govOperationLog.setInserter(sessionUser.getId());
            baseMapper.insert(govOperationLog);
        }catch (Exception e){
            logger.error("添加操作日志失败");
            e.getMessage();
        }
    }
}