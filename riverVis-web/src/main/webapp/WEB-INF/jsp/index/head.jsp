		<div id="navbar" class="navbar navbar-default">
			<script type="text/javascript">
				try{ace.settings.check('navbar' , 'fixed');}catch(e){}
			</script>

			<div class="navbar-container" id="navbar-container">
				<!-- #section:basics/sidebar.mobile.toggle -->
				<button type="button" class="navbar-toggle menu-toggler pull-left" id="menu-toggler" data-target="#sidebar">
					<span class="sr-only">Toggle sidebar</span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>

					<span class="icon-bar"></span>
				</button>

				<!-- /section:basics/sidebar.mobile.toggle -->
				<div class="navbar-header pull-left" style="height: 84px; ">
					<!-- #section:basics/navbar.layout.brand -->
					<a class="navbar-brand">
						<mid> ${pd.SYSNAME} </mid>
					</a><br>
					
                 	<a class="navbar-brand">
						<font size="1">欢迎您，<font color="yellow">${user.username }</font>${var.logtime}</font>
					</a>
					<!-- /section:basics/navbar.layout.brand -->

					<!-- #section:basics/navbar.toggle -->

					<!-- /section:basics/navbar.toggle -->
				</div>

				<!-- #section:basics/navbar.dropdown -->
				<div class="navbar-buttons navbar-header pull-right" role="navigation">
					<ul class="nav ace-nav">
<!-- 						<li class="grey"> -->
<!-- 							<a data-toggle="dropdown" class="dropdown-toggle" href="#"> -->
<!-- 								<i class="ace-icon fa fa-tasks"></i> -->
<!-- 								<span class="badge badge-grey">2</span> -->
<!-- 							</a> -->

<!-- 							<ul class="dropdown-menu-right dropdown-navbar dropdown-menu dropdown-caret dropdown-close"> -->
<!-- 								<li class="dropdown-header"> -->
<!-- 									<i class="ace-icon fa fa-check"></i> -->
<!-- 									预留功能,待开发 -->
<!-- 								</li> -->
<!-- 								<li class="dropdown-footer"> -->
<!-- 									<a href="javascript:"> -->
<!-- 										预留功能,待开发 -->
<!-- 										<i class="ace-icon fa fa-arrow-right"></i> -->
<!-- 									</a> -->
<!-- 								</li> -->
<!-- 							</ul> -->
<!-- 						</li> -->

	<!-- 					<li title="站内信" class="light-blue" onclick="fhsms();" id="fhsmstss"><!-- fhsms()在 WebRoot\static\js\myjs\head.js中 -->
	<!--						<a data-toggle="dropdown" class="dropdown-toggle" href="#">-->
	<!--							<i class="ace-icon fa fa-envelope icon-animated-vertical"></i>-->
	<!--							<span class="badge badge-success" id="fhsmsCount"></span>-->
	<!--						</a>-->
		<!--				</li>-->
						
                              
									<a href="main/index">
									<img
										src="static/ace/avatars/shouye.jpg"
										 style="height: 83px; "/>
									</a>
				

						<!-- #section:basics/navbar.user_menu -->
						
								<a data-toggle="dropdown" class="dropdown-toggle" href="#"> 
									<img
										 src="static/ace/avatars/help.jpg"
										 style="height: 83px; "/> 
									</span> 
									<i class="ace-icon fa fa-caret-down"></i>
									</a>
									<ul
										class="user-menu dropdown-menu-right dropdown-menu dropdown-yellow dropdown-caret dropdown-close">
										<li><a onclick="editUserH();" style="cursor:pointer;"><i
												class="ace-icon fa fa-cog"></i>修改密码</a>
										<!-- editUserH()在 WebRoot\static\js\myjs\head.js中 --></li>
<!-- 										<li id="systemset"><a onclick="editSys();" -->
<!-- 											style="cursor:pointer;"><i class="ace-icon fa fa-user"></i>系统设置</a> -->
										<!-- editSys()在 WebRoot\static\js\myjs\head.js中 --></li>
										<li class="divider"></li>
										<li><a href="logout"><i
												class="ace-icon fa fa-power-off"></i>退出登录</a></li>
									</ul>							
						</li>
                         
										<a href="logout">
				<!-- 						<i class="ace-icon fa fa-power-off"></i>退出登录</a></li>-->
											<img src="static/ace/avatars/quit.jpg" style="height: 83px; "/> </a>		
												
												
												
						<!-- /section:basics/navbar.user_menu -->
					</ul>
				</div>
				<!-- /section:basics/navbar.dropdown -->
			</div><!-- /.navbar-container -->
		</div>
		<div id="fhsmsobj"><!-- 站内信声音消息提示 --></div>