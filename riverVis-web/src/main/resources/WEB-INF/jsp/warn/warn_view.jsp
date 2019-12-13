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
								<form  name="warnForm" id="warnForm" method="post">
									<input type="hidden" name="wid" id="w_id" value="${warn.wid }"/>
									<input type="hidden" name="aid" id="aid" value="${warn.aid }"/>
									<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report" class="table table-striped table-bordered table-hover">
										<tr>
											<td style="width:90px;text-align: right;padding-top: 13px;">管理区域:</td>
											<td><input type="text" name="aname" id="aname" value="${warn.aname }" readonly="readonly" maxlength="32" placeholder="选择区域" title="区域" style="width:85%;"/>
											<a id="areaBtn_warn" onclick="showArea(this); return false;">选择</a></td>
										</tr>
											
										<tr>
											<td style="width:90px;text-align: right;padding-top: 13px;">预警级别:</td>
											<td>
												<select class="chosen-select form-control" id="leveal" name="leveal" value="${warn.leveal }" data-placeholder="请选择预警级别" style="width:98%;">
													<option value="" ></option>
									              <option value="一级" <c:if test="${warn.leveal=='一级'}">selected</c:if>>一级</option>
									              <option value="二级" <c:if test="${warn.leveal=='二级'}">selected</c:if>>二级</option>
									              <option value="三级" <c:if test="${warn.leveal=='三级'}">selected</c:if>>三级</option>
												  </select>
											</td>
										</tr>
										
										<tr>
											<td style="width:90px;text-align: right;padding-top: 13px;">预警值:</td>
											<td><input type="text" value="${warn.data}" id="data"  name="data" title="预警值:" style="width:98%;" /></td>
										</tr>
										<tr>
											<td style="width:90px;text-align: right;padding-top: 13px;">预警策略:</td>
											<td><input type="text" value="${warn.content}" id="content"  name="content" title="预警策略:" style="width:98%;" /></td>
										</tr>
									
										<tr>
											<td style="text-align: center;" colspan="10">
												<a class="btn btn-sm btn-primary" onclick="save();" >保存</a>&nbsp;
											
												<a class="btn btn-sm btn-danger" onclick="top.Dialog.close();" >取消</a>&nbsp;
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
	<!-- 删除时确认窗口 -->
	<!--引入弹窗组件start-->
		<script type="text/javascript" src="plugins/attention/zDialog/zDrag.js"></script>
		<script type="text/javascript" src="plugins/attention/zDialog/zDialog.js"></script>
		<!--引入弹窗组件end-->
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
		 if($("#leveal").val()==null||$("#leveal").val()=="" ){
				$("#leveal").tips({
						side:3,
			            msg:'请选择预警级别',
			            bg:'#AE81FF',
			            time:3
			    });
				$("#leveal").focus();
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
			}else if($("#data").val()==null||$("#data").val()=="" ){
				$("#data").tips({
						side:3,
			            msg:'请输入预警值',
			            bg:'#AE81FF',
			            time:3
			    });
				$("#data").focus();
				return false;
			}else if($("#content").val()==null||$("#content").val()=="" ){
				$("#content").tips({
						side:3,
			            msg:'请输入预警策略',
			            bg:'#AE81FF',
			            time:3
			    });
				$("#content").focus();
				return false;
			}
			else{
				//console.info("修改");
				var url = "warn/${MSG}.do";
				$.post(url, $("#warnForm").serialize(), function(data) {
					if ("success" == data.result) {
						$("#zhongxin").hide();
						$("#zhongxin2").show();
						top.Dialog.close();
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