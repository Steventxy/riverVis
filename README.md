# 山洪预警课程设计  
[项目地址](https://github.com/Steventxy/riverVis-old.git)  

## 将Java Web项目修改成Spring Boot项目  
### 已优化问题：

#### 唐焕棋

1. 关闭“欢迎使用”提示

![pic thq1](https://Steventxy.github.io/pic/thq1.png)

![pic thq2](https://Steventxy.github.io/pic/thq4.png)

#### 彭文迪

1. 实现删除功能并只有管理员才有权限操作

![pic pwd1](https://Steventxy.github.io/pic/pwd1.png)

![pic pwd1](https://Steventxy.github.io/pic/pwd2.png)

#### 余颖锋

1. 修复系统管理页面

![pic yyf6](https://Steventxy.github.io/pic/yyf6.png)

![pic yyf7](https://Steventxy.github.io/pic/yyf7.png)

2. 在系统日志界面添加清空日志表的按钮

![pic yyf2](https://Steventxy.github.io/pic/yyf2.png)

![pic yyf1](https://Steventxy.github.io/pic/yyf1.jpg)

#### 唐嵩

1. 用户授权界面新增角色不起作用，经分析发现role表中的主键类型为varchar，并设有默认值，所以每次添加都是失败的。将其改为int类型，并将主键设为自动递增

![pic ts1](https://Steventxy.github.io/pic/ts1.png)

![pic ts2](https://Steventxy.github.io/pic/ts2.png)

#### 伍文平

1. 数据采集展示页面的删除和导出按钮位置不合理，且功能都无法使用

![pic wwp1](https://Steventxy.github.io/pic/wwp1.png)

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