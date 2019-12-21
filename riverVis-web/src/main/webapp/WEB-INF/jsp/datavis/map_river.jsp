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
    
    <title>水库水位折线图展示</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="refresh" content="3600">
    <!-- <meta charset="utf-8" /> -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
  <script src="http://api.map.baidu.com/api?v=1.3" type="text/javascript"></script>  
  <script language="javascript" src="<%=path%>/js/jquery-1.3.2.min.js"></script>
  <script type="text/javascript">  
  	   $(top.hangge());//关闭加载状态
  	   
		 // var gt,bs,fa,tj,jl,stc,xsb;
	
			//雨量地图
		//	var chartData4;
			//var xAxisData = [];
			//var raindata = [];
			//
		//	var str="";
		/*
			if(${pd.chartData4!=''}){
			chartData4= eval(${pd.chartData4})
			
           console.info(chartData4)

             for (var i = 0; i<chartData4.length; i++){ 
                if(chartData4[i].rname=='谷塘水库') gt=chartData4[i].data;
                if(chartData4[i].rname=='北山水库') bs=chartData4[i].data;
                if(chartData4[i].rname=='付安水库') fa=chartData4[i].data;
                if(chartData4[i].rname=='团结水库') tj=chartData4[i].data;
                if(chartData4[i].rname=='蛟龙水库') jl=chartData4[i].data;
                if(chartData4[i].rname=='石塘冲水库')stc=chartData4[i].data;
                if(chartData4[i].rname=='响水坝水库')xsb=chartData4[i].data;
             }
             
  	   }
  	   */
        var map;  
        var beaches
        function initialize(){  
            map=new BMap.Map("container",{mapType:BMAP_HYBRID_MAP});  
            var point=new BMap.Point(113.153091,28.284059);  
            map.enableScrollWheelZoom(); //启用滚轮放大缩小，默认禁用
            map.centerAndZoom(point,10);  
            map.addControl(new BMap.NavigationControl());  
            map.addControl(new BMap.ScaleControl());  
            map.addControl(new BMap.OverviewMapControl());  
            map.addControl(new BMap.MapTypeControl());  
           
        }  
        //var beaches = "22.541693`114.080229||22.541693`114.080229||22.546529`114.041519||22.542327`114.106278";
          
        var opts={  
            width:250,//信息窗口宽度height:100,//信息窗口高度  
            title:"谷塘水库"//信息窗口标题  
        }  
        
        //编写自定义函数，创建标注  
        function addMarker(point,index){  
      //
          //var infoWindow=new BMap.InfoWindow("<a href=http://www.baidu.com>查看水库详细信息图表</a><br/>",opts);//创建信息窗口对象
          var infoWindow=new BMap.InfoWindow("<a href=<%=basePath%>chart5/waterstatistics>查看水库详细信息图表</a><br/>",opts);    
       
            var marker=new BMap.Marker(point);  
                map.addOverlay(marker);  
                marker.addEventListener("click",function(){  
                   map.openInfoWindow(infoWindow,point);//打开信息窗口  
            });  
        }

       function getValue(value)   //下拉框触发事件
       {
            //alert(value);
            //创建标注  
            //var marker=new BMap.Marker(point);  
            //map.addOverlay(marker);    
            if(value=="谷塘水库") {beaches="28.19117`113.246768";opts.title=value+"的水位为"+12;}
            if(value=="北山水库") {beaches="28.408909`113.003406";opts.title=value+"的水位为"+12;}
            if(value=="付安水库") {beaches="28.284059`113.153091";opts.title=value+"的水位为"+12;}
            if(value=="团结水库") {beaches="28.603276`113.341701";opts.title=value+"的水位为"+22;}
            if(value=="蛟龙水库") {beaches="28.21396`113.230582";opts.title=value+"的水位为"+23;}
            if(value=="石塘冲水库") {beaches="28.142148`113.261156";opts.title=value+"的水位为"+23;}
            if(value=="响水坝水库") {beaches="28.511873`113.198429";opts.title=value+"的水位为"+23;}
            //beaches = "28.19117`113.246768||28.408909`113.003406||28.284059`113.153091||28.603276`113.341701||28.21396`113.230582||28.142148`113.261156||28.511873`113.198429";  
            var bounds=map.getBounds();  
            var lngSpan=bounds.maxX-bounds.minX;  
            var latSpan=bounds.maxY-bounds.minY;  
            var gpsdatas = beaches.split("||");  
            //alert(gpsdatas.length);  
            for(var i=0;i<gpsdatas.length;i++){  
                var beach = gpsdatas[i].split("`");  
                var point=new BMap.Point(beach[1],beach[0]);  
                addMarker(point,i);  
            }  
       }  

</script>  
 </head>  
 <body onload="initialize()">  
 
 <!--<div style="position:absolute; top:15; right:20; width:200px;">  -->

<div>
<select name="sk" onChange="getValue(this.value)">		   
<option selected>=请选择需要查看的水库=</option>
				   				   
<option value="谷塘水库">谷塘水库</option> <!--谷塘水库的坐标:113.246768,28.19117  -->
		
<option value="北山水库">北山水库</option> <!--北山水库的坐标:113.003406,28.408909 -->

<option value="付安水库">付安水库</option> <!--付安水库的坐标:113.153091,28.284059 -->

<option value="团结水库">团结水库</option> <!--团结水库的坐标:113.341701,28.603276 -->                     

<option value="蛟龙水库">蛟龙水库</option> <!--蛟龙水库的坐标:113.230582,28.21396 -->

<option value="石塘冲水库">石塘冲水库</option>  <!--石塘冲水库的坐标:113.261156,28.142148 -->

<option value="响水坝水库">响水坝水库</option>  <!--响水坝水库的坐标:113.198429,28.511873 -->
</select>
</div> 
 
 <div id="container"style="width:600px;height:510px;border:1px solid red">
 </div>  
 
 </body>  
</html>  