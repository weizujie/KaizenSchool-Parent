package com.kaizen.serviceBase.exceptionhandler;


import com.kaizen.utils.R;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 统一异常处理类
 */
@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(Exception.class) // 执行出现扫描异常执行这个方法
    @ResponseBody // 为了返回 json 数据
    public R error(Exception e) {
        e.printStackTrace();
        return R.error().message("服务器错误");
    }
}
