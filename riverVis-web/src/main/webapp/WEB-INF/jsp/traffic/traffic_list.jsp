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
	<style type="text/css">
		table th {white-space:nowrap;}
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
				<form action="traffic/listTerTraffic.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
								<td style="vertical-align:top;padding-left:2px;">
									<div class="nav-search">
									<span class="input-icon">
										<input class="nav-search-input"  autocomplete="off" id="nav-search-input" type="text" name="usernamekey" value="${pd.usernamekey }" placeholder="所属用户" style="width: 110px;"/>
										<i class="ace-icon fa fa-search nav-search-icon"></i>
									</span>
									</div>
								</td>
								<td style="vertical-align:top;padding-left:2px;">
									<div class="nav-search">
									<span class="input-icon">
										<input class="nav-search-input"  autocomplete="off" id="nav-search-input" type="text" name="groupnamekey" value="${pd.groupnamekey }" placeholder="所属分组" style="width: 110px;"/>
										<i class="ace-icon fa fa-search nav-search-icon"></i>
									</span>
									</div>
								</td>
								<td style="vertical-align:top;padding-left:2px;">
									<div class="nav-search">
									<span class="input-icon">
										<input class="nav-search-input"  autocomplete="off" id="nav-search-input" type="text" name="tnamekey" value="${pd.tnamekey }" placeholder="终端名称" style="width: 110px;" />
										<i class="ace-icon fa fa-search nav-search-icon"></i>
									</span>
									</div>
									<td style="vertical-align:top;padding-left:2px;">
								  	<select class="chosen-select form-control" name="usestate" id="usestate" data-placeholder="流量使用情况" style="vertical-align:top;width: 100px;">
									<option value=""></option>
									<option value="0" <c:if test="${pd.usestate=='0' }">selected="selected"</c:if> >未超过</option>
									<option value="1" <c:if test="${pd.usestate=='1' }">selected="selected"</c:if>>已超过</option>
								  	</select>
								</td>
								
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								
									<td style="vertical-align:top; padding-left:12px">
										<a class="btn btn-sm btn-success" onclick="setTrafficLimit();" style="vertical-align:top;height: 30px;">批量设置流量限制</a>
									</td>
									<td style="vertical-align:top; padding-left:12px">
										<a class="btn btn-sm btn-primary" onclick="setTerIsuse(this);" style="vertical-align:top;height: 30px;" title="请先选择终端，在设置终端启用">批量设置终端启用</a>
									</td>
								
							</tr>
							<tr>
								<td style="vertical-align:top;padding-left:2px;margin-top:5px;" colspan="6">
								  	<span style="width: 100px;">流量使用范围：</span> 
								  	<input type="number" name="usenumstart" id="usenumstart" value="${pd.usenumstart }" min="0" step="1" placeholder="最小值" onblur="setEndMin();" style="width:80px;height: 28px;">MB ~
								  	<input type="number" name="usenumend" id="usenumend" value="${pd.usenumend }" min="0" step="1" placeholder="最大值" style="width:80px;height: 28px;">MB
								</td>
							</tr>
					</table>
							<table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
								<thead>
									<tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
										<th class="center">终端IEMI</th>
									<th class="center">终端名称</th>
									<th class="center">所属分组</th>
									<th class="center">所属用户</th>
									<th class="center">已使用流量</th>
									<th class="center">流量限制</th>
									<th class="center">最后统计时间</th>
									<th class="center">启用状态</th>
									</tr>
								</thead>
								<tbody>
								<c:choose>
									<c:when test="${not empty trafficlist}">
									<c:forEach items="${trafficlist}" var="traffic" varStatus="vs">
									<tr>
									<td class='center' style="width: 30px;">
												<label><input type='checkbox' name='ids'  id="${traffic.tid }"  class="ace"/><span class="lbl"></span></label>
											</td>
										<td class='center'>${traffic.tid}</td>
										<td class='center'>${traffic.tname}</td>	
										<td class='center'>${traffic.aname}</td>										
										<td class='center'>${traffic.username}</td>										
										<td class='center'>
											<c:if test="${traffic.usetraffic-traffic.trafficlimit>0}"><span class="red">${traffic.usetraffic} MB</span></c:if>
											<c:if test="${traffic.usetraffic-traffic.trafficlimit<=0}"><span class="green">${traffic.usetraffic} MB</span></c:if>
										</td>										
										<td class='center'>${traffic.trafficlimit} MB</td>
										<td class='center'>${traffic.lasttime}</td>
										<td class='center'>${traffic.isuse?'启用':'停用'}</td>
									</tr>
									</c:forEach>
									</c:when>
										<c:otherwise>
											<tr>
											<td colspan="100" class='center'>没有相关数据</td>
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
		<a href="#" id="btn-scroll-up"
			class="btn-scroll-up btn btn-sm btn-inverse"> <i
			class="ace-icon fa fa-angle-double-up icon-only bigger-110"></i>
		</a>

	</div>
	<!-- /.main-container -->

	<!-- basic scripts -->
	<!-- 页面底部js¨ -->
	<%@ include file="../index/foot.jsp"%>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<!--引入弹窗组件start-->
		<script type="text/javascript" src="plugins/attention/zDialog/zDrag.js"></script>
		<script type="text/javascript" src="plugins/attention/zDialog/zDialog.js"></script>
		<!--引入弹窗组件end-->
