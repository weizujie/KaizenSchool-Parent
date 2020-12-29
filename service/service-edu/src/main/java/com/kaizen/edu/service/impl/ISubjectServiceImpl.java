package com.kaizen.edu.service.impl;

import com.alibaba.excel.EasyExcel;
import com.kaizen.edu.entity.Subject;
import com.kaizen.edu.entity.excel.SubjectData;
import com.kaizen.edu.listener.SubjectExcelListener;
import com.kaizen.edu.mapper.SubjectMapper;
import com.kaizen.edu.service.ISubjectService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;

/**
 * 课程科目 服务实现类
 * <p>
 * Service注解 -> 将 ISubjectServiceImpl 交给spring管理，
 * 但是 SubjectExcelListener 是我们自己 new 的，所以不能注入其他对象，不能实现数据库操作
 * 所以我们需要手动写 ISubjectService 构造方法
 *
 * @author weizujie
 * @since 2020-12-29
 */

@Slf4j
@Service
public class ISubjectServiceImpl extends ServiceImpl<SubjectMapper, Subject> implements ISubjectService {


    /**
     * 添加课程分类
     */
    @Override
    public void saveSubject(MultipartFile file, ISubjectService subjectService) {
        try {
            // 文件输入流
            InputStream in = file.getInputStream();
            // 调用方法进行读取
            EasyExcel.read(in, SubjectData.class, new SubjectExcelListener(subjectService)).sheet().doRead();
        } catch (Exception e) {
            log.error(e.getMessage());
        }

    }
}
