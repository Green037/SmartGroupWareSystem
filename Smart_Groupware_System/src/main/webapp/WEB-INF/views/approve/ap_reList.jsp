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
					
					<div class="sub-heard-part">a
						<ol class="breadcrumb m-b-0">
							<li><a href="/smart"><b>Home</b></a></li>
							<li>반려된 결재 목록</li>
						</ol>
					</div>
			
					<div class="forms-main">
						<div class="graph-form">
							<div class="validation-form">						
								<label class="control-label"><b>반려된 목록 [건수 : 10건]</b></label>
								<table class="table table-bordered">
									<tr>
										<th>진행번호</th>
										<th>문서번호</th>
										<th width="300">문서제목</th>
										<th>기안자</th>
										<th>기안부서</th>
										<th>등록일자</th>
										<th>반려일자</th>
										<th>반려차수</th>
										<th>결재진행여부</th>
										<th>결재자</th>
	
									</tr>
									
									<c:forEach var="r" items="${reList}">
									
									<tr>
										<td>${r.proCode}</td>
										<td>${r.dftCode}</td>
										<td>1차프로젝트</td>
										<td>홍길동</td>
										<td>개발부</td>
										<td>${r.proTime}</td>
										<td>${r.proRealTime}</td>
										<td>${r.proTurn}</td>
										<td>반려</td>
										<td>${r.proApproval}</td>
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