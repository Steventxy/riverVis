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
							
						<!-- 检索  -->
						<form action="log/list.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
									<span class="input-icon">
										<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" style="vertical-align:top;width: 120px; height: 30px" name="unamekey" value="${pd.unamekey }" placeholder="用户名" />
										<i class="ace-icon fa fa-search nav-search-icon"></i>
									</span>
									</div>
								</td>

								<td style="vertical-align:top;padding-left:2px;">
								 	<select class="chosen-select form-control" name="logtype" id="logtype" data-placeholder="日志类别" style="vertical-align:top;width: 120px; height: 30px">
									<option value=""></option>
									<option value="">全部</option>
									<option value="操作日志" <c:if test="${pd.logtype=='操作日志'}">selected</c:if>>操作日志</option>
									<option value="登陆日志" <c:if test="${pd.logtype=='登陆日志'}">selected</c:if>>登陆日志</option>
								  	</select>
								</td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="${pd.lastLoginStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="日志时间开始"/></td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginEnd" id="lastLoginEnd"  value="${pd.lastLoginEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="日志时间结束"/></td>
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="ace-icon fa fa-download bigger-110 nav-search-icon blue"></i></a></td>
<%--								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-sm btn-danger" onclick="deleteAll('确定要删除选定的数据吗');" style="vertical-align:top;height: 30px;">批量删除日志</a></td>--%>
									<c:if test="${rid == 1}">
											<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-xs btn-danger" onclick="delLog('${pd.userid}');"><i class="ace-icon fa fa-trash-o bigger-120" title="清空所有日志"></i></a>
												</c:if>
							</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
								<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
								</th>
									<th class="center" style="width:50px;">序号</th>
									<th class="center">日志编号</th>
									<th class="center">日志类别</th>
									<th class="center">操作用户</th>
									<th class="center">功能模块</th>
									<th class="center">操作</th>
									<th class="center">生成日期</th>
									<th class="center">IP地址</th>
									<th class="center">备注</th>
								</tr>
							</thead>
													
							<tbody>
							<!-- 开始循环 -->	
							<c:choose>
								<c:when test="${not empty loglist}">
									<c:forEach items="${loglist}" var="var" varStatus="vs">
										<tr>
										<td class='center' style="width: 30px;">
												<label><input type='checkbox' name='ids'  id="${var.lid }"  class="ace"/><span class="lbl"></span></label>
										</td>
											<td class='center' style="width: 30px;vertical-align: middle">${vs.index+1}</td>
											<td class='center' style="vertical-align: middle">${var.lid}</td>
											<td class='center' style="vertical-align: middle">${var.logtype}</td>
											<td class='center' style="vertical-align: middle">${var.username}</td>
											<td class='center' style="vertical-align: middle">${var.functions}</td>
											<td class='center' style="vertical-align: middle">${var.logcontent}</td>
											<td class='center' style="vertical-align: middle">${var.logtime}</td>
											<td class='center' style="vertical-align: middle">${var.ip}</td>
											<td class='center' style="vertical-align: middle;word-break: break-all">${var.remark}</td>
										</tr>
									
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr class="main_info">
										<td colspan="100" class="center" >没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
						<div class="page-header position-relative">
					<table style="width:100%;">
						<tr>
							<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
						</tr>
					</table>
					</div>
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
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
		
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
	
		$(function() {
			//日期框
			$('.date-picker').datepicker({
				autoclose : true,
				todayHighlight : true
			});
			//复选框全选控制
	var active_class = 'active';
	$('#simple-table > thead > tr > th input[type=checkbox]').eq(0).on('click', function(){
		var th_checked = this.checked;//checkbox inside "TH" table header
		$(this).closest('table').find('tbody > tr').each(function(){
			var row = this;
			if($(row).attr("disabled")!="disabled"){
				if(th_checked) $(row).addClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', true);
				else $(row).removeClass(active_class).find('input[type=checkbox]').eq(0).prop('checked', false);
			}
		});
	});


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
	}
		});
		
		//导出excel
function toExcel(){
var checkedidlist =[];
	var i=0;
		var checkedidlist = '';
			for(var i=0;i < document.getElementsByName('ids').length;i++) {
				  if(document.getElementsByName('ids')[i].checked){
				  	if(checkedidlist=='') checkedidlist += document.getElementsByName('ids')[i].id;
				  	else checkedidlist += ',' + document.getElementsByName('ids')[i].id;
				  }
			}
			if(checkedidlist==''){
				bootbox.dialog({
					message: "<span class='bigger-110'>您没有选择任何内容!</span>",
					buttons:
							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}
				});
				$("#zcheckbox").tips({
					side:3,
					msg:'点这里全选',
					bg:'#AE81FF',
					time:8
				});
				$("#zcheckbox").focus();
				return;
			}else{
			window.location.href='<%=basePath%>log/excel.do?checkedidlist='+checkedidlist;
	}
}

<%--function deleteAll(msg){--%>
<%--	bootbox.confirm(msg, function(result) {--%>
<%--		if(result) {--%>
<%--			var lidstr = '';--%>
<%--			var lnamestr='';--%>
<%--			for(var i=0;i < document.getElementsByName('ids').length;i++)--%>
<%--			{--%>
<%--				if(document.getElementsByName('ids')[i].checked){--%>
<%--					if(lidstr=='') lidstr += document.getElementsByName('ids')[i].id;--%>
<%--					else lidstr += ',' + document.getElementsByName('ids')[i].id;--%>
<%--					if(lnamestr=='') lnamestr += document.getElementsByName('ids')[i].value;--%>
<%--					else lnamestr += ',' + document.getElementsByName('ids')[i].value;--%>
<%--				}--%>
<%--			}--%>
<%--			if(lidstr==''){--%>
<%--				bootbox.dialog({--%>
<%--					message: "<span class='bigger-110'>您没有选择任何内容!</span>",--%>
<%--					buttons:--%>
<%--							{ "button":{ "label":"确定", "className":"btn-sm btn-success"}}--%>
<%--				});--%>
<%--				$("#zcheckbox").tips({--%>
<%--					side:3,--%>
<%--					msg:'点这里全选',--%>
<%--					bg:'#AE81FF',--%>
<%--					time:8--%>
<%--				});--%>
<%--				$("#zcheckbox").focus();--%>
<%--				return;--%>
<%--			}else{--%>
<%--				top.jzts();--%>
<%--				$.ajax({--%>
<%--					type: "POST",--%>
<%--					url: '<%=basePath%>log/deleteAllLog.do',--%>
<%--					data: {lids:lidstr,lnames:lnamestr},--%>
<%--					dataType:'json',--%>
<%--					//beforeSend: validateData,--%>
<%--					cache: false,--%>
<%--					success: function(data){--%>
<%--						$.each(data.list, function(i, list){--%>
<%--							nextPage(${page.currentPage});--%>
<%--						});--%>
<%--					}--%>
<%--				});--%>
<%--			}--%>
<%--		}--%>
<%--	});--%>
<%--}--%>

	//删除
	function delLog(userid){
		bootbox.confirm("确认清空所有的日志吗?", function(result) {
			if(result) {
				top.jzts();
				var url = "<%=basePath%>log/deleteLog.do?userid="+userid;
				$.get(url,function(data){
					nextPage(${page.currentPage});
				});
			};
		});
	}
	</script>
</body>
</html>