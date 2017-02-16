<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<meta name="keywords" content="Augment Responsive web template, Bootstrap Web Templates, Flat Web Templates,
								  Android Compatible web template, Smartphone Compatible web template,
								  free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"/>
	
	<link href="resources/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
	<link href="resources/css/style.css" rel="stylesheet" type="text/css"/>
	<link href="resources/css/font-awesome.css" rel="stylesheet"/>
	<link href="resource//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400" rel="stylesheet" type="text/css"/>
	<link href="resources/css/barChart.css" rel="stylesheet" type="text/css"/>
	<link href="resources/css/fabochart.css" rel="stylesheet"type="text/css"/>
	<link rel="stylesheet" href="resources/css/icon-font.min.css" type="text/css"/>
	<link rel="stylesheet" href="resources/css/vroom.css">
	
	<script src="resources/js/jquery-1.10.2.min.js"></script>
	<script src="resources/js/amcharts.js"></script>
	<script src="resources/js/serial.js"></script>
	<script src="resources/js/light.js"></script>
	<script src="resources/js/radar.js"></script>
	<script src="resources/js/css3clock.js"></script>
	<script src="resources/js/skycons.js"></script>
	<script src="resources/js/jquery.easydropdown.js"></script>
	<script type="text/javascript" src="resources/js/vroom.js"></script>
	<script type="text/javascript" src="resources/js/TweenLite.min.js"></script>
	<script type="text/javascript" src="resources/js/CSSPlugin.min.js"></script>
	<script src="resources/js/jquery.nicescroll.js"></script>
	<script src="resources/js/scripts.js"></script>
	<script src="resources/js/bootstrap.min.js"></script>

	

	<script type="application/x-javascript">
		addEventListener("load", function() {
			 setTimeout(hideURLbar, 0);
		}, false);
		
		function hideURLbar() {
			window.scrollTo(0, 1);
		} 
	</script>
