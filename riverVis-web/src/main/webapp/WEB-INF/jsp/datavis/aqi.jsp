<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'aqi.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
 <body>
   <!--Step:1 Prepare a dom for ECharts which (must) has size (width & hight)-->
    <!--Step:1 为ECharts准备一个具备大小（宽高）的Dom-->
    <div id="main" style="height:320px;width:320px;border:0px solid #ccc;padding:0px;position:relative;top:5px;left:60px"></div>
   <!--Step:2 引入echarts-all.js-->
   <script type="text/JavaScript" src="<%=path%>/js/echarts-all.js"></script>
   <script language="javascript" src="<%=path%>/js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript">
	    $(top.hangge());//关闭加载状态
	    
	    var obj=${message};
	    var pm25=obj.pm2_5; //获得pm2.5
	    var pm10=obj.pm10;
	    var co=obj.co;
	    var no2=obj.no2;
	    var so2=obj.so2;
	    var o3=obj.o3;
	    //alert(pm25);
	 /* alert(obj.weather_picf2);
	    alert(obj.weather_picf3);
	    alert(obj.mintempf2);
	    alert(obj.maxtempf2);
	    alert(obj.mintempf3);
	    alert(obj.maxtempf3);
	    */
		var myChart = echarts.init(document.getElementById('main'));
		//自适应宽高
		var myChartContainer = function () {
		    myChart.style.width = window.innerWidth+'px';
		    myChart.style.height = window.innerHeight+'px';
		};
		
        myChart.setOption ({
    title : {
      text: '空气质量情况',
	  x:'center',
	  textStyle: {
         fontSize: 12,
         fontWeight: 'bolder',
         color: '#333'          // 主标题文字颜色
       },
      //subtext: '纯属虚构'
    },
    tooltip : {
        trigger: 'axis'
    },
   /* legend: {
        orient : 'vertical',
        x : 'right',
        y : 'bottom',
        data:['预算分配（Allocated Budget）','实际开销（Actual Spending）']
    },*/
    toolbox: {
        show : true,
        feature : {
            mark : {show: false},
            dataView : {show: false, readOnly: false},
            restore : {show: false},
            saveAsImage : {show: false}
        }
    },
    polar : [
       {
           indicator : [
               { text: 'PM2.5', max: 200},
               { text: 'PM10', max: 200},
               { text: 'CO', max: 10},
               { text: 'NO2', max:200},
               { text: 'SO2', max: 200},
               { text: 'O3', max: 200}
            ]
        }
    ],
    calculable : true,
    series : [
        {
            name: '当前空气质量情况',
            type: 'radar',
            data : [
                {
                    value : [pm25, pm10, co, no2, so2, o3],
                    name : '空气质量参数'
                }/*,
                 {
                    value : [5000, 14000, 28000, 31000, 42000, 21000],
                    name : '实际开销（Actual Spending）'
                }*/
            ]
        }
    ]
});
                    
</script>
</body>
</html>


