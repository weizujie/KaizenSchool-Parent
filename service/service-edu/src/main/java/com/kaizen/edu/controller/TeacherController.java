package com.kaizen.edu.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.kaizen.edu.entity.Teacher;
import com.kaizen.edu.model.query.TeacherQuery;
import com.kaizen.edu.service.ITeacherService;
import com.kaizen.utils.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import lombok.extern.slf4j.Slf4j;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 讲师 前端控制器
 * </p>
 *
 * @author weizujie
 * @since 2020-12-25
 */
@Api(tags = "讲师管理")
@Slf4j
@RestController
@RequestMapping("/edu/teacher")
@CrossOrigin // 解决跨域问题
public class TeacherController {

    /**
     * 注入 teacherService，不用 @Autowired
     */
    private final ITeacherService teacherService;

    public TeacherController(ITeacherService teacherService) {
        this.teacherService = teacherService;
    }

    /**
     * 1. 查询所有讲师数据
     *
     * @return R
     */
    @ApiOperation("讲师列表")
    @GetMapping("/findAll")
    public R findAllTeacher() {
        List<Teacher> teachers = teacherService.list(null);
        return R.success().data("items", teachers);
    }

    /**
     * 2. 从逻辑上删除讲师，并不是真正的从数据库中删除
     * 注意：PathVariable 需要路径中输入的 id 值
     *
     * @param id 要删除的教师的id。 id 需要通过路径进行传递
     * @return R
     */
    @ApiOperation("逻辑删除讲师")
    @DeleteMapping("/deleteTeacher/{id}")
    public R deleteTeacherById(@ApiParam(name = "id", value = "讲师ID", required = true) @PathVariable String id) {
        boolean flag = teacherService.removeById(id);
        if (flag) {
            return R.success();
        } else {
            return R.error();
        }
    }

    /**
     * 3. 讲师列表分页查询（不带条件）
     *
     * @param current 当前页
     * @param limit   每页显示的条数
     * @return R
     */
    @ApiOperation("讲师列表分页查询(不带条件)")
    @GetMapping("/pageTeacher/{current}/{limit}")
    public R pageListTeacher(@ApiParam(name = "current", value = "当前页") @PathVariable Long current,
                             @ApiParam(name = "limit", value = "每页显示的条数") @PathVariable Long limit) {
        // 创建 page 对象
        Page<Teacher> pageTeacher = new Page<>(current, limit);
        // 调用方法的时候，把分页所有数据封装到 pageTeacher 对象里面
        teacherService.page(pageTeacher, null);
        long total = pageTeacher.getTotal(); // 总记录数
        List<Teacher> records = pageTeacher.getRecords(); // 数据 list 集合
        Map<String, Object> map = new HashMap<>();
        // 封装返回结果
        map.put("total", total);
        map.put("rows", records);
        return R.success().data(map);
    }

    /**
     * 4. 讲师分页查询带条件
     * 注意：使用 @RequestBody 注解的时候，要使用 POST 请求
     * required = false 表示参数值可以为空
     *
     * @param current      当前页
     * @param limit        每页显示的条数
     * @param teacherQuery TeacherQuery
     * @return R
     */
    @ApiOperation("讲师分页查询带条件")
    @PostMapping("/pageTeacherCondition/{current}/{limit}")
    public R pageTeacherCondition(@ApiParam(name = "current", value = "当前页") @PathVariable Long current,
                                  @ApiParam(name = "limit", value = "每页显示的条数") @PathVariable Long limit,
                                  @RequestBody(required = false) TeacherQuery teacherQuery) { // 加 @RequestBody 注解是常见写法，不要也行
        // 创建 page 对象
        Page<Teacher> pageTeacher = new Page<>(current, limit);
        // 构建条件
        // wrapper是啥？
        QueryWrapper<Teacher> wrapper = new QueryWrapper<>();
        // 多条件组合查询
        String name = teacherQuery.getName();
        Integer level = teacherQuery.getLevel();
        String begin = teacherQuery.getBegin();
        String end = teacherQuery.getEnd();
        // 判断条件值是否为空，如果不为空，拼接条件
        // column 是数据库里字段名
        if (!StringUtils.isEmpty(name)) {
            // 模糊查询
            wrapper.like("name", name);
        }
        if (!StringUtils.isEmpty(level)) {
            // eq 等于
            wrapper.eq("level", level);
        }
        if (!StringUtils.isEmpty(begin)) {
            // ge 大于等于
            wrapper.ge("gmt_create", begin);
        }
        if (!StringUtils.isEmpty(end)) {
            // le 小于等于
            wrapper.le("gmt_create", end);
        }
        // 根据创建时间进行降序排列（新增的数据在第一个）
        wrapper.orderByDesc("gmt_create");

        teacherService.page(pageTeacher, wrapper);
        // 构建返回结果
        long total = pageTeacher.getTotal();
        List<Teacher> records = pageTeacher.getRecords();
        Map<String, Object> map = new HashMap<>();
        // 封装返回结果
        map.put("total", total);
        map.put("rows", records);
        return R.success().data(map);
    }

    /**
     * 5. 添加讲师
     *
     * @param teacher EduTeacher
     * @return R
     */
    @ApiOperation("添加讲师")
    @PostMapping("/addTeacher")
    public R addTeacher(@RequestBody Teacher teacher) {
        boolean save = teacherService.save(teacher);
        if (save) {
            return R.success();
        } else {
            return R.error();
        }
    }

    /**
     * 6. 根据 id 查询讲师
     *
     * @param id id
     * @return R
     */
    @ApiOperation("根据讲师id进行查询")
    @GetMapping("/getTeacher/{id}")
    public R getTeacherById(@PathVariable("id") String id) {
        Teacher teacher = teacherService.getById(id);
        return R.success().data("teacher", teacher);
    }

    /**
     * 7. 修改讲师
     * RequestBody 注解详解请看：https://blog.csdn.net/jiashanshan521/article/details/88244735
     *
     * @param teacher EduTeacher
     * @return R
     */
    @ApiOperation("修改讲师")
    @PutMapping(value = "/editTeacher")
    public R updateTeacher(@RequestBody Teacher teacher) {
        boolean flag = teacherService.updateById(teacher);
        if (flag) {
            return R.success();
        } else {
            return R.error();
        }
    }
}

