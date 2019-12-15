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
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="refresh" content="10">
    
  <!--   <link rel="stylesheet" href="leaflet.css" /> 
	<script src="leaflet.js"></script>--> 
	
	<link rel="stylesheet" href="<%=path%>/js/leaflet.css" /> 
	<script src="<%=path%>/js/leaflet.js"></script>


	

	<style>#map { width: 600px; height: 525px; }
		.info { padding: 6px 8px; font: 14px/16px Arial, Helvetica, sans-serif; background: white; background: rgba(255,255,255,0.8); box-shadow: 0 0 15px rgba(0,0,0,0.2); border-radius: 5px; } .info h4 { margin: 0 0 5px; color: #777; }
		.legend { text-align: left; line-height: 18px; color: #555; } .legend i { width: 18px; height: 18px; float: left; margin-right: 8px; opacity: 0.7; }
	</style>
	<script language="javascript" src="<%=path%>/js/jquery-1.3.2.min.js"></script>
	

	
</head>

<body>
    <div>
    <div id='map'></div>  <!--为雨量地图准备一个具备大小（宽高）的Dom-->
    <div id="main" style="height:525px;width:625px;border:0px solid #ccc;padding:0px;  position:relative;top:-525px;left:625px"></div>   <!--Step:1 为ECharts准备一个具备大小（宽高）的Dom-->
    </div>
 
    <!--Step:2 引入echarts-all.js-->
   <!-- 此处开始添加相应的地图信息 -->
  <script type="text/JavaScript" src="<%=path%>/js/echarts-all.js"></script>
  <script language="javascript" src="<%=path%>/js/jquery-1.3.2.min.js"></script>
   
  <script type="text/javascript">
  $(top.hangge());//关闭加载状态
  var myChart = echarts.init(document.getElementById('main'));
  //alert(1);
   function rain(a,b,c,d,e,f,t1,t2,t3,t4,t5,t6,r1,r2,r3,r4,r5,r6)
   {
		//alert(2);
		//自适应宽高
		var myChartContainer = function () {
		    myChart.style.width = window.innerWidth+'px';
		    myChart.style.height = window.innerHeight+'px';
		};
		
        myChart.setOption({
				  title : {
        text: '温度湿度关系图',
        x: 'center'
    },
    tooltip : {
        trigger: 'axis',
        formatter: function(params) {
            return params[0].name + '<br/>'
                   + params[0].seriesName + ' : ' + params[0].value + ' (℃)<br/>'
                   + params[1].seriesName + ' : ' + -params[1].value + ' (%)';
        }
    },
    legend: {
        data:['温度','湿度'],
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
            t1,t2,t3,t4,t5,t6
                 //obj[5].time,obj[4].time,obj[3].time,obj[2].time,obj[1].time,obj[0].time
            ]
        }
    ],
    yAxis : [
        {
            name : '温度(℃)',
            type : 'value',
            max : 40
        },
        {
            name : '湿度(%)',
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
            name:'温度',
            type:'line',
            itemStyle: {normal: {areaStyle: {type: 'default'}}},
            data:[a,b,c,d,e,f
           // obj[5].flow,obj[4].flow,obj[3].flow,obj[2].flow,obj[1].flow,obj[0].flow
            ]
        },
        {
            name:'湿度',
            type:'line',
            yAxisIndex:1,
            itemStyle: {normal: {areaStyle: {type: 'default'}}},
            data: (function(){
                var oriData = [
                r1,r2,r3,r4,r5,r6
                //obj[5].rain,obj[4].rain,obj[3].rain,obj[2].rain,obj[1].rain,obj[0].rain
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
            
            
            

    }    
</script>
  
  

<script type="text/javascript">
		var obj=${message};
		
		$(top.hangge());//关闭加载状态
		//rain(100,50,70,60,40,24);
		rain(obj[5].temp,obj[4].temp,obj[3].temp,obj[2].temp,obj[1].temp,obj[0].temp,obj[5].time,obj[4].time,obj[3].time,obj[2].time,obj[1].time,obj[0].time,obj[5].hum,obj[4].hum,obj[3].hum,obj[2].hum,obj[1].hum,obj[0].hum);
		//alert(4);
		
		$(document).ready(function() {
			init1();
		});
		
		function init1() {
			
	  	    
			  //alert(3);
           
         
				   
					function onEachFeature(feature, layer) {
						layer.on({
							mouseover: highlightFeature,
							mouseout: resetHighlight,
							click: zoomToFeature
						});
					}
				
					geojson = L.geoJson(statesData, {
						style: style,
						onEachFeature: onEachFeature
					}).addTo(map);
				
					var legend = L.control({position: 'bottomright'});
				
					legend.onAdd = function (map) {
				
						var div = L.DomUtil.create('div', 'info legend'),
							grades = [0, 5, 10, 15, 20, 25, 30, 35],
							labels = [],
							from, to;
				
						for (var i = 0; i < grades.length; i++) {
							from = grades[i];
							to = grades[i + 1];
				
							labels.push(
								'<i style="background:' + getColor(from + 1) + '"></i> ' + '&nbsp;' +
								from + (to ? '&ndash;' + to : '+') + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
						}
				
						div.innerHTML = labels.join('<br>');
						return div;
					};
				
					legend.addTo(map);   
	                 
	  	        
	  	       	
		}
		
</script>

  
  
  
  
  
 

<div>
    <div id='map1'></div>  <!--为雨量地图准备一个具备大小（宽高）的Dom-->
    <div id="main1" style="height:525px;width:625px;border:0px solid #ccc;padding:0px;  position:relative;top:-1050px;left:0px"></div>   <!--Step:1 为ECharts准备一个具备大小（宽高）的Dom-->
    </div>
 
    <!--Step:2 引入echarts-all.js-->
   <!-- 此处开始添加相应的地图信息 -->
  <script type="text/JavaScript" src="<%=path%>/js/echarts-all.js"></script>
  <script language="javascript" src="<%=path%>/js/jquery-1.3.2.min.js"></script>
   
  <script type="text/javascript">
  $(top.hangge());//关闭加载状态
  var myChart = echarts.init(document.getElementById('main1'));
  //alert(1);
   function rain(a,b,c,d,e,f,t1,t2,t3,t4,t5,t6,r1,r2,r3,r4,r5,r6)
   {
		//alert(2);
		//自适应宽高
		var myChartContainer = function () {
		    myChart.style.width = window.innerWidth+'px';
		    myChart.style.height = window.innerHeight+'px';
		};
		
        myChart.setOption({
				  title : {
        text: '雨量酸碱度关系图',
        x: 'center'
    },
    tooltip : {
        trigger: 'axis',
        formatter: function(params) {
            return params[0].name + '<br/>'
                   + params[0].seriesName + ' : ' + params[0].value + ' (mm)<br/>'
                   + params[1].seriesName + ' : ' + -params[1].value + ' (PH)';
        }
    },
    legend: {
        data:['雨量','酸碱度'],
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
            t1,t2,t3,t4,t5,t6
                 //obj[5].time,obj[4].time,obj[3].time,obj[2].time,obj[1].time,obj[0].time
            ]
        }
    ],
    yAxis : [
        {
            name : '雨量(mm)',
            type : 'value',
            max : 40
        },
        {
            name : '酸碱度(PH)',
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
            name:'雨量',
            type:'line',
            itemStyle: {normal: {areaStyle: {type: 'default'}}},
            data:[a,b,c,d,e,f
           // obj[5].flow,obj[4].flow,obj[3].flow,obj[2].flow,obj[1].flow,obj[0].flow
            ]
        },
        {
            name:'酸碱度',
            type:'line',
            yAxisIndex:1,
            itemStyle: {normal: {areaStyle: {type: 'default'}}},
            data: (function(){
                var oriData = [
                r1,r2,r3,r4,r5,r6
                //obj[5].rain,obj[4].rain,obj[3].rain,obj[2].rain,obj[1].rain,obj[0].rain
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
            
            
            

    }    
</script>
  
  

<script type="text/javascript">
		var obj=${message};
		var level="${warn.leveal}";
		var data=${warn.data};
		$(top.hangge());//关闭加载状态
		//rain(100,50,70,60,40,24);
		rain(obj[5].rain,obj[4].rain,obj[3].rain,obj[2].rain,obj[1].rain,obj[0].rain,obj[5].time,obj[4].time,obj[3].time,obj[2].time,obj[1].time,obj[0].time,obj[5].ph,obj[4].ph,obj[3].ph,obj[2].ph,obj[1].ph,obj[0].ph);
		//alert(4);
		
		$(document).ready(function() {
			init1();
		});
		
		function init1() {
			
	  	    
			  //alert(3);
           
         
				   
					function onEachFeature(feature, layer) {
						layer.on({
							mouseover: highlightFeature,
							mouseout: resetHighlight,
							click: zoomToFeature
						});
					}
				
					geojson = L.geoJson(statesData, {
						style: style,
						onEachFeature: onEachFeature
					}).addTo(map);
				
					var legend = L.control({position: 'bottomright'});
				
					legend.onAdd = function (map1) {
				
						var div = L.DomUtil.create('div', 'info legend'),
							grades = [0, 5, 10, 15, 20, 25, 30, 35],
							labels = [],
							from, to;
				
						for (var i = 0; i < grades.length; i++) {
							from = grades[i];
							to = grades[i + 1];
				
							labels.push(
								'<i style="background:' + getColor(from + 1) + '"></i> ' + '&nbsp;' +
								from + (to ? '&ndash;' + to : '+') + '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
						}
				
						div.innerHTML = labels.join('<br>');
						return div;
					};
				
					legend.addTo(map1);   
	                 
	  	        
	  	       	
		}
		if(obj[0].rain>data){
		alert('当前雨量预警级别为:'+level+'。 已超过预警值!请发送预警信息');
		}
</script>

  
  
  
  
  
 

</body>
</html>