<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'wind.jsp' starting page</title>
    
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
    <div id="main" style="height:200px;width:450px;border:0px solid #ccc;padding:0px;"></div>
    <!--Step:2 引入echarts-all.js-->
   <script type="text/JavaScript" src="<%=path%>/js/echarts-all.js"></script>
   <script language="javascript" src="<%=path%>/js/jquery-1.3.2.min.js"></script>
	<script type="text/javascript">
	    $(top.hangge());//关闭加载状态
	    
	    var obj=${message};
	    var windpowermin=new Array(); //最小风力
	    var windpowermax=new Array(); //最大风力
	    var winddirection=new Array(); //获取风向
	    var arrawxz=new Array(); 
	    var time1=new Array();
	    var i;
	    for(i=0;i<6;i++) //获取JSON数组中的属性值(获取最近六个小时的数据)
	    {
	        windpowermin[i]=obj[i].wind_power.slice(0,1);  //获取最小风力大小
	        windpowermax[i]=obj[i].wind_power.slice(2,3);  //获取最大风力大小
	        winddirection[i]=obj[i].wind_direction; //获取风向
	        time1[i]=obj[i].time.slice(8,10)+":00";  //获取采集时间 ，去掉最后的那个逗号,slice()为字符串截取函数
	    }
	    //随风向而变的箭头旋转值 0--->正北方,45--->西北风,90--->西风,135-->西南风,180-->南风,-45-->东北风,-90-->东风,-135-->东南风
	    for(i=0;i<6;i++)
	   {
	    if(winddirection[i]=="北风")
	    {
	       arrawxz[i]=0;
	    }
	    if(winddirection[i]=="南风")
	    {
	       arrawxz[i]=180;
	    }
	    if(winddirection[i]=="西风")
	    {
	       arrawxz[i]=90;
	    }
	    if(winddirection[i]=="东风")
	    {
	       arrawxz[i]=-90;
	    }
	    if(winddirection[i]=="东北风")
	    {
	       arrawxz[i]=-45;
	    }
	     if(winddirection[i]=="西北风")
	    {
	       arrawxz[i]=45;
	    }
	     if(winddirection[i]=="东南风")
	    {
	       arrawxz[i]=-135;
	    }
	     if(winddirection[i]=="西南风")
	    {
	       arrawxz[i]=135;
	    }
	   }
	   
	    
		var myChart = echarts.init(document.getElementById('main'));
		
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
						//data : ['09/23','09/24','09/25','09/23','09/23','09/23']
						data:[time1[0]+'\n'+winddirection[0],time1[1]+'\n'+winddirection[1],time1[2]+'\n'+winddirection[2],time1[3]+'\n'+winddirection[3],time1[4]+'\n'+winddirection[4],time1[5]+'\n'+winddirection[5]]
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
					
					data:[{value:windpowermin[0],symbol:'arrow',symbolSize:10,symbolRotate:arrawxz[0],		   
						   
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
					{value:windpowermin[1],symbol:'arrow',symbolSize:10,symbolRotate:arrawxz[1],
					itemStyle:{
						normal:{
							color:'deepskyblue'
						}
					}
					}
					, {value:windpowermin[2],symbol:'arrow',symbolSize:10,symbolRotate:arrawxz[2],
					itemStyle:{
						normal:{
							color:'deepskyblue'
						}
					}
					}, 
					{value:windpowermin[3],symbol:'arrow',symbolSize:10,symbolRotate:arrawxz[3],
					itemStyle:{
						normal:{
							color:'deepskyblue'
						}
					}
					}, 
					{value:windpowermin[4],symbol:'arrow',symbolSize:10,symbolRotate:arrawxz[4],
					itemStyle:{
						normal:{
							color:'deepskyblue'
						}
					}
					}, 
					{value:windpowermin[5],symbol:'arrow',symbolSize:10,symbolRotate:arrawxz[5],
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
					data:[{value:windpowermax[0],symbol:'arrow',symbolSize:10,symbolRotate:arrawxz[0],
					itemStyle:{
						normal:{
						
							color:'plum'
						}
					}
					}, 
					{value:windpowermax[1],symbol:'arrow',symbolSize:10,symbolRotate:arrawxz[1],
					itemStyle:{
						normal:{
						
							color:'plum'
						}
					}
					}, 
					{value:windpowermax[2],symbol:'arrow',symbolSize:10,symbolRotate:arrawxz[2],
					itemStyle:{
						normal:{
						
							color:'plum'
						}
					}
					} ,
					{value:windpowermax[3],symbol:'arrow',symbolSize:10,symbolRotate:arrawxz[3],
					itemStyle:{
						normal:{
						
							color:'plum'
						}
					}
					}, 
					{value:windpowermax[4],symbol:'arrow',symbolSize:10,symbolRotate:arrawxz[4],
					itemStyle:{
						normal:{
						
							color:'plum'
						}
					}
					}, 
					{value:windpowermax[5],symbol:'arrow',symbolSize:10,symbolRotate:arrawxz[5],
					itemStyle:{
						normal:{
						
							color:'plum'
						}
					}
					}]
				}
			]
            });
	</script>
	<script language="javascript" src="jquery-1.3.2.min.js"></script>
</body>
</html>

