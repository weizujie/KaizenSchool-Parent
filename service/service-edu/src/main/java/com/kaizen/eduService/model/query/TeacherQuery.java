package com.kaizen.eduService.model.query;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;


@Data
@ApiModel("教师查询对象")
public class TeacherQuery {
    @ApiModelProperty("教师名称，模糊查询")
    private String name;

    @ApiModelProperty("头衔  1 高级讲师  2 首席讲师")
    private Integer level;

    @ApiModelProperty(value = "查询开始时间", example = "2020-01-01 10:10:10")
    private String begin;

    @ApiModelProperty(value = "查询结束时间", example = "2020-04-01 10:10:10")
    private String end;
}
