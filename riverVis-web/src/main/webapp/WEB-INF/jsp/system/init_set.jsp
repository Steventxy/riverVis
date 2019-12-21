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
<script type="text/javascript" src="static/js/jquery.min.js"></script>
	<style>
        .droppable-active{background-color:#ffe!important}.tools a{cursor:pointer;font-size:80%}.form-body .col-md-6,.form-body .col-md-12{min-height:400px}.draggable{cursor:move}
    </style>
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
									<div >
									<table id="table_report" class="table table-striped table-bordered table-hover">
										<tr>
											<td style="width: 1137px;color:red;text-align:center; ">注意：系统初始化后，系统所有的数据将全部清空，用户账号仅仅保留admin一个账号，请谨慎操作!</td>
										</tr>
										<tr>
											<td style="text-align:center;;padding-left:5px;"><a class="btn btn-sm btn-warning" onclick="setinit();">确认初始化</a></td>																																												
										</tr>
									</table>
									</div>
									</div><!-- /.col -->
						            
						        </div><!-- row -->
						    </div>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
		<!-- /.main-content -->
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>
<script type="text/javascript">
	$().ready(function() {
		$(top.hangge());
	});
	//保存
	function setinit() {
			$.post("system/initSystem.do", $("#userForm").serializeArray(), function(
					data) {
				if ("success" == data.result) {
					$("#save").tips({
						side : 3,
						msg : "保存成功",
						bg : '#AE81FF',
						time : 2
					});
				}
			});

	}
</script>
</html>