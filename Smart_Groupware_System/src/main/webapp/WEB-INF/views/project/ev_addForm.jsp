<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<link href="<c:url value='/resources/css/evAdd.css'/>" rel="stylesheet" type="text/css"/>
	<script>
	// 프로젝트 평가보고서 폼 등장!
	$(document).on('click','#evPrAddBtn',function(){
		$('#evPrTable').css('display','');
	});
	
	// 프로젝트 참여인원 평가보고서 폼 등장!
	$(document).on('click','#evMmAddBtn',function(){
		$('#evPrTable').css('display','none');
	});
	</script>
</head> 
<body>
<%@ include file="../menu.jsp" %>
<!-- contents -->
<div class="page-container">
<div class="left-content">
<div class="inner-content">
<div class="outter-wp">	
<!-- 본문시작 -->
<div class="container">
	<center>
		<h2><span class="glyphicon glyphicon-pencil"> 평가보고서 등록</span></h2>
	</center>
	<marquee behavior="alternate">
		<span style="color:red;">First.</span>
		<span style="color:blue;"> 입력할 평가보고서 종류를 선택하세요.</span>
		<span style="color:red;">Second.</span>
		<span style="color:blue;">작성 후 등록 버튼을 누르면 등록됩니다.</span>
	</marquee>
	
	<div class="row">
		<div class="col-md-12">
			<button class="btn btn-success orange-circle-button" id="evPrAddBtn">
				프로젝트<br />평가보고서<br /><span class="orange-circle-greater-than">Go!!</span>
			</button>
			<button class="btn btn-warning orange-circle-button" id="evMmAddBtn">
				참여인원<br />평가보고서<br /><span class="orange-circle-greater-than">Go!!</span>
			</button>
		</div>   
	</div>
	
	<table class="table table-bordered" id="evPrTable" style="display:none;">
		<thead>
			<tr>
				<th><span class="glyphicon glyphicon-bookmark"></span> 프로젝트코드</th>
				<th colspan="7">
					<center>${project.prCode}</center>
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><span class="glyphicon glyphicon-list-alt"></span> 프로젝트명</td>
				<td colspan="7" align="center">${project.prName}</td>
			</tr>
			<tr>
				<td rowspan="3"><span class="glyphicon glyphicon-king"></span> 팀장</td>
				<td><span class="glyphicon glyphicon-flag"></span> 부서및직급</td>
				<td colspan="5">${mmMap.dpName}   ${mmMap.ptName}</td>
			</tr>
			<tr>
				<td>이름</td>
				<td colspan="5">${mmMap.mmName}</td>
			</tr>
			<tr>
				<td><strong><span class="glyphicon glyphicon-envelope"></span> 이메일</strong></td>
				<td colspan="2">${mmMap.mmEmail}</td>
				<td><strong><span class="glyphicon glyphicon-earphone"></span> 전화번호</strong></td>
				<td colspan="2">${mmMap.mmTel}</td>
				
			</tr>
			<tr>
				<td><strong><span class="glyphicon glyphicon-usd"></span> 총자금</strong></td>
				<td colspan="7">${project.prMoney}</td>
			</tr>
			<tr>	
				<td><strong><span class="glyphicon glyphicon-calendar"></span> 프로젝트기간</strong></td>
				<td colspan="7">${project.prStartDay} ~ ${project.prEndDay}</td>
			</tr>
			<tr>
				<td><span class="glyphicon glyphicon-comment"></span> 프로젝트성과</td>
				<td colspan="7"><input type="text" class="form-control" name="evPrResult" placeholder="프로젝트 성과를 입력해주세요"/></td>
			</tr>
			<tr>
				<!-- td값 rowspan으로 참여인원 수만큼 값으로 세팅. -->
				<td rowspan="2"><span class="glyphicon glyphicon-check"></span> 팀평가</td>
				<td>성명</td>
				<td>특이사항</td>
				<td>평가1</td>
				<td>평가2</td>
				<td>평가3</td>
			</tr>
			<tr>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
				<td>-</td>
			</tr>
		</tbody>
	</table>
	
</div>

<!-- 본문끝 -->
</div>				
</div>
</div>
</div>
<%@ include file="../footer.jsp"%>
</body>
</html>