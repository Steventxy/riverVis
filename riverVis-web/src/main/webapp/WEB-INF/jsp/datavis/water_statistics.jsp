<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html >
<head>
<base href="<%=basePath%>">
<script type="text/javascript"></script>

<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
<link rel="stylesheet" href="static/js/bootstrap-table.css">
</head>

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!-- 设置页面刷新的时间间隔 -->
	<meta http-equiv="refresh" content="3600">
    <!-- <meta charset="utf-8" /> -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />

<style type="text/css">
		.table th {white-space:nowrap;}
		.table td {white-space:nowrap;}
</style>
<body >   

						<div class="col-xs-12">
				<form action="chart5/waterstatistics.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
							
							
								<td style="vertical-align:top;padding-left:5px">
									<select class="chosen-select form-control" name="key1" id="key1" data-placeholder="关键词" style="vertical-align:top;width: 100px; height: 30px;">
										<option value="">全部</option>
<!-- 										<option value="all"  <c:if test="${pd.key1=='all' }">selected</c:if>>全部年份</option> -->
										<option value="2017"  <c:if test="${pd.key1=='2017' }">selected</c:if>>2017</option>
										<option value="2016"  <c:if test="${pd.key1=='2016' }">selected</c:if>>2016</option>
										<option value="2015"  <c:if test="${pd.key1=='2015' }">selected</c:if>>2015</option>								
										<option value="2014"  <c:if test="${pd.key1=='2014' }">selected</c:if>>2014</option>
										<option value="2013"  <c:if test="${pd.key1=='2013' }">selected</c:if>>2013</option>
										<option value="2012"  <c:if test="${pd.key1=='2012' }">selected</c:if>>2012</option>
										<option value="2011"  <c:if test="${pd.key1=='2011' }">selected</c:if>>2011</option>
										<option value="2010"  <c:if test="${pd.key1=='2010' }">selected</c:if>>2010</option>
								  	</select>
								  </td>
								
								<td style="vertical-align:top;padding-left:5px">
									<select class="chosen-select form-control" name="key2" id="key2" data-placeholder="关键词" style="vertical-align:top;width: 100px; height: 30px;">
										<option value="">全部</option>
<!-- 										<option value="all"  <c:if test="${pd.key2=='all' }">selected</c:if>>全部月份</option> -->
										<option value="01"  <c:if test="${pd.key2=='01' }">selected</c:if>>01</option>
										<option value="02"  <c:if test="${pd.key2=='02' }">selected</c:if>>02</option>
										<option value="03"  <c:if test="${pd.key2=='03' }">selected</c:if>>03</option>
										<option value="04"  <c:if test="${pd.key2=='04' }">selected</c:if>>04</option>
										<option value="05"  <c:if test="${pd.key2=='05' }">selected</c:if>>05</option>
										<option value="06"  <c:if test="${pd.key2=='06' }">selected</c:if>>06</option>
										<option value="07"  <c:if test="${pd.key2=='07' }">selected</c:if>>07</option>
										<option value="08"  <c:if test="${pd.key2=='08' }">selected</c:if>>08</option>
										<option value="09"  <c:if test="${pd.key2=='09' }">selected</c:if>>09</option>
										<option value="10"  <c:if test="${pd.key2=='10' }">selected</c:if>>10</option>
										<option value="11"  <c:if test="${pd.key2=='11' }">selected</c:if>>11</option>
										<option value="12"  <c:if test="${pd.key2=='12' }">selected</c:if>>12</option>
										
								  	</select>
								  	</td>

								<td style="vertical-align:top;padding-left:5px">
									<select class="chosen-select form-control" name="key3" id="key3" data-placeholder="关键词" style="vertical-align:top;width: 100px; height: 30px;">
										<option value="">全部</option>
