package com.krt.gov.common.utils;

import javax.servlet.http.HttpServletRequest;

public class CommonUtil {

    public static String getIconUrl(String file) {
        return "https://iot.krtyun.com/iot-mqttgov/dist/img/icon/"+file;
    }

    public static String getLayoutUrl(String file) {
        return "https://iot.krtyun.com/iot-mqttgov/dist/img/layout/"+file;
    }
}
