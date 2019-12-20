<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
<script type="text/javascript" src="static/js/jquery.min.js"></script>
	
</head>
<body class="no-skin">
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div id="rain" style="height: 300px;"></div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->
	</div>
	
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<!--引入弹窗组件start-->
		<script type="text/javascript" src="plugins/attention/zDialog/zDrag.js"></script>
		<script type="text/javascript" src="plugins/attention/zDialog/zDialog.js"></script>
		<!--引入弹窗组件end-->
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/echarts.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-gl/echarts-gl.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts-stat/ecStat.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/dataTool.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/china.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/map/js/world.js"></script>
       <script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=ZUONbpqGBsYGXNIYHicvbAbM"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/echarts/extension/bmap.min.js"></script>
       <script type="text/javascript" src="http://echarts.baidu.com/gallery/vendors/simplex.js"></script>
</body>
<script type="text/javascript">
	$(top.hangge());
	
	var dataview =new Array();
	var datatime =new Array();
	var obj=${message};
	var dom = document.getElementById("rain");
	var myChart = echarts.init(dom);
	var app = {};
	if("${type}"=="pow1"){
		for(var i=0;i<obj.length;i++)
		{
			dataview[i]=obj[i].pow1;
			datatime[i]=obj[i].time;
		}
	}else if("${type}"=="grouppow"){
		for(var i=0;i<obj.length;i++)
		{
			dataview[i]=obj[i].grouppow;
			datatime[i]=obj[i].time;
		}	
	}else if("${type}"=="outv1"){
		for(var i=0;i<obj.length;i++)
		{
			dataview[i]=obj[i].outv1;
			datatime[i]=obj[i].time;
		}
	}else if("${type}"=="outv2"){
		for(var i=0;i<obj.length;i++)
		{
			dataview[i]=obj[i].outv2;
			datatime[i]=obj[i].time;
		}
	}else if("${type}"=="v24"){
		for(var i=0;i<obj.length;i++)
		{
			dataview[i]=obj[i].v24;
			datatime[i]=obj[i].time;
		}
	}else if("${type}"=="v28"){
		for(var i=0;i<obj.length;i++)
		{
			dataview[i]=obj[i].v28;
			datatime[i]=obj[i].time;
		}
	}else if("${type}"=="extendpow"){
		for(var i=0;i<obj.length;i++)
		{
			dataview[i]=obj[i].extendpow;
			datatime[i]=obj[i].time;
		}
	}else if("${type}"=="solarpow"){
		for(var i=0;i<obj.length;i++)
		{
			dataview[i]=obj[i].solarpow;
			datatime[i]=obj[i].time;
		}
	}
	option = null;
        option = {
    title: {
        text: "${type}"+'关系图',
        subtext: '数据来自IMEI号为'+obj[0].IMEI+'的终端',
        x: 'center'
    },
    legend: {
        data:["${type}"],
         x: 'left'
    },
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            animation: false
        }
    },
    toolbox: {
        show: true,
        feature: {
            dataZoom: {
                yAxisIndex: 'none'
            },
            dataView: {readOnly: false},
            magicType: {type: ['line', 'bar']},
            restore: {},
            saveAsImage: {}
        }
    },
    axisPointer: {
        link: {xAxisIndex: 'all'}
    },
    dataZoom: {
        show : true,
        realtime : true,
        start : 0,
        end : 100
    },
     grid: {
        left: 50,
        right: 50,
        height: '70%'
    },
    xAxis: {
        type: 'category',
        data: datatime
    },
    yAxis: {
        name : "${type}",
        type : 'value',
        max : 25
    },
    series: [{
        name:"${type}",
        symbolSize: 8,
        hoverAnimation: false,
        data: dataview,
        type: 'line'
    }]
	};
	;
	if (option && typeof option === "object") {
	    myChart.setOption(option, true);
	}
</script>
</html>