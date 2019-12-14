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
<meta charset="utf-8" />
<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
	<script type="text/javascript">
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
				<div class="row">
						<div class="col-xs-12">
			<form action="orgnz/list.do" method="post" name="Form" id="Form">
				<table style="margin-top:5px;">
							<tr>
								<td>
									<div class="nav-search">
									<span class="input-icon">
										<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" style="vertical-align:top;width: 120px; height: 30px" name="imeikey" value="${pd.imeikey}" placeholder="这里输入IMEI" />
										<i class="ace-icon fa fa-search nav-search-icon"></i>
									</span>
									</div>
								</td>
								<td style="vertical-align:top;padding-left:2px;">
								 	<select class="chosen-select form-control" name="isusekey" id="isusekey" data-placeholder="是否启用" style="vertical-align:top;width: 120px; height: 30px">
									<option value=""></option>
									<option value="">全部</option>
									<option value="1" <c:if test="${pd.isusekey=='1'}">selected</c:if>>是</option>
									<option value="0" <c:if test="${pd.isusekey=='0'}">selected</c:if>>否</option>
								  	</select>
								</td>
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
							    <td style="vertical-align:top;padding-left:2px"><a title="批量删除" class="btn btn-xs btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" ><i class='ace-icon fa fa-trash-o bigger-120'></i></a></td>								
								<td style="vertical-align:top; padding-left:12px">
										<c:if test="${pd.area!='' }"><a class="btn btn-xs btn-success" onclick="addorgnz('${pd.area.aid}');">新增</a></c:if>
								        <c:if test="${pd.area=='' }"><a class="btn btn-xs btn-success" onclick="addorgnz('');">新增</a></c:if>
								        <c:if test="${pd.area!='' }"><a class="btn btn-xs btn-success" onclick="goback();">返回所有终端列表</a></c:if>
									</td>
							</tr>
						</table>
				
							<h1>								
								<small>
									<i class="ace-icon fa fa-angle-double-right"></i>
									<c:if test="${pd.area=='' }">所有</c:if>
									<c:if test="${pd.area!='' }">${pd.area.aname} </c:if>
									&nbsp;终端列表
								</small>																					
								
									</h1>
							
                    </div>
                    
				
							   <table id="simple-table" class="table table-striped table-bordered table-hover" style="margin-top:5px;">
								<thead>
								
								  <tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
										<th class="center" style="width: 50px;">序号</th>
										<th class="center" >IMEI</th>
										<th class="center" >终端设备名称</th>										
										<c:if test="${pd.area=='' }"><th class='center'>所属区域</th></c:if>
<!-- 										<c:if test="${pd.area=='' }"><th class='center'>所属用户</th></c:if> -->
<!-- 										<th class="center" >终端地址</th> -->
<!-- 										<th class="center" >终端创建时间</th> -->
										<th class="center" >是否启用</th>
									
										<th class='center' >操作</th>
									</tr>
								</thead>

								<tbody>
								<c:choose>
									<c:when test="${not empty orgnzList}">
									<c:forEach items="${orgnzList}" var="orgnz" varStatus="vs">
									<tr>
										<td class='center' style="width: 30px;">
												<c:if test="${orgnz.tid != pd.currenTid}"><label><input type='checkbox' name='ids' value="${orgnz.tname}" id="${orgnz.tid }"  class="ace"/><span class="lbl"></span></label></c:if>
												<c:if test="${orgnz.tid  == pd.currentTid}"><label><input type='checkbox' disabled="disabled" class="ace" /><span class="lbl"></span></label></c:if>
											</td>

										<td class='center'>${vs.index+1}</td>
										<td class='center'>${orgnz.tid}</td>
										<td class='center'>${orgnz.tname}</td>
										<c:if test="${pd.area=='' }"><td class='center'>${orgnz.aname}</td></c:if>
									 
<!-- 										<td class='center'>${orgnz.address}</td> -->
<!-- 										<td class='center'>${orgnz.createdtime}</td> -->
										<td class='center'>${orgnz.isuse?'是':'否'}</td> 
