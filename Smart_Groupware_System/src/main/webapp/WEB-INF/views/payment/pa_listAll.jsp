<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
							<li>총무부권한 > 총급여목록</li>
						</ol>
					</div>
			
					<div class="forms-main">
						<div class="graph-form">
							<div class="validation-form">
								<label class="control-label"><b>급여목록 (총 10건)</b></label>
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
								<div class="clearfix">&nbsp;</div>		
								
								<div align="center">
									<form class="form-inline">
										<div class="form-group">
											<select class="form-control1">
												<option>-옵션 선택-</option>
												<option value="paCode">급여코드</option>
												<option value="paCode">일급</option>
												<option value="paCode">성과급</option>
												<option>사원코드</option>
												<option value="paDate">급여지급일</option>
												<option>담당사원코드</option>
											</select>
										</div>
										<div class="form-group">
											<input type="text" class="form-control1"/>
										</div>
										<div class="form-group">
											<button class="btn btn-primary" type="submit">검색</button>
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