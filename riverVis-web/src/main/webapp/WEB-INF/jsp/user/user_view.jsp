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
								<form  name="userForm" id="userForm" method="post">
									<input type="hidden" name="userid" id="user_id" value="${user.userid }"/>
									<input type="hidden" name="aid" id="aid" value="${user.aid }"/>
									<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report" class="table table-striped table-bordered table-hover">
										<tr>
											<td style="width:90px;text-align: right;padding-top: 13px;">用户姓名:</td>
											<td><input type="text" value="${user.username}" id="username"  name="username" title="用户姓名:" style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:90px;text-align: right;padding-top: 13px;">用户类型:</td>
											<td>
												<select class="chosen-select form-control" id="usertype" name="usertype" value="${user.usertypes }"  data-placeholder="请分配角色" style="width:98%;">
													<option value="" ></option>
													<option value="县级" <c:if test="${user.usertypes=='县级'}">selected</c:if>>县级</option>
													<option value="乡级" <c:if test="${user.usertypes=='乡级'}">selected</c:if>>乡级</option>
												  </select>
											</td>
										</tr>
										<tr>
											<td style="width:90px;text-align: right;padding-top: 13px;">登录账号:</td>
											<td><input type="text" value="${user.loginid }" id="loginid" name="loginid" title="登录账号" style="width:98%;" /></td>
										</tr>
										<c:if test="${MSG=='addU' }">
										<tr>
											<td style="width:90px;text-align: right;padding-top: 13px;">登录密码:</td>
											<td><input type="password"  id="password" name="password" title="登录密码" style="width:98%;" /></td>
										</tr>
										</c:if>
										<tr>
											<td style="width:90px;text-align: right;padding-top: 13px;">用户角色:</td>
											<td>
<!-- 												<div style="width:180px; display: inline-flex;"> -->
													<select class="chosen-select form-control" id="roleid" name="roleid" value="${user.rname }"  data-placeholder="请分配角色" style="width:98%;">
												  		<c:forEach items="${rolelist}" var="role">
															<option value="${role.rid }" <c:if test="${user.roleid==role.rid}">selected</c:if>>${role.rname }</option>
														</c:forEach>
												  	</select>
