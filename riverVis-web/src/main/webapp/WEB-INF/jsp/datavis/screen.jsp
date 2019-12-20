<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>河道环境数据监测1</title>
    
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
 
     <div id="up" style="height:150px;width:450px">
   
<div id="left" style="height:180px;width:150px">
   	   <div style="height:30px;width:80px;border:0px solid #ccc;padding:0px;position:relative;top:33px;left:65px">
   <p id="p1">2017-10-14 周六</p>
<!--<p id="p2">实时空气质量:良好</p>--> 
	</div>
   
    <div style="height:70px;width:120px;border:0px solid #ccc;padding:0px;position:relative;top:13px;left:35px">
    <iframe id="a" src="" height=70px  width=120px  scrolling="no" frameborder="0" > 
    </iframe>
    </div>
    
    <div style="height:20px;width:80px;border:0px solid #ccc;padding:0px;position:relative;top:10px;left:75px">
    <p id="p3">16℃(阴天)</p>
    </div>
 <!--     
    <div style="height:20px;width:80px;border:0px solid #ccc;padding:0px;position:relative;top:-5px;left:65px">
    <p id="p4">北风1级</p>
	</div>
 -->	
</div>
    
   <div id="center" style="height:180px;width:130px;border:0px solid #ccc;padding:0px;position:relative;top:-189px;left:145px">
  	 <div style="height:40px;width:90px;border:0px solid #ccc;padding:0px;position:relative;top:25px;left:65px">
     <p id="p5">10月15日</p>
     </div>
   	 <div style="height:70px;width:120px;border:0px solid #ccc;padding:0px;position:relative;top:5px;left:35px">
     <iframe id="b" src="" height=70px  width=120px  scrolling="no" frameborder="0" > 
     </iframe>
     </div>
     
     <div style="height:20px;width:80px;border:0px solid #ccc;padding:0px;position:relative;top:-1px;left:70px">
    <p id="p6">14-17℃</p>
    </div>
    
  <!--  
    <div style="height:20px;width:85px;border:0px solid #ccc;padding:0px;position:relative;top:-5px;left:65px">
    <p id="p7">北风2级</p>
	</div>
  -->    
	   
   </div>
   
   <div id="right" style="height:180px;width:150px;border:0px solid #ccc;padding:0px;position:relative;top:-385px;left:315px">
   	<div style="height:40px;width:90px;border:0px solid #ccc;padding:0px;position:relative;top:25px;left:33px">
     <p id="p8">10月16日</p>
     </div>
     
     <div style="height:70px;width:120px;border:0px solid #ccc;padding:0px;position:relative;top:5px;left:5px">
     <iframe id="c" src="" height=70px  width=120px  scrolling="no" frameborder="0" > 
     </iframe>
     </div>
     
    <div style="height:20px;width:80px;border:0px solid #ccc;padding:0px;position:relative;top:-1px;left:37px">
    <p id="p9">14-17℃</p>
    </div>
<!-- 
    <div style="height:20px;width:85px;border:0px solid #ccc;padding:0px;position:relative;top:-5px;left:32px">
    <p id="p10">北风3-4级</p>
	</div>
 --> 
   </div>
   
   
   
