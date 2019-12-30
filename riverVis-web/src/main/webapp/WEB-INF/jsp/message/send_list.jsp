<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="ft"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Object rid=request.getSession().getAttribute("");
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
<script type="text/javascript"></script>
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
						<form action="smsbroad/listSendMessage.do" method="post" name="Form" id="Form">
						<table style="margin-top:5px;">
							<tr>
							<td style="vertical-align:top;padding-left:2px;">
									<div class="nav-search">
									<span class="input-icon">
										<input class="nav-search-input"  autocomplete="off" id="tnamekey" type="text" name="tnamekey" value="${pd.tnamekey }" placeholder="这里输入收信区域 " />
											<i class="ace-icon fa fa-search nav-search-icon"></i>
									</span>
									</div>
								</td>
								<td style="vertical-align:top;padding-left:2px;">
									<div class="nav-search">
									<span class="input-icon">
										<input class="nav-search-input"  autocomplete="off" id="smobilekey" type="text" name="smobilekey" value="${pd.smobilekey }" placeholder="这里输入手机号码 " />
											<i class="ace-icon fa fa-search nav-search-icon"></i>
									</span>
									</div>
								</td>
									<td style="vertical-align:top;padding-left:2px;">
								  	<select class="chosen-select form-control" name="issend" id="issend" data-placeholder="是否发送" style="vertical-align:top;width: 100px;height: 30px;">
									<option value=""></option>
									<option value="">全部</option>
									<option value="1" <c:if test="${pd.issend=='1' }">selected</c:if>>已发送</option>
									<option value="0" <c:if test="${pd.issend=='0' }">selected</c:if>>未发送</option>
								  	</select>
								</td>
						
								<td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="${pd.lastLoginStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="消息发送时间开始"/></td>
								<td style="padding-left:2px;"><input class="span10 date-picker" name="lastLoginEnd" id="lastLoginEnd"  value="${pd.lastLoginEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="消息发送时间结束"/></td>
								<td style="vertical-align:top;padding-left:2px"><a class="btn btn-light btn-xs" onclick="tosearch();"  title="检索"><i id="nav-search-icon" class="ace-icon fa fa-search bigger-110 nav-search-icon blue"></i></a></td>
								</tr>
						</table>
						<!-- 检索  -->
					
						<table id="simple-table"  class="table table-striped table-bordered table-hover" style="margin-top:5px;">	
							<thead>
								<tr>
									<th class="center" style="width: 50px;">序号</th>
									<th class="center">收件区域</th>									
									<th class="center">电话号码</th>		
									<th class="center">短信内容</th>
									<th class="center">发送时间</th>
									<th class="center">是否发送</th>														
									<th class="center">备注</th>
									<c:if test="${rid == 1}">
										<th class="center">删除</th>
									</c:if>

								</tr>
							</thead>
								<tbody>
								<c:choose>
									<c:when test="${not empty sendlist}">
									<c:forEach items="${sendlist}" var="send" varStatus="vs">
									<tr >
										<td class='center'>${vs.index+1}</td>
										<td class='center'>${send.aname}</td>
										<td class='center'>${send.smobile}</td>
										<td class='center'>${send.scontent}</td>	
										<td class='center'>${send.sendtime}</td>	
										<td class='center'>${send.issend?'已发送':'未发送'}</td> 																																																	
						                <td class='center'>${send.remark}</td>
										<c:if test="${rid == 1}">
											<td class="center">
												<div  class="hidden-sm hidden-xs btn-group">
													<a class="btn btn-xs btn-danger" onclick="delMsg(${send.smid});">
														<i class="ace-icon fa fa-trash-o bigger-120" title="删除"></i>
													</a>
												</div>
											</td>
										</c:if>
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
		   class="btn-scroll-up btn btn-sm btn-inverse"><i
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
	<!-- 日期框 -->
	<script src="static/ace/js/date-time/bootstrap-datepicker.js"></script>
	<!-- 下拉框 -->
	<script src="static/ace/js/chosen.jquery.js"></script>
	<!--提示框-->
	<script type="text/javascript" src="static/js/jquery.tips.js"></script>
	<script type="text/javascript">
		$(top.hangge());//关闭加载状态
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
		});
		//删除
		function delMsg(smid){
			 // console.log(rid);

			bootbox.confirm("确定要删除吗?", function(result) {
				if(result) {
					top.jzts();
					var url = "<%=basePath%>smsbroad/deleteMsg.do?smid="+smid;
					$.get(url,function(data){
						nextPage(${page.currentPage});
					});
				};top.hangge();
			});

		}

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
	</script>
</body>
</html>