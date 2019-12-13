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
</head>
<body class="no-skin">
	<!-- /section:basics/navbar.layout -->
	<div class="main-container" id="main-container">
		<!-- /section:basics/sidebar -->
		<div class="main-content">
			<div class="main-content-inner">
				<div class="page-content">
					<div class="row">
						<div class="col-xs-6 col-xs-offset-3">
								<form action="users/${msg }.do" name="userForm" id="userForm" method="post">
									<input type="hidden" name="userid" id="userid" value="${user.userid }"/>
									<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report" class="table table-striped table-bordered table-hover">
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">用户名:</td>
											<td><input type="text" value="${user.username }" readonly="readonly" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">登陆账号:</td>
											<td><input type="text" value="${user.loginid }" maxlength="32"  readonly="readonly"  style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">原始密码:</td>
											<td><input type="password" name="oldpwd" id="oldpwd"  maxlength="32" placeholder="输入原始密码" title="原始密码" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">新密码:</td>
											<td><input type="password" name="newpwd" id="newpwd"  maxlength="32" placeholder="输入新密码" title="新密码" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="width:79px;text-align: right;padding-top: 13px;">确认密码:</td>
											<td><input type="password" name="chkpwd" id="chkpwd"  maxlength="32" placeholder="确认密码" title="确认密码" style="width:98%;"/></td>
										</tr>
										<tr>
											<td style="text-align: center;" colspan="10">
												<a class="btn btn-mini btn-primary" id="save" onclick="save();">保存</a>&nbsp;&nbsp;
												<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
											</td>
										</tr>
									</table>
									</div>
									<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><br/><img src="static/images/jiazai.gif" /><br/><h4 class="lighter block green"></h4></div>
								</form>
						</div>
						<!-- /.col -->
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->
	</div>
	<!-- /.main-container -->
	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
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
	function save(){
		
		if( $("#oldpwd").val()==""){
			$("#oldpwd").tips({
				side:3,
	            msg:'输入原始密码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#oldpwd").focus();
			return false;
		}
		if( $("#newpwd").val()==""){
			$("#newpwd").tips({
				side:3,
	            msg:'输入新密码',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#newpwd").focus();
			return false;
		}
		if( $("#newpwd").val()==$("#oldpwd").val()){
			$("#newpwd").tips({
				side:3,
	            msg:'新密码与原密码相同',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#newpwd").focus();
			return false;
		}
		if($("#newpwd").val()!=$("#chkpwd").val()){
			
			$("#chkpwd").tips({
				side:3,
	            msg:'两次密码不一致',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#chkpwd").focus();
			return false;
		}
		
			$.post("users/judgePwd",{"password":$("#oldpwd").val()}, 
			function(data) {
				if ("success" == data.result) {
				bootbox.confirm("确定要修改密码吗?", function(result) {
						top.jzts();
						$("#userid").val(data.userid);
						$.post("users/${msg }.do", $("#userForm").serialize(), function(data) {
							if ("success" == data.result) {
								$("#oldpwd").val("");
								$("#newpwd").val("");
								$("#chkpwd").val("");
								$(top.hangge());
								$("#save").tips({
									side : 3,
									msg : '修改成功',
									bg : '#AE81FF',
									time : 2
								});
							}else{
								$("#oldpwd").val("");
								$("#newpwd").val("");
								$("#chkpwd").val("");
								$(top.hangge());
								$("#save").tips({
									side : 3,
									msg : '修改出错',
									bg : '#AE81FF',
									time : 2
								});
							}
						});
					});
				}else{
					$("#oldpwd").tips({
						side : 3,
						msg : '密码错误，请重新输入',
						bg : '#AE81FF',
						time : 2
					});
					$("#oldpwd").val("");
					$("#oldpwd").focus();
				}
			});
// 		};
	
			
		}
</script>
</html>