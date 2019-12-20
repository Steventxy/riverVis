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
<script type="text/JavaScript" src="<%=path%>/js/echarts.min.js"></script>
<script type="text/JavaScript" src="<%=path%>/js/hunan.js"></script>
<script language="javascript" src="<%=path%>/js/jquery-1.3.2.min.js"></script>


</head>


<frameset cols="70%,30%" >
      <frame  noresize="noresize" src="<%=basePath%>SanweiData/sanwei6" scrolling=no frameborder="no" border="0" framespacing="0"/>
      <frameset rows="50%,50%" >
       <frame  noresize="noresize" src="<%=basePath%>SanweiData/sanwei1" scrolling=no frameborder="no" border="0" framespacing="0"/>
      <frame  noresize="noresize" src="<%=basePath%>SanweiData/sanwei2"  scrolling=no frameborder="no" border="0" framespacing="0"/>
     <!--   <frame  noresize="noresize" src="<%=basePath%>chart4/sanwei1" scrolling=no frameborder="no" border="0" framespacing="0"/>
      <frame  noresize="noresize" src="<%=basePath%>chart4/sanwei2"  scrolling=no frameborder="no" border="0" framespacing="0"/>
     -->
     </frameset>  
</frameset>
 
<noframes>
<body>
       
</body>
</noframes>
</frameset>
</html>
