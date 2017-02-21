<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
</head> 

<body>
<%@ include file="../menu.jsp" %>

<!-- contents -->
<div class="page-container">
<div class="left-content">
<div class="inner-content">
<div class="outter-wp">	
<!-- 본문 -->
<div class="container">
<center><h2>프로젝트 리스트</h2>
<p>If you click projectName, show detail information. </p></center>           

	<table class="table table-hover">
		<thead>
			<tr>
				<th>코드</th>
				<th>프로젝트명</th>
				<th>팀장</th>
				<th>인원모집상황</th>
				<th>분류</th>
				<th>시작일</th>
				<th>#</th>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="projectList" items="${projectList}">
				<tr>
					<td>${projectList.prCode}</td>
					<td><a href="#">${projectList.prName}</a></td>
					<td>${projectList.prMemberCode}</td>
					<td>${projectList.prProgress}</td>
					<td>${projectList.prCate}</td>
					<td>${projectList.prStartDay}</td>
					<c:choose>
						<c:when test="${projectList.prProgress eq '모집중'}">
							<td><a href="#">참여신청</a></td>
						</c:when>
						<c:when test="${projectList.prProgress eq '모집완료'}">
							<td>-</td>
						</c:when>
					</c:choose>
				</tr>
				
			</c:forEach>
		</tbody>
	</table>
</div>

</body>
</html>
<!-- 본문끝 -->
</div>				
</div>
</div>
</div>
		
<%@ include file="../footer.jsp"%>

</body>
</html>