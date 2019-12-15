<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<meta charset="utf-8" />
	<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
	<script type="text/javascript" src="static/js/jquery.min.js"></script>
	<link type="text/css" rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css"/>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>
<body>
	
<table style="width:100%;" border="0">
	<tr>
		<td style="width:10%;" valign="top" >
			<div class="widget-box" style="margin-top:5px;">
								<div class="widget-header ">
									<h5 id="tertitle">分组列表</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main" >
											<ul id="leftTree" class="ztree" style="overflow:auto;"></ul>
									</div>
								</div>
							</div>
		</td>
		<td style="width:90%;" valign="top" >
			<iframe name="treeFrame" id="treeFrame" frameborder="0" src="<%=basePath%>orgnz/listdata.do" style="margin:0 auto;width:100%;height:100%;"></iframe>
		</td>
	</tr>
</table>
		<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
<script type="text/javascript">
		$(top.hangge());
		var zTree;
		$(document).ready(function(){
			// ztree 设置
			var setting = {
				data: {simpleData: {enable: true}},
				callback: {	onClick: onClick}
			};
			var zTreeNodes = eval(${zTreeNodes});
			$.fn.zTree.init($("#leftTree"), setting,zTreeNodes);
			$("#treeFrame").attr("src","orgnz/listdata.do");
		});
		function onClick(e, treeId, treeNode) {
			var zTree = $.fn.zTree.getZTreeObj("leftTree"), 
			node = zTree.getSelectedNodes();
// 			node.sort(function compare(a, b) {
// 				return a.id - b.id;
// 			});
			var	aid = node[0].id ;
			$("#treeFrame").attr("src","orgnz/listdata.do?aid="+aid);
		}
		function treeFrameT(){
			var hmainT = document.getElementById("treeFrame");
			var bheightT = document.documentElement.clientHeight;
// 			hmainT .style.width = '100%';
			hmainT .style.height = (bheightT-26) + 'px';
			var treeT = document.getElementById("leftTree");
			     treeT .style.height = (bheightT-100)+'px';
		}
		treeFrameT();
		window.onresize=function(){  
			treeFrameT();
		};
</SCRIPT>
</body>
</html>

