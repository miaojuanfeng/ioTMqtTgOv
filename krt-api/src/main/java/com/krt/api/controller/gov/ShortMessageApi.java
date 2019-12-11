package com.krt.api.controller.gov;

import com.alibaba.fastjson.JSONObject;
import com.krt.common.annotation.KrtIgnoreAuth;
import com.krt.common.bean.ReturnBean;
import com.krt.common.util.Base64Utils;
import com.krt.common.util.HttpUtils;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

/**
 * @author 郭明德
 * @description 短信接口
 * @date 2019/8/13 16:26
 */
@Slf4j
@Controller
@RequestMapping("api/sendMessage")
@Api(tags = "5、短信接口")
public class ShortMessageApi {

    private static String card_id = "20190813090928";
    private static String card_pwd = "572319";
    private static String server_url = "http://211.149.186.179:8052/messagecenter/messagetool";
    private static String voice_yzm_url = "";

    @KrtIgnoreAuth
    @GetMapping("textMessage")
    @ApiOperation(value = "普通短信接口")
    @ResponseBody
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", dataType = "String", name = "phone", value = "手机号", required = false),
            @ApiImplicitParam(paramType = "query", dataType = "String", name = "content", value = "短信内容", required = false)
    })
    public ReturnBean textMessage(@RequestParam("phone") String phone, @RequestParam("content") String content){
        return sendMsg(server_url, phone, content);
    }

    @KrtIgnoreAuth
    @PostMapping("voiceMessage")
    @ApiOperation(value = "语音短信接口")
    @ResponseBody
    @ApiImplicitParams({
            @ApiImplicitParam(paramType = "query", dataType = "String", name = "phone", value = "手机号", required = true),
            @ApiImplicitParam(paramType = "query", dataType = "String", name = "content", value = "短信内容", required = true)
    })
    public ReturnBean voiceMessage(String phone, String content){
        return sendMsg(voice_yzm_url, phone, content);
    }

    /**
     * 发送短信
     * @param server_url 服务URL
     * @param phone 手机号
     * @param content 短信内容
     */
    public static ReturnBean sendMsg(String server_url, String phone, String content) {
        try {
            JSONObject result = null;
            JSONObject message = new JSONObject();
            message.put("card_id", card_id);
            message.put("card_pwd", card_pwd);
            message.put("to", phone);
            message.put("content", content);

            //加密
            String msgContent = Base64Utils.encode(message.toString().getBytes("UTF-8"), 0, message.toString().getBytes("UTF-8").length);

            String resultString = HttpUtils.doPostJsonStr(server_url, msgContent, null);
            resultString = new String(Base64Utils.decode(resultString.toString()), "UTF-8");

            log.debug("短信接口返回:" + resultString);
            result = JSONObject.parseObject(resultString);
            String isSuccess = result.getString("isSuccess");
            if ("true".equals(isSuccess)) {
                int shengyu = result.getInteger("shengyu");
                if (shengyu == 100) {
                    log.error("短信只剩下100条请及时充值" + phone);
                }
                return ReturnBean.ok("发送成功");
            } else {
                String isSuccess_remark = result.getString("isSuccess_remark");
                if ("1".equals(isSuccess_remark)) {
                    log.error("短信发送失败~短信接口故障" + phone);
                }
                if ("2".equals(isSuccess_remark)) {
                    log.error("短信发送失败~短信服务器故障" + phone);
                }
                if ("3".equals(isSuccess_remark)) {
                    log.error("短信发送失败~短信余额不足" + phone);
                }
                if ("4".equals(isSuccess_remark)) {
                    log.error("短信发送失败~短信账号密码错误" + phone);
                }
                if ("5".equals(isSuccess_remark)) {
                    log.error("短信发送失败~短信关键字 重复" + phone);
                }
                return ReturnBean.error(isSuccess_remark);
            }
        } catch (Exception e) {
            log.error("短信发送异常" + phone, e);
            return ReturnBean.error("短信发送错误");
        }
    }

}
