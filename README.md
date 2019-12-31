# 山洪预警课程设计  
[项目地址](https://github.com/Steventxy/riverVis-old.git)  

## 将Java Web项目修改成Spring Boot项目  
### 已优化问题：

#### 唐焕棋

1. 关闭“欢迎使用”提示

![pic thq1](https://Steventxy.github.io/pic/thq1.png)

![pic thq2](https://Steventxy.github.io/pic/thq4.png)

2. 首页轮播图点击跳转404，修改跳转连接后可跳转到对应的数据可视化图形界面

![pic thq5](https://Steventxy.github.io/pic/thq5.png)

3. 视频监控下载插件链接失效，更换链接后可以下载插件

![pic thq6](https://Steventxy.github.io/pic/thq6.png)

![pic thq8](https://Steventxy.github.io/pic/thq8.png)

4. 发信箱查询收信区域实际为终端名称

![pic thq7](https://Steventxy.github.io/pic/thq7.png)

5. 增加发信箱查询条件，可根据电话查询

![pic thq7](https://Steventxy.github.io/pic/thq7.png)

6. 雨量地图的水位预警原来为空值，现可显示出当前水位

![pic thq9](https://Steventxy.github.io/pic/thq9.png)

![pic thq7](https://Steventxy.github.io/pic/thq10.png)

#### 彭文迪

1. 实现删除功能并只有管理员才有权限操作

![pic pwd1](https://Steventxy.github.io/pic/pwd1.png)

![pic pwd2](https://Steventxy.github.io/pic/pwd2.png)

2. 导出为Excel没选择导出的记录时，没有弹出按提示，用户交互不友好

![pic pwd3](https://Steventxy.github.io/pic/pwd3.png)

3. 管理员不可更改自己的账号权限

![pic pwd4](https://Steventxy.github.io/pic/pwd4.png)

#### 余颖锋

1. 修复系统管理页面

![pic yyf6](https://Steventxy.github.io/pic/yyf6.png)

![pic yyf7](https://Steventxy.github.io/pic/yyf7.png)

2. 在系统日志界面添加清空日志表的按钮

![pic yyf2](https://Steventxy.github.io/pic/yyf2.png)

![pic yyf1](https://Steventxy.github.io/pic/yyf1.jpg)

3. 增加返回上一页按钮

![pic yyf1](https://Steventxy.github.io/pic/yyf1.png)

4. 将乱码改为正常显示

![pic yyf4](https://Steventxy.github.io/pic/yyf4.png)

![pic yyf1](https://Steventxy.github.io/pic/yyf1.png)

#### 唐嵩

1. 用户授权界面新增角色不起作用，经分析发现role表中的主键类型为varchar，并设有默认值，所以每次添加都是失败的。将其改为int类型，并将主键设为自动递增

![pic ts1](https://Steventxy.github.io/pic/ts1.png)

![pic ts2](https://Steventxy.github.io/pic/ts2.png)

#### 伍文平

1. 数据采集展示页面的删除和导出按钮位置不合理，且功能都无法使用

![pic wwp1](https://Steventxy.github.io/pic/wwp1.png)

![pic wwp2](https://Steventxy.github.io/pic/wwp2.png)

#### 肖霆锋

1. 数据库关系完整性中缺乏参照完整性

>原数据库的表中未定义外键约束，数据库的完整性中缺乏参照完整性。为了确保数据库的各表参照完整性和逻辑一致性，以role表为参照表，给user表中的roleId增加了外键，并且定义了带短语ON DELETE RESTRICT的FR约束。同理以user表为参照表给terminal表和ann_high表也增加了外键约束，增加了参照完整性，完善数据库的完整性。

![pic xtf1](https://Steventxy.github.io/pic/xtf1.png)

![pic xtf2](https://Steventxy.github.io/pic/xtf2.png)

2. 将终端信息界面的修改和查看按钮合并

![pic xtf3](https://Steventxy.github.io/pic/xtf3.png)

![pic xtf4](https://Steventxy.github.io/pic/xtf4.png)

3. 在搜索之后的终端管理页面添加一个显示所有终端的按钮

![pic xtf5](https://Steventxy.github.io/pic/xtf5.png)

4. 设置删除按钮权限，只有管理员才能看到删除按钮

![pic xtf6](https://Steventxy.github.io/pic/xtf6.png)

![pic xtf7](https://Steventxy.github.io/pic/xtf7.png)

5. 收件区域列对应的值显示为终端名称，改为了收件区域

![pic xtf9](https://Steventxy.github.io/pic/xtf9.png)

![pic xtf8](https://Steventxy.github.io/pic/xtf8.png)

6.用户列表应该为终端所属区域列表

![pic xtf11](https://Steventxy.github.io/pic/xtf11.png)

![pic xtf10](https://Steventxy.github.io/pic/xtf10.png)