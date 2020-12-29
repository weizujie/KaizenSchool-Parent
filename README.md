# KaizenSchool 在线学习平台

> Kaizen 意味着改进，涉及每一个人、每一环节的连续不断的改进。

## 使用方法

1. 克隆项目到本地
  ```git
      git clone https://github.com/weizujie/KaizenSchool-Parent.git
  ```
2. 配置数据库
  ```yaml
  spring: 
    datasource:
      driver-class-name: com.mysql.cj.jdbc.Driver
      url: jdbc:mysql://localhost:3306/数据库名?serverTimezone=UTC
      username: 数据库账号
      password: 数据库密码
  ```
3. 运行该项目
