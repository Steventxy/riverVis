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
				
					<div class="page-header">
							<h1>
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									<c:if test="${MSG=='edit' }">编辑终端</c:if>
									<c:if test="${MSG=='add' }">添加终端</c:if>
								</small>
							</h1>
					</div><!-- /.page-header -->

					<div class="row">
						<div class="col-xs-12">

						<form  action="orgnz/${MSG }.do" name="orgnzForm" id="orgnzForm" method="post" class="form-horizontal">
							<input type="hidden" name="aid" id="aid" value="${aid }"/>

							<c:if test="${MSG=='add' }">
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 所属区域 :</label>
								<div class="col-sm-9">
									<div style="padding-top:5px;">
										<input type="text" name="aname" id="aname" value="${aname }" readonly="readonly" maxlength="32" placeholder="选择区域" title="区域" />
											<a id="areaBtn" href="#"  onclick="showArea(); return false;">选择</a>
									</div>
								</div>
							</div>
							
							<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> IMEI号 : </label>
									<div class="col-sm-9">
										<input type="number" name="tid" id="tid" value="${pd.orgnz.tid}" placeholder="这里输入15位IMEI号"  title="请输入正整数" class="col-xs-10 col-sm-5" />
									</div>
								</div>
							
							</c:if>
							<c:if test="${MSG=='edit' }">
								<div class="form-group">
									<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> IMEI号 : </label>
									<div class="col-sm-9">
										<input type="number" name="tid" id="tid" value="${pd.orgnz.tid}" readonly="readonly"   placeholder="这里输入15位IMEI号"  title="请输入正整数" class="col-xs-10 col-sm-5" />
									</div>
								</div>
							</c:if>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 名称 :</label>
								<div class="col-sm-9">
									<input type="text" name="tname" id="tname" value="${pd.orgnz.tname }" placeholder="这里输入终端名称" class="col-xs-10 col-sm-5" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 地址 :</label>
								<div class="col-sm-9">
									<input type="text" name="address" id="address" value="${pd.orgnz.address }" placeholder="这里输入终端地址" class="col-xs-10 col-sm-5" />
								</div>
							</div>
							
								<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 手机号码: </label>
								<div class="col-sm-9">
									<input type="number" name="phone" id="phone" value="${pd.orgnz.phone}"   class="col-xs-10 col-sm-5" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 终端出厂编号 :</label>
								<div class="col-sm-9">
									<input type="text" name="facnum" id="facnum" value="${pd.orgnz.facid }"   class="col-xs-10 col-sm-5" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 终端接入通信网标准:</label>
								<div class="col-sm-9">
									<select class="chosen-select form-control" name="comstand" id="comstand"  class="col-xs-12 ">
										<option value="WCDMA" <c:if test="${pd.orgnz.comstand =='WCDMA'}">selected="selected"</c:if>>WCDMA</option>
										<option value="TDSCDMA" <c:if test="${pd.orgnz.comstand =='TDSCDMA'}">selected="selected"</c:if>>TDSCDMA</option>
										<option value="CDMA2000" <c:if test="${pd.orgnz.comstand =='CDMA2000'}">selected="selected"</c:if>>CDMA2000</option>
										<option value="GPRS" <c:if test="${pd.orgnz.comstand =='GPRS'}">selected="selected"</c:if>>GPRS</option>
										<option value="WIFI" <c:if test="${pd.orgnz.comstand =='WIFI'}">selected="selected"</c:if>>WIFI</option>
										<option value="TDDLTE" <c:if test="${pd.orgnz.comstand =='TDDLTE'}">selected="selected"</c:if>>TDDLTE</option>
										<option value="FDDLTE" <c:if test="${pd.orgnz.comstand =='FDDLTE'}">selected="selected"</c:if>>FDDLTE</option>
									</select>
									
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 终端接入广播电视网模式 :</label>
								<div class="col-sm-9">
									<select class="chosen-select form-control" name="broadtel" id="broadtel" class="col-xs-12 ">
										<option value="有线网" <c:if test="${pd.orgnz.broadtel =='有线网'}">selected="selected"</c:if>>有线网</option>
										<option value="无线网" <c:if test="${pd.orgnz.broadtel =='无线网'}">selected="selected"</c:if>>无线网</option>
										<option value="数字电视网" <c:if test="${pd.orgnz.broadtel =='数字电视网'}">selected="selected"</c:if>>数字电视网</option>
										<option value="卫星电视网" <c:if test="${pd.orgnz.broadtel =='卫星电视网'}">selected="selected"</c:if>>卫星电视网</option>
										<option value="互联网" <c:if test="${pd.orgnz.broadtel =='互联网'}">selected="selected"</c:if>>互联网</option>
										<option value="其他" <c:if test="${pd.orgnz.broadtel =='其他'}">selected="selected"</c:if>>其他</option>
									</select>
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 终端可收转广播 :</label>
								<div class="col-sm-9">
									<input type="text" name="broadfre" id="broadfre" value="${pd.orgnz.broadfre }"   class="col-xs-10 col-sm-5" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 终端管理员名称 :</label>
								<div class="col-sm-9">
									<input type="text" name="manager" id="manager" value="${pd.orgnz.manager }"   class="col-xs-10 col-sm-5" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 终端管理员电话 :</label>
								<div class="col-sm-9">
									<input type="text" name="managertel" id="managertel" value="${pd.orgnz.managertel }"   class="col-xs-10 col-sm-5" />
								</div>
							</div>
							
							<div class="form-group">
								<label class="col-sm-3 control-label no-padding-right" for="form-field-1"> 备注 :</label>
								<div class="col-sm-9">
									<input type="text" name="note" id="note" value="${pd.orgnz.note }" placeholder="这里输入备注" class="col-xs-10 col-sm-5" />
								</div>
							</div>
							<div class="form-group">
								<label class="col-xs-3 control-label no-padding-right" for="form-field-1"> 是否可用 :</label>
								<div class="col-xs-9">
									<label style="margin:5px 0px 5px 5px;"><input name="isuse" type="radio" value="1" <c:if test="${pd.orgnz.isuse!='false'}">checked="checked"</c:if> />&nbsp;是</label>
									<label style="margin:5px 0px 5px 5px;"><input name="isuse" type="radio" value="0" <c:if test="${pd.orgnz.isuse=='false'}">checked="checked"</c:if>/>&nbsp;否</label> 
								</div>
							</div>
							<div class="clearfix form-actions">
								<div class="col-md-offset-3 col-md-9">
									<a class="btn btn-mini btn-primary" onclick="save();">保存</a>&nbsp;&nbsp;
									<a class="btn btn-mini btn-danger" onclick="goback('${aid}');">取消</a>
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