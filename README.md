## 前提
首先安装 Docker：

```
curl -sSL https://get.docker.com/ | sh
```

然后安装 Compose：

```
curl -L https://github.com/docker/compose/releases/download/1.10.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
```

拉取仓库的脚本找自己需要的版本（编译版和源码版）并进入对应目录下。

```
git clone https://github.com/KeiferJu/docker-leanote.git
```
## 安装

### 编译版(dist)

首先在这个文件夹内执行：
```
bash get-data.sh
```

然后执行：
```
docker-compose run --rm initdb
```

最后启动：
```
docker-compose up -d leanote
```

打开 localhost:9000 即可看到部署成功。

### 源码版(src)
这个文件夹存放的是从源代码安装 Leanote 的 Docker 配置文件。
也就是“开发版”,可以进行一些自定义.
使用方法也是先执行：
```
bash get-src.sh
```
然后执行数据库初始化：
```
docker-compose run --rm initdb
```
最后启动 Leanote 即可：
```
docker-compose up -d leanote
```
打开 localhost:9000 即可看到部署成功。

## 后续：

1. 管理员账户密码
以上两个方法部署之后账号和密码都是：
账号：admin
密码：abc123

修改 admin 用户名的方法
   首先编辑 leanote/conf/app.conf 文件，把 adminUsername 修改为你喜欢的用户名。
   然后在网页端中打开：
   http://localhost:9000/member/user/username
   修改 admin 为配置文件中的用户名。
   最后重启 Leanote 应用容器。
 
2. 存在的问题
    - 邮件服务配置不起作用（因为我是个人使用，又是强迫症，所以在源码版里面屏蔽了所有注册，找回密码，发邮件的相关代码，等以后有时间看一下它的源码，找一下问题出在哪）
    - 想要修改管理员邮箱得去数据库
    - 不盈利，官方估计已经不维护了，主要靠社区，个人使用的话目前已有的功能已经完全够用，实在不行还可以自己fork源码修改。
