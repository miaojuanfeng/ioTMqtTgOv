package com.krt.gov.common.utils;

public class TopicNameUtil {

    public static String cmdSet(Long productId, Long deviceId) {
        return "/sys/"+productId+"/"+deviceId+"/thing/cmd/set";
    }
}
