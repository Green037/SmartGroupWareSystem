<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<c:url value='/resources/js/jquery-1.10.2.min.js'/>"></script>
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
							<li>사원 조회 리스트</li>
						</ol>
					</div>
			
					<div class="forms-main">
						<div class="graph-form">
							<div class="validation-form">
							
								
								
									<label class="control-label"><b>조회 리스트</b></label>
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>사원번호</th>
												<th>사원 이름</th>
												<th>소속부서</th>
												<th>직급</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="mmList" items="${mmList}">
												<tr>
													<td>${mmList.mmCode}</td>
													<td>${mmList.mmName}</td>
													<td>${mmList.dpName}</td>
													<td>${mmList.ptName}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table> 
								</div>
								 <div>
						        <c:if test="${currentPage>1}">
						            <a href="<c:url value='/member/mm_list?currentPage=${currentPage-1}'/>">이전</a>
						        </c:if>
						        <c:if test="${currentPage < lastPage}"> 
						            <a href="<c:url value='/member/mm_list?currentPage=${currentPage+1}'/>">다음</a>
						        </c:if>
   							 </div>
								
								<div class="clearfix">&nbsp;</div>
									
							
								<div class="clearfix">&nbsp;</div>							
							</div>
								
								<div class="clearfix">&nbsp;</div>
							</div>
						</div>
					</div>
				
				</div>
			</div>
		</div>
		
			
	<%@ include file="../footer.jsp"%>

</body>
</html>