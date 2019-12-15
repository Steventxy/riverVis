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
<meta http-equiv="refresh" content="10">
<!-- 下拉框 -->
<link rel="stylesheet" href="static/ace/css/chosen.css" />
<!-- jsp文件头和头部 -->
<%@ include file="../index/top.jsp"%>

<link rel="stylesheet" href="static/js/bootstrap-table.css">

	<style type="text/css">
		.table th {white-space:nowrap;}
		.table td {white-space:nowrap;}
</style>
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
									&nbsp;终端列表
								</small>
								
							</h1>
                    </div><!-- /.page-header -->
				<div class="row">
						<div class="col-xs-12">
					<form action="sensordata/envdata.do" method="post" name="Form" id="Form">
						<input type="hidden" id="parentaid" name="aid" value="${pd.area==''?'':pd.area.aid}">
						<table style="margin-top:5px;margin-bottom:5px;">
							<tr>
								<td style="vertical-align:top;padding-left:5px">
									<select class="chosen-select form-control" name="key1" id="key1" data-placeholder="关键词" style="vertical-align:top;width: 100px;height: 30px;">
										<option value="IMEI"  <c:if test="${pd.key1=='IMEI' }">selected</c:if>>终端IMEI</option>
										<option value="aname"  <c:if test="${pd.key1=='aname' }">selected</c:if>>所属分组</option>
										<option value="IP"  <c:if test="${pd.key1=='IP' }">selected</c:if>>地址</option>
										<option value="time"  <c:if test="${pd.key1=='time' }">selected</c:if>>采集日期</option>
								  	</select>
								  </td>
								<td style="padding-left:2px;">
									<div class="nav-search">
											<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="val1" value="${pd.val1 }" placeholder="输入内容"  style="width: 80px;"/>
									</div>
								</td>
								<td style="vertical-align:top;padding-left:5px">
									<select class="chosen-select form-control" name="key2" id="key2" data-placeholder="关键词" style="vertical-align:top;width: 100px;height: 30px;">
								  		<option value="IMEI"  <c:if test="${pd.key1=='IMEI' }">selected</c:if>>终端IMEI</option>
										<option value="aname"  <c:if test="${pd.key1=='aname' }">selected</c:if>>所属分组</option>
										<option value="IP"  <c:if test="${pd.key1=='IP' }">selected</c:if>>地址</option>
										<option value="time"  <c:if test="${pd.key1=='time' }">selected</c:if>>采集日期</option>								  	</select>
								  	</td>
								<td style="padding-left:2px;">
									<div class="nav-search">
											<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="val2" value="${pd.val2 }" placeholder="输入内容" style="width: 80px;" />
									</div>
								</td>
								<td style="vertical-align:top;padding-left:5px">
									<select class="chosen-select form-control" name="key3" id="key3" data-placeholder="关键词" style="vertical-align:top;width: 100px;height: 30px;">
										<option value="IMEI"  <c:if test="${pd.key1=='IMEI' }">selected</c:if>>终端IMEI</option>
										<option value="aname"  <c:if test="${pd.key1=='aname' }">selected</c:if>>所属分组</option>
										<option value="IP"  <c:if test="${pd.key1=='IP' }">selected</c:if>>地址</option>
										<option value="time"  <c:if test="${pd.key1=='time' }">selected</c:if>>采集日期</option>
								  	</select>
								  	</td>
								
								<td style="padding-left:2px;">
									<div class="nav-search">
											<input class="nav-search-input" autocomplete="off" id="nav-search-input" type="text" name="val3" value="${pd.val3 }" placeholder="输入内容" style="width: 80px;" />
									</div>
								</td>
								<td style="vertical-align:top;padding-left:5px">
								  	<select class="chosen-select form-control" name="isuse" id="isuse" data-placeholder="是否启用" style="vertical-align:top;width: 90px;height: 30px;">
										<option value=""></option>
										<option value="1" <c:if test="${pd.isuse=='1' }">selected</c:if>> 启用</option>
										<option value="0" <c:if test="${pd.isuse=='0' }">selected</c:if>>停用</option>
								  	</select>
								</td>
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								<c:if test="${editQX }">
								<td style="vertical-align:top;padding-left:2px;"><a class="btn btn-light btn-xs" onclick="fromExcel();" title="从EXCEL导入"><i id="nav-search-icon" class="ace-icon fa fa-cloud-upload bigger-110 nav-search-icon blue"></i></a></td>
								</c:if>
							</tr>
	                   </table>
							   <table id="simple-table" data-toggle="table"   class="table table-striped table-hover" style="margin-top:5px;">
<!-- 								data-height="320" -->
								<thead>
								  <tr>
									<th class="center" style="width:35px;">
									<label class="pos-rel"><input type="checkbox" class="ace" id="zcheckbox" /><span class="lbl"></span></label>
									</th>
										<th class='center' style="width:300px;">操作</th>
										<th class="center" >终端IMEI</th>
										<th class="center" >雨量</th>										
										<th class='center'>流量</th>
										<th class="center" >水位</th>
										<th class="center" >酸碱度</th>
										<th class="center" >空气质量数据</th>
										<th class="center" >温度</th>
										<th class="center" >湿度</th>
										<th class="center" >采集时间</th>
									</tr>
								</thead>
								<tbody >
								<c:choose>
									<c:when test="${not empty orgnzList}">
									<c:forEach items="${orgnzList}" var="orgnz" varStatus="vs">
									<tr>
										<td class='center' style="width:35px;">
												<label><input type='checkbox' name='ids' value="${orgnz.tname}" id="${orgnz.tid }"  class="ace"/><span class="lbl"></span></label>
											</td>
										<td class='center' style="white-space:nowrap;">
											<div class="  action-buttons" >
												
												<c:if test="${editQX }">
												<a class="red" href="javascript:delorgnz('${orgnz.tid}','${orgnz.tname }');">
													<i class="ace-icon fa fa-trash-o bigger-130" title="删除"></i>
												</a>
												</c:if>
											</div>
										</td>
										<td class='center'>1111</td>
										<td class='center'>${orgnz.rain}</td>
										<td class='center'>${orgnz.flow}</td>
										<td class='center'>${orgnz.wlevel}</td>
										<td class='center'>${orgnz.ph}</td>
										<td class='center'>${orgnz.pm}</td>
										<td class='center'>${orgnz.temp}</td>
										<td class='center'>${orgnz.hum}</td>
										<td class='center'>${orgnz.time}</td>

										
									</tr>
									</c:forEach>
									</c:when>
										<c:otherwise>
