<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
<link type="text/css" rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css"/>
<script type="text/javascript" src="static/js/jquery.min.js"></script>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.excheck.js"></script>
</head>
<body class="no-skin">

	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				
				<div class="page-content">
					<div class="row">
						<div class="col-xs-12">
							<div id="zhongxin">
							<input type="hidden" id="selectter" >
								<div style="overflow: auto; scrolling: yes;height:400px;width: 270px;">
								<ul id="tertree" class="ztree" style="overflow:auto;"></ul>
								</div>
							</div>
							<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green">正在保存...</h4></div>
							</div>
						</div>
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->
		<div style="width: 100%;padding-top: 5px;" class="center">
			<a class="btn btn-mini btn-primary" onclick="save();">保存</a>&nbsp;&nbsp;
			<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
		</div>


	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<script type="text/javascript">
			var zTree;
	$(document).ready(function(){
	
		$(top.hangge());//关闭加载状态
		
			var setting = {
				check: {enable: true},
				data: {simpleData: {enable: true}}
			};
			var zTreeNodes = eval(${areaTerJson});
			zTree=$.fn.zTree.init($("#tertree"), setting,zTreeNodes);
	});
	//保存
		 function save(){
		 	//获取选择终端
		var nodes = zTree.getCheckedNodes();
			var terids = "";
			for(var i=0; i<nodes.length; i++){
				if(nodes[i].type=="1"){
					terids += nodes[i].id+",";
				}
			}
			terids = terids.substring(0,terids.length-1);
			if(terids==""){
				$("#tertree").tips({
						side:3,
			            msg:'请选择播出终端',
			            bg:'#AE81FF',
			            time:3
			        });
					return false;
			}else{
				$("#selectter").val(terids);
			}
			$("#zhongxin").hide();
			$("#zhongxin2").show();
				top.Dialog.close();
			
		 }
	</script>
</body>
</html>