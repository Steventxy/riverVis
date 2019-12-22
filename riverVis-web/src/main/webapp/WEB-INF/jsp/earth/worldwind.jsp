<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML >
<html>
<head lang="en">
<base href="<%=basePath%>">
    
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<meta http-equiv="refresh" content="3600"> 
	 <script  src="<%=path%>/js/jquery-1.3.2.min.js"type="text/javascript"></script>
	   <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="<%=path%>/js/bootstrap.min.css">
    <script src="<%=path%>/js/jquery-1.9.1.js" type="text/javascript"></script>
    <script src="<%=path%>/js/bootstrap.min.js"></script>
    <script data-main="<%=path%>/js/worldwindjs/wwjs/Main" src="<%=path%>/js/require.min.js"></script>
  
 </head>  
 <body>  
<div class="container">
    
    <div class="row">
        <div class="col-sm-3">
            <h4>模式</h4>
            <div class="dropdown" id="projectionDropdown">
            </div>
            <br>
            <h4>图层</h4>
            <div class="list-group" id="layerList">
            </div>
            <br>目的地</h4>
            <div class="input-group" id="searchBox">
                <input type="text" class="form-control" placeholder="GoTo" id="searchText"/>
                <span class="input-group-btn">
                    <button id="searchButton" class="btn btn-primary" type="button">
                        <span class="glyphicon glyphicon-search"></span>
                    </button>
                </span>
            </div>
        </div>
        <div class="col-sm-9" id="globe">
            <canvas id="canvasOne" width="1000" height="700" style="width: 100%; height:100%;">
                Your browser does not support HTML5 Canvas.
            </canvas>
        </div>
    </div>
      
</div>
 <script type="text/javascript">  
  	   $(top.hangge());//关闭加载状态  
</script>
 </body>  
</html>  

