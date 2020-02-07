package com.stream;

import com.infopublic.util.Const;
import com.infopublic.util.Tools;
import io.netty.bootstrap.Bootstrap;
import io.netty.buffer.Unpooled;
import io.netty.channel.*;
import io.netty.channel.nio.NioEventLoopGroup;
import io.netty.channel.socket.SocketChannel;
import io.netty.channel.socket.nio.NioSocketChannel;
import io.netty.handler.codec.LineBasedFrameDecoder;
import io.netty.handler.codec.string.StringDecoder;
import io.netty.handler.codec.string.StringEncoder;
import io.netty.util.CharsetUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.socket.WebSocketSession;

import java.net.InetSocketAddress;

//public class NettyClient {
//
//    private final String host;
//    private final int port;
//    public WebSocketSession conn;
//    public static Channel channel=null;
//
//    public String message;
//	     public NettyClient(WebSocketSession connection,String message) {
//	    	 this.host = Tools.GetValueByKey(Const.CONFIG, "SERVERIP");
//	    	 this.port = Integer.parseInt(Tools.GetValueByKey(Const.CONFIG, "SERVERPORT"));
//	    	 this.message = message;
//	    	 this.conn = connection;
//	     }
//
//	     public void start() throws Exception {
//	         EventLoopGroup group = new NioEventLoopGroup();
//	         try {
//	             Bootstrap b = new Bootstrap();
//	             b.group(group) // 注册线程池
//	                     .channel(NioSocketChannel.class) // 使用NioSocketChannel来作为连接用的channel类
//	                     .remoteAddress(new InetSocketAddress(this.host, this.port)) // 绑定连接端口和host信息
//	                     .handler(new ChannelInitializer<SocketChannel>() { // 绑定连接初始化器
//	                                 @Override
//	                                 protected void initChannel(SocketChannel ch) throws Exception {
//	                                     System.out.println(" connected...");
//	                                     ch.pipeline().addLast(new NettyClientHandler(conn,message));
//                                         ch.pipeline().addLast(new LineBasedFrameDecoder(1024));
//                                         ch.pipeline().addLast(new StringEncoder());
//                                         ch.pipeline().addLast(new StringDecoder());
//                                         ch.pipeline().addLast(new MyHandler());
//	                                 }
//	                             });
//	             System.out.println(" created..");
//
//	             ChannelFuture cf = b.connect().sync(); // 异步连接服务器
//	             System.out.println(" connected..."); // 连接完成
//
//	             cf.channel().closeFuture().sync(); // 异步等待关闭连接channel
//	             System.out.println(" closed.."); // 关闭完成
//	         } finally {
//	             group.shutdownGracefully().sync(); // 释放线程池资源
//	         }
//	     }
//    	public static void writeDate(String data){
//		channel.writeAndFlush(Unpooled.copiedBuffer(data+System.getProperty("line.separator"), CharsetUtil.UTF_8)).addListener(new ChannelFutureListener() {
//			@Override
//			public void operationComplete(ChannelFuture channelFuture) throws Exception {//确定发送结果
//				if(channelFuture.isSuccess()) {
//					System.out.println("发送成功");
//				}else {
//					System.err.println("发送失败");
//				}
//			}
//		});
//	}
//}

public class NettyClient {

    private static final Logger log = LoggerFactory.getLogger(NettyClient.class);
    //思信地址
//    private  String host = "110.53.162.164";
//    private  String host = "114.67.88.76";
    private String host = "192.168.4.1";
    //    交互端口
    private  int port = 5000;
    public static  Channel channel=null;
    //    声明一个 WebSocketSession 对象 conn
    public WebSocketSession conn;
    public String message;

    /**
     * 初始化一个 NettyClient 对象
     * @author 张超 teavamc
     * @date 2019/2/16
     * @param
     * @return
     */
    public NettyClient(WebSocketSession connection,String message) {
        this.host = host;
        this.port = port;
        this.message = message;
        this.conn = connection;
    }

    public NettyClient() {
    }

    /**
     * NettyClient 的线程执行体
     * @author 张超 teavamc
     * @date 2019/2/16
     * @param
     * @return void
     */
    public void start() throws Exception {
        // 创建一个新的 EventLoopGroup 类型是 异步 UDP 对象
        EventLoopGroup group = new NioEventLoopGroup();
        try {
            // 创建一个 启动类 实例
            Bootstrap b = new Bootstrap();
            // 注册线程池
            b.group(group)
                    // 使用NioSocketChannel来作为连接用的channel类 ， TCP Socket
                    .channel(NioSocketChannel.class)
                    .option(ChannelOption.TCP_NODELAY,true)
                    // 绑定连接端口和host信息
                    .remoteAddress(new InetSocketAddress(this.port))
                    // 绑定连接初始化器
                    .handler(new ChannelInitializer<SocketChannel>() {
                        // 注册通道
                        @Override
                        protected void initChannel(SocketChannel ch) throws Exception {
//	                                     System.out.println(" connected...");
                            ch.pipeline().addLast(new LineBasedFrameDecoder(1024));
                            ch.pipeline().addLast(new StringEncoder());
                            ch.pipeline().addLast(new StringDecoder());
                            ch.pipeline().addLast(new MyHandler());
                        }
                    });
//	             System.out.println(" created..");
            // 异步连接服务器
            ChannelFuture cf = b.connect(host,port).sync();
            channel = cf.channel();

//	             System.out.println(" connected..."); // 连接完成
            // 异步等待关闭连接channel
            cf.channel().closeFuture().sync();
//	             System.out.println(" closed.."); // 关闭完成
            log.info("NettyClient对象host: "+this.host+"port: "+this.port);
        } finally {
            // 释放线程池资源
            group.shutdownGracefully().sync();
        }
    }
    public static void writeDate(String data){
        channel.writeAndFlush(Unpooled.copiedBuffer(data+System.getProperty("line.separator"), CharsetUtil.UTF_8)).addListener(new ChannelFutureListener() {
            @Override
            public void operationComplete(ChannelFuture channelFuture) throws Exception {//确定发送结果
                if(channelFuture.isSuccess()){
                    System.out.println("发送成功");
                }else {
                    System.err.println("发送失败");
                }
            }
        });
    }
}