</div>
    
    
       <!--Step:1 为ECharts准备一个具备大小（宽高）的Dom-->
  <!--  <div id="aqi" style="height:320px;width:320px;border:0px solid #ccc;padding:0px;position:relative;top:5px;left:60px"></div> -->
   <div id="aqi" style="height:350px;width:350px;border:0px solid #ccc;padding:0px;position:relative;top:45px;left:55px"></div>
   <!--Step:2 引入echarts-all.js-->
   <script type="text/JavaScript" src="<%=path%>/js/echarts-all.js"></script>
   <script language="javascript" src="<%=path%>/js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript">
	    $(top.hangge());//关闭加载状态
	    
	   
       
	    
	  function tqzl(pm25,pm10,co,no2,so2,o3)
	  {
		var myChart = echarts.init(document.getElementById('aqi'));
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
                    value :// [100, 100 , 5 , 100 , 100 , 100],
                    [pm25, pm10, co, no2, so2, o3],
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
        
}       
</script>
    
    
    
   <!--Step:1 Prepare a dom for ECharts which (must) has size (width & hight)-->
    <!--Step:1 为ECharts准备一个具备大小（宽高）的Dom-->
    <div id="weather" style="height:140px;width:450px;border:0px solid #ccc;padding:0px;position:relative;top:-480px;left:585px"></div> 
    <!--Step:2 引入echarts-all.js-->
    <script src="js/echarts-all.js"></script>
    
   <!-- 此处开始添加相应的地图信息 -->
  <script type="text/JavaScript" src="<%=path%>/js/echarts-all.js"></script>
  <script language="javascript" src="<%=path%>/js/jquery-1.3.2.min.js"></script>
  <script type="text/javascript">
    $(top.hangge());//关闭加载状态
	//alert(${message});
	
	var d = new Date();
	month1=d.getMonth();
	date1=d.getDate();
	var date2 = new Date(d);
	date2.setDate(d.getDate()+1);
	var date3 = new Date(date2);
	date3.setDate(date2.getDate()+1);
	var x=document.getElementById("p1");x.innerHTML=(month1+1)+"月"+date1+"日"; //修改标签<P> id="p1"的内容
	var y=document.getElementById("p5");y.innerHTML=(date2.getMonth()+1)+"月"+date2.getDate()+"日"; //修改标签<P> id="p5"的内容
	var z=document.getElementById("p8");z.innerHTML=(date3.getMonth()+1)+"月"+date3.getDate()+"日"; //修改标签<P> id="p8"的内容
	
	//var weatherpic="http://app1.showapi.com/weather/icon/day/"+obj[0].weather_code+".png";
    //alert("http://app1.showapi.com/weather/icon/day/"+obj[0].weather_code+".png");
   
    function wd1(obj1)
   {
    var weatherpicf2=weatherpicf2+"http://app1.showapi.com/weather/icon/day/"+obj1.weather_picf2+".png";
    var weatherpicf3=weatherpicf3+"http://app1.showapi.com/weather/icon/day/"+obj1.weather_picf3+".png";
    document.getElementById("b").src=weatherpicf2;
    document.getElementById("c").src=weatherpicf3;
    
    var tempf1=document.getElementById("p6");tempf1.innerHTML=obj1.mintempf2+"~"+obj1.maxtempf2+"℃"; //修改标签<P> id="p6"的内容
    var tempf2=document.getElementById("p9");tempf2.innerHTML=obj1.mintempf3+"~"+obj1.maxtempf3+"℃"; //修改标签<P> id="p9"的内容
   }
    
    
    function wd(obj)
   {
    var weatherpic1="";
    weatherpic1=weatherpic1+"http://app1.showapi.com/weather/icon/day/"+obj[0].weather_code+".png";
    //var weatherpic="http://app1.showapi.com/weather/icon/day/";
    //alert(stra);
	document.getElementById("a").src=weatherpic1;
	document.getElementById("b").src="http://app1.showapi.com/weather/icon/day/02.png";
	document.getElementById("c").src="http://app1.showapi.com/weather/icon/day/00.png";
	
		var i;
		var temp=new Array();  //存储温度变量
		var time1=new Array();  //存储时间变量
		for(i=0;i<6;i++) //获取JSON数组中的属性值(获取最近六个小时的数据)
	    {
	       temp[i]=obj[i].temperature;
	       time1[i]=obj[i].time.slice(8,10)+":00";  //获取采集时间 ，去掉最后的那个逗号,slice()为字符串截取函数
	    }
	    //alert(obj[0].weather_code);
	    var t=document.getElementById("p3");t.innerHTML=temp[0]+"℃"+"("+obj[0].weather+")"; //修改标签<P> id="p3"的内容
		var myChart = echarts.init(document.getElementById('weather'));
		
		//自适应宽高
		var myChartContainer = function () {
		    myChart.style.width = window.innerWidth+'px';
		    myChart.style.height = window.innerHeight+'px';
		};
		
        myChart.setOption({
          title : {
        text: '',
        subtext: ''
     },
     grid:{
             x:40,
             y:22,
             x2:0,
             y2:8,
             //borderWidth:1
     },
     
     
            tooltip : {
                trigger: 'axis'
            },
            legend: {
                data:['温度']
            },
            toolbox: {
                //show:false,
                show : true,
                feature : {
                    //mark : {show: true},
                    mark : {show: false},
                    //dataView : {show: true, readOnly: false},
                    dataView : {show: false, readOnly: false},
                    magicType : {show: true, type: ['line', 'bar']},
                    //restore : {show: true},
                    restore : {show: false},
                    //saveAsImage : {show: true}
                    saveAsImage : {show: false}
                }
            },
            calculable : true,
            xAxis : [
                {
                    type : 'category',
                    data : [time1[0],time1[1],time1[2],time1[3],time1[4],time1[5]]
                }
            ],
            yAxis : [
                {
                    type : 'value',
					min:-20,
					max:45,
                    splitArea : {show : true},
                     axisLabel : {
                formatter: '{value} ℃'
            }
                }
            ],
            series : [
               
                {
                    name:'温度',
                    type:'bar',
                    data: [temp[0],temp[1],temp[2],temp[3],temp[4],temp[5]]
                }
            ]
        });
        
     } 
	</script>
 
 
 
 
 
 
	 <!--Step:1 为ECharts准备一个具备大小（宽高）的Dom-->
    <div id="wind" style="height:200px;width:450px;border:0px solid #ccc;padding:0px;position:relative;top:-480px;left:585px"></div>
    <!--Step:2 引入echarts-all.js-->
   <script type="text/JavaScript" src="<%=path%>/js/echarts-all.js"></script>
   <script language="javascript" src="<%=path%>/js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript">
	   $(top.hangge());//关闭加载状态
	   
	   
	  function winddata(t1,t2,t3,t4,t5,t6,d1,d2,d3,d4,d5,d6,winmin1,winmin2,winmin3,winmin4,winmin5,winmin6,winmax1,winmax2,winmax3,winmax4,winmax5,winmax6){
	    
	   var dr=new Array();
	   dr[0]=d1;dr[1]=d2;dr[2]=d3;dr[3]=d4;dr[4]=d5;dr[5]=d6;
		//随风向而变的箭头旋转值 0--->正北方,45--->西北风,90--->西风,135-->西南风,180-->南风,-45-->东北风,-90-->东风,-135-->东南风
	    for(i=0;i<6;i++)
	   {
	    if(dr[i]=="北风")
	    {
	       arrawxz[i]=0;
	    }
	    if(dr[i]=="南风")
	    {
	       arrawxz[i]=180;
	    }
	    if(dr[i]=="西风")
	    {
	       arrawxz[i]=90;
	    }
	    if(dr[i]=="东风")
	    {
	       arrawxz[i]=-90;
	    }
	    if(dr[i]=="东北风")
	    {
	       arrawxz[i]=-45;
	    }
	     if(dr[i]=="西北风")
	    {
	       arrawxz[i]=45;
	    }
	     if(dr[i]=="东南风")
	    {
	       arrawxz[i]=-135;
	    }
	     if(dr[i]=="西南风")
	    {
	       arrawxz[i]=135;
	    }
	   }
		
		var myChart = echarts.init(document.getElementById('wind'));
		
		//自适应宽高
		var myChartContainer = function () {
		    myChart.style.width = window.innerWidth+'px';
		    myChart.style.height = window.innerHeight+'px';
		};
		
        myChart.setOption({
				title:{
					/*text:"未来一周气温变化",
					subtext:"纯属虚构"*/
				},
				grid:{
					x:40,
					y:22,
             		x2:0,
             		y2:35
     			},
                tooltip : {
                    trigger: 'axis'
                },
				legend: {
        			data:['最小风力','最大风力']
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
			
						axisLine:{
							show:true
						},
						axisTick:{
							show:true,
							length:{}
						},
						splitLine:{
							show:true
						},
						data:[t1+'\n'+d1,t2+'\n'+d2,t3+'\n'+d3,t4+'\n'+d4,t5+'\n'+d5,t6+'\n'+d6]
						//data:[time1[0]+'\n'+winddirection[0],time1[1]+'\n'+winddirection[1],time1[2]+'\n'+winddirection[2],time1[3]+'\n'+winddirection[3],time1[4]+'\n'+winddirection[4],time1[5]+'\n'+winddirection[5]]
						//data:['12:00','13:00','14:00','15:00','16:00','17:00']
                        //data:['东北风\n09/23','东北风\n09/24','西南风\n09/25','东北风\n09/23','东北风\n09/23','西北风\n09/23']
                    }/*,
					{
						type:'category',
						axisLine:{
							show:true
						},
						axisTick:{
							show:true
						},
						splitLine:{
							show:true
						},
						data:['昨天\n东北风','今天\n东北风','明天\n西南风','周三\n西南风','周四\n北风','周五\n东北风']
					}*/
                ],
                yAxis : [
                    {
                        type: 'value',
						axisLabel: {
						formatter: '{value} 级'
        				}
					}
                ],
				series : [
				{
					name:'最小风力',
					type:'line',
					
					data:[{//value:1,symbol:'arrow',symbolSize:10,symbolRotate:45,
					value:winmin1,symbol:'arrow',symbolSize:10,symbolRotate:arrawxz[0],		   
						   
					itemStyle:{
						/*normal:{
						
							label:{
							show:true,
							textStyle:{
								fontSize:'15'
							}
							},
							emhasis:{label:{show:true}},
							color:'gray'
						}*/
						normal:{
							color:'deepskyblue'
						}
					}
					}, 
					{//value:1,symbol:'arrow',symbolSize:10,symbolRotate:45,
					value:winmin2,symbol:'arrow',symbolSize:10,symbolRotate:arrawxz[1],
					itemStyle:{
						normal:{
							color:'deepskyblue'
						}
					}
					}
					, {
					//value:1,symbol:'arrow',symbolSize:10,symbolRotate:45,
					value:winmin3,symbol:'arrow',symbolSize:10,symbolRotate:arrawxz[2],
					itemStyle:{
						normal:{
							color:'deepskyblue'
						}
					}
					}, 
					{//value:1,symbol:'arrow',symbolSize:10,symbolRotate:45,
					value:winmin4,symbol:'arrow',symbolSize:10,symbolRotate:arrawxz[3],
					itemStyle:{
						normal:{
							color:'deepskyblue'
						}
					}
					}, 
					{//value:1,symbol:'arrow',symbolSize:10,symbolRotate:45,
					value:winmin5,symbol:'arrow',symbolSize:10,symbolRotate:arrawxz[4],
					itemStyle:{
						normal:{
							color:'deepskyblue'
						}
					}
					}, 
					{//value:1,symbol:'arrow',symbolSize:10,symbolRotate:45,
					value:winmin6,symbol:'arrow',symbolSize:10,symbolRotate:arrawxz[5],
					itemStyle:{
						normal:{
							color:'deepskyblue'
						}
					}
					}]
					
				},
				{
					name:'最大风力',
					type:'line',
					data:[{//value:1,symbol:'arrow',symbolSize:10,symbolRotate:45,
					value:winmax1,symbol:'arrow',symbolSize:10,symbolRotate:arrawxz[0],
					itemStyle:{
						normal:{
						
							color:'plum'
						}
					}
					}, 
					{//value:1,symbol:'arrow',symbolSize:10,symbolRotate:45,
					value:winmax2,symbol:'arrow',symbolSize:10,symbolRotate:arrawxz[1],
					itemStyle:{
						normal:{
						
							color:'plum'
						}
					}
					}, 
					{//value:1,symbol:'arrow',symbolSize:10,symbolRotate:45,
					value:winmax3,symbol:'arrow',symbolSize:10,symbolRotate:arrawxz[2],
					itemStyle:{
						normal:{
						
							color:'plum'
						}
					}
					} ,
					{//value:1,symbol:'arrow',symbolSize:10,symbolRotate:45,
					value:winmax4,symbol:'arrow',symbolSize:10,symbolRotate:arrawxz[3],
					itemStyle:{
						normal:{
						
							color:'plum'
						}
					}
					}, 
					{//value:1,symbol:'arrow',symbolSize:10,symbolRotate:45,
					value:winmax5,symbol:'arrow',symbolSize:10,symbolRotate:arrawxz[4],
					itemStyle:{
						normal:{
						
							color:'plum'
						}
					}
					}, 
					{//value:1,symbol:'arrow',symbolSize:10,symbolRotate:45,
					value:winmax6,symbol:'arrow',symbolSize:10,symbolRotate:arrawxz[5],
					itemStyle:{
						normal:{
						
							color:'plum'
						}
					}
					}]
				}
			]
            });
            
      }  
	</script>
	
	
	
	
	
  

	


