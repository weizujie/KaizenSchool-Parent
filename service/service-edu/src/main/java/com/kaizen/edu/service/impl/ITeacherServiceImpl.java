package com.kaizen.edu.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.kaizen.edu.entity.Teacher;
import com.kaizen.edu.mapper.TeacherMapper;
import com.kaizen.edu.service.ITeacherService;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 讲师 服务实现类
 * </p>
 *
 * @author weizujie
 * @since 2020-12-25
 */
@Service
public class ITeacherServiceImpl extends ServiceImpl<TeacherMapper, Teacher> implements ITeacherService {

}
