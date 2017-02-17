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
		<div class="left-content">
			<div class="inner-content">
				<div class="header-section">
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
						<h1><span class="glyphicon glyphicon-globe" aria-hidden="true"></span>Smart</h1>
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
			
			<!-- menu -->
			<div class="menu">
				<ul id="menu">
				
					<!-- bbang menu -->
					<li id="menu-academico">
						<a href="#">
							<i class="glyphicon glyphicon-calendar"></i>
							<span>출퇴근관리</span>
							<span class="fa fa-angle-right" style="float:right"></span>
						</a>
						<ul id="menu-academico-sub">
							<li id="menu-academico-avaliacoes"><a href="#">출근등록</a></li>
							<li id="menu-academico-boletim"><a href="#">퇴근등록</a></li>
							<li id="menu-academico-avaliacoes"><a href="#">출퇴근기록조회</a></li>
							<li id="menu-academico-avaliacoes"><a href="#">부서출퇴근기록조회</a></li>
						</ul>
					</li>		
					<li id="menu-academico">
						<a href="#">
							<i class="glyphicon glyphicon-user"></i>
							<span>인사관리</span>
							<span class="fa fa-angle-right" style="float:right"></span>
						</a>
						<ul id="menu-academico-sub">
							<li id="menu-academico-avaliacoes"><a href="#">사원추가</a></li>
							<li id="menu-academico-boletim"><a href="#">사원정보수정</a></li>
							<li id="menu-academico-avaliacoes"><a href="#">사원조회</a></li>
							<li id="menu-academico-avaliacoes"><a href="#">개인정보조회</a></li>
						</ul>
					</li>
					<li id="menu-academico">
						<a href="#">
							<i class="glyphicon glyphicon-plane"></i>
							<span>근외일정관리</span> 
							<span class="fa fa-angle-right" style="float:right"></span>
						</a>
						<ul id="menu-academico-sub">
							<li id="menu-academico-avaliacoes"><a href="#">근외일정등록</a></li>
							<li id="menu-academico-boletim"><a href="#">근외일정조회</a></li>
							<li id="menu-academico-boletim"><a href="#">부서근외일정조회</a></li>
						</ul>
					</li>
					
<!-- rang1536 Menu~!! dont touch plz.. -->
					<li id="menu-comunicacao">
						<a href="#">
							<i class="lnr lnr-pencil"></i>
							<span>프로젝트</span>
							<span class="fa fa-angle-double-right" style="float:right"></span>
						</a>
						<ul id="menu-comunicacao-sub">
							<li id="menu-mensagens" style="width:120px">
								<a href="<c:url value='/prList.pr' />">목록
									<i class="fa fa-angle-right" style="float:right; margin-right:-8px; margin-top:2px;"></i>
								</a>
								<ul id="menu-mensagens-sub">
									<li id="menu-mensagens-enviadas" style="width:130px"><a href="#">모집중</a></li>
									<li id="menu-mensagens-recebidas" style="width:130px"><a href="#">진행중</a></li>
									<li id="menu-mensagens-recebidas" style="width:130px"><a href="#">완료된</a></li>
								</ul>
							</li>
							<li id="menu-arquivos"><a href="<c:url value='/prAdd.pr'/>">등록</a></li>
							<li id="menu-mensagens" style="width:120px">
								<a href="#">완료보고서
									<i class="fa fa-angle-right" style="float:right; margin-right:-8px; margin-top:2px;"></i>
								</a>
								<ul id="menu-mensagens-sub">
									<li id="menu-mensagens-enviadas" style="width:130px"><a href="#">등록</a></li>
									<li id="menu-mensagens-recebidas" style="width:130px"><a href="#">목록</a></li>
								</ul>
							</li>
						</ul>
					</li>
					<li id="menu-academico">
						<a href="#">
							<i class="lnr lnr-book"></i> 
							<span>Project WBS</span> 
							<span class="fa fa-angle-right" style="float:right"></span>
						</a>
						<ul id="menu-academico-sub">
							<li id="menu-academico-avaliacoes"><a href="#">WBS등록</a></li>
							<li id="menu-academico-boletim"><a href="#">프로젝트목록</a></li>
						</ul>
					</li>
