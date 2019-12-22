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

<title>My JSP 'main1.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
    <meta name="description" content="百度地图地点搜索和鼠标点击地点获取经纬度，这些都是地图比较基本" />
    <meta name="keywords" content="百度地图,地点搜索,获取经纬度,改变地图鼠标样式,启用滚轮缩放" />
    <title>百度地图API地点搜索-获取经纬度DEMO</title>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=1.2"></script>
    <style type="text/css">*{ font-family: "微软雅黑";} #where,#lonlat,#lonlat2{ width:120px; height:20px; font-size:24px; color:blue;} #but{ width:100px; height:26px; font-size:20px;}</style></head>
  
  <body>
    <center>
      <form>
        <div style=" margin:auto;width:480px;height:200px;border:2px solid gray; margin-bottom:20px;position:relative;top:0px;left:-50px" id="container"></div>
 <!--    <h3 style="color: red;">介绍：输入地点然后点击“地图查找”搜索，再点击地图地点获取相应经纬度</h3>  -->    
        <label>输入地点：</label>
        <input id="where" name="where" type="text" placeholder="请输入地址">
        <input id="but" type="button" value="地图查找" onClick="sear(document.getElementById('where').value);" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 经度：
        <input id="lonlat" name="lonlat" type="number" maxlength="10">纬度：
        <input id="lonlat2" name="lonlat2" type="number" maxlength="9"></form></center>
  </body>
</html>
<script type="text/javascript">

   //如果经纬度没有给个默认值
  //var longitude=105.386515;
  //var latitude=28.91124;
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
      alert(e.point.lat);
      alert(e.point.lng);
      alert(rs.addressComponents.city);
      
        $.ajax({
				async : false,
				cache : false,
				type : 'POST',
			    url : "sensordata/ajax?data="+rs.addressComponents.city,  //返回当前数据到后台
				error : function() {
					alert('更新数据失败 ');
			    },
				success : function(data) {
				    
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