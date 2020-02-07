package com.stream;

import io.netty.channel.*;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class MyHandler extends ChannelInboundHandlerAdapter {

    private static Channel channel ;

    //数据库初始化
    private Connection initsql()
    {
        String Url = "jdbc:mysql://localhost:3306/rivervis2?serverTimezone=UTC&useUnicode=true&characterEncoding=utf-8";//参数参考MySql连接数据库常用参数及代码示例
        String userName = "root";//数据库用户名
        String pwd = "txy813";//数据库密码
        String jdbcName = "com.mysql.cj.jdbc.Driver";//连接MySql数据库
        Connection con=null;
        try {
            Class.forName(jdbcName);//向DriverManager注册自己
            con = DriverManager.getConnection(Url, userName, pwd);//与数据库建立连接
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {//执行与数据库建立连接需要抛出SQL异常
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return con;
    }

    //读取服务端发送来的内容存入数据库
    @Override
    public void channelRead(ChannelHandlerContext channelHandlerContext, Object msg) throws Exception
    {
          String s=(String)msg;
          String[] str=s.split(",");
          System.err.println(s);
          String sql = "insert into env_data(temp,hum) values('"+str[1].toString()+"','"+str[3].toString()+"')";//数据库操作语句（插入）
//          String sql1 = "insert into tb_collect(ctype,cid,vdata) values('湿度','10031402','"+str[3].toString()+"')";//数据库操作语句（插入）
          Connection con=initsql();
          PreparedStatement pst = con.prepareStatement(sql);
//          PreparedStatement pst1 = con.prepareStatement(sql1);//用来执行SQL语句查询，对sql语句进行预编译处理
          pst.executeUpdate();//解释在下
//          pst1.executeUpdate();//解释在下
    }

}

