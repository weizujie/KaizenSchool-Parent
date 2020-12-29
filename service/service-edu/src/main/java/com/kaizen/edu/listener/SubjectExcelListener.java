package com.kaizen.edu.listener;

import com.alibaba.excel.context.AnalysisContext;
import com.alibaba.excel.event.AnalysisEventListener;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.kaizen.edu.entity.Subject;
import com.kaizen.edu.entity.excel.SubjectData;
import com.kaizen.edu.service.ISubjectService;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

/**
 * SubjectExcelListener 实例是手动 new 出来的，不是给 spring 管理，所以使用 @Autowired 是不行的，
 * 但是可以曲线救国 -> 构造器
 * <p>
 * 缺点：需要一直查询数据库，并发量大的话服务器承受压力也不会小
 */
@AllArgsConstructor
@NoArgsConstructor
public class SubjectExcelListener extends AnalysisEventListener<SubjectData> {


    private ISubjectService subjectService;

    /**
     * 读取 excel 内容，一行一行读取
     * invoke() 会调用很多次（查询很多次数据库），在高并发情况下会对服务器造成压力
     */
    @Override
    public void invoke(SubjectData subjectData, AnalysisContext analysisContext) {

        // 一行一行读取，每次读取都有两个值：（1）一级分类  （2）二级分类
        // 判断一级分类是否重复
        Subject existOneSubject = this.existOneSubject(subjectService, subjectData.getOneSubjectName());
        // 没有一级分类，进行添加
        if (existOneSubject == null) {
            existOneSubject = new Subject();
            existOneSubject.setParentId("0"); // parent_id
            existOneSubject.setTitle(subjectData.getOneSubjectName()); // 一级分类名称
            subjectService.save(existOneSubject);
        }

        // 获取一级分类的 id
        String parentId = existOneSubject.getId();
        // 判断二级分类是否重复
        Subject existTwoSubject = this.existTwoSubject(subjectService, subjectData.getTwoSubjectName(), parentId);
        if (existTwoSubject == null) {
            existTwoSubject = new Subject();
            existTwoSubject.setParentId(parentId);
            existTwoSubject.setTitle(subjectData.getTwoSubjectName()); // 二级分类名称
            subjectService.save(existTwoSubject);
        }
    }

    /**
     * 读取完 excel 之后干的事（暂无）
     */
    @Override
    public void doAfterAllAnalysed(AnalysisContext analysisContext) {

    }


    /**
     * 判断一级分类不能重复添加
     *
     * @param subjectService subjectService
     * @param subjectName    一级分类的名称
     * @return Subject
     */
    private Subject existOneSubject(ISubjectService subjectService, String subjectName) {
        QueryWrapper<Subject> wrapper = new QueryWrapper<>();
        wrapper.eq("title", subjectName);
        wrapper.eq("parent_id", "0");
        return subjectService.getOne(wrapper);
    }

    /**
     * 判断二级分类不能重复添加
     *
     * @param subjectService subjectService
     * @param subjectName    一级分类的名称
     * @return Subject
     */
    private Subject existTwoSubject(ISubjectService subjectService, String subjectName, String parentId) {
        QueryWrapper<Subject> wrapper = new QueryWrapper<>();
        wrapper.eq("title", subjectName);
        wrapper.eq("parent_id", parentId);
        return subjectService.getOne(wrapper);
    }
}
