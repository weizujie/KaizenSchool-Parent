package com.kaizen.edu.controller;


import com.kaizen.edu.service.ISubjectService;
import com.kaizen.utils.R;
import io.swagger.annotations.Api;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 * <p>
 * 课程科目 前端控制器
 * </p>
 *
 * @author weizujie
 * @since 2020-12-29
 */
@Api(tags = "课程管理")
@Slf4j
@RestController
@RequestMapping("/edu/subject")
@CrossOrigin // 解决跨域问题
public class SubjectController {

    /**
     * 注入 subjectService
     */
    private final ISubjectService subjectService;

    public SubjectController(ISubjectService subjectService) {
        this.subjectService = subjectService;
    }

    /**
     * 添加课程分类
     *
     * @param file excel
     * @return R
     */
    @PostMapping("addSubject")
    public R addSubject(MultipartFile file) {

        subjectService.saveSubject(file, subjectService);

        return R.success();
    }


}

