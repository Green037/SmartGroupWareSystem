<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="keywords" content="Augment Responsive web template, Bootstrap Web Templates, Flat Web Templates,
								  Android Compatible web template, Smartphone Compatible web template,
								  free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design"/>
	
	<link href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet" type="text/css"/>
	<link href="<c:url value='/resources/css/style.css'/>" rel="stylesheet" type="text/css"/>
	<link href="<c:url value='/resources/css/font-awesome.css'/>" rel="stylesheet"/>
	<link href="<c:url value='/resources/font/font.ttf'/>" rel="stylesheet"/>
	<link href="<c:url value='/resources/css/barChart.css'/>" rel="stylesheet" type="text/css"/>
	<link href="<c:url value='/resources/css/fabochart.css'/>" rel="stylesheet" type="text/css"/>
	<link href="<c:url value='/resources/css/icon-font.min.css'/>" rel="stylesheet" type="text/css"/>
	<link href="<c:url value='/resources/css/vroom.css'/>" rel="stylesheet"/>
	
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<script src="<c:url value='/resources/js/amcharts.js'/>"></script>
	<script src="<c:url value='/resources/js/serial.js'/>"></script>
	<script src="<c:url value='/resources/js/light.js'/>"></script>
	<script src="<c:url value='/resources/js/radar.js'/>"></script>
	<script src="<c:url value='/resources/js/css3clock.js'/>"></script>
	<script src="<c:url value='/resources/js/skycons.js'/>"></script>
	<script src="<c:url value='/resources/js/jquery.easydropdown.js'/>"></script>
	<script src="<c:url value='/resources/js/vroom.js'/>" type="text/javascript" ></script>
	<script src="<c:url value='/resources/js/TweenLite.min.js'/>" type="text/javascript"></script>
	<script src="<c:url value='/resources/js/CSSPlugin.min.js'/>" type="text/javascript"></script>
	<script src="<c:url value='/resources/js/jquery.nicescroll.js'/>"></script>
	<script src="<c:url value='/resources/js/scripts.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>

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
								<img src="<c:url value='/resources/images/cross.png'/>"/>
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
													<img src="<c:url value='/resources/images/1.jpg'/>" alt="">
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
													<img src="<c:url value='/resources/images/in.jpg'/>" alt="">
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
													<img src="<c:url value='/resources/images/in1.jpg'/>" alt="">
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
													<img src="<c:url value='/resources/images/in.jpg'/>" alt="">
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
													<img src="<c:url value='/resources/images/in5.jpg'/>" alt="">
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
													<img src="<c:url value='/resources/images/in8.jpg'/>" alt="">
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
		<div class="sidebar-menu" style="position:fixed ; z-index:999999;">
			<header class="logo">
				<a href="#" class="sidebar-icon"> <span class="fa fa-bars"></span>
				</a> <a href="/smart"> <span id="logo">
						<h1><span class="glyphicon glyphicon-globe" aria-hidden="true"></span> Smart</h1>
				</span> <!--<img id="logo" src="" alt="Logo"/>-->
				</a>
			</header>
			<div style="border-top: 1px solid rgba(69, 74, 84, 0.7)"></div>
			<!--/down-->
			<div class="down">
				<a href="index.html"><img src="<c:url value='/resources/images/admin.jpg'/>"></a>
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
							<li id="menu-academico-avaliacoes"><a href="<c:url value='/member/mm_add'/>">사원등록</a></li>
							<li id="menu-academico-avaliacoes"><a href="<c:url value='/member/mm_search'/>">사원조회</a></li>
							<li id="menu-academico-avaliacoes"><a href="<c:url value='/member/mm_content'/>">개인정보조회</a></li>
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
								<a href="<c:url value='/pr/list?prProgress=0'/>">목록</a>
							</li>
							<li id="menu-arquivos"><a href="<c:url value='/pr/add'/>">등록</a></li>
							<li id="menu-mensagens" style="width:120px">
								<a href="#"></i> 완료보고서
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
							<li id="menu-academico-avaliacoes"><a href="<c:url value='/wbs/add'/>">WBS등록</a></li>
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
						
							<li id="menu-mensagens">
								<a href="#"><i class="glyphicon glyphicon-ok"></i> 전자결재 목록
									<i class="fa fa-angle-right" style="float:right; margin-right:-8px; margin-top:2px;"></i>
								</a>
								<ul id="menu-mensagens-sub">
									<li id="menu-mensagens-enviadas" style="width:120px"><a href="<c:url value='/ap/temList'/>">임시 문서</a></li>
									<li id="menu-mensagens-enviadas" style="width:120px"><a href="<c:url value='/ap/list?apProgress=0'/>">결재 목록</a></li>
								</ul>
							</li>
							
							<li id="menu-academico-avaliacoes">
								<a href="<c:url value='/ap/add'/>">문서결재신청</a>
							</li>
							
						</ul>
					</li>
					<li id="menu-academico">
						<a href="#">
							<i class="lnr lnr-layers"></i>
							<span>문서양식</span>
							<span class="fa fa-angle-right" style="float:right"></span>
						</a>
						<ul id="menu-academico-sub">
							<li id="menu-academico-avaliacoes"><a href="<c:url value='/ap/docList'/>">문서함</a></li>
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
									<li id="menu-mensagens-enviadas" style="width:200px"><a href="<c:url value='/pa/list'/>">총급여목록</a></li>
									<li id="menu-mensagens-enviadas" style="width:200px"><a href="<c:url value='/pa/add'/>">급여내역추가</a></li>
								</ul>
							</li>
							<!-- 일반 사원들만 보이는 메뉴 -->
							<li id="menu-mensagens-enviadas"><a href="<c:url value='/pc/content'/>">월급여조회</a></li>
							<li id="menu-mensagens-enviadas"><a href="<c:url value='/pc/list'/>">연간급여내역조회</a></li>
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
									<li id="menu-mensagens-enviadas" style="width:200px"><a href="<c:url value='/re/listAll'/>">총고과목록</a></li>
									<li id="menu-mensagens-enviadas" style="width:200px"><a href="<c:url value='/re/add'/>">고과내역추가</a></li>
								</ul>
							</li>
							<!-- 일반 사원들만 보이는 메뉴 -->
							<li id="menu-mensagens-enviadas"><a href="<c:url value='/re/content'/>">고과기록정보조회</a></li>
							<li id="menu-mensagens-enviadas"><a href="<c:url value='/re/list'/>">연간고과내역조회</a></li>
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