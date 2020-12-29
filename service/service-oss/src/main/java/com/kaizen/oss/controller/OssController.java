package com.kaizen.oss.controller;

import com.kaizen.oss.service.IOssService;
import com.kaizen.utils.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

@Api("阿里云OSS文件上传")
@RestController
@RequestMapping("/oss/file")
@CrossOrigin
public class OssController {

    /**
     * 注入 iOssService，不用 @Autowired
     */
    public final IOssService ossService;

    public OssController(IOssService ossService) {
        this.ossService = ossService;
    }

    /**
     * @param file 获取文件的类
     * @return R
     */
    @ApiOperation("上传文件")
    @PostMapping
    public R uploadOssFile(@ApiParam("文件") MultipartFile file) {
        // 获取上传文件，返回 oos 里的路径
        String avatarUrl = ossService.uploadFileAvatar(file);
        return R.success().data("url", avatarUrl);
    }
}
