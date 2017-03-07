<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>

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
							<li>문서 양식 </li>
						</ol>
					</div>
			
					<div class="forms-main">
						<div class="graph-form">
							<div class="validation-form">						
								<label class="control-label"><b>문서 양식 [건수 : 10건]</b></label>	
								
								</div> &nbsp;
								
								<table class="table table-bordered">
								
									<tr>
										<th>문서번호</th>
										<th width="600">문서이름</th>
										<th>Download</th>
									</tr>
									
									<c:forEach var="docList" items="${docList}">
									
									<tr>
										<td>${docList.docCode}</td>
										<td>${docList.docFileGroup}</td>
										<td>경로0[다운로드]</td>
									</tr>
									
									</c:forEach>
										
								</table> 
								<div class="clearfix">&nbsp;</div>
							
							<!-- 관리자만 보이는 메뉴 -->
											
							<div class="btn-group btn-group-justified">
								<a href="<c:url value='/ap/docAdd'/>" class="btn btn-success">문서 추가</a>
							</div>
								
					
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