<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'rain.jsp' starting page</title>
    
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
    <div id="main" style="height:400px;width:550px;border:0px solid #ccc;padding:0px;"></div>
    <!--Step:2 引入echarts-all.js-->
   <!-- 此处开始添加相应的地图信息 -->
  <script type="text/JavaScript" src="<%=path%>/js/echarts-all.js"></script>
  <script language="javascript" src="<%=path%>/js/jquery-1.3.2.min.js"></script>
  <script type="text/javascript">
  	$(top.hangge());//关闭加载状态
  	
  
	
	var obj=${message};
	
	var myChart = echarts.init(document.getElementById('main'));
		
		//自适应宽高
		var myChartContainer = function () {
		    myChart.style.width = window.innerWidth+'px';
		    myChart.style.height = window.innerHeight+'px';
		};
		
        myChart.setOption({
				  title : {
        text: '雨量流量关系图',
        x: 'center'
    },
    tooltip : {
        trigger: 'axis',
        formatter: function(params) {
            return params[0].name + '<br/>'
                   + params[0].seriesName + ' : ' + params[0].value + ' (m^3/s)<br/>'
                   + params[1].seriesName + ' : ' + -params[1].value + ' (mm)';
        }
    },
    legend: {
        data:['流量','降雨量'],
        x: 'left'
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    dataZoom : {
        show : true,
        realtime : true,
        start : 0,
        end : 100
    },
    xAxis : [
        {
            type : 'category',
            boundaryGap : false,
            axisLine: {onZero: false},
            data : [
                  obj[5].time,obj[4].time,obj[3].time,obj[2].time,obj[1].time,obj[0].time
            ]
        }
    ],
    yAxis : [
        {
            name : '流量(m^3/s)',
            type : 'value',
            max : 300
        },
        {
            name : '降雨量(mm)',
            type : 'value',
            axisLabel : {
                formatter: function(v){
                    return - v;
                }
            }
        }
    ],
    series : [
        {
            name:'流量',
            type:'line',
            itemStyle: {normal: {areaStyle: {type: 'default'}}},
            data:[
            obj[5].flow,obj[4].flow,obj[3].flow,obj[2].flow,obj[1].flow,obj[0].flow
            ]
        },
        {
            name:'降雨量',
            type:'line',
            yAxisIndex:1,
            itemStyle: {normal: {areaStyle: {type: 'default'}}},
            data: (function(){
                var oriData = [
                obj[5].rain,obj[4].rain,obj[3].rain,obj[2].rain,obj[1].rain,obj[0].rain
                ];
                var len = oriData.length;
                while(len--) {
                    oriData[len] *= -1;
                }
                return oriData;
            })()
        }
    ]
			
            });

        
</script>
  </body>
</html>