<!-- 											<tr> -->
<!-- 											<td colspan="1" class='center'></td> -->
<!-- 											<td data-colspan="20" class='center'>没有相关数据</td> -->
<!-- 											</tr> -->
											<tr>
											<td colspan="100" class='center'>没有相关数据</td>
											</tr>
										</c:otherwise>
									</c:choose>
								</tbody>
							</table>
							<div class="page-header position-relative"> 
							<table style="width:100%; margin-top:5px;">
								<tr>
									<td style="vertical-align:top">
										<c:if test="${editQX }">
										<a title="批量删除" class="btn btn-sm btn-danger" onclick="makeAll('确定要删除选中的数据吗?',this);" ><i class='ace-icon fa fa-trash-o bigger-130'></i></a>
								
										
								        </c:if>
								        <a class="btn btn-sm btn-primary" onclick="toExcel(this);">导出</a>
									 <c:if test="${pd.area!='' }">
								       <a class="btn btn-sm btn-success" onclick="goback();">返回所有终端列表</a>
									</c:if>
									</td>
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
	<!--引入弹窗组件start-->
		<script type="text/javascript" src="plugins/attention/zDialog/zDrag.js"></script>
		<script type="text/javascript" src="plugins/attention/zDialog/zDialog.js"></script>
		<!--引入弹窗组件end-->
	<!-- ace scripts -->
	<script src="static/ace/js/ace/ace.js"></script>
	<script type="text/javascript" src="static/js/jquery.min.js"></script>
<!-- 	<script type="text/javascript" src="static/ace/js/bootstrap.js"></script> -->
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
<script type="text/javascript" src="static/js/bootstrap-table.js"></script>

<script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-table/1.11.0/locale/bootstrap-table-zh-CN.min.js"></script>
<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<!-- inline scripts related to this page -->
	<script type="text/javascript">
		$(document).ready(function(){
			
			top.hangge();
//     		$("th").css("white-space","nowrap"); 
// 			setwindow();
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
		$('#simple-table > tbody > tr').each(function(){
// 		$(this).closest('table').find('tbody > tr').each(function(){
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
			window.location.href="<%=basePath%>sensordata/envdata.do";
		}
		//检索
		function tosearch(){
			top.jzts();
			$("#Form").submit();
		}
		

function dataview(type,IMEI){

	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="数据展示";
	 diag.URL = "<%=basePath%>orgnz/dataview.do?type="+type+"&IMEI="+IMEI;
	 diag.Width = 600;
	 diag.Height = 500;
	 diag.CancelEvent = function(){ //关闭事件
	
		diag.close();
	 };
	 diag.show();
}
		

		
		//批量操作
function makeAll(msg,object){
	Dialog.confirm(msg,function(){
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
				$(object).tips({
						side:1,
			            msg:'您没有选择任何内容',
			            bg:'#AE81FF',
			            time:2
			        });
				return;
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
						url: '<%=basePath%>orgnz/deleteAllGroupTer.do?',
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
	});
}
	//删除
		function delorgnz(tid,tname){
			Dialog.confirm("确定要删除此终端吗?",function(){
					var url = "<%=basePath%>orgnz/delete.do?tid="+tid+"&tname="+tname;
					top.jzts();
					$.get(url,function(data){
						if("success" == data.result){
							var aid = "${pd.area!=''? pd.area.aid:''}";
							window.location.href="<%=basePath%>orgnz/list.do?aid="+aid;
						}else if("false" == data.result){
							top.hangge();
							Dialog.alert("删除失败");
						}
					});
			});
		}
//打开上传excel页面
function fromExcel(){
	 top.jzts();
	 var diag = new top.Dialog();
	 diag.Drag=true;
	 diag.Title ="EXCEL 导入到数据库";
	 diag.URL = '<%=basePath%>orgnz/goUploadExcel.do';
	 diag.Width = 300;
	 diag.Height = 150;
	 diag.CancelEvent = function(){ //关闭事件
		 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
			 if('${page.currentPage}' == '0'){
				 top.jzts();
				 setTimeout("self.location.reload()",100);
			 }else{
			 	if (typeof(nextPage) == "function") {
				           nextPage(${page.currentPage});
				        }else{
				        	tosearch();
				        }
			 }
		}
		diag.close();
	 };
	 diag.show();
}	
//导出到excel
function toExcel( object){
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
				$(object).tips({
						side:1,
			            msg:'您没有选择任何内容',
			            bg:'#AE81FF',
			            time:2
			        });
				return;
			}else{
					window.location.href='<%=basePath%>orgnz/excel.do?checkedidlist='+checkedidlist;
			}
}
	</script>


</body>
</html>