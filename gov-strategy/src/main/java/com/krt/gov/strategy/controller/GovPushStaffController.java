package com.krt.gov.strategy.controller;

import com.krt.common.annotation.KrtLog;
import com.krt.common.base.BaseController;
import com.krt.common.bean.ReturnBean;
import com.krt.gov.strategy.entity.GovPushStaff;
import com.krt.gov.strategy.service.IGovPushStaffService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.constraints.NotNull;

/**
 * 推送人员设置控制层
 *
 * @author 郭明德
 * @version 1.0
 * @date 2019年07月13日
 */
@Controller
public class GovPushStaffController extends BaseController {

    @Autowired
    private IGovPushStaffService govPushStaffService;

}
