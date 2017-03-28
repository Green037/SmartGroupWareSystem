<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<link href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">
<link href="<c:url value='/resources/css/landing-page.css'/>" rel="stylesheet">
<link href="<c:url value='/resources/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js'/>" type="text/javascript"></script>
<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" />
<link href="<c:url value='/resources/css/mainBtnBtn.css'/>" rel="stylesheet">
		
</head>
<body>
<!-- Navigation -->
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
						<li><a href="<c:url value='/pa/listAll'/>">총급여목록</a></li>
						<li><a href="<c:url value='/pa/add'/>">급여내역추가</a></li>
						<!--  일반사원공개메뉴-->
						<li><a href="<c:url value='/pc/content'/>">급여내역조회(월)</a></li>
						<li><a href="<c:url value='/pc/list'/>">급여내역조회(연)</a></li>
					</ul>
       			</li>
       			<li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">인사고과 <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<!-- 인사부직원만 공개되는 메뉴 -->
						<li><a href="<c:url value='/re/listAll'/>">총고과목록</a></li>
						<li><a href="<c:url value='/re/add'/>">고과내역추가</a></li>
						<!-- 일반직원만 공개되는 메뉴 -->
						<li><a href="<c:url value='/pc/content'/>">고과기록정보조회</a></li>
						<li><a href="<c:url value='/pc/list'/>">연간고과내역조회</a></li>
					</ul>
       			</li>
            </ul>
        </div>
    </div>
</nav>


</body>
</html>