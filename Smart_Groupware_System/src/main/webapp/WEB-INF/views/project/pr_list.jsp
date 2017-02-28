<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<script>
		$(document).on('click','#putInBtn',function(){
			$('#putInFor').modal();
			var prCode = $(this).parent().parent().children('#_prCode').val();
			console.log(prCode);
			$('#prCode').val(prCode);
		});
		
		
		$(document).on('click','#approvalBtn',function(){
			$('#approvalForm').attr({action:"<c:url value='/pr/addPm'/>", method:"post"}).submit();
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
<!-- 본문 -->
<div class="container">
<center><h2>프로젝트 리스트</h2>
<p style="color:red;">If you click projectName, show detail information.!! </p></center>           
	<div class="btn-group btn-group-justified">
		<a href="<c:url value='/pr/list?prProgress=1'/>" class="btn btn-primary">
			<span class="glyphicon glyphicon-search">팀원모집중목록</span>
		</a>
		<a href="<c:url value='/pr/list?prProgress=2'/>" class="btn btn-primary">
			<span class="glyphicon glyphicon-play">진행중인프로젝트목록</span>
		</a>
		<a href="<c:url value='/pr/list?prProgress=3'/>" class="btn btn-primary">
			<span class="glyphicon glyphicon-check">완료된프로젝트목록</span>
		</a>
	</div>
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
					<input type="hidden" id="_prCode" value="${projectList.prCode}"/>
					<td>${projectList.prCode}</td>
					<td><a href="<c:url value='/pr/detail?prCode=${projectList.prCode}' />">${projectList.prName}</a></td>
					<td>${projectList.prMemberCode}</td>
					<td>${projectList.prProgress}</td>
					<td>${projectList.prCate}</td>
					<td>${projectList.prStartDay}</td>
					<c:choose>
						<c:when test="${projectList.prProgress eq '모집중'}">
							<td>
								<button type="button" id="putInBtn">참여신청</button>
							</td>
						</c:when>
						<c:when test="${projectList.prProgress eq '모집완료'}">
							<td>-</td>
						</c:when>
					</c:choose>
				</tr>
				
			</c:forEach>
			<c:import url="./pm_addForm.jsp"></c:import> <!--팝업창, 참여신청폼  -->
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