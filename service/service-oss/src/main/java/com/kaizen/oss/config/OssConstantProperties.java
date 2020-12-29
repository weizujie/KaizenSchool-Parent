package com.kaizen.oss.config;

import lombok.Setter;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 读取配置文件内容类
 * 当项目启动后，Spring 加载配置文件里的值（下面这几个），然后 afterPropertiesSet() 方法就会执行，
 * 把取到的值赋值给 public 修饰的常量就能对外使用（类名.常量名）（面向对象的封装特性？）（解耦）
 */
@Component
@ConfigurationProperties("aliyun.oss.file")
@Setter // 必须加 Setter
public class OssConstantProperties implements InitializingBean {

    /**
     * 存储节点地址
     */
    @Value("{aliyun.oss.file.endpoint}")
    private String endPoint;
    /**
     * 秘钥id
     */
    @Value("{aliyun.oss.file.keyid}")
    private String keyId;
    /**
     * 密匙
     */
    @Value("{aliyun.oss.file.keysecret}")
    private String keySecret;
    /**
     * 文件夹名称
     */
    @Value("{aliyun.oss.file.bucketname}")
    private String bucketName;


    public static String END_POINT;
    public static String KEY_ID;
    public static String KEY_SECRET;
    public static String BUCKET_NAME;


    @Override
    public void afterPropertiesSet() throws Exception {
        END_POINT = endPoint;
        KEY_ID = keyId;
        KEY_SECRET = keySecret;
        BUCKET_NAME = bucketName;
    }
}
