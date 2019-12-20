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

						<form  action="orgnz/read.do" name="orgnzForm" id="orgnzForm" method="post" class="form-horizontal">
							<input type="hidden" name="aid" id="aid" value="${aid }"/>

							
							
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> IMEI号 : </label>
									<div class="col-sm-9">
										<input type="number" name="tid" id="tid" value="${pd.orgnz.tid}" readonly="readonly"   placeholder="这里输入15位IMEI号"  title="请输入正整数" class="col-xs-10 col-sm-5" />
									</div>
								</div>
						
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 名称 :</label>
								<div class="col-sm-9">
									<input type="text" name="tname" id="tname" value="${pd.orgnz.tname }" readonly="readonly"  placeholder="这里输入终端名称" class="col-xs-10 col-sm-5" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 地址 :</label>
								<div class="col-sm-9">
									<input type="text" name="address" id="address" value="${pd.orgnz.address }" readonly="readonly"  placeholder="这里输入终端地址" class="col-xs-10 col-sm-5" />
								</div>
							</div>
							
								<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 手机号码: </label>
								<div class="col-sm-9">
									<input type="number" name="phone" id="phone" value="${pd.orgnz.phone}"  readonly="readonly"   class="col-xs-10 col-sm-5" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 终端出厂编号 :</label>
								<div class="col-sm-9">
									<input type="text" name="facnum" id="facnum" value="${pd.orgnz.facid }"  readonly="readonly"   class="col-xs-10 col-sm-5" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 终端接入通信网:</label>
								<div class="col-sm-9">
									<input type="text" name="comstand" id="comstand" value="${pd.orgnz.comstand }"  readonly="readonly"   class="col-xs-10 col-sm-5" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 终端接入广播 :</label>
								<div class="col-sm-9">
									<input type="text" name="broadtel" id="broadtel" value="${pd.orgnz.broadtel }"  readonly="readonly"   class="col-xs-10 col-sm-5" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 终端可收转广播 :</label>
								<div class="col-sm-9">
									<input type="text" name="broadfre" id="broadfre" value="${pd.orgnz.broadfre }"  readonly="readonly"   class="col-xs-10 col-sm-5" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 终端管理员名称 :</label>
								<div class="col-sm-9">
									<input type="text" name="manager" id="manager" value="${pd.orgnz.manager }" readonly="readonly"    class="col-xs-10 col-sm-5" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 终端管理员电话 :</label>
								<div class="col-sm-9">
									<input type="text" name="managertel" id="managertel" value="${pd.orgnz.managertel }"  readonly="readonly"   class="col-xs-10 col-sm-5" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 备注 :</label>
								<div class="col-sm-9">
									<input type="text" name="note" id="note" value="${pd.orgnz.note }" placeholder="这里输入备注" readonly="readonly"  class="col-xs-10 col-sm-5" />
								</div>
							</div>
							
							<div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
									<a class="btn btn-mini btn-primary" onclick="save();">确认</a>&nbsp;&nbsp;
									<a class="btn btn-mini btn-danger" onclick="goback('${aid}');">返回</a>
								</div>
							</div>
							<div class="hr hr-18 dotted hr-double"></div>
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


		<!-- 返回顶部 -->
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<div id="areaContent" class="alert alert-info"  style="display:none; position: absolute;overflow:auto;background-color:#f0f6e4;border-color:#c3c3c3;padding:0px">
		<ul id="areaTree" class="ztree" style="margin-top:0; width:160px;"></ul>
	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		$(top.hangge());
// 		console.info("${MSG}")
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
		$(function(){
		
			$.get("area/listSelectArea", function(data, status) {
					if (status == "success") {
						areaZNodes = eval(data);
						areazTreeObj = $.fn.zTree.init($("#areaTree"), setting,areaZNodes);
						if($("#aname").val()==""){
							$("#aname").val(areaZNodes[0].name);
							$("#aid").val(areaZNodes[0].id);
						}
					}
				});
		});
		
	// 	选择区域
	function showArea() {
		var cityObj = $("#aname");
		var cityOffset = $("#aname").offset();
		$("#areaContent").css({
			left : cityOffset.left + "px",
			top : cityOffset.top + cityObj.outerHeight() + "px"
		}).slideDown("fast");
		$("#areaTree").css("width",cityObj.css("width")+ "px");
		$("body").bind("mousedown", onBodyDown);
	}
	function hideMenu() {
		$("#areaContent").fadeOut("fast");
		$("body").unbind("mousedown", onBodyDown);
	}
	function onBodyDown(event) {
		if (!(event.target.id == "areaBtn" || event.target.id == "areaContent" || $(
				event.target).parents("#areaContent").length > 0)) {
			hideMenu();
		}
	}
	function onClick(e, treeId, treeNode) {
		var zTree = $.fn.zTree.getZTreeObj("areaTree"), 
		nodes = zTree.getSelectedNodes(),
		v = "",id="";
		v = nodes[nodes.length-1].name ;
		id = nodes[nodes.length-1].id ;
		$("#aname").val(v);
		$("#aid").attr("value", id);
	}
		//返回
		function goback(aid){
			top.jzts();
			console.info(aid)
			window.location.href="<%=basePath%>orgnz/list.do?aid="+aid;
		}
		
		//保存
		function save(){
			if($("#tname").val()==""){
				$("#tname").tips({
					side:3,
		            msg:'请输入终端名称',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#tname").focus();
				return false;
			}
		
					$("#orgnzForm").submit();
		}
	</script>
</body>
</html>