<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
	//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		$(document).ready(function(){
			top.hangge();
			
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
		});	
		
		function setEndMin(tid){
			var min = $("#usenumstart").val();
			if(min !=null &&min !="")
			$("#usenumend").attr("min",min);
		}
		
		function setTrafficLimit(){
		top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="设置终端流量限制";
			 diag.URL = "<%=basePath%>traffic/toSetTrafficLimit.do";
			 diag.Width = 600;
			 diag.Height = 300;
			 diag.CancelEvent = function(){ 
			 	 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					if (typeof(nextPage) == "function") {
				           nextPage(${page.currentPage});
				        }else{
				        	tosearch();
				        }
				}
				diag.close();
			 };
			 diag.show();
			}
		function setTerIsuse(object){
			var i=0;
			var checkedidlist = '';
				for(var i=0;i < document.getElementsByName('ids').length;i++) {
					  if(document.getElementsByName('ids')[i].checked){
					  	if(checkedidlist=='') checkedidlist += document.getElementsByName('ids')[i].id;
					  	else checkedidlist += ',' + document.getElementsByName('ids')[i].id;
					  }
				}
				if(checkedidlist==''){
					$(object).tips({
						side:3,
			            msg:'您没有选择任何内容',
			            bg:'#AE81FF',
			            time:3
			        });
					return;
				}else{
					$.post("<%=basePath%>traffic/setTerIsuse.do",{checkedidlist:checkedidlist},function(data){
						if("success"==data.result){
							nextPage(${page.currentPage});
							Dialog.alert("设置终端启用成功！");
						}else{
							nextPage(${page.currentPage});
							Dialog.alert("设置终端启用失败！");
						}
					})
		}
		}
// 导出excel
// function toExcel(object){
// 	var i=0;
// 		var checkedidlist = '';
// 			for(var i=0;i < document.getElementsByName('ids').length;i++) {
// 				  if(document.getElementsByName('ids')[i].checked){
// 				  	if(checkedidlist=='') checkedidlist += document.getElementsByName('ids')[i].id;
// 				  	else checkedidlist += ',' + document.getElementsByName('ids')[i].id;
// 				  }
// 			}
// 			if(checkedidlist==''){
// 				$(object).tips({
// 					side:3,
// 		            msg:'您没有选择任何内容',
// 		            bg:'#AE81FF',
// 		            time:3
// 		        });
// 				return;
// 			}else{
// 			window.location.href='<%=basePath%>maintain/excel.do?checkedidlist='+checkedidlist;
// 	}
// }
	</script>


</body>
</html>