<!-- 												</div> -->
<!-- 											<input type="text" value="${user.rname }"  title="用户角色" style="width:98%;" readonly="readonly"/> -->
											</td>
										</tr>
										<tr>
											<td style="width:100px;text-align: right;padding-top: 13px;">所属区域:</td>
											<td><input type="text" name="aname" id="aname" value="${user.aname }" readonly="readonly" maxlength="32" placeholder="选择区域" title="区域" style="width:85%;"/>
											<a id="areaBtn_user" onclick="showArea(this); return false;">选择</a></td>
										</tr>
										<tr>
											<td style="width:90px;text-align: right;padding-top: 13px;">联系电话:</td>
											<td><input type="text" value="${user.linktel }" id="linktel" name="linktel" title="联系电话" style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:90px;text-align: right;padding-top: 13px;">联系地址:</td>
											<td><input type="text" value="${user.linkaddr }" id="linkaddr" name="linkaddr" title="联系地址" style="width:98%;" /></td>
										</tr>
										<tr >
											<td style="width:90px;text-align: right;padding-top: 13px;">备注:</td>
											<td ><textarea name="note" id="note" wrap="soft" value="${user.note }" title="备注" style="width:98%;"></textarea></td>
										</tr>
										<tr>
											<td style="text-align: center;" colspan="10">
												<a class="btn btn-sm btn-primary" onclick="save();" >保存</a>
												<a class="btn btn-sm btn-danger" onclick="top.Dialog.close();" >取消</a>
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
	$(document).ready(function(){
		//下拉框
	if(!ace.vars['touch']) {
		$('.chosen-select').chosen({allow_single_deselect:true}); 
		$(window)
		.off('resize.chosen')
		.on('resize.chosen', function() {
			$('.chosen-select').each(function() {
				 var $this = $(this);
				 $this.next().css({'width': $this.parent().width()});
			});
		}).trigger('resize.chosen');
		$(document).on('settings.ace.chosen', function(e, event_name, event_val) {
			if(event_name != 'sidebar_collapsed') return;
			$('.chosen-select').each(function() {
				 var $this = $(this);
				 $this.next().css({'width': $this.parent().width()});
			});
		});
		$('#chosen-multiple-style .btn').on('click', function(e){
			var target = $(this).find('input[type=radio]');
			var which = parseInt(target.val());
			if(which == 2) $('#form-field-select-4').addClass('tag-input-style');
			 else $('#form-field-select-4').removeClass('tag-input-style');
		});
	}
	});
	function save(){
		if($("#loginid").val()==null||$("#loginid").val()=="" ){
			$("#loginid").tips({
					side:3,
		            msg:'请输入登录账号',
		            bg:'#AE81FF',
		            time:3
		    });
			$("#loginid").focus();
			return false;
		}else{
			$.post("users/checkloginid.do",{loginid:$("#loginid").val(),userid:$("#user_id").val()},function(data){
				if(data.result=="success"){
			if($("#username").val()==null||$("#username").val()=="" ){
				$("#username").tips({
						side:3,
			            msg:'请输入用户姓名',
			            bg:'#AE81FF',
			            time:3
			    });
				$("#username").focus();
				return false;
			}else if($("#usertype").val()==null||$("#usertype").val()=="" ){
				$("#usertype").tips({
						side:3,
			            msg:'请选择用户类型',
			            bg:'#AE81FF',
			            time:3
			    });
				$("#usertype").focus();
				return false;
			}else if("${MSG}"=="addU"&&($("#password").val()==null||$("#password").val()=="") ){
				$("#password").tips({
						side:3,
			            msg:'请输入登录密码',
			            bg:'#AE81FF',
			            time:3
			    });
				$("#password").focus();
				return false;
			}else if($("#roleid").val()==null||$("#roleid").val()=="" ){
				$("#roleid").tips({
						side:3,
			            msg:'请选择用户角色',
			            bg:'#AE81FF',
			            time:3
			    });
				$("#roleid").focus();
				return false;
			}else if($("#aid").val()==null||$("#aid").val()=="" ){
				$("#aid").tips({
						side:3,
			            msg:'请选择所属区域',
			            bg:'#AE81FF',
			            time:3
			    });
				$("#aname").focus();
				return false;
			}else if($("#linktel").val()==null||$("#linktel").val()=="" ){
				$("#linktel").tips({
						side:3,
			            msg:'请输入联系电话',
			            bg:'#AE81FF',
			            time:3
			    });
				$("#linktel").focus();
				return false;
			}else if($("#linkaddr").val()==null||$("#linkaddr").val()=="" ){
				$("#linkaddr").tips({
						side:3,
			            msg:'请输入联系地址',
			            bg:'#AE81FF',
			            time:3
			    });
				$("#linkaddr").focus();
				return false;
			}else{
				var url = "users/${MSG}.do";
				$.post(url, $("#userForm").serialize(), function(data) {
					if ("success" == data.result) {
						$("#zhongxin").hide();
						$("#zhongxin2").show();
						top.Dialog.close();
					}
				});
			}
				}else{
					$("#loginid").tips({
							side:3,
				            msg:'登陆名已存在',
				            bg:'#AE81FF',
				            time:3
				    });
					$("#loginid").focus();
							return false;
				}
			});
		}
		
	}
	// ztree 设置
	var setting = {
			view: {
				dblClickExpand: false
			},
			data: {
				simpleData: {
					enable: true
				}},
			callback: {
				onClick: onClick
			}
		};
		var areaZNodes;
	var areazTreeObj;
		$().ready(function() {
		$.get("area/listSelectArea", function(data, status) {
					if (status == "success") {
						areaZNodes = eval(data);
						areazTreeObj = $.fn.zTree.init($("#areaTree"), setting,
								areaZNodes);
					
					}
				});
				});
	// 	选择区域
	function showArea(obj) {
		var cityObj = $(obj.previousElementSibling);
		var cityOffset = cityObj.offset();
		$("#areaTree").css("width",cityObj.css("width"));
		$("#areaContent").css({
			left : cityOffset.left + "px",
			top : cityOffset.top + cityObj.outerHeight() + "px"
		}).slideDown("fast");
		$("body").bind("mousedown", onBodyDown);
	}
	function hideMenu() {
		$("#areaContent").fadeOut("fast");
		$("body").unbind("mousedown", onBodyDown);
	}
	function onBodyDown(event) {
		if (!(event.target.id == "areaBtn_user" ||event.target.id == "areaBtn_manager"|| event.target.id == "areaContent" || $(
				event.target).parents("#areaContent").length > 0)) {
			hideMenu();
		}
	}
	window.onresize = function(){
		hideMenu();
	} 
	function onClick(e, treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj("areaTree"), 
		nodes = zTree.getSelectedNodes(),
		 v = "",id="";
		nodes.sort(function compare(a, b) {
			return a.id - b.id;
		});
		v = nodes[nodes.length-1].name ;
		id = nodes[nodes.length-1].id ;
		$("#aname").attr("value", v);
		$("#aid").attr("value", id);
	}
</script>
</html>