<!-- rang1536 menu end thank you~^^ -->
									
					<!-- hsa nemu -->
					<!-- 전자결재 -->	
					<li id="menu-academico">
						<a href="#">
							<i class="lnr lnr-envelope"></i>
							<span>전자결재</span>
							<span class="fa fa-angle-right" style="float:right"></span>
						</a>
						<ul id="menu-academico-sub">
							<li id="menu-academico-avaliacoes"><a href="#">결재목록</a></li>
							<li id="menu-academico-avaliacoes"><a href="#">문서결재신청</a></li>
						</ul>
					</li>
					<li id="menu-academico">
						<a href="#">
							<i class="lnr lnr-layers"></i>
							<span>문서양식</span>
							<span class="fa fa-angle-right" style="float:right"></span>
						</a>
						<ul id="menu-academico-sub">
							<li id="menu-academico-avaliacoes"><a href="#">문서함</a></li>
						</ul>
					</li>
						
					<!-- Green037 menu -->
					<!-- 급여관리 -->
					<li id="menu-comunicacao">
						<a href="#">
							<i class="glyphicon glyphicon-usd"></i><span>급여관리</span>
							<span class="fa fa-angle-double-right" style="float:right"></span>
						</a>
						<ul id="menu-comunicacao-sub">
							<!-- 총무부 사원들만 볼 수 있는 메뉴 => 급여 목록/추가/삭제 -->
							<li id="menu-mensagens">
								<a href="#"><i class="glyphicon glyphicon-ok"></i> 총무부권한
									<i class="fa fa-angle-right" style="float:right; margin-right:-8px; margin-top:2px;"></i>
								</a>
								<ul id="menu-mensagens-sub">
									<li id="menu-mensagens-enviadas" style="width:200px"><a href="#">총급여목록</a></li>
									<li id="menu-mensagens-enviadas" style="width:200px"><a href="#">급여내역추가</a></li>
									<li id="menu-mensagens-recebidas" style="width:200px"><a href="#">급여내역수정</a></li>
								</ul>
							</li>
							<!-- 일반 사원들만 보이는 메뉴 -->
							<li id="menu-mensagens-enviadas"><a href="#">월급여조회</a></li>
							<li id="menu-mensagens-enviadas"><a href="#">연간급여내역조회</a></li>
							<li id="menu-mensagens-enviadas"><a href="#">최근 3년간 급여내역조회</a></li>
							<li id="menu-mensagens-enviadas"><a href="#">성과연봉액조회</a></li>
						</ul>
					</li>
					<!-- 고과관리 -->
					<li id="menu-academico"> 
						<a href="#"><i class="glyphicon glyphicon-chevron-up"></i><span>고과관리</span>
							<span class="fa fa-angle-double-right" style="float:right"></span>
						</a>
						<ul id="menu-academico-sub">
							<!-- 인사부 사원들만 볼 수 있는 메뉴 => 고과 목록/추가/수정 -->
							<li id="menu-mensagens">
								<a href="#"><i class="glyphicon glyphicon-ok"></i> 인사부권한
									<i class="fa fa-angle-right" style="float:right; margin-right:-8px; margin-top:2px;"></i>
								</a>
								<ul id="menu-mensagens-sub">
									<li id="menu-mensagens-enviadas" style="width:200px"><a href="#">총고과목록</a></li>
									<li id="menu-mensagens-enviadas" style="width:200px"><a href="#">고과내역추가</a></li>
									<li id="menu-mensagens-recebidas" style="width:200px"><a href="#">고과내역수정</a></li>
								</ul>
							</li>
							<!-- 일반 사원들만 보이는 메뉴 -->
							<li id="menu-mensagens-enviadas"><a href="#">고과기록정보조회</a></li>
							<li id="menu-mensagens-enviadas"><a href="#">연간고과내역조회</a></li>
						</ul>
					</li>
					
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