<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

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
	<meta http-equiv="refresh" content="30">    <!-- 页面刷新时间 -->
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

	<script type="text/javascript">
	$(top.hangge());//关闭加载状态
	//柱状图
	var sanweidata;
	//var xAxisData = [];
	//var raindata = [];
	//
	var returndata1; //地名
	var returndata2; //数值
	var returndata1obj;
	var returndata2obj;
	var str="";
	if(${pd.sanweidata!=''}){
	sanweidata = eval(${pd.sanweidata})
	//console.info(chartData)
	//alert(chartData);
	//
	returndata1="[";
	returndata2="[";
	for (var i = 0; i < sanweidata.length; i++) {
	//for (var i = 0; i < sanweidata.length; i=i+10) {
	              //  if(sanweidata[i].address=="lyh1")
	             //   {
	                       returndata1+='"'+sanweidata[i].time+'",';
	                       returndata2+='"'+sanweidata[i].flow+'",';
	                       //alert(i);
	            //    }
	 }   
	                 
	                  returndata1+="]";    
	                  returndata2+="]";   
	                  returndata1obj=eval('('+returndata1+ ')');
		              returndata2obj=eval('('+returndata2+ ')');
}
		var myChart = echarts.init(document.getElementById('main'));
        myChart.setOption({
          title : {
        text: '1号监测点',
        subtext: ''
     },
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['流量']
            },
            toolbox: {
                show : true,
                feature : {
                    mark : {show: false},
                    dataView : {show: false, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    restore : {show: false},
                    saveAsImage : {show: false}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data : returndata1obj
                }
            ],
            yAxis : [
                {   
                    type : 'value',
                    splitArea : {show : true},
                    axisLabel : {
                formatter: '{value} mm3/s'
            }
                }
            ],
            series : [
               
                {
                    name:'流量',
                    type:'line',
                    data: returndata2obj
                }
            ]
        });
        
	
			
// 			myChart.on('click', function (param){  
//			       alert(param.name+" ");
//                     var name=param.name;  
//                     if(name==param.name){  把name从rain_chart.jsp传到RainStatisticsController.java中
//                         window.location.href="<%=basePath%>chart5/rainstatistics?name="+name;          
                          
//                     }   
//                 });  
//                myChart.on('click',eConsole); 
		
	</script>

   
</head>

<body>
   
           
			    
               
    <!-- <a href="#top" id="goTop"><i class="fa fa-angle-up fa-3x"></i></a> -->
</body>
</html>
