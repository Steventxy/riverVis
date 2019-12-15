<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<!-- 这个jsp的直方图数据是通过随机数函数产生的 -->


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
    
    <title>三维场景数据展示</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="refresh" content="3600">
    <!-- <meta charset="utf-8" /> -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--Step:1 Prepare a dom for ECharts which (must) has size (width & hight)-->
    <!--Step:1 为ECharts准备一个具备大小（宽高）的Dom-->
    <div id="main" style="height:250px;border:1px solid #ccc;padding:10px;"></div>
   

    <!--Step:2 Import echarts-all.js-->
    <!--Step:2 引入echarts-all.js-->
    <script src="js/echarts-all.js"></script>
    
    <!-- 此处开始添加相应的地图信息 -->
    <script type="text/JavaScript" src="<%=path%>/js/echarts-all.js"></script>
	
	<script language="javascript" src="<%=path%>/js/jquery-1.3.2.min.js"></script>

   
</head>

<body>
   <div id="main" style="height:400px"></div>
     <script src="<%=path%>/js/echarts.js"></script>
      <script type="text/javascript">
      $(top.hangge());//关闭加载状态
        require.config({
            paths: {
              //使用<%=path%>/js路径代替echarts
               echarts: '<%=path%>/js'   
            }
        });
        // 使用
        require
        (
            [
                'echarts',        //使用<%=path%>/js路径代替echarts
                'echarts/chart/line' ,//再按需加载图表模块
                'echarts/chart/bar' // 使用柱状图就加载bar模块，按需加载
            ],
            function (ec) 
            {
                // 基于准备好的dom，初始化echarts图表
                var myChart = ec.init(document.getElementById('main')); 
                var option = {
    title : {
        text: '1号监测点',
        //subtext: '纯属虚构'
    },
    tooltip : {
        trigger: 'axis'
    },
    legend: {
        data:['实际水位','预测水位']
        //data:['水位']
    },
    toolbox: {
        show : true,
       /* feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }*/
         
                feature : {
                    mark : {show: false},
                    dataView : {show: false, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: false},
                    saveAsImage : {show: false}
                }
    },
    dataZoom : {
        show : false,
        start : 0,
        end : 100
    },
    xAxis : [
        {
            type : 'category',
            boundaryGap : true,
            data : (function (){
                var now = new Date();
                var res = [];
                var len = 5;
                while (len--) {
                    res.unshift(now.toLocaleTimeString().replace(/^\D*/,''));
                    now = new Date(now - 5000);
                }
                return res;
            })()
        },
        {
            type : 'category',
            boundaryGap : true,
            data : (function (){
                var res = [];
                var len = 5;
                while (len--) {
                    res.push(len + 1);
                }
                return res;
            })()
        }
    ],
    yAxis : [
        {
            type : 'value',
            scale: true,
            name : '水位(cm)',
            boundaryGap: [0.2, 0.2]
        },
        {
            type : 'value',
            scale: true,
            name : '水位(cm)',
            boundaryGap: [0.2, 0.2]
        }
    ],
    series : [
        {
            name:'预测水位',
            type:'bar',
            xAxisIndex: 1,
            yAxisIndex: 1,
            data:(function (){
                var res = [];
                var len = 5;
                while (len--) {
                    res.push(Math.round(Math.random() * 1000));
                }
                return res;
            })()
        }
        ,
        {
            name:'实际水位',
            type:'line',
            data:(function (){
                var res = [];
                var len = 5;
                while (len--) {
                    //res.push((Math.random()*10 + 5).toFixed(1) - 0);
                     res.push(Math.round(Math.random() * 1000));
                }
                return res;
            })()
        }
    ]
};; 
                myChart.setOption(option); 

                var lastData = 11;
var axisData;
var timeTicket;
clearInterval(timeTicket);
timeTicket = setInterval(function (){
    lastData += Math.random() * ((Math.round(Math.random() * 10) % 2) == 0 ? 1 : -1);
    lastData = lastData.toFixed(1) - 0;
    axisData = (new Date()).toLocaleTimeString().replace(/^\D*/,'');

    // 动态数据接口 addData
    myChart.addData([
        [
            0,        // 系列索引
            Math.round(Math.random() * 1000), // 新增数据
            true,     // 新增数据是否从队列头部插入
            false     // 是否增加队列长度，false则自定删除原有数据，队头插入删队尾，队尾插入删队头
        ],
        [
            1,        // 系列索引
            lastData, // 新增数据
            false,    // 新增数据是否从队列头部插入
            false,    // 是否增加队列长度，false则自定删除原有数据，队头插入删队尾，队尾插入删队头
            axisData  // 坐标轴标签
        ]
    ]);
}, 2100);
            }
        );
    </script>
           
			    
               
    <!-- <a href="#top" id="goTop"><i class="fa fa-angle-up fa-3x"></i></a> -->
</body>
</html>