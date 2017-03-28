<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
	<!-- Bootstrap Core CSS -->
    <link href="<c:url value='/resources/css/bootstrap.min.css'/>" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<c:url value='/resources/css/landing-page.css'/>" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<c:url value='/resources/font-awesome/css/font-awesome.min.css'/>" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">
	
	<!-- RSA javascript library / cdn 올리는 순서 틀리면 안 됨 -->
	<script src="<c:url value='/resources/js/rsa/jsbn.js'/>"></script>
	<script src="<c:url value='/resources/js/rsa/rsa.js'/>"></script>
	<script src="<c:url value='/resources/js/rsa/prng4.js'/>"></script>
	<script src="<c:url value='/resources/js/rsa/rng.js'/>"></script>
	
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<script>
		$(document).on('click','#loginBtn',function() {
		// 로그인 버튼 클릭시 서버로 전송되기 전에 계정 정보 암호화 후 서버로 전송
// 		$("#loginBtn").click(function() {
			var mmCode = $("#mmCode").val();
			var mmPassword = $("#mmPassword").val();
		 
			// RSA 암호키 생성
			var rsa = new RSAKey();
			
			rsa.setPublic($("#RSAModulus").val(), $("#RSAExponent").val());
			
			// 계정 정보 암호화
			var secondMmCode = rsa.encrypt(mmCode);
			var secondMmPassword = rsa.encrypt(mmPassword);
			
// 			console.log('secondMmCode : ' + secondMmCode);
// 			console.log('secondMmPassword : ' + secondMmPassword);
			
			$.ajax({ 
				  type: "post",  
				  url: "/smart/mm/loginRSA",
				  dataType: "json",
				  data: {"secondMmCode": secondMmCode, "secondMmPassword": secondMmPassword},
				  success: function(data) {    
					  
// 					  alert('data.state : ' + data.state);
					 
					  if(data.state == true) {
						  location.href = "<c:url value='/member/mm_login'/>"; 
					  } else if(data.state == false) {
						 THIS.oWin.alert("로그인","로그인에 실패했습니다. <br> 아이디와 패스워드를 확인하세요.");
					  } else {
						 THIS.oWin.alert("로그인","잘못된 경로로 접근했습니다. <br>암호화 인증에 실패했습니다."); 
					  } 
				  } 
			});
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
                   <div class="intro-message">
                       <h1>Smart Groupware-System</h1>
                       <h3>made by Dokkebi - 고은비, 방상엽, 윤재호, 홍수아</h3>
                       <hr class="intro-divider">
                    <div class="col-md-4 col-md-offset-4">
						<div class="panel panel-default">
							<div class="panel-body">
								<h5 class="text-center" style="color:black;">
								SIGN UP</h5>
								<form class="form form-signup" role="form" id="mmlogin" action="member/mm_login" method="post">
									<div class="form-group">
										<input type="hidden" id="RSAModulus" value="${RSAModulus}">
										<input type="hidden" id="RSAExponent" value="${RSAExponent}">
										<div class="input-group">
											<span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
											<input type="text" class="form-control" name="mmCode" id="mmCode" value="2"/>
										</div>
									</div>
									<div class="form-group">
										<div class="input-group">
											<span class="input-group-addon"><span class="glyphicon glyphicon-lock"></span></span>
											<input type="password" class="form-control" name="mmPassword" id="mmPassword" value="123456"/>
										</div>
									</div>
									<input type="button" id="loginBtn" class="btn btn-sm btn-primary btn-block" value="로그인">
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
       <!-- /.container -->
</div>
   <!-- /.intro-header -->

<div class="content-section-a">
	<div class="container">
		<div class="row">
			<div class="col-lg-5 col-sm-6">
				<hr class="section-heading-spacer">
				<div class="clearfix"></div>
					<h2 class="section-heading">Smart Groupware-System:<br>사내편의를 말하다</h2>
					<p class="lead" style="font:1.1em/1em 돋움, serif;line-height:normal;">사내편의를 위한<a target="_blank" href="#">&nbsp;Smart Groupware-System</a> 
						는 인사관리부터<br/> 프로젝트,전자결제까지 기본 편의를 제공하며 나아가 <br/>고과,급여관리까지 실질적인 편의를 제공하는 어플리케이션<br/>입니다.</p>
				</div>
				<div class="col-lg-5 col-lg-offset-2 col-sm-6">
					<img class="img-responsive" src="resources/img/ipad.png" alt="">
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>