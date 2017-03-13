<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<!-- menu.jsp에서 부터 작업시작할것. 날짜연산안됨. 서비스에 로직수정할 것. -->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<script>
		$(document).on('click','#evAppShowBtn',function(){
			var prCode = $(this).parent().parent().children('#prCode').val();
			console.log(prCode);
			$('#prListForm').attr({action:"<c:url value='/ev/EvDetail?prCode="+prCode+"'/>",method:"post"}).submit();
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
		<h2><span class="glyphicon glyphicon-pencil"> 프로젝트목록</span></h2>
	</center>
	
	<form id="prListForm">
		<table id="projectList" class="table table-hover">
			<thead>
				<tr>
					<th>코드</th>
					<th>프로젝트명</th>
					<th>팀장</th>
					<th>인원참여</th>
					<th>분류</th>
					<th>시작일</th>
					<th>종료일</th>
					<th>#</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="projectList" items="${projectList}">
					<tr>
						<input type="hidden" name="prCode" id="prCode" value="${projectList.prCode}"/>
						<td>${projectList.prCode}</td>
						<td>${projectList.prName}</a></td>
						<td>${projectList.mmName}</td>
						<td>${projectList.prMember}명</td>
						<td>${projectList.prCate}</td>
						<td>${projectList.prStartDay}</td>
						<td>${projectList.prEndDay}</td>
						<td><button type="button" id="evAppShowBtn">평가보고서</button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</form>
	
</div>
</div>
</div>

<!-- 본문 끝 -->

</div>				
</div>
</div>
</div>
<%@ include file="../footer.jsp"%>
</body>
</html>