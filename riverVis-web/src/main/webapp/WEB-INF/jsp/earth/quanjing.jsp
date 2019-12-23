<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" >
<html>
	<head>
	<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
		<script language="javascript" src="<%=path%>/js/jquery-1.3.2.min.js"></script>
		<title></title>
		<script type="text/javascript" src="<%=path%>/js/swfobject.js">
		</script>
		<style type="text/css" title="Default">
			body, div, h1, h2, h3, span, p {
				font-family: Verdana,Arial,Helvetica,sans-serif;
				color: #000000; 
			}
			body {
				/* fullscreen */
				margin: 0px;
				overflow:hidden; /* disable scrollbars */
			}
			html, body {
				height:100%;
				font-size: 10pt;
				background : #ffffff; 
			}
			h1 {
				font-size: 18pt;
			}
			h2 {
				font-size: 14pt;
			}
			.warning {
				font-weight: bold;
			}
		</style>	
	</head>
	<body>
		<script type="text/javascript">
		 $(top.hangge());//关闭加载状态
<!--
	
			var flashvars = {};
			var params = {};
			params.quality = "high";
			params.bgcolor = "#ffffff";
			params.allowscriptaccess = "sameDomain";
			params.allowfullscreen = "true";
			params.base="../../浏阳河/output";
			var attributes = {};
			attributes.id = "pano";
			attributes.name = "pano";
			attributes.align = "middle";
			swfobject.embedSWF(
				"<%=path%>/1_out.swf", "flashContent", 
				"100%", "100%", 
				"9.0.0", "expressInstall.swf", 
				flashvars, params, attributes);
//-->
		</script>
		<div id="flashContent">
			<p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="Get Adobe Flash player" /></a></p>
		</div>
		<noscript>
			<p class="warning">Please enable Javascript!</p>
		</noscript>
	</body>
</html>
