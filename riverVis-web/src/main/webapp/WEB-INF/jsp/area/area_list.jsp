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
	<script type="text/javascript">
		//刷新ztree
		function parentReload(){
			if(null != ${MSG} && 'change' == ${MSG}){
				var aid = "${aid}";
				parent.location.href="<%=basePath%>area/listAllArea.do?aid="+aid;
			}else{
				//什么也不干
			}
		}
		console.info("${MSG}");
		parentReload();
	</script>
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
									<c:if test="${pd.area=='' }">所有</c:if>
									<c:if test="${pd.area!='' }">${pd.area.aname} </c:if>
									&nbsp;分组列表
								</small>
							<a class="btn btn-sm btn-primary" onclick="toExcel(this);" title="导出到EXCEL" style="float: right;">导出&nbsp;
								<c:if test="${pd.area!='' }">${pd.area.aname} </c:if>
									&nbsp;分组列表</a>

							</h1>
					</div>	
					<div class="row" style="padding-top:5px;">
						<div class="col-xs-12">

							<table id="simple-table" class="table table-striped table-bordered table-hover" style="padding-top:5px;">
								<thead>
								  <tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
									<th class="center" >分组编号</th>
										<th class='center'>分组名称</th>		

										<th class='center' >备注</th>
										<th class='center' >操作</th>
									</tr>
								</thead>

								<tbody>
								<c:choose>
									<c:when test="${not empty areaList}">
									<c:forEach items="${areaList}" var="area" varStatus="vs">
									<tr>	
										<td class='center' style="width: 35px;">
													<label><input type='checkbox' name='ids' value="${area.aid}"  class="ace"/><span class="lbl"></span></label>
										</td>		
                                        <td class='center'>${area.aid}</td>
										<td class='center'>${area.aname}</td>
										<td >${area.note}</td>
										<td class='center'>
											<div class="hidden-sm hidden-xs action-buttons">
												<a class="green" href="javascript:editarea('${area.aid}');">
													<i class="ace-icon fa fa-pencil-square-o bigger-130" title="修改"></i>
												</a>
												<a class="red" href="javascript:delarea('${area.aid}');">
													<i class="ace-icon fa fa-trash-o bigger-130" title="删除"></i>
												</a>
											</div>
											<div class="hidden-md hidden-lg">
												<div class="inline pos-rel">
													<button
														class="btn btn-minier btn-yellow dropdown-toggle"
														data-toggle="dropdown" data-position="auto">
														<i
															class="ace-icon fa fa-caret-down icon-only bigger-120"></i>
													</button>

													<ul class="dropdown-menu dropdown-only-icon dropdown-yellow dropdown-menu-right dropdown-caret dropdown-close">
														<li><a href="javascript:editarea('${area.aid }');" class="tooltip-success" data-rel="tooltip" title="Edit">
															<span class="green">
																<i class="ace-icon fa fa-pencil-square-o bigger-120" title="修改"></i>
															</span>
														</a></li>
														<li><a href="javascript:delarea('${area.aid }');" class="tooltip-success" data-rel="tooltip" title="Delete">
															<span class="red"> 
																<i class="ace-icon fa fa-trash-o bigger-120"  title="删除"></i>
															</span>
														</a></li>
													</ul>
												</div>
											</div>
										</td>
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
					 							<div> 
 								&nbsp;&nbsp; 
 								<a class="btn btn-sm btn-success" onclick="addarea('${aid}');">新增</a> 
								<c:if test="${null != pd.area.aid && pd.area.aid != '0'}">
									<a class="btn btn-sm btn-success" onclick="goSonarea('${pd.area.parentaid}');">返回</a> 
 								</c:if> 
 							</div> 
							
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
	<!-- 删除时确认窗口 -->
	<script src="static/ace/js/bootbox.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		$(document).ready(function(){
			top.hangge();
		});	
		
		//去此ID下子区域列表
		function goSonarea(aid){
			top.jzts();
			window.location.href="<%=basePath%>area/list.do?aid="+aid;
		};
		
		//新增
		function addarea(aid){
			top.jzts();
			window.location.href="<%=basePath%>area/toAdd.do?aid="+aid;
		};
		
		//编辑
		function editarea(aid){
			top.jzts();
			window.location.href="<%=basePath%>area/toEdit.do?aid="+aid;
		};
		
		//删除
		function delarea(aid){
			bootbox.confirm("确定要删除此区域吗?", function(result) {
				if(result) {
					var url = "<%=basePath%>area/delete.do?aid="+aid;
					top.jzts();
					$.get(url,function(data){
						if("success" == data.result){
							parent.location.href="<%=basePath%>area/listAllArea.do?aid="+"${aid}";
						}else if("false" == data.result){
							top.hangge();
							bootbox.dialog({
								message: "<span class='bigger-110'>删除失败,请先删除子区域!</span>",
								buttons: 			
								{
									"button" :
									{
										"label" : "确定",
										"className" : "btn-sm btn-success"
									}
								}
							});
						}
					});
				}
			});
		}
//				导出excel
// function toExcel(){
// 	window.location.href='<%=basePath%>area/excel.do';
// }
	
$(function() {	
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
//导出到excel
function toExcel( object){
	var checkedidlist =[];
	var i=0;
		var checkedidlist = '';
			for(var i=0;i < document.getElementsByName('ids').length;i++) {
				  if(document.getElementsByName('ids')[i].checked){
				  	if(checkedidlist=='') checkedidlist += document.getElementsByName('ids')[i].value;
				  	else checkedidlist += ',' + document.getElementsByName('ids')[i].value;
				  }
			}
			if(checkedidlist==''){
				$(object).tips({
						side:3,
			            msg:'您没有选择任何内容',
			            bg:'#AE81FF',
			            time:3
			        });
				$("#zcheckbox").tips({
					side:2,
		            msg:'点这里全选',
		            bg:'#AE81FF',
		            time:8
		        });
				$("#zcheckbox").focus();
				return;
			}else{
					window.location.href='<%=basePath%>area/excel.do?checkedidlist='+checkedidlist;
			}
}
	</script>
</body>
</html>