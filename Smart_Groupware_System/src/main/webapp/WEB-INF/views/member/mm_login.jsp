<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta name="keywords"
		content="Augment Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
	Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
	<script type="application/x-javascript">
		addEventListener("load", function() {
			 setTimeout(hideURLbar, 0);
		}, false);
		
		function hideURLbar() {
			window.scrollTo(0, 1);
		} 
	</script>
	
	<link href="<c:url value='/resources/css/bootstrap.min.css'/>" rel='stylesheet' type='text/css' />
	<link href="<c:url value='/resources/css/style.css'/>" rel='stylesheet' type='text/css' />
	<link href="<c:url value='/resources/css/font-awesome.css'/>" rel="stylesheet">
	<link href='//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="resources/css/icon-font.min.css" type='text/css' />
	
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
	<div class="error_page">
		
		<div class="error-top">
			<h2 class="inner-tittle page">Smart Group</h2>
			<div class="login">
				<h3 class="inner-tittle t-inner">Login</h3>
				<div class="buttons login">
					<ul>
						<li><a href="#" class="hvr-sweep-to-right">야근의</a></li>
						<li class="lost"><a href="#" class="hvr-sweep-to-left">생활화</a></li>
						<div class="clearfix"></div>
					</ul>
				</div>
				<form id="mmlogin" action="member/mm_login" method="post">
					<!-- 서버에서 전달한 값 hidden type setting -->
					<input type="hidden" id="RSAModulus" value="${RSAModulus}">
					<input type="hidden" id="RSAExponent" value="${RSAExponent}">				
				
					<input type="text" name="mmCode" id="mmCode" value="2">
					<input type="password" name="mmPassword" id="mmPassword" value="123456">
					<div class="submit">
						<input type="button" id="loginBtn" class="btn btn-default btn-success btn-block" value="Login">
					</div>
					<div class="clearfix"></div>
				</form>
			</div>
		</div>
	</div>
	<div class="footer">
		<p>
			&copy 2016 SmartGroup . All Rights Reserved | Design by
			<a href="https://w3layouts.com/" target="_blank">빵상</a>
		</p>
	</div>
	
	<script src="<c:url value='/resources/js/jquery.nicescroll.js'/>"></script>
	<script src="<c:url value='/resources/js/scripts.js'/>"></script>
	<script src="<c:url value='/resources/js/bootstrap.min.js'/>"></script>
</body>
</html>