<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js'/>" type="text/javascript"></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" />
<link href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/resources/css/landing-page.css'/>" rel="stylesheet">
<link href="<c:url value='/resources/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
<link href="<c:url value='/resources/css/mainBtnBtn.css'/>" rel="stylesheet">


<script>
	/*근태,근외관리 */
	$(document).on('click','#commuteMenuBtn',function(){
		$('#mainMenu').css('display','none');
		$('#commute').css('display','');
	});
	
	/*메인메뉴  */
	$(document).on('click','#mainMoveBtn',function(){
		$('#commute').css('display','none');
		$('#member').css('display','none');
		$('#project').css('display','none');
		$('#payment').css('display','none');
		$('#approval').css('display','none');
		$('#mainMenu').css('display','');
	});
	
	/*인사관리  */
	$(document).on('click','#memberMenuBtn',function(){
		$('#mainMenu').css('display','none');
		$('#member').css('display','');
	});
	
	/*프로젝트  */
	$(document).on('click','#projectMenuBtn',function(){
		$('#mainMenu').css('display','none');
		$('#project').css('display','');
	});
	
	/*인사,고과  */
	$(document).on('click','#paymentMenuBtn',function(){
		$('#mainMenu').css('display','none');
		$('#payment').css('display','');
	});
	
	/*전자결제  */
	$(document).on('click','#approvalMenuBtn',function(){
		$('#mainMenu').css('display','none');
		$('#approval').css('display','');
	});
</script>

<body>
<!-- 상단 네비게이션 바 -->
<nav class="navbar navbar-default navbar-fixed-top topnav" role="navigation">
    <div class="container topnav">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand topnav" href="<c:url value='/main/mainIndex'/>"><span class="glyphicon glyphicon-globe"></span>Smart Groupware-System</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">근태관리 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="<c:url value='/cm/add'/>">출퇴근등록</a></li>
						<li><a href="<c:url value='/cm/listForm'/>">출퇴근기록조회(개인)</a></li>
						<li><a href="<c:url value='/cm/cmDplist'/>">출퇴근기록조회(부서)</a></li>
					</ul>
       			</li>
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">사원관리 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="<c:url value='/member/mm_add'/>">사원등록</a></li>
						<li><a href="<c:url value='/member/mm_listSearch'/>">사원조회</a></li>
						<li><a href="<c:url value='/member/mm_content'/>">개인정보조회</a></li>
					</ul>
       			</li>
       			<li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">근외일정관리 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="<c:url value='/extraSchedule/es_add'/>">연차,출장등록</a></li>
						<li><a href="<c:url value='/cm/listForm'/>">근외일정조회(개인)</a></li>
						<li><a href="<c:url value='/cm/cmDplist'/>">근외일정조회(부서)</a></li>
					</ul>
       			</li>
       			<li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">프로젝트 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="<c:url value='/pr/add'/>">프로젝트등록</a></li>
						<li><a href="<c:url value='/pr/list?prProgress=0'/>">프로젝트목록</a></li>
						<li><a href="<c:url value='/pr/search'/>">프로젝트검색</a></li>
						<li><a href="<c:url value='/ev/add'/>">완료보고서 등록</a></li>
						<li><a href="<c:url value='/ev/list'/>">완료보고서 목록</a></li>
					</ul>
       			</li>
       			<li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">WBS <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="<c:url value='/wbs/add'/>">WBS등록</a></li>
					</ul>
       			</li>
       			<li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">전자결제 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="<c:url value='/ap/add'/>">결제신청</a></li>
						<li><a href="<c:url value='/ap/list?apProgress=0'/>">결제목록</a></li>
						<li><a href="<c:url value='/ap/temList'/>">임시보관함</a></li>
					</ul>
       			</li>
       			<li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">문서함 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="<c:url value='/ap/docList'/>">문서양식</a></li>
					</ul>
       			</li>
       			<li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">급여관리 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<!-- 총무부직원만 공개되는 메뉴 -->
						<c:choose>
							<c:when test="${dpName eq '총무부'}">
								<li><a href="<c:url value='/pa/listAll'/>">총급여목록</a></li>
								<li><a href="<c:url value='/pa/add'/>">급여내역추가</a></li>
							</c:when>
						</c:choose>
						<!--  일반사원공개메뉴-->
						<li><a href="<c:url value='/pc/content'/>">급여내역조회(월)</a></li>
						<li><a href="<c:url value='/pc/list'/>">급여내역조회(연)</a></li>
					</ul>
       			</li>
       			<li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">인사고과 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<!-- 인사부직원만 공개되는 메뉴 -->
						<c:choose>
							<c:when test="${dpName eq '인사부'}">
								<li><a href="<c:url value='/re/listAll'/>">총고과목록</a></li>
								<li><a href="<c:url value='/re/add'/>">고과내역추가</a></li>
							</c:when>
						</c:choose>
						<!-- 일반직원만 공개되는 메뉴 -->
						<li><a href="<c:url value='/pc/content'/>">고과기록정보조회</a></li>
						<li><a href="<c:url value='/pc/list'/>">연간고과내역조회</a></li>
					</ul>
       			</li>
            </ul>
        </div>
    </div>
