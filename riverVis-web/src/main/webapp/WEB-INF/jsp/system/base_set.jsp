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
	<link type="text/css" rel="stylesheet" href="plugins/zTree/3.5/zTreeStyle.css"/>
	<script type="text/javascript" src="plugins/zTree/3.5/jquery.ztree.core-3.5.js"></script>
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
						
							<form action="" name="userForm" id="userForm" method="post" class="col-xs-10">
									<div >
									<table id="table_report" class="table table-striped table-bordered table-hover">
										<tr>
											<td style="width:150px;text-align: right;padding-top: 13px;">系统所有者:</td>
									<!--  	<td style="width: 520px; "><input type="text" name="owner" id="owner" value="${pd.owner }"  style="width:95%;"/></td>  -->
											<td style="width: 520px; "><input type="text" name="owner" id="owner" value="我心飞翔团队"  style="width:95%;"/></td>
											<td style="width:100px;text-align: right;padding-top: 13px;">
												<a class="btn btn-sm btn-primary" onclick="save();" id="save">保存</a>
											</td>
										</tr>
										<tr>
											<td style="width:150px;text-align: right;padding-top: 13px;">系统名称:</td>
											<td style="width: 520px; "><input type="text" name="systemname" id="systemname" value="${pd.systemname }"  style="width:95%;"/></td>
											<td style="width:100px;text-align: right;padding-top: 13px;">
												<a class="btn btn-sm btn-primary" onclick="save('systemname');" id="save">保存</a>
											</td>
										</tr>
										
										
									
										
									</table>
									</div>
								</form>
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
	<div id="areaContent" class="alert alert-info"  style="display:none; position: absolute;overflow:auto;background-color:#f0f6e4;border-color:#c3c3c3;padding:0px">
		<ul id="areaTree" class="ztree" style="margin-top:0; width:160px;"></ul>
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!-- inline scripts related to this page -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
</body>
<script type="text/javascript">
	$(top.hangge());
	//保存
	function save(objid) {
		if ($("#"+objid).val() == "") {
			$("#"+objid).tips({
				side : 3,
				msg : '请输入内容',
				bg : '#AE81FF',
				time : 2
			});
			$("#"+objid).focus();
			return false;
		}
			$.post("system/saveEdit.do", {content:$("#"+objid).val(),name:objid}, function(
					data) {
				if ("success" == data.result) {
					$("#"+objid).tips({
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