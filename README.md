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

拉取仓库的脚本找自己需要的版本并进入对应目录下。

```
git clone https://github.com/KeiferJu/docker-leanote.git
```
## 安装
总共在网上zuolan/leanote和foolishflyfox/leanote等镜像的基础上整合制作，src和dist版本（编译和源码）因为采取alpine为基础镜像，编译安装pdf
插件时可能比较麻烦，而且配置邮箱也失败。但是它镜像的大小很小，适合用不到pdf导出和邮箱并且要求镜像大小的。而latest版本比较大，pdf和邮箱都可以正常使用。


### 推荐版(latest)
集成了pdf导出插件wkhtmltopdf，邮箱配置没问题，并且暴露源码可以进行修改，镜像比较大。
首先在这个文件夹内执行：
```
bash get-latest.sh
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



### 编译版(dist)
没有集成了pdf导出插件，邮箱配置存在问题，不暴露源码自定义，镜像比较小。

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
没有集成了pdf导出插件，邮箱配置存在问题，暴露源码给用户来自定义，镜像比较小。

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


## 收尾

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
