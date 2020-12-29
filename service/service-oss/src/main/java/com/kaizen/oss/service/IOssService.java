package com.kaizen.oss.service;

import org.springframework.web.multipart.MultipartFile;

public interface IOssService {
    /**
     * 上传头像到 oss
     *
     * @param file 获取上传文件的类
     * @return avatarUrl
     */
    String uploadFileAvatar(MultipartFile file);
}
