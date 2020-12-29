package com.kaizen.oss.service.impl;

import com.aliyun.oss.OSS;
import com.aliyun.oss.OSSClientBuilder;
import com.kaizen.oss.config.OssConstantProperties;
import com.kaizen.oss.service.IOssService;
import lombok.extern.slf4j.Slf4j;
import org.joda.time.DateTime;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

@Service
@Slf4j
public class IOssServiceImpl implements IOssService {
    /**
     * 上传头像到 oss
     *
     * @param file 获取上传文件的类
     * @return avatarUrl
     */
    @Override
    public String uploadFileAvatar(MultipartFile file) {

        // 工具类获取值
        String endPoint = OssConstantProperties.END_POINT;
        String accessKeyId = OssConstantProperties.KEY_ID;
        String accessKeySecret = OssConstantProperties.KEY_SECRET;
        String bucketName = OssConstantProperties.BUCKET_NAME;

        try {
            // 创建 oss 实例
            OSS ossClient = new OSSClientBuilder().build(endPoint, accessKeyId, accessKeySecret);

            // 上传文件输入流
            InputStream inputStream = file.getInputStream();
            // 获取文件的名称
            String fileName = file.getOriginalFilename();
            // 1. 在文件名称添加随机的唯一的值
            String uuid = UUID.randomUUID().toString().replace("-", "");
            fileName = uuid + "_" + fileName;
            // 2. 把文件按照日期分类   2020/12/28/xxx.jpg
            String datePath = new DateTime().toString("yyyy/MM/dd");
            fileName = datePath + "/" + fileName;

            // 调用 oss 方法实现文件上传
            // 第一个参数：bucket 名称; 第二个参数：上传到 oss 的路径和名称；第三个参数：上传文件的输入流
            ossClient.putObject(bucketName, fileName, inputStream);

            // 关闭 ossClient
            ossClient.shutdown();

            // 拼接上传到阿里云 oss 文件的路径手动拼接，然后返回
            return "https://" + bucketName + "." + endPoint + "/" + fileName;
        } catch (IOException e) {
            log.error(e.getMessage());
        }
        return null;
    }
}
