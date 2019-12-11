package com.krt.gov.strategy.util;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.NoopHostnameVerifier;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.ssl.SSLContexts;
import org.apache.http.util.EntityUtils;

import javax.net.ssl.SSLContext;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @author 郭明德
 * @description HTTPS访问工具类
 * @date 2019/6/3 10:13
 */
public class HttpsUtils {

    /**
     * 获取HTTPS加密认证
     * @return
     * @throws Exception
     */
    private static CloseableHttpClient createHttpClient() throws Exception {
        SSLContext sslcontext = SSLContexts.custom().loadTrustMaterial(null, (chain, authType) -> true).build();
        SSLConnectionSocketFactory sslSf = new SSLConnectionSocketFactory(sslcontext, null,
                null, new NoopHostnameVerifier());

        return HttpClients.custom().setSSLSocketFactory(sslSf).build();
    }

    /**
     * 发送https doPost请求
     * @param url 请求的https地址
     * @param data 请求的参数(如需传入多个参数，可将data的数据类型变成Map)
     * @return 返回请求的结果
     */
    public static String doPost(String url, Map<String, String> data){
        try{
            CloseableHttpClient httpClient = createHttpClient();
            // Https Get方法
            //HttpGet httpGet = new HttpGet(url);
            HttpPost httpPost = new HttpPost(url);

            // 写出需要传递的参数
            List<NameValuePair> nameValuePairs = new ArrayList();
            data.forEach((K, V)->{
                nameValuePairs.add(new BasicNameValuePair(K, V));
            });

            httpPost.setEntity(new UrlEncodedFormEntity(nameValuePairs, "UTF-8"));

            CloseableHttpResponse httpResponse = httpClient.execute(httpPost);
            HttpEntity entity = httpResponse.getEntity();
            // 获得返回值
            String result = EntityUtils.toString(entity);

            // 关闭HttpEntity资源
            EntityUtils.consume(entity);

            return result;

            // 程序错误返回 错误代码 "error"
        }catch (Exception e){
            e.printStackTrace();

        }
        return "error";
    }

    /**
     * 发送https doGet请求
     * @param url 请求的https地址
     * @param data 请求的参数(如需传入多个参数，可将data的数据类型变成Map)
     * @return 返回请求的结果
     */
    public static String doGet(String url, Map<String, String> data){
        try{
            CloseableHttpClient httpClient = createHttpClient();

            url += "?";
            // 写出需要传递的参数
            for(String key : data.keySet()){
                url += (key + "=");
                url += (data.get(key) + "&");
            }

            HttpGet httpGet = new HttpGet(url);

            CloseableHttpResponse httpResponse = httpClient.execute(httpGet);
            HttpEntity entity = httpResponse.getEntity();
            // 获得返回值
            String result = EntityUtils.toString(entity, "UTF-8");

            // 关闭HttpEntity资源
            EntityUtils.consume(entity);

            return result;

            // 程序错误返回 错误代码 "error"
        }catch (Exception e){
            e.printStackTrace();

        }
        return "error";
    }

}