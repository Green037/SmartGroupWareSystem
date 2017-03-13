<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<link href="<c:url value='/resources/css/evAdd.css'/>" rel="stylesheet" type="text/css"/>
	
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
		<h2><span class="glyphicon glyphicon-pencil"> 평가보고서</span></h2>
	</center>
	<div class="row">
		<div class="col-md-12">
			<button class="btn btn-success orange-circle-button" id="evPrAddBtn">
				목록<br />보기<br /><span class="orange-circle-greater-than">Go!!</span>
			</button>
			<!-- <button class="btn btn-warning orange-circle-button" id="evApprovalBtn">
				전자결제<br />바로가기<br /><span class="orange-circle-greater-than">Go!!</span>
			</button> -->
		</div>   
	</div>
	<form id="evPrForm">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th><span class="glyphicon glyphicon-bookmark"></span> 프로젝트코드</th>
					<th colspan="7">
						<input type="hidden" name="prCode" value="${project.prCode}"/>
						<input type="hidden" name="mmCode" value="${project.prMemberCode}"/>
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
					<td>${mmMap.mmEmail}</td>
					<td><strong><span class="glyphicon glyphicon-earphone"></span> 전화번호</strong></td>
					<td colspan="3">${mmMap.mmTel}</td>
					
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
					<td colspan="7">${prEval.evPrResult}</td>
				</tr>
				<tr>
					<!-- td값 rowspan으로 참여인원 수만큼 값으로 세팅. -->
					<td rowspan="${project.prMember + 1}"><span class="glyphicon glyphicon-check"></span> 팀평가</td>
					<td>성명</td>
					<td>평가</td>
					<td>성실성(100)</td>
					<td>전문성(100)</td>
					<td>사교성(100)</td>
					<td>고과총점</td>
				</tr>
				<c:forEach var="evalList" items="${evalList}">
					<tr>
						<input type="hidden" name="mmCodes" value="${evalList.mmCode}"/>
						<td style="width:120px;">${evalList.mmName}</td>
						<td>${evalList.evEval}</td>
						<td style="width:120px;">${evalList.evIntegrity}</td>
						<td style="width:120px;">${evalList.evProfessional}</td>
						<td style="width:120px;">${evalList.evSociability}</td>
						<td style="width:120px;">${evalList.evTotalScore}</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="8" align="center">
						<br/><br/>
						<h3>상기와 같이 프로젝트를 보고합니다.</h3>
						<br/><br/><br/>
						<h3 align="right">팀장 ${mmMap.mmName}</h3>
					</td>
				</tr>
			</tfoot>
		</table>
		<!-- <button type="submit" class="btn btn-warning btn-block" id="evAddBtn">
			<span class="glyphicon glyphicon-pencil"></span> 등록하기
		</button> -->
	</form>
</div>

<!-- 본문끝 -->
</div>				
</div>
</div>
</div>
<c:import url="./ev_calculator.jsp"></c:import>
<%@ include file="../footer.jsp"%>
</body>
</html>