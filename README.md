# 山洪预警课程设计  
[项目地址](https://github.com/Steventxy/riverVis.git)  

## 将Java Web项目修改成Spring Boot项目  
1. 将jsp页面改为HTML文件  

### 分工及存在问题：  

* （唐焕棋）登录界面+首页

  1. 问题1：首页设置在进行选择后，点击切换页面回到首页，页面设置又会返回默认设置  

  ![pic thq1](https://Steventxy.github.io/pic/thq1.png)

  ![pic yhq2](https://steventxy.github.io/pic/thq2.png)

  2. 提示无法关闭

     ![pic thq3](https://steventxy.github.io/pic/thq3.png)

* （余颖锋）天气概况+水库水情信息  

  1. 天气统计情况页面存在问题，无法打开

  ![pic yyf1](https://steventxy.github.io/pic/yyf1.png)

  2. 雨量地图中汉字存在乱码

     ![pic yyf3](https://steventxy.github.io/pic/yyf3.png)

     ![pic yyf4](https://steventxy.github.io/pic/yyf4.png)

     3. 水库地图不能打开

        ![pic yyf5](https://steventxy.github.io/pic/yyf5.png)

        

* （肖霆锋）河道水情信息

  1.  监测点折现图显示和柱状图显示的文字为乱码，并且文字存在重叠

  ![pic xtf1](https://steventxy.github.io/pic/xtf1.png)

  ![pic xtf2](https://steventxy.github.io/pic/xtf2.png)

  2. 金河镇、果园镇河段三维地图显示不出来

     ![pic xtf3](https://steventxy.github.io/pic/xtf4.png)

     

* （伍文平）系统管理+预警信息设置  

  1. 系统日志下两个子页面都打不开

  ![pic wwp1](https://steventxy.github.io/pic/wwp1.png)

  ![pic wwp2](https://steventxy.github.io/pic/wwp2.png)

  2. 预警设置信息填好后点击保存,不会提示操作成功

     ![pic wwp3](https://steventxy.github.io/pic/wwp3.png)

     

* （彭文迪）短信管理+流媒体语音直播

  1. 在短信管理的发件箱中增加一个删除功能

  ![pic pwd1](https://Steventxy.github.io/pic/pwd1.png)

* （唐嵩） 终端管理+人员管理  

  1. 在终端列表删除一个终端的时候会一直加载，不会提示删除成功
  
  ![pic ts1](https://steventxy.github.io/pic/ts1.png)
  
  2. 启用批量设置终端之后会卡在操作成功提示的那个界面
  
     ![pic ts1](https://steventxy.github.io/pic/ts2.png)
  
  3. 终端数据展示子页面无法打开
  
     ![pic ts1](https://steventxy.github.io/pic/ts3.png)
  
  4. 无法新增角色
  
     ![pic ts1](https://steventxy.github.io/pic/ts4.png)
  
  5. 用户信息管理界面新增角色，操作成功没有任何提示
  
     ![pic ts1](https://steventxy.github.io/pic/ts5.png)

