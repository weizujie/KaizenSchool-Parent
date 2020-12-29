# KaizenSchool 在线学习平台

> Kaizen 意味着改进，涉及每一个人、每一环节的连续不断的改进。

前端项目: https://github.com/weizujie/KaizenSchool-Front

## 使用方法

1. 克隆项目到本地
  ```git
      git clone https://github.com/weizujie/KaizenSchool-Parent.git
  ```
2. 配置数据库 ```service\service-edu\src\main\resources\application.yml```
  ```yaml
  spring: 
    datasource:
      driver-class-name: com.mysql.cj.jdbc.Driver
      url: jdbc:mysql://localhost:3306/数据库名?serverTimezone=UTC
      username: 数据库账号
      password: 数据库密码
  ```
3. 配置阿里云 OSS ```service\service-oss\src\main\resources\application.yml```
  ```yml
    server:
  port: 8002

  spring:
    application:
      name: service-oss

    profiles:
      active: dev

  # 阿里云OSS
  # 不同的服务器，地址不同
  aliyun:
    oss:
      file:
        endpoint: 
        keyid: 
        keysecret: 
        # bucket可以在控制台创建，也可以使用 java 代码创建
        bucketname: 
  ```