<script type="text/javascript" src="http://api.map.baidu.com/api?v=1.2"></script>
<center>
<form>
        <div style=" margin:auto;width:480px;height:200px;border:2px solid gray; margin-bottom:20px;position:relative;top:-470px;left:190px" id="container"></div>
 <!--    <h3 style="color: red;">介绍：输入地点然后点击“地图查找”搜索，再点击地图地点获取相应经纬度</h3>    
        <label>输入地点：</label>
        <input id="where" name="where" type="text" placeholder="请输入地址">
        <input id="but" type="button" value="地图查找" onClick="sear(document.getElementById('where').value);" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 经度：
        <input id="lonlat" name="lonlat" type="number" maxlength="10">纬度：
        <input id="lonlat2" name="lonlat2" type="number" maxlength="9">
  --> 
</form>
</center>

<script type="text/javascript">
        var obj2=${wind};
	    var windpowermin=new Array(); //最小风力
	    var windpowermax=new Array(); //最大风力
	    var winddirection=new Array(); //获取风向
	    var arrawxz=new Array(); 
	    var time1=new Array();
	    var i;
	    for(i=0;i<6;i++) //获取JSON数组中的属性值(获取最近六个小时的数据)
	    {
	        windpowermin[i]=obj2[i].wind_power.slice(0,1);  //获取最小风力大小
	        windpowermax[i]=obj2[i].wind_power.slice(2,3);  //获取最大风力大小
	        winddirection[i]=obj2[i].wind_direction; //获取风向
	        time1[i]=obj2[i].time.slice(8,10)+":00";  //获取采集时间 ，去掉最后的那个逗号,slice()为字符串截取函数
	    }
	
	  t1=time1[0];t2=time1[1];t3=time1[2];t4=time1[3];t5=time1[4];t6=time1[5];
	  d1=winddirection[0];d2=winddirection[1];d3=winddirection[2];d4=winddirection[3];d5=winddirection[4];d6=winddirection[5];
	  winmin1=windpowermin[0];winmin2=windpowermin[1];winmin3=windpowermin[2];winmin4=windpowermin[3];winmin5=windpowermin[4];winmin6=windpowermin[5];
	  winmax1=windpowermax[0];winmax2=windpowermax[1];winmax3=windpowermax[2];winmax4=windpowermax[3];winmax5=windpowermax[4];winmax6=windpowermax[5];

  winddata(t1,t2,t3,t4,t5,t6,d1,d2,d3,d4,d5,d6,winmin1,winmin2,winmin3,winmin4,winmin5,winmin6,winmax1,winmax2,winmax3,winmax4,winmax5,winmax6);
  
  
  
   var obj3=${aqi};
   var pm25=obj3.pm2_5; //获得pm2.5
   var pm10=obj3.pm10;
   var co=obj3.co;
   var no2=obj3.no2;
   var so2=obj3.so2;
   var o3=obj3.o3;
   tqzl(pm25,pm10,co,no2,so2,o3);
   
  var tempa1=${message1};
  wd1(tempa1);
  
  var tempat=${message};
  wd(tempat);
 
  //如果经纬度没有给个默认值
  var longitude=113.153091;
  var latitude=28.284059;
   
  var map = new BMap.Map("container",{mapType:BMAP_HYBRID_MAP});
  map.setDefaultCursor("crosshair");
  map.enableScrollWheelZoom();
  var point = new BMap.Point(longitude,latitude);
  map.centerAndZoom(point, 13);
  var gc = new BMap.Geocoder();
  map.addControl(new BMap.NavigationControl());
  map.addControl(new BMap.OverviewMapControl());
  map.addControl(new BMap.ScaleControl());
  map.addControl(new BMap.MapTypeControl());
  map.addControl(new BMap.CopyrightControl());
  var marker = new BMap.Marker(point);
  map.addOverlay(marker);
  marker.addEventListener("click",
  function(e) {
    document.getElementById("lonlat").value = e.point.lng;
    document.getElementById("lonlat2").value = e.point.lat;
  });
  marker.enableDragging();
  marker.addEventListener("dragend",
  function(e) {
    gc.getLocation(e.point,
    function(rs) {
      /*alert(e.point.lat);
      alert(e.point.lng);
      alert(rs.addressComponents.city);*/
      var jwd=e.point.lat+","+e.point.lng;
        $.ajax({
				async : false,
				cache : false,
				type : 'POST',
			    url : "data/screen_ajax_address?area="+rs.addressComponents.city,  //返回当前数据到后台
				error : function() {
					alert('更新数据失败 ');
			    },
				success : function(data) {
				    var getdata = eval("(" + data + ")");  //获得wind_data
				    //alert(getdata[0].wind_power);
				    wd(getdata);
				    
				    
				    var windpowermin1=new Array(); //最小风力
				    var windpowermax1=new Array(); //最大风力
				    var winddirection1=new Array(); //获取风向
				    var time2=new Array();
				    var i;
				    for(i=0;i<6;i++) //获取JSON数组中的属性值(获取最近六个小时的数据)
				    {
				        windpowermin1[i]=getdata[i].wind_power.slice(0,1);  //获取最小风力大小
				        windpowermax1[i]=getdata[i].wind_power.slice(2,3);  //获取最大风力大小
				        winddirection1[i]=getdata[i].wind_direction; //获取风向
				        time2[i]=getdata[i].time.slice(8,10)+":00";  //获取采集时间 ，去掉最后的那个逗号,slice()为字符串截取函数
				    }
				    winddata(time2[0],time2[1],time2[2],time2[3],time2[4],time2[5],winddirection1[0],winddirection1[1],winddirection1[2],winddirection1[3],winddirection1[4],winddirection1[5], windpowermin1[0],windpowermin1[1],windpowermin1[2],windpowermin1[3],windpowermin1[4],windpowermin1[5],windpowermax1[0],windpowermax1[1],windpowermax1[2],windpowermax1[3],windpowermax1[4],windpowermax1[5]);
                 }
			 });
		 
		 $.ajax({
				async : false,
				cache : false,
				type : 'POST',
			    url : "data/screen_ajax_jwd?jwd="+jwd,  //返回当前数据到后台
				error : function() {
					alert('更新数据失败 ');
			    },
				success : function(data) {
				
				     var getdata = eval("(" + data + ")");  //获得aqi_data
				     
				     wd1(getdata);
				     
				     var pm25=getdata.pm2_5; //获得pm2.5
   					 var pm10=getdata.pm10;
   					 var co=getdata.co;
   					 var no2=getdata.no2;
   					 var so2=getdata.so2;
   					 var o3=getdata.o3;
                     tqzl(pm25,pm10,co,no2,so2,o3);
                 }
			 });
		 
		 
      showLocationInfo(e.point, rs);
    });
  });
  function showLocationInfo(pt, rs) {
    var opts = {
      width: 250,
      height: 150,
      title: "当前位置"
    };
    var addComp = rs.addressComponents;
    var addr = "当前位置：" + addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber + "<br/>";
    addr += "纬度: " + pt.lat + ", " + "经度：" + pt.lng;
    var infoWindow = new BMap.InfoWindow(addr, opts);
    marker.openInfoWindow(infoWindow);
  }
  map.addEventListener("click",
  function(e) {
    document.getElementById("lonlat").value = e.point.lng;
    document.getElementById("lonlat2").value = e.point.lat;
  });
  var traffic = new BMap.TrafficLayer();
  map.addTileLayer(traffic);
  function iploac(result) {
    var cityName = result.name;
  }
  var myCity = new BMap.LocalCity();
  myCity.get(iploac);
  function sear(result) {
    var local = new BMap.LocalSearch(map, {
      renderOptions: {
        map: map
      }
    });
    local.search(result);
  }

  </script>	
	
</body>
</html>