</head>
<body>

	<div class="page-container">
		<!--/content-inner-->
		<div class="left-content">
			<div class="inner-content">
				<!-- header-starts -->
				<div class="header-section">
					<!--menu-right-->
					<div class="top_menu">
						<div class="main-search">
							<form>
								<input type="text" value="Search" onFocus="this.value = '';"
									onBlur="if (this.value == '') {this.value = 'Search';}"
									class="text" /> <input type="submit" value="">
							</form>
							<div class="close">
								<img src="resources/images/cross.png" />
							</div>
						</div>
						<div class="srch">
							<button></button>
						</div>
						<script type="text/javascript">
							$('.main-search').hide();
							$('button').click(function() {
								$('.main-search').show();
								$('.main-search text').focus();
							});
							$('.close').click(function() {
								$('.main-search').hide();
							});
						</script>
						<!--/profile_details-->
						<div class="profile_details_left">
							<ul class="nofitications-dropdown">
								<li class="dropdown note"><a href="#"
									class="dropdown-toggle" data-toggle="dropdown"
									aria-expanded="false"><i class="fa fa-envelope-o"></i> <span
										class="badge">3</span></a>


									<ul class="dropdown-menu two first">
										<li>
											<div class="notification_header">
												<h3>You have 3 new messages</h3>
											</div>
										</li>
										<li><a href="#">
												<div class="user_img">
													<img src="resources/images/1.jpg" alt="">
												</div>
												<div class="notification_desc">
													<p>Lorem ipsum dolor sit amet</p>
													<p>
														<span>1 hour ago</span>
													</p>
												</div>
												<div class="clearfix"></div>
										</a></li>
										<li class="odd"><a href="#">
												<div class="user_img">
													<img src="resources/images/in.jpg" alt="">
												</div>
												<div class="notification_desc">
													<p>Lorem ipsum dolor sit amet</p>
													<p>
														<span>1 hour ago</span>
													</p>
												</div>
												<div class="clearfix"></div>
										</a></li>
										<li><a href="#">
												<div class="user_img">
													<img src="resources/images/in1.jpg" alt="">
												</div>
												<div class="notification_desc">
													<p>Lorem ipsum dolor sit amet</p>
													<p>
														<span>1 hour ago</span>
													</p>
												</div>
												<div class="clearfix"></div>
										</a></li>
										<li>
											<div class="notification_bottom">
												<a href="#">See all messages</a>
											</div>
										</li>
									</ul></li>

								<li class="dropdown note"><a href="#"
									class="dropdown-toggle" data-toggle="dropdown"
									aria-expanded="false"><i class="fa fa-bell-o"></i> <span
										class="badge">5</span></a>

									<ul class="dropdown-menu two">
										<li>
											<div class="notification_header">
												<h3>You have 5 new notification</h3>
											</div>
										</li>
										<li><a href="#">
												<div class="user_img">
													<img src="resources/images/in.jpg" alt="">
												</div>
												<div class="notification_desc">
													<p>Lorem ipsum dolor sit amet</p>
													<p>
														<span>1 hour ago</span>
													</p>
												</div>
												<div class="clearfix"></div>
										</a></li>
										<li class="odd"><a href="#">
												<div class="user_img">
													<img src="resources/images/in5.jpg" alt="">
												</div>
												<div class="notification_desc">
													<p>Lorem ipsum dolor sit amet</p>
													<p>
														<span>1 hour ago</span>
													</p>
												</div>
												<div class="clearfix"></div>
										</a></li>
										<li><a href="#">
												<div class="user_img">
													<img src="resources/images/in8.jpg" alt="">
												</div>
												<div class="notification_desc">
													<p>Lorem ipsum dolor sit amet</p>
													<p>
														<span>1 hour ago</span>
													</p>
												</div>
												<div class="clearfix"></div>
										</a></li>
										<li>
											<div class="notification_bottom">
												<a href="#">See all notification</a>
											</div>
										</li>
									</ul></li>
								<li class="dropdown note"><a href="#"
									class="dropdown-toggle" data-toggle="dropdown"
									aria-expanded="false"><i class="fa fa-tasks"></i> <span
										class="badge blue1">9</span></a>
									<ul class="dropdown-menu two">
										<li>
											<div class="notification_header">
												<h3>You have 9 pending task</h3>
											</div>
										</li>
										<li><a href="#">
												<div class="task-info">
													<span class="task-desc">Database update</span><span
														class="percentage">40%</span>
													<div class="clearfix"></div>
												</div>
												<div class="progress progress-striped active">
													<div class="bar yellow" style="width: 40%;"></div>
												</div>
										</a></li>
										<li><a href="#">
												<div class="task-info">
													<span class="task-desc">Dashboard done</span><span
														class="percentage">90%</span>
													<div class="clearfix"></div>
												</div>

												<div class="progress progress-striped active">
													<div class="bar green" style="width: 90%;"></div>
												</div>
										</a></li>
										<li><a href="#">
												<div class="task-info">
													<span class="task-desc">Mobile App</span><span
														class="percentage">33%</span>
													<div class="clearfix"></div>
												</div>
												<div class="progress progress-striped active">
													<div class="bar red" style="width: 33%;"></div>
												</div>
										</a></li>
										<li><a href="#">
												<div class="task-info">
													<span class="task-desc">Issues fixed</span><span
														class="percentage">80%</span>
													<div class="clearfix"></div>
												</div>
												<div class="progress progress-striped active">
													<div class="bar  blue" style="width: 80%;"></div>
												</div>
										</a></li>
										<li>
											<div class="notification_bottom">
												<a href="#">See all pending task</a>
											</div>
										</li>
									</ul></li>
								<div class="clearfix"></div>
							</ul>
						</div>
						<div class="clearfix"></div>
						<!--//profile_details-->
					</div>
					<!--//menu-right-->
					<div class="clearfix"></div>
				</div>
				<!-- //header-ends -->
			</div>
		</div>
		<!--//content-inner-->
		<!--/sidebar-menu-->
		<div class="sidebar-menu">
			<header class="logo">
				<a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span>
				</a> <a href="/smart"> <span id="logo">
						<h1 align="center">Smart</h1>
				</span> <!--<img id="logo" src="" alt="Logo"/>-->
				</a>
			</header>
			<div style="border-top: 1px solid rgba(69, 74, 84, 0.7)"></div>
			<!--/down-->
			<div class="down">
				<a href="index.html"><img src="resources/images/admin.jpg"></a>
				<a href="index.html"><span class=" name-caret"><b>홍길동</b></span></a>
				<p>님이 로그인 중입니다.</p>
				<ul>
					<li><a class="tooltips" href="index.html"><span>Profile</span><i
							class="lnr lnr-user"></i></a></li>
					
					<li><a class="tooltips" href="index.html"><span>Log
								out</span><i class="lnr lnr-power-switch"></i></a></li>
				</ul>
			</div>
			<!--//down-->
			<div class="menu">
				<ul id="menu">
					<li><a href="index.html"><i class="fa fa-tachometer"></i>
							<span>Dashboard</span></a></li>
					<li id="menu-academico"><a href="#"><i
							class="fa fa-table"></i> <span> Tabs &amp; Panels</span> <span
							class="fa fa-angle-right" style="float: right"></span></a>
						<ul id="menu-academico-sub">
							<li id="menu-academico-avaliacoes"><a href="tabs.html">
									Tabs &amp; Panels</a></li>
							<li id="menu-academico-boletim"><a href="widget.html">Widgets</a></li>
							<li id="menu-academico-avaliacoes"><a href="calender.html">Calendar</a></li>

						</ul></li>
					<li id="menu-academico"><a href="#"><i
							class="fa fa-file-text-o"></i> <span>Ui Elements</span> <span
							class="fa fa-angle-right" style="float: right"></span></a>
						<ul id="menu-academico-sub">
							<li id="menu-academico-avaliacoes"><a href="forms.html">Forms</a></li>
							<li id="menu-academico-boletim"><a href="validation.html">Validation
									Forms</a></li>
							<li id="menu-academico-boletim"><a href="table.html">Tables</a></li>
							<li id="menu-academico-boletim"><a href="buttons.html">Buttons</a></li>
						</ul></li>
					<li><a href="typography.html"><i class="lnr lnr-pencil"></i>
							<span>Typography</span></a></li>
					<li id="menu-academico"><a href="#"><i
							class="lnr lnr-book"></i> <span>Pages</span> <span
							class="fa fa-angle-right" style="float: right"></span></a>
						<ul id="menu-academico-sub">
							<li id="menu-academico-avaliacoes"><a href="login.html">Login</a></li>
							<li id="menu-academico-boletim"><a href="register.html">Register</a></li>
							<li id="menu-academico-boletim"><a href="404.html">404</a></li>
							<li id="menu-academico-boletim"><a href="sign.html">Sign
									up</a></li>
							<li id="menu-academico-boletim"><a href="profile.html">Profile</a></li>
						</ul></li>
					<li><a href="#"><i class="lnr lnr-envelope"></i> <span>Mail
								Box</span><span class="fa fa-angle-right" style="float: right"></span></a>
						<ul>
							<li><a href="inbox.html"><i class="fa fa-inbox"></i>
									Inbox</a></li>
							<li><a href="compose.html"><i
									class="fa fa-pencil-square-o"></i> Compose Mail</a></li>
							<li><a href="editor.html"><span
									class="lnr lnr-highlight"></span> Editors Page</a></li>

						</ul></li>
					<li id="menu-academico"><a href="#"><i
							class="lnr lnr-layers"></i> <span>Components</span> <span
							class="fa fa-angle-right" style="float: right"></span></a>
						<ul id="menu-academico-sub">
							<li id="menu-academico-avaliacoes"><a href="grids.html">Grids</a></li>
							<li id="menu-academico-boletim"><a href="media.html">Media
									Objects</a></li>

						</ul></li>
					<li><a href="chart.html"><i class="lnr lnr-chart-bars"></i>
							<span>Charts</span> <span class="fa fa-angle-right"
							style="float: right"></span></a>
						<ul>
							<li><a href="map.html"><i class="lnr lnr-map"></i> Maps</a></li>
							<li><a href="graph.html"><i class="lnr lnr-apartment"></i>
									Graph Visualization</a></li>
						</ul></li>
					<li id="menu-comunicacao"><a href="#"><i
							class="fa fa-smile-o"></i> <span>More</span><span
							class="fa fa-angle-double-right" style="float: right"></span></a>
						<ul id="menu-comunicacao-sub">
							<li id="menu-mensagens" style="width: 120px"><a
								href="project.html">Projects <i class="fa fa-angle-right"
									style="float: right; margin-right: -8px; margin-top: 2px;"></i></a>
								<ul id="menu-mensagens-sub">
									<li id="menu-mensagens-enviadas" style="width: 130px"><a
										href="ribbon.html">Ribbons</a></li>
									<li id="menu-mensagens-recebidas" style="width: 130px"><a
										href="blank.html">Blank</a></li>
								</ul></li>
							<li id="menu-arquivos"><a href="500.html">500</a></li>
						</ul></li>
				</ul>
			</div>
		</div>
		<div class="clearfix"></div>
	</div>
	
	<script>
		var toggle = true;
		
		$(".sidebar-icon").click(
			function() {
				if (toggle) {
					$(".page-container").addClass("sidebar-collapsed").removeClass("sidebar-collapsed-back");
					$("#menu span").css({"position" : "absolute"});
				} else {
					$(".page-container").removeClass("sidebar-collapsed").addClass("sidebar-collapsed-back");
						setTimeout(function() {
							$("#menu span").css({
								"position" : "relative"
							});
						}
				, 400);
			}
	
			toggle = !toggle;
		});		
	</script>
	
</body>
</html>