<!-- 										<option value="all"  <c:if test="${pd.key3=='hversion' }">selected</c:if>>全部日期</option> -->
										<option value="01"  <c:if test="${pd.key3=='01' }">selected</c:if>>01</option>
										<option value="02"  <c:if test="${pd.key3=='02' }">selected</c:if>>02</option>
										<option value="03"  <c:if test="${pd.key3=='03' }">selected</c:if>>03</option>
										<option value="04"  <c:if test="${pd.key3=='04' }">selected</c:if>>04</option>
										<option value="05"  <c:if test="${pd.key3=='05' }">selected</c:if>>05</option>
										<option value="06"  <c:if test="${pd.key3=='06' }">selected</c:if>>06</option>
										<option value="07"  <c:if test="${pd.key3=='07' }">selected</c:if>>07</option>
										<option value="08"  <c:if test="${pd.key3=='08' }">selected</c:if>>08</option>
										<option value="09"  <c:if test="${pd.key3=='09' }">selected</c:if>>09</option>
										<option value="10"  <c:if test="${pd.key3=='10' }">selected</c:if>>10</option>
										<option value="11"  <c:if test="${pd.key3=='11' }">selected</c:if>>11</option>
										<option value="12"  <c:if test="${pd.key3=='12' }">selected</c:if>>12</option>									
										<option value="13"  <c:if test="${pd.key3=='13' }">selected</c:if>>13</option>
										<option value="14"  <c:if test="${pd.key3=='14' }">selected</c:if>>14</option>
										<option value="15"  <c:if test="${pd.key3=='15' }">selected</c:if>>15</option>
										<option value="16"  <c:if test="${pd.key3=='16' }">selected</c:if>>16</option>
										<option value="17"  <c:if test="${pd.key3=='17' }">selected</c:if>>17</option>
										<option value="18"  <c:if test="${pd.key3=='18' }">selected</c:if>>18</option>
										<option value="19"  <c:if test="${pd.key3=='19' }">selected</c:if>>19</option>
										<option value="20"  <c:if test="${pd.key3=='20' }">selected</c:if>>20</option>
										<option value="21"  <c:if test="${pd.key3=='21' }">selected</c:if>>21</option>
										<option value="22"  <c:if test="${pd.key3=='22' }">selected</c:if>>22</option>
										<option value="13"  <c:if test="${pd.key3=='23' }">selected</c:if>>23</option>
										<option value="14"  <c:if test="${pd.key3=='24' }">selected</c:if>>24</option>
										<option value="15"  <c:if test="${pd.key3=='25' }">selected</c:if>>25</option>
										<option value="16"  <c:if test="${pd.key3=='26' }">selected</c:if>>26</option>
										<option value="17"  <c:if test="${pd.key3=='27' }">selected</c:if>>27</option>
										<option value="18"  <c:if test="${pd.key3=='28' }">selected</c:if>>28</option>
										<option value="19"  <c:if test="${pd.key3=='29' }">selected</c:if>>29</option>
										<option value="20"  <c:if test="${pd.key3=='30' }">selected</c:if>>30</option>
										<option value="21"  <c:if test="${pd.key3=='31' }">selected</c:if>>31</option>
								  	</select>
								  	</td>																
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>								
							</tr>							
						</table>						
							</form>
<!-- 						</div>												 -->
						<!-- /.col -->
<!-- 					</div>					 -->
					<!-- /.row -->
<!-- 				</div> -->
				<!-- /.page-content -->
<!-- 			</div> -->
<!-- 		</div> -->
		<!-- /.main-content -->
