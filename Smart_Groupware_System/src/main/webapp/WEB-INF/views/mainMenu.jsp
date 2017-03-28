<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
	<link href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">

    <link href="<c:url value='/resources/css/landing-page.css'/>" rel="stylesheet">
    <link href="<c:url value='/resources/css/mainBtnBtn.css'/>" rel="stylesheet">

    <link href="<c:url value='/resources/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	
	<script>
	$(document).ready(function () {
		$('[data-toggle="tooltip"]').tooltip();
	});
	</script>
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
            <a class="navbar-brand topnav" href="#">Smart Groupware-System</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="#about">About</a>
                </li>
                <li>
                    <a href="#services">Services</a>
                </li>
                <li>
                    <a href="#contact">Contact</a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>
<div class="intro-header">
<div class="container">
<div class="row">
<div class="col-lg-12">
<div class="row">
<div class="container">
	<section>
	    <div class="row">
			<div class="col-md-12">
				<h3>Smart Groupware-System</h3>
				<p>I needed dashboard buttons for a project without having to make lots of different images to use as buttons, as the new CMS was going to be bootstrap based i decided to make them with glyphicons in custom sized buttons.</p>
	        </div>
	    </div>
		<br/><br/><br/><br/>
		<div class="row">
			<div class="col-md-12">
				<!-- dred -->
				<a href="#" class="btn btn-dred btn-lg" role="button"><span class="glyphicon glyphicon-calendar glyphsize"></span><br/>출/퇴근,외출 <br /> 체크</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" class="btn btn-dred btn-lg" role="button"><span class="glyphicon glyphicon-calendar glyphsize"></span> <br />개인 <br />근태기록조회</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" class="btn btn-dred btn-lg" role="button"><span class="glyphicon glyphicon-calendar glyphsize"></span> <br/>부서<br /> 근태기록조회</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" class="btn btn-dgreen btn-lg" role="button"><span class="glyphicon glyphicon-calendar glyphsize"></span> <br/>사원등록<br/> <인사부관리></a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" class="btn btn-dgreen btn-lg" role="button"><span class="glyphicon glyphicon-calendar glyphsize"></span> <br/><br/>개인정보조회</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" class="btn btn-dgreen btn-lg" role="button"><span class="glyphicon glyphicon-calendar glyphsize"></span> <br/><br/>사원정보조회 </a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
		</div>
		<br/><br/><br/><br/>
		<div class="row">
			<div class="col-md-12">
				<!-- mokka -->
				<a href="#" class="btn btn-mokka btn-lg" role="button"><span class="glyphicon glyphicon-triangle-right glyphsize green"></span><span class="glyphicon glyphicon-home glyphsize choc"></span> <br />출장/연차<br />신청</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" class="btn btn-mokka btn-lg" role="button"><span class="glyphicon glyphicon-tasks glyphsize choc"></span> <br />근외<br />일정조회(월)</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" class="btn btn-mokka btn-lg" role="button"><span class="glyphicon glyphicon-triangle-right glyphsize green"></span><span class="glyphicon glyphicon-home glyphsize choc"></span> <br />근외일정<br />조회(부서)</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" class="btn btn-mblue btn-lg" role="button"><span class="glyphicon glyphicon-triangle-right glyphsize green"></span><span class="glyphicon glyphicon-home glyphsize choc"></span> <br />프로젝트<br />등록</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" class="btn btn-mblue btn-lg" role="button"><span class="glyphicon glyphicon-triangle-right glyphsize green"></span><span class="glyphicon glyphicon-home glyphsize choc"></span> <br />프로젝트<br />목록</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" class="btn btn-mblue btn-lg" role="button"><span class="glyphicon glyphicon-triangle-right glyphsize green"></span><span class="glyphicon glyphicon-home glyphsize choc"></span> <br />프로젝트<br />검색</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
		</div>
		<br/><br/><br/><br/>
		<div class="row">
			<div class="col-md-12">
				<!-- dpurple -->
				<a href="#" class="btn btn-dpurple btn-lg" role="button"><span class="glyphicon glyphicon-gbp glyphsize lilac"></span> <br/>프로젝트WBS<br />등록</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" class="btn btn-dpurple btn-lg" role="button"><span class="glyphicon glyphicon-piggy-bank glyphsize mblue"></span> <br/>완료보고서<br />등록</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" class="btn btn-dpurple btn-lg" role="button"><span class="glyphicon glyphicon-user glyphsize"></span> <br/>완료보고서<br />목록</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" class="btn btn-dpurple btn-lg" role="button"><span class="glyphicon glyphicon-check glyphsize green"></span> <br/>Invoices<br />Paid</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" class="btn btn-dpurple btn-lg" role="button"><span class="glyphicon glyphicon-remove glyphsize red"></span> <br/>Invoices<br />Canceled</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" class="btn btn-dpurple btn-lg" role="button"><span class="glyphicon glyphicon-saved glyphsize lilac"></span> <br/>Invoices<br />Archived</a>
			</div>
		</div>
		<br/><br/><br/><br/>
		<div class="row">
			<div class="col-md-12">
				<!-- mokka -->
				<a href="#" class="btn btn-mokka btn-lg" role="button"><span class="glyphicon glyphicon-triangle-right glyphsize green"></span><span class="glyphicon glyphicon-home glyphsize choc"></span> <br />Delivery<br />Setup</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" class="btn btn-mokka btn-lg" role="button"><span class="glyphicon glyphicon-tasks glyphsize choc"></span> <br />Departments<br />Setup</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" class="btn btn-mokka btn-lg" role="button"><span class="glyphicon glyphicon-triangle-right glyphsize green"></span><span class="glyphicon glyphicon-home glyphsize choc"></span> <br />Delivery<br />Setup</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" class="btn btn-mokka btn-lg" role="button"><span class="glyphicon glyphicon-triangle-right glyphsize green"></span><span class="glyphicon glyphicon-home glyphsize choc"></span> <br />Delivery<br />Setup</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" class="btn btn-mokka btn-lg" role="button"><span class="glyphicon glyphicon-triangle-right glyphsize green"></span><span class="glyphicon glyphicon-home glyphsize choc"></span> <br />Delivery<br />Setup</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#" class="btn btn-mokka btn-lg" role="button"><span class="glyphicon glyphicon-triangle-right glyphsize green"></span><span class="glyphicon glyphicon-home glyphsize choc"></span> <br />Delivery<br />Setup</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			</div>
		</div>
	</div>
	</section>
</div>
</div>      
</div>
</div>
</div>
</body>
</html>