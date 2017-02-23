<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<script>
		$(document).on('click','#pmBtn',function(){
			$('#pmList').modal();
			var prCode = ${project.prCode};
			$.ajax({
				url: '/smart/pm/detail',
				data : {'prCode' : prCode},
				dataType : 'json',
				type : 'POST',
				success : function(result){
					/* 여기부터 작업하면됨.  */
					console.log(result[0].prCode);
				}
			});
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
		<h2><span class="glyphicon glyphicon-file"> 프로젝트 상세보기</span></h2>
		<p>This infomation is detail contents By you selected.</p>
	</center>            
	<table class="table table-bordered">
		<thead>
			<tr>
				<th>프로젝트코드</th>
				<th colspan="7">
					<center>${project.prCode}</center>
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>프로젝트명</td>
				<td colspan="7" align="center">${project.prName}</td>
			</tr>
			<tr>
				<td><strong>팀장</strong></td>
				<td colspan="3">-</td>
				<td><strong>직급</strong></td>
				<td>-</td>
				<td><strong>부서</strong></td>
				<td>-</td>
			</tr>
			<tr>
				<td><strong>이메일</strong></td>
				<td colspan="2">-</td>
				<td><strong>전화번호</strong></td>
				<td colspan="2">-</td>
				<td><strong>참여인원</strong></td>
				<td>
					-/${project.prMember}
					<button type="button" id="pmBtn">상세보기</button>
					
				</td>
			</tr>
			<tr>
				<td><strong>총자금</strong></td>
				<td>${project.prMoney}</td>
				<td><strong>시작일</strong></td>
				<td colspan="2">${project.prStartDay}</td>
				<td><strong>종료일</strong></td>
				<td colspan="2">${project.prEndDay}</td>
			</tr>
			<tr>
				<td><strong>팀원모집상황</strong></td>
				<td>${project.prProgress}</td>
				<td><strong>분류</strong></td>
				<td>${project.prCate}</td>
				<td><strong>진행최종승인여부</strong></td>
				<td>${project.prForProgress}</td>
				<td><strong>프로젝트진행상황</strong></td>
				<td>${project.prFinishCheck}</td>
			</tr>
		</tbody>
	</table>
	
</div>
<c:import url="./pm_list.jsp"></c:import> <!--팝업창, 참여인원리스트  -->
<!-- 본문끝 -->
</div>				
</div>
</div>
</div>
		
<%@ include file="../footer.jsp"%>
</body>
</html>