<!-- 	</div> -->
	</div>
	<script language="javascript" src="<%=path%>/js/jquery-1.3.2.min.js"></script>
    <!--Step:1 Prepare a dom for ECharts which (must) has size (width & hight)-->
    <!--Step:1 为ECharts准备一个具备大小（宽高）的Dom-->															
    <div id="main" style="height:500px;border:1px solid #ccc;padding:10px;"></div>
     <!--<div id="mainMap" style="height:500px;border:1px solid #ccc;padding:10px;"></div>-->
    
    <!--Step:2 Import echarts.js-->
    <!--Step:2 引入echarts.js-->
    <script src="js/echarts.js"></script>
    
    <script type="text/javascript">
    $(top.hangge());//关闭加载状态
	//柱状图
	var chartData0;
	var chartData1;
	var returndata1; //地名
	var returndata2; //数值
	var returndata3;//日期
	var returndata4;
	var returndata1obj;
	var returndata2obj;
	var returndata3obj;
	var returndata4obj;
	var colors = ['#5793f3', '#d14a61', '#675bba'];
	//var str="";
    if(${pd.chartData0!=''}){
    chartData0 = eval(${pd.chartData0})
    returndata2="[";
    for (var i = 0; i < chartData0.length; i++) {	   
	     if(i!=chartData0.length-1){	                    
	                      returndata2+='"'+chartData0[i].data+'",';	                       	                 
	                   } 
	                   else{	                     
	                      returndata2+='"'+chartData0[i].data+'"';	                    
	                   }	                   
	                  }   
	                  //alert(str+'的雨量已超过安全值！请发送预警信息');	                 
	                  returndata2+="]";   
	                  returndata2obj=eval('('+returndata2+ ')');		            
}
  
	if(${pd.chartData1!=''}){
	chartData0 = eval(${pd.chartData0})
 	chartData1 = eval(${pd.chartData1})
// 	alert(1);
	returndata1="[";
	//returndata2="[";
	returndata3="[";
 	returndata4="[";
	for (var i = 0; i < chartData1.length; i++) {	   
	     if(i!=chartData1.length-1){
	                      returndata1+='"'+chartData1[i].rname+'",';
	                  //  returndata2+='"'+chartData0[i].data+'",';
	                      returndata3+='"'+chartData1[i].time+'",';
 	                      returndata4+='"'+chartData1[i].data+'",';
	                   } 
	                   else{
	                      returndata1+='"'+chartData1[i].rname+'"';
	                  //    returndata2+='"'+chartData0[i].data+'"';
	                      returndata3+='"'+chartData1[i].time+'",';
 	                      returndata4+='"'+chartData1[i].data+'"';
	                   }
	                   
	                  }   
	                  //alert(str+'的雨量已超过安全值！请发送预警信息');
	                  returndata1+="]";    
	               //   returndata2+="]";   
	                  returndata3+="]";  
 	                 returndata4+="]"; 
	                  returndata1obj=eval('('+returndata1+ ')');
		           //   returndata2obj=eval('('+returndata2+ ')');
		              returndata3obj=eval('('+returndata3+ ')');
 		             returndata4obj=eval('('+returndata4+ ')');
}
  
    require.config({
        paths: {
            echarts: './js'
        }
    });
    
    
    require(
        [
            'echarts',
            'echarts/chart/bar',
            'echarts/chart/line',
            'echarts/chart/map',
         
           
        ],
        function (ec) {
            //--- 折柱 ---
            var myChart = ec.init(document.getElementById('main'));
            myChart.setOption({
                 title : {
       
        subtext: '',
        x: 'left',
        align: 'right'
    },
    
    grid: {
        bottom: 80
    },
    toolbox: {
      show : true,
        feature: {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {show: true, type: ['line', 'bar']},
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
     color: colors,
    tooltip : {
        trigger: 'axis',

        axisPointer: {
             animation: false
//  type: 'cross'
        }
    },
    legend: {
 
        data:['实际水位','预计水位'],
        x: 'center'
    },
    dataZoom: [
        {
            show: true,
            realtime: true,
            start: 65,
            end: 85
        },
        {
            type: 'inside',
            realtime: true,
            start: 65,
            end: 85
        }
    ],
    xAxis : [
        {
            type : 'category',
            boundaryGap : false,
            axisLine: {onZero: false},
            data:returndata3obj.map(function (str) {
                return str.replace(' ', '\n')
            }),
            data:['2016/7/2 1:00','2016/7/2 13:00','2016/7/3 1:00','2016/7/3 13:00','2016/7/4 1:00','2016/7/4 13:00','2016/7/5 1:00','2016/7/5 13:00','2016/7/6 1:00','2016/7/6 13:00']
        }
    ],
    yAxis: [
        {
            name: '水位(mm)',
            type: 'value',
            max: 40,
            min:25
        }
    ],
    series: [
        {
            name:'实际水位',
            type:'line',
            //data:returndata2obj,
            data:[31.99,32.08,32.43,33.25,34.91,36.09,37.93,37.81,35.61,34.98],
            markPoint: {
                data: [
                    {type: 'max', name: '最大值'},
                    {type: 'min', name: '最小值'}
                ]
            },
            markLine: {
                data: [
            //       {type: 'average', name: '平均值'}
             //     {name: '预警值', yAxis: 28}
                ]
            }

        },
         {
            name:'预计水位',
            type:'line',
             data:[31.25,31.98,32.51,33.24,34.88,35.94,38.11,37.67,35.52,34.95],
             //data:returndata4obj,
              markPoint: {
                data: [
                    {type: 'max', name: '最大值'},
                    {type: 'min', name: '最小值'}
                ]
            },
            markLine: {
//              data: [
//                    {name: '预警值', yAxis: 28}
//                 ]
                 data: [
               //      {type: 'average', name: '平均值'}
                ]
            }

           
        }
    ]


});

            
     })      
    </script>
	
	
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<script type="text/javascript" src="static/js/jquery.min.js"></script>
	<script type="text/javascript" src="static/js/bootstrap-table.js"></script>
	<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.0/locale/bootstrap-table-zh-CN.min.js"></script>
<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
	//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		$(document).ready(function(){
			top.hangge();
// 			setwindow();
			//下拉框
	if(!ace.vars['touch']) {
		$('.chosen-select').chosen({allow_single_deselect:true}); 
		$(window)
		.off('resize.chosen')
		.on('resize.chosen', function() {
			$('.chosen-select').each(function() {
				 var $this = $(this);
				 $this.next().css({'width': $this.parent().width()});
			});
		}).trigger('resize.chosen');
		$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
			if(event_name != 'sidebar_collapsed') return;
			$('.chosen-select').each(function() {
				 var $this = $(this);
				 $this.next().css({'width': $this.parent().width()});
			});
		});
	}

// 	var active_class = 'active';
	
		});	
		function setEndMin(){
			var min = $("#signalstart").val();
			if(min !=null &&min !="")
			$("#signalend").attr("min",min);
		}


	</script>


</body>
</html>