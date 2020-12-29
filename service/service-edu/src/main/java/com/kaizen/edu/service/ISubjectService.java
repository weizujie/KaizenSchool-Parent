package com.kaizen.edu.service;

import com.kaizen.edu.entity.Subject;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.web.multipart.MultipartFile;

/**
 * <p>
 * 课程科目 服务类
 * </p>
 *
 * @author weizujie
 * @since 2020-12-29
 */
public interface ISubjectService extends IService<Subject> {

    /**
     * 添加课程分类
     */
    void saveSubject(MultipartFile file, ISubjectService subjectService);
}
