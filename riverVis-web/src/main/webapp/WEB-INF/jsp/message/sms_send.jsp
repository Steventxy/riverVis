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
<!-- 日期框 -->
<link rel="stylesheet" href="static/ace/css/datepicker.css" />
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
						<div class="col-xs-9" >
										<form action="" method="post" name="Form" id="Form">
						<table id="table_report" class="table table-striped table-bordered table-hover" style="margin-top:10px;">
										
										<tr>
											<td style="width:90px;text-align: right;padding-top: 13px;">内容:</td>
											<td>
												<div class="row" style="padding-left:12px;">
												<textarea class="col-xs-10" rows="16" name="content" id="content" wrap="soft" title="内容" ></textarea>
												
												</div>
												</td>
										</tr>
										<tr>
											<td style="text-align: center;" colspan="10">
												<a class="btn btn-sm btn-primary" id="save" onclick="save();" >发送</a>
											</td>
										</tr>
						</table>
						</form>
					
						</div>
						<!-- /.col -->
						<div class="col-xs-3" style="padding-left:0px;">
							<div class="widget-box">
								<div class="widget-header ">
									<h5 id="tertitle">用户列表</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main">
										<div style="overflow: scroll; scrolling: yes;">
											<ul id="tertree" class="ztree" style="overflow:auto;"></ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- /.row -->
				</div>
				<!-- /.page-content -->
			</div>
		</div>
		<!-- /.main-content -->

		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up" class="btn-scroll-up btn btn-sm btn-inverse">
			<i class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

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
		//日期框
			$('.date-picker').datepicker({
				autoclose : true,
				todayHighlight : true
			});
			var setting = {
				check: {enable: true},
				data: {simpleData: {enable: true}}
			};
			var zn = '${areaTerJson}';
			var zTreeNodes = eval(zn);
			zTree=$.fn.zTree.init($("#tertree"), setting,zTreeNodes);
// 			type = { "Y":py + sy, "N":pn + sn};
// 			zTree.setting.check.chkboxType = type;

			function treeFrameT(){
				var treeT = document.getElementById("tertree");
				var bheightT = document.documentElement.clientHeight;
			     treeT .style.height = (bheightT-100)+'px';
			}
			treeFrameT();
			window.onresize=function(){  
				treeFrameT();
			};
	});
	//保存
	function save(){
	
		
		if($("#content").val()==null||$("#content").val()==""){
			$("#content").tips({
						side:3,
			            msg:'请输入短信内容',
			            bg:'#AE81FF',
			            time:3
			        });
					return false;
		}
	
		
		//获取选择终端
		var nodes = zTree.getCheckedNodes();
			var terids = "";
			var phones = "";
			for(var i=0; i<nodes.length; i++){
				if(nodes[i].type=="1"){
					terids += nodes[i].id+",";
					phones += nodes[i].phone+",";
				}
			}
			
			terids = terids.substring(0,terids.length-1);
			phones = phones.substring(0,phones.length-1);
			if(terids==""){
				$("#tertitle").tips({
						side:3,
			            msg:'请选择播出终端',
			            bg:'#AE81FF',
			            time:3
			        });
					return false;
			}
		
		$.post("<%=basePath%>smsbroad/sendsms.do",{content:$("#content").val(),terids:terids,phones:phones},function(data){
			if(data.result=="success"){
			$("#content").val("");
				$("#save").tips({
						side:3,
			            msg:'发送成功',
			            bg:'#AE81FF',
			            time:3
			        });
			}else{
				$("#save").tips({
						side:3,
			            msg:'发送失败',
			            bg:'#AE81FF',
			            time:3
			        });
			}
		});
	}
	</script>
</body>
</html>