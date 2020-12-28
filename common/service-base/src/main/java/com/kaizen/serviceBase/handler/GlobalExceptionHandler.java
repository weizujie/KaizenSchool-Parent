package com.kaizen.serviceBase.handler;


import com.kaizen.serviceBase.exception.MyException;
import com.kaizen.utils.R;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 统一异常处理类
 */
@Slf4j
@ControllerAdvice
public class GlobalExceptionHandler {

    /**
     * 不管什么异常都执行
     * 执行出现扫描异常执行这个方法
     *
     * @param e Exception
     * @return R
     */
    @ExceptionHandler(Exception.class)
    @ResponseBody // 为了返回 json 数据
    public R error(Exception e) {
        log.error(e.getMessage());
        return R.error().message("服务器错误");
    }


    /**
     * 自定义异常
     *
     * @param e MyException
     * @return R
     */
    @ExceptionHandler(MyException.class)
    @ResponseBody
    public R error(MyException e) {
        log.error(e.getMsg());
        return R.error().code(e.getCode()).message(e.getMsg());
    }


}
