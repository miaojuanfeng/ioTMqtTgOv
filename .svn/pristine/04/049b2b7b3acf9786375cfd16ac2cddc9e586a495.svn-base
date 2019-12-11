package com.krt.gov.common.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.krt.common.util.Base64Utils;
import com.krt.common.util.HttpUtils;
import com.krt.gov.common.service.MessageService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Service
@Slf4j
public class MessageServiceImpl implements MessageService {

    private static final String CARD_ID = "20190813090928";
    private static final String CARD_PWD = "572319";
    private static final String SERVER_URL = "http://211.149.186.179:8052/messagecenter/messagetool";
    private static final String VOICE_YZM_URL = "";

    /**
     * 发送短信
     * @param phone 手机号
     * @param content 短信内容
     */
    @Override
    public boolean sendMsg(String phone, String content) {
        try {
            JSONObject result = null;
            JSONObject message = new JSONObject();
            message.put("card_id", CARD_ID);
            message.put("card_pwd", CARD_PWD);
            message.put("to", phone);
            message.put("content", content);

            //加密
            String msgContent = Base64Utils.encode(message.toString().getBytes("UTF-8"), 0, message.toString().getBytes("UTF-8").length);

            String resultString = HttpUtils.doPostJsonStr(SERVER_URL, msgContent, null);
            resultString = new String(Base64Utils.decode(resultString.toString()), "UTF-8");

            log.debug("短信接口返回:" + resultString);
            result = JSONObject.parseObject(resultString);
            String isSuccess = result.getString("isSuccess");
            if ("true".equals(isSuccess)) {
                int shengyu = result.getInteger("shengyu");
                if (shengyu == 100) {
                    log.error("短信只剩下100条请及时充值" + phone);
                }
                return true;
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
                return false;
            }
        } catch (Exception e) {
            log.error("短信发送异常" + phone, e);
            return false;
        }
    }
}
