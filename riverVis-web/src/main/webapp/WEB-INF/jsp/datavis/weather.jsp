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
   	   <div style="height:30px;width:80px;border:0px solid #ccc;padding:0px;position:relative;top:18px;left:60px">
   <p id="p1">2017-10-14 周六</p>
<!--<p id="p2">实时空气质量:良好</p>--> 
	</div>
   
    <div style="height:70px;width:120px;border:0px solid #ccc;padding:0px;position:relative;top:0px;left:30px">
    <iframe id="a" src="" height=70px  width=120px  scrolling="no" frameborder="0" > 
    </iframe>
    </div>
    
    <div style="height:20px;width:80px;border:0px solid #ccc;padding:0px;position:relative;top:-5px;left:65px">
    <p id="p3">16℃(阴天)</p>
    </div>
 <!--     
    <div style="height:20px;width:80px;border:0px solid #ccc;padding:0px;position:relative;top:-5px;left:65px">
    <p id="p4">北风1级</p>
	</div>
 -->	
</div>
    
   <div id="center" style="height:180px;width:130px;border:0px solid #ccc;padding:0px;position:relative;top:-197px;left:140px">
  	 <div style="height:40px;width:90px;border:0px solid #ccc;padding:0px;position:relative;top:20px;left:60px">
     <p id="p5">10月15日</p>
     </div>
   	 <div style="height:70px;width:120px;border:0px solid #ccc;padding:0px;position:relative;top:0px;left:30px">
     <iframe id="b" src="" height=70px  width=120px  scrolling="no" frameborder="0" > 
     </iframe>
     </div>
     
     <div style="height:20px;width:80px;border:0px solid #ccc;padding:0px;position:relative;top:-5px;left:65px">
    <p id="p6">14-17℃</p>
    </div>
    
  <!--  
    <div style="height:20px;width:85px;border:0px solid #ccc;padding:0px;position:relative;top:-5px;left:65px">
    <p id="p7">北风2级</p>
	</div>
  -->    
	   
   </div>
   
   <div id="right" style="height:180px;width:150px;border:0px solid #ccc;padding:0px;position:relative;top:-392px;left:310px">
   	<div style="height:40px;width:90px;border:0px solid #ccc;padding:0px;position:relative;top:20px;left:28px">
     <p id="p8">10月16日</p>
     </div>
     
     <div style="height:70px;width:120px;border:0px solid #ccc;padding:0px;position:relative;top:0px;left:0px">
     <iframe id="c" src="" height=70px  width=120px  scrolling="no" frameborder="0" > 
     </iframe>
     </div>
     
    <div style="height:20px;width:80px;border:0px solid #ccc;padding:0px;position:relative;top:-5px;left:32px">
    <p id="p9">14-17℃</p>
    </div>
<!-- 
    <div style="height:20px;width:85px;border:0px solid #ccc;padding:0px;position:relative;top:-5px;left:32px">
    <p id="p10">北风3-4级</p>
	</div>
 --> 
   </div>
   
   
   
</div>
    
   <!--Step:1 Prepare a dom for ECharts which (must) has size (width & hight)-->
    <!--Step:1 为ECharts准备一个具备大小（宽高）的Dom-->
    <div id="main" style="height:140px;width:450px;border:0px solid #ccc;padding:0px;"></div>
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
	var x=document.getElementById("p1");x.innerHTML=(month1+1)+"月"+date1+"日"; //修改标签<P> id="p1"的内容
	var y=document.getElementById("p5");y.innerHTML=(month1+1)+"月"+(date1+1)+"日"; //修改标签<P> id="p5"的内容
	var z=document.getElementById("p8");z.innerHTML=(month1+1)+"月"+(date1+2)+"日"; //修改标签<P> id="p8"的内容
	
	//var weatherpic="http://app1.showapi.com/weather/icon/day/"+obj[0].weather_code+".png";
    //alert("http://app1.showapi.com/weather/icon/day/"+obj[0].weather_code+".png");
    var obj1=${message1};
    var weatherpicf2=weatherpicf2+"http://app1.showapi.com/weather/icon/day/"+obj1.weather_picf2+".png";
    var weatherpicf3=weatherpicf3+"http://app1.showapi.com/weather/icon/day/"+obj1.weather_picf3+".png";
    document.getElementById("b").src=weatherpicf2;
    document.getElementById("c").src=weatherpicf3;
    
    var tempf1=document.getElementById("p6");tempf1.innerHTML=obj1.mintempf2+"~"+obj1.maxtempf2+"℃"; //修改标签<P> id="p6"的内容
    var tempf2=document.getElementById("p9");tempf2.innerHTML=obj1.mintempf3+"~"+obj1.maxtempf3+"℃"; //修改标签<P> id="p9"的内容
    
    
    
    var obj=${message};
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
		var myChart = echarts.init(document.getElementById('main'));
		
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
             y2:22,
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
					min:-10,
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
      
	</script>
	
</body>
</html>
