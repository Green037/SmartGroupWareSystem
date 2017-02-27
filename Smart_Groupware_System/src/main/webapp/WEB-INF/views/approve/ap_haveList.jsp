<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
</head> 
<body>

	<%@ include file="../menu.jsp" %>
	
	<!-- contents -->
	<div class="page-container">
		<div class="left-content">
			<div class="inner-content">
				<div class="outter-wp">
					
					<div class="sub-heard-part">
						<ol class="breadcrumb m-b-0">
							<li><a href="/smart"><b>Home</b></a></li>
							<li>결재 가능 목록</li>
						</ol>
					</div>
			
					<div class="forms-main">
						<div class="graph-form">
							<div class="validation-form">						
								<label class="control-label"><b>결재 가능 목록 [건수 : 10건]</b></label>
								<table class="table table-bordered">
									<tr>
										<th>차수</th>
										<th>구분</th>
										<th width="300">문서제목</th>
										<th>기안자</th>
										<th>기안부서</th>
										<th>등록일자</th>
										<th>최근 결재 일자</th>
										<th>비고</th>
															
									</tr>
									
									<c:forEach var="h" items="${hvList}">
									
									<tr>
										<td>${h.proCode}</td>
										<td></td>
										<td><a href="<c:url value='/ap/hvContent?dftCode=${h.dftCode}'/>">${h.dftTitle}</a></td>
										<td>${h.mmCode}</td>
										<td></td>
										<td>${h.dftDate}</td>
										<td>${h.proRealTime}</td>
										<td></td>								

									</tr>
									
									</c:forEach>
				
								</table> 
								<div class="clearfix">&nbsp;</div>				
					
							</div>
						</div>
					</div>
				
				</div>
			</div>
		</div>
	</div>	
			
	<%@ include file="../footer.jsp"%>

</body>
</html>