<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
					<form action="<c:url value='/member/mm_modify'/>" method="POST" >
						<div class="sub-heard-part">
							<ol class="breadcrumb m-b-0">
								<li><a href="/smart"><b>Home</b></a></li>
								<li>개인정보조회</li>
								<li><button type="submit" class="btn btn-default">수정등록</button></li>
							</ol>
						</div>
					
					<div class="forms-main">
						<div class="graph-form">
							<div class="validation-form">
								
									<div class="col-md-2 form-group1">
										<label class="control-label"><b>사원번호</b></label>&nbsp;
										<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="${memberContent.mmCode}" id="mmCode" name="mmCode"  readonly>
									</div>
									<div class="col-md-2 form-group1 form-last">
										<label class="control-label"><b>사원이름</b></label>
										<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="${memberContent.mmName}" id="mmName" name="mmName" readonly>
									</div>
									<div class="col-md-2 form-group1 form-last">
										<label class="control-label"><b>소속부서</b></label>
										<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="${memberContent.dpName}"  id="dpName" name="dpName" readonly>
									</div>
									<div class="col-md-2 form-group1 form-last">
										<label class="control-label"><b>직급</b></label>
										<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="${memberContent.ptName}"  id="ptName" name="ptName" readonly>
									</div>
									<div class="col-md-2 form-group1 form-last">
										<label class="control-label"><b>계약형태</b></label>
										<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="${memberContent.ctType}"  id="ctType" name="ctType" readonly>
									</div>
							
								<div class="clearfix">&nbsp;</div>
						
								<label class="control-label"><b>인사정보</b></label>
								<table class="table table-bordered">
									<tr>
										<th>입사일</th>
										<th>계약종료일</th>
										<th>일급</th>
										<th>군대여부</th>
										<th>결혼여부</th>
										<th>남은연차</th>
									</tr>
									<tr>
										<td>${memberContent.mmJoinDate}</td>
										<td>${memberContent.mmResignDate}</td>
										<td>${memberContent.mmDailyPay}</td>
										<c:choose>
											<c:when test="${memberContent.mmArmy eq 0}">
												<td>미필</td>
											</c:when>
											<c:when test="${memberContent.mmArmy ne 0}">
												<td>군필</td>
											</c:when>
										</c:choose>
										<c:choose>
											<c:when test="${memberContent.mmMarriage eq 0}">
												<td>미혼</td>
											</c:when>
											<c:when test="${memberContent.mmArmy ne 0}">
												<td>기혼</td>
											</c:when>
										</c:choose>
										<td>${memberContent.mmAnnualLeave}</td>
									</tr>
									<tr>
										<th>이메일주소</th>
										<th>집주소</th>
										<th>연락처</th>
										<th>지급계좌</th>
										<th>계좌번호</th>
										<th>사인</th>
									</tr>
									<tr>
										<td><input type="text" value="${memberContent.mmEmail}" class="form-control1" name="mmEmail"/></td>
										<td><input type="text" value="${memberContent.mmAddress}" class="form-control1" name="mmAddress"/></td>
										<td><input type="text" value="${memberContent.mmTel}" class="form-control1" name="mmTel"/></td>
										<td><input type="text" value="${memberContent.mmBank}" class="form-control1" name="mmBank"/></td>
										<td><input type="text" value="${memberContent.mmAccount}" class="form-control1" name="mmAccount"/></td>
										<td>${memberContent.mmSign}</td>
									</tr>
								</table> 
							
								<div class="clearfix">&nbsp;</div>
								
							</div>
								
								<div class="clearfix">&nbsp;</div>
							</div>
						</div>
					</div>
				
				</div>
			</div>
		</div>
	</form>
			
	<%@ include file="../footer.jsp"%>

</body>
</html>