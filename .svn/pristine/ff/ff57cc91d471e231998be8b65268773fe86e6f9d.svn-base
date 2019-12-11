package com.krt.api.controller.html;

import com.krt.common.annotation.KrtIgnoreAuth;
import com.krt.common.bean.ReturnBean;
import com.krt.common.bean.ReturnCode;
import com.krt.common.constant.GlobalConstant;
import com.krt.common.session.SessionUser;
import com.krt.common.util.ShiroUtils;
import com.krt.common.validator.Assert;
import com.krt.gov.common.utils.CommonUtil;
import com.krt.sys.entity.User;
import com.krt.sys.service.IRoleScopeService;
import com.krt.sys.service.ITokenService;
import com.krt.sys.service.IUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.BeanUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @author 刘威
 * @version 1.0
 * @Description: 登录接口
 * @date 2019年10月8日 13:58:51
 */
@RestController
@RequestMapping("api")
@Api(tags = "0、登录接口API")
public class ApiLoginController {
    @Resource
    private IUserService userService;

    @Resource
    private ITokenService tokenService;

    @Resource
    private IRoleScopeService roleScopeService;


    /**
     * 登录
     *
     * @param username
     * @param password
     * @return
     */
    @KrtIgnoreAuth
    @PostMapping("login")
    @ApiOperation(value = "登录", notes = "登录说明")
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", dataType = "string", name = "username", value = "账号", required = true),
            @ApiImplicitParam(paramType = "query", dataType = "string", name = "password", value = "密码", required = true),
            @ApiImplicitParam(paramType = "query", dataType = "string", name = "verificationCode", value = "验证码", required = true)
    })
    public ReturnBean<Map> login(String username, String password,String verificationCode) {
        Assert.isBlank(username, "账号不能为空");
        Assert.isBlank(password, "密码不能为空");
        Assert.isBlank(verificationCode, "验证码不能为空");
        if (!verificationCode.equals(ShiroUtils.getSessionAttribute(GlobalConstant.KAPTCHA_SESSION_KEY))){
            ReturnCode rc = ReturnCode.VerificationCode_Error;
            return ReturnBean.error(rc);
        }
        Map userMap = userService.selectByUsername(username);
        if (userMap != null) {
            String oldPsd = userMap.get("password") + "";
            password = ShiroUtils.getMD5(password, userMap.get("salt") + "");
            if (password.equals(oldPsd)) {
                String id = userMap.get("id").toString();
                Map<String, Object> map = tokenService.createToken(Integer.valueOf(id));

                //保存用户信息到session中
                User user = userService.selectById(id);
                SessionUser sessionUser = new SessionUser();
                BeanUtils.copyProperties(user, sessionUser);
                ShiroUtils.setSessionAttribute(GlobalConstant.SESSION_USER, sessionUser);
                // 超时时间
                SecurityUtils.getSubject().getSession().setTimeout(6*60*60*1000);
                //数据权限
                if (!sessionUser.isAdmin()) {
                    List<String> dataId = roleScopeService.selectUserDataScope(user);
                    ShiroUtils.setSessionAttribute(GlobalConstant.DATA_SCOPE, dataId);
                }

                //设置接口返回的用户信息
                map.put("userInfo",sessionUser);

                return ReturnBean.ok(map);
            } else {
                ReturnCode rc = ReturnCode.Account_Password_ERROR;
                return ReturnBean.error(rc);
            }
        } else {
            ReturnCode rc = ReturnCode.Account_Password_ERROR;
            return ReturnBean.error(rc);
        }
    }
}
