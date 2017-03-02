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
	<center>
		<h2><span class="glyphicon glyphicon-file"></span> 결재 목록</h2>
	</center>
	<marquee behavior="alternate">
		<p style="color:red;">If you click ApprovalName, show detail information.!! </p>
	</marquee>
           
	<div class="btn-group btn-group-justified">
		<a href="<c:url value='/ap/pgList?apProgress=1'/>" class="btn btn-success">
			<span class="glyphicon glyphicon-search"></span> 결재 대기 목록
		</a>
		<a href="<c:url value='/ap/pgList?apProgress=2'/>" class="btn btn-success">
			<span class="glyphicon glyphicon-play"></span> 결재 반려 목록
		</a>
		<a href="<c:url value='/ap/pgList?apProgress=3'/>" class="btn btn-success">
			<span class="glyphicon glyphicon-check"></span> 결재 완료 목록
		</a>
	</div>
	<table class="table table-hover">
		<thead>
			<tr>
				<th>기안번호</th>
				<th>결재Title</th>
				<th>기안자</th>
				<th>결재자</th>
				<th>기안등록일자</th>
				<th>최근결재일자</th>
				<th>결재진행현황</th>
			
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="pgList" items="${pgList}">
				<tr>
					<input type="hidden" id="_dftCode" value="${pgList.dftCode}"/>
					<td>${pgList.dftCode}</td>
					<td><a href="<c:url value='/ap/hvContent?dftCode=${pgList.dftCode}' />">${pgList.dftTitle}</a></td>
					<td>${pgList.mmCode}</td>
					<td>${pgList.proApproval}</td>
					<td>${pgList.dftDate}</td>
					<td>${pgList.proRealTime}</td>
					<td>${pgList.dftFinalState}</td>
				
					
			<%-- 		<c:choose>
						<c:when test="${projectList.prProgress eq '모집중'}">
							<td>
								<button type="button" id="putInBtn">참여신청</button>
							</td>
						</c:when>
						<c:when test="${projectList.prProgress eq '모집완료'}">
							<td>-</td>
						</c:when>
					</c:choose> --%>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<%-- <c:import url="./pm_addForm.jsp"></c:import> <!--팝업창, 참여신청폼  --> --%>
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