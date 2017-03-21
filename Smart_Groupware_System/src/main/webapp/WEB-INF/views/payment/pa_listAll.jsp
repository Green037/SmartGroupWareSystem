<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script type="text/javascript" src="<c:url value='/resources/js/script.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/search.js'/>"></script>
</head> 
<body onload="initSelectOptionRadio(${paging.recordsPerPage}, '${sortItem}', '${sortMethod}');">
	<%@ include file="../menu.jsp" %>
	
	<!-- contents -->
	<div class="page-container">
		<div class="left-content">
			<div class="inner-content">
				<div class="outter-wp">
					
					<div class="sub-heard-part">
						<ol class="breadcrumb m-b-0">
							<li><a href="/smart"><b>Home</b></a></li>
							<li>총무부권한 > 총급여목록</li>
						</ol>
					</div>
			
					<div class="forms-main">
						<div class="graph-form">
							<div class="validation-form">
								<label class="control-label"><b>급여목록</b></label>
								
								<table width="100%">
									<tr>
										<td align="right">
											<select id="select_count">
												<option value=3>3개씩 보기</option>
												<option value=5>5개씩 보기</option>
												<option value=10>10개씩 보기</option>
												<option value=20>20개씩 보기</option>
												<option value=50>50개씩 보기</option>
											</select>
										</td>
									</tr>
								</table>
								<div class="clearfix">&nbsp;</div>
								
								<table class="table table-bordered">
									<tr>
										<th>순번</th>
										<th>급여코드</th>
										<th>사원코드</th>
										<th>일급</th>
										<th>성과급</th>
										<th>기본급</th>
										<th>실급여</th>
										<th>산정일</th>
										<th>지급일</th>
										<th>지급여부</th>
										<th>담당사원</th>
									</tr>
									
									<c:forEach var="paymentView" items="${paList}" varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td><a href="<c:url value='/pc/mmContent?pcCode=${paymentView.pcCode}'/>">${paymentView.pcCode}</a></td>
											<td>${paymentView.mmCode}</td>
											<td><fmt:formatNumber value="${paymentView.mmDailyPay}" pattern="#,###"/></td>
											<td><fmt:formatNumber value="${paymentView.paIncentive}" pattern="#,###"/></td>
											<td><fmt:formatNumber value="${paymentView.paSalary}" pattern="#,###"/></td>
											<td><fmt:formatNumber value="${paymentView.paSumSalary}" pattern="#,###"/></td>
											<td>${paymentView.paCalculateDate}</td>
											<td>${paymentView.paDate}</td>
											<td>${paymentView.paPossible}</td>
											<td>${paymentView.paMmCode}</td>
										</tr>
									</c:forEach>
								</table> 
								
								<!-- Paging -->
								<table border=0 width=100%>
									<tr>
										<td align='right'>
											<jsp:include page="<c:url value='smart/paging'/>" flush="true">
												<jsp:param name="recordsPerPage" value="${paging.recordsPerPage}" />
												<jsp:param name="sortItem" value="${sortItem}" />
												<jsp:param name="sortMethod" value="${sortMethod}" />
												<jsp:param name="cri" value="${cri}" />
												
											    <jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
											    <jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
											    <jsp:param name="startPageNo" value="${paging.startPageNo}" />
											    <jsp:param name="currentPageNo" value="${paging.currentPageNo}" />
											    <jsp:param name="endPageNo" value="${paging.endPageNo}" />
											    <jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
											    <jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
											</jsp:include>
										</td>
									</tr>
								</table>
								<div class="clearfix">&nbsp;</div>		
								
								<div align="center">
									<form method="post" name="search" class="form-inline">
										<div class="form-group">
											<select name="keyfield" class="form-control1">
												<option>-옵션 선택-</option>
												<option value="paCode"
													<c:out value="${cri.keyfield eq 'paCode' ? 'selected' : ''}"/>>
													급여코드
												</option>
												<option value="mmDailyPay"
													<c:out value="${cri.keyfield eq 'mmDailyPay' ? 'selected' : ''}"/>>
													일급
												</option>
												<option value="inAmount"
													<c:out value="${cri.keyfield eq 'inAmount' ? 'selected' : ''}"/>>
													성과급
												</option>
												<option value="mmCode"
													<c:out value="${cri.keyfield eq 'mmCode' ? 'selected' : ''}"/>>
													사원코드
												</option>
												<option value="pcDate"
													<c:out value="${cri.keyfield eq 'pcDate' ? 'selected' : ''}"/>>
													급여지급일
												</option>
												<option value="paMmCode"
													<c:out value="${cri.keyfield eq 'paDate' ? 'selected' : ''}"/>>
													담당사원코드
												</option>
											</select>
										</div>
										<div class="form-group">
											<input type="radio" name="compare" value="equals"
												<c:out value="${(cri.compare eq null) || (cri.compare eq 'equals') ? 'checked' : ''}" />>같음
											<input type="radio" name="compare" value="contains"
												<c:out value="${cri.compare eq 'contains' ? 'checked' : ''}" />>포함
										</div>										
										<div class="form-group">
											<input type="text" name="keyword" value="${cri.keyword}" class="form-control1"
												onkeydown = "if (event.keyCode == 13) document.getElementById('btnSearch').click()">
										</div>
										<div class="form-group">
											<input type="button" id="btnSearch" value="검색" class="form-control1" onclick="searchCheck(form)"/>
										</div>
									</form>
								</div>
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