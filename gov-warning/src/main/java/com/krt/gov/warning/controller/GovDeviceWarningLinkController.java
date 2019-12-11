package com.krt.gov.warning.controller;

import com.krt.common.annotation.KrtLog;
import com.krt.common.base.BaseController;
import com.krt.common.bean.ReturnBean;
import com.krt.gov.warning.entity.GovDeviceWarningLink;
import com.krt.gov.warning.service.IGovDeviceWarningLinkService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 设备预警规则关联的设备控制层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月12日
 */
@Controller
public class GovDeviceWarningLinkController extends BaseController {

    @Autowired
    private IGovDeviceWarningLinkService govDeviceWarningLinkService;



}