</nav>
<!-- 상단 -->
<div class="intro-header">
<div class="container">
<div class="row">
<div class="col-lg-12">
<div class="row">
	<div class="col-md-12">
		<h2>Smart Groupware-System</h2>
		<p>I needed dashboard buttons for a project without having to make lots of different images to use as buttons, as the new CMS was going to be bootstrap based i decided to make them with glyphicons in custom sized buttons.</p>
	</div>
	
	<div class="row">
		<div class="col-md-12" id="mainMenu">
			<!-- dred -->
			<br/><br/><br/>
			<a href="#" class="btn btn-primary btn-lg" role="button" id="commuteMenuBtn"><span class="glyphicon glyphicon-calendar glyphsize"></span> <br/><br/>근태/근외일정</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" class="btn btn-primary btn-lg" role="button" id="memberMenuBtn"><span class="glyphicon glyphicon-triangle-right glyphsize"></span><span class="glyphicon glyphicon-user glyphsize"></span><br/><br />인사관리</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" class="btn btn-primary btn-lg" role="button" id="projectMenuBtn"><span class="glyphicon glyphicon-folder-open glyphsize"></span> <br/><br/>프로젝트/WBS</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" class="btn btn-primary btn-lg" role="button" id="approvalMenuBtn"><span class="glyphicon glyphicon glyphicon-save glyphsize"></span><span class="glyphicon glyphicon-folder-open glyphsize"></span> <br/><br/>전자결제</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			<a href="#" class="btn btn-primary btn-lg" role="button" id="paymentMenuBtn"><span class="glyphicon glyphicon-usd glyphsize"></span> <br/><br />급여.고과</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
	</div>
	<div class="row" id="commute" style="display:none;">
		<div class="col-md-12">
			<!-- dred -->
			<br/><br/><br/>
			<a href="<c:url value='/cm/add'/>" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-log-in glyphsize"></span> <br/><br/>출퇴근등록</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/cm/listForm'/>" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-search glyphsize"></span><br/><br />근태조회(개인)</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/cm/cmDplist'/>" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-zoom-in glyphsize"></span> <br/><br/>근태조회(부서)</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/extraSchedule/es_add'/>" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-log-in glyphsize"></span> <br/><br />연차/출장등록</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/extraSchedule/es_listSearch'/>" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-search glyphsize"></span><br/><br />근태조회(개인)</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/extraSchedule/es_dplist'/>" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-zoom-in glyphsize"></span> <br/><br/>근태조회(부서)</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" class="btn btn-success" role="button" id="mainMoveBtn"><span class="glyphicon glyphicon-play-circle glyphsize"></span> <br/>메인페이지<br /> 이동</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
	</div>
	<div class="row" id="member" style="display:none;">
		<div class="col-md-12">
			<!-- dred -->
			<br/><br/><br/>
			<a href="<c:url value='/member/mm_add'/>" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-log-in glyphsize"></span> <br/><br/>사원 등록</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/member/mm_content'/>" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-list-alt glyphsize"></span><br/><br />개인정보보기</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/member/mm_listSearch'/>" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-search glyphsize"></span> <br/><br/>사원정보조회</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" class="btn btn-success" role="button" id="mainMoveBtn"><span class="glyphicon glyphicon-play-circle glyphsize"></span> <br/>메인페이지<br /> 이동</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
	</div>
	<div class="row" id="project" style="display:none;">
		<div class="col-md-12">
			<!-- dred -->
			<br/><br/><br/>
			<a href="<c:url value='/pr/add'/>" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-level-up glyphsize"></span> <br/>프로젝트<br/>등록</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/pr/list?prProgress=0'/>" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-duplicate glyphsize"></span><br/>프로젝트<br />목록</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/pr/search'/>" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-search glyphsize"></span> <br/>프로젝트<br/>검색</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/wbs/add'/>" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-level-up glyphsize"></span> <br/><br />WBS 등록</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/ev/add'/>" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-list glyphsize"></span><br/>완료보고서<br />등록</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/ev/list'/>" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-duplicate glyphsize"></span> <br/>완료보고서<br/>목록</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" class="btn btn-success" role="button" id="mainMoveBtn"><span class="glyphicon glyphicon-play-circle glyphsize"></span> <br/>메인페이지<br /> 이동</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
	</div>
	<div class="row" id="payment" style="display:none;">
		<div class="col-md-12">
			<br/><br/><br/>
		<!-- 총무부,인사부 일시에 급여나 고과 메뉴 추가 보이기 -->
			<c:choose>
				<c:when test="${dpName eq '총무부'}">
					<a href="<c:url value='/pa/listAll'/>" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-level-up glyphsize"></span> <br/><br/>총급여목록</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="<c:url value='/pa/add'/>" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-duplicate glyphsize"></span><br/>급여내역<br />추가</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</c:when>
			</c:choose>
			<a href="<c:url value='/pc/content'/>" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-search glyphsize"></span> <br/>급여내역<br/>조회(월)</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/pc/list'/>" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-level-up glyphsize"></span> <br/>급여내역<br />조회(연)</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<c:choose>
				<c:when test="${dpName eq '인사부'}">
					<a href="<c:url value='/re/listAll'/>" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-list glyphsize"></span><br/><br />총고과목록</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="<c:url value='/re/add'/>" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-duplicate glyphsize"></span> <br/>고과내역<br/>추가</a>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				</c:when>
			</c:choose>
			<a href="<c:url value='/re/content'/>" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-search glyphsize"></span> <br/>고과기록<br/>조회(월)</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/re/list'/>" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-level-up glyphsize"></span> <br/>고과기록<br />조회(연)</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" class="btn btn-success" role="button" id="mainMoveBtn"><span class="glyphicon glyphicon-play-circle glyphsize"></span> <br/>메인페이지<br /> 이동</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
	</div>
	<div class="row" id="approval" style="display:none;">
		<div class="col-md-12">
			<!-- dred -->
			<br/><br/><br/>
			<a href="<c:url value='/ap/add'/>" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-log-in glyphsize"></span> <br/><br/>전자결제신청</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/ap/list?apProgress=0'/>" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-list-alt glyphsize"></span><br/><br />결제대기목록</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/ap/temList'/>" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-inbox glyphsize"></span> <br/>결제문서<br/>임시보관함</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="<c:url value='/ap/docList'/>" class="btn btn-primary" role="button"><span class="glyphicon glyphicon-download-alt glyphsize"></span> <br/>기본양식<br/>문서함</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<a href="#" class="btn btn-success" role="button" id="mainMoveBtn"><span class="glyphicon glyphicon-play-circle glyphsize"></span> <br/>메인페이지<br /> 이동</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
	</div>
</div>      
</div>
</div>
</div>
</div>
<!--상단끝  -->

</body>
</html>