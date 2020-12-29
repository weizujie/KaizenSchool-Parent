package com.kaizen.edu.controller;


import com.kaizen.utils.R;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

@Api("登录")
@RestController
@RequestMapping("/edu/user")
@CrossOrigin // 解决跨域问题
public class LoginController {

    /**
     * 用户登录
     *
     * @return R
     */
    @ApiOperation("用户登录")
    @PostMapping("/login")
    public R login() {
        return R.success().data("token", "admin");
    }


    /**
     * 获取用户信息
     *
     * @return R
     */
    @ApiOperation("获取用户信息")
    @GetMapping("/info")
    public R info() {
        return R.success().data("name", "admin").data("avatar", "https://weizujie.vip/images/logo@2x.png");
    }
}
