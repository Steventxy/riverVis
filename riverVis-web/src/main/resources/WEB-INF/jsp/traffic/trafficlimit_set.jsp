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
						<div class="col-xs-8">
								<form  name="Form" id="Form" method="post">
									<div id="zhongxin" style="padding-top: 13px;">
									<table id="table_report" class="table table-striped table-bordered table-hover">
										<tr>
											<td style="width:90px;text-align: right;padding-top: 13px;">流量限制:</td>
											<td><input type="number" min="0" step="1" id="trafficlimit"  name="trafficlimit" title="流量限制" style="width:90%;" />MB</td>
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
						<div class="col-xs-4" style="padding-left:0px;">
							<div class="widget-box">
								<div class="widget-header ">
									<h5 id="tertitle">终端列表</h5>
								</div>
								<div class="widget-body">
									<div class="widget-main">
<!-- 										<div style="overflow: scroll; scrolling: yes;"> -->
											<ul id="tertree" class="ztree" style="overflow:auto;"></ul>
<!-- 										</div> -->
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
	var zTree;
	function save(){
		if($("#trafficlimit").val()==null||$("#trafficlimit").val()=="" ){
			$("#trafficlimit").tips({
					side:3,
		            msg:'请输入流量限制数值',
		            bg:'#AE81FF',
		            time:3
		    });
			$("#trafficlimit").focus();
			return false;
		}else{	
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
						$("#tertitle").tips({
								side:3,
					            msg:'请选择设置终端',
					            bg:'#AE81FF',
					            time:3
					        });
							return false;
					}
				var url = "traffic/saveSet.do";
						$("#zhongxin").hide();
						$("#zhongxin2").show();
				$.post(url, {trafficlimit:$("#trafficlimit").val(),terids:terids}, function(data) {
					if ("success" == data.result) {
						top.Dialog.close();
					}
				});
			}
	}
	$().ready(function() {
		var setting = {
				check: {enable: true},
				data: {simpleData: {enable: true}}
			};
			var zTreeNodes = eval(${areaTerJson});
			zTree=$.fn.zTree.init($("#tertree"), setting,zTreeNodes);

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
</script>
</html>