<!-- 										<td >${orgnz.note}</td> -->
										<td class='center'>
											<div class="hidden-sm hidden-xs action-buttons">
											
											<a class="blue" href="javascript:editorgnz('${orgnz.tid}');">
													<i class="ace-icon fa fa-folder-o bigger-130" title="查看"></i>
												</a>
												<a class="green" href="javascript:editorgnz('${orgnz.tid}');">
													<i class="ace-icon fa fa-pencil-square-o bigger-130" title="修改"></i>
												</a>
												<a class="red" href="javascript:delorgnz('${orgnz.tid}','${orgnz.tname }');">
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
												
												<li><a href="javascript:readorgnz('${orgnz.tid }');" class="tooltip-success" data-rel="tooltip" title="Read">
															<span class="blue">
																<i class="ace-icon fa fa-folder-o bigger-120" title="查看"></i>
															</span>
														</a></li>
														<li><a href="javascript:editorgnz('${orgnz.tid }');" class="tooltip-success" data-rel="tooltip" title="Edit">
															<span class="green">
																<i class="ace-icon fa fa-pencil-square-o bigger-120" title="修改"></i>
															</span>
														</a></li>
														<li><a href="javascript:delorgnz('${orgnz.tid }','${orgnz.tname }');" class="tooltip-success" data-rel="tooltip" title="Delete">
															<span class="red"> 
																<i class="ace-icon fa fa-trash-o bigger-120"  title="删除"></i>
															</span>
														</a>
														</li>
														
														
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
				
 							<div class="page-header position-relative"> 
 							<table style="width:100%;"> 
 								<tr> 
 									<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td> 
 								</tr>
							</table>
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
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
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

      //返回
		function goback(){
			window.location.href="<%=basePath%>orgnz/list.do";
		}
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		//新增
		function addorgnz(aid){
			top.jzts();
			window.location.href="<%=basePath%>orgnz/toAdd.do?aid="+aid;
		};

			//编辑
		function editorgnz(tid){
			top.jzts();
			window.location.href="<%=basePath%>orgnz/toEdit.do?tid="+tid;
		};
			//查看
		function readorgnz(tid){
			top.jzts();
			window.location.href="<%=basePath%>orgnz/read.do?tid="+tid;
		};
					//查看授权号码
function showTel(tid,area){
			top.jzts();
			window.location.href="<%=basePath%>orgnz/showTel.do?tid="+tid+"&aid=${pd.area!=''? pd.area.aid:''}";
		};
		
		//批量操作
function makeAll(msg){
	bootbox.confirm(msg, function(result) {
		if(result) {
			var tidstr = '';
			var tnamestr='';
			for(var i=0;i < document.getElementsByName('ids').length;i++)
			{
				  if(document.getElementsByName('ids')[i].checked){
				  	if(tidstr=='') tidstr += document.getElementsByName('ids')[i].id;
				  	else tidstr += ',' + document.getElementsByName('ids')[i].id;
				  	if(tnamestr=='') tnamestr += document.getElementsByName('ids')[i].value;
				  	else tnamestr += ',' + document.getElementsByName('ids')[i].value;
				  }
			}
			if(tidstr==''){
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
					top.jzts();
					$.ajax({
						type: "POST",
						url: '<%=basePath%>orgnz/deleteAllO.do?',
				    	data: {tids:tidstr,tnames:tnamestr},
						dataType:'json',
						//beforeSend: validateData,
						cache: false,
						success: function(data){
							 $.each(data.list, function(i, list){
									nextPage(${page.currentPage});
							 });
						}
					});
			}
		}
	});
}
	//删除
		function delorgnz(tid,tname){
			bootbox.confirm("确定要删除此终端吗?", function(result) {
				if(result) {
					var url = "<%=basePath%>orgnz/delete.do?tid="+tid+"&tname="+tname;
					top.jzts();
					$.get(url,function(data){
						if("success" == data.result){
							var aid = "${pd.area!=''? pd.area.aid:''}";
							window.location.href="<%=basePath%>orgnz/list.do?aid="+aid;
						}else if("false" == data.result){
							top.hangge();
							bootbox.dialog({
								message: "<span class='bigger-110'>删除失败!</span>",
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

	</script>


</body>
</html>