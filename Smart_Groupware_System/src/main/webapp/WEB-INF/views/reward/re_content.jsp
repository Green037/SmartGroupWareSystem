<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
							<li>고과기록정보조회</li>
						</ol>
					</div>
			
					<div class="forms-main">
						<div class="graph-form">
							<div class="validation-form">
								<form>
									<div class="col-md-3 form-group1">
										<label class="control-label"><b>고과연월</b></label>&nbsp;
										<c:choose>
											<c:when test="${reward != null}">
												<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="${reward.reDate}" placeholder="YYYY-MM-DD"/>
											</c:when>
											<c:otherwise>
												<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="${rewardDate}"  readonly/>
											</c:otherwise>
										</c:choose>
									</div>
									<div class="col-md-3 form-group1 form-last">
										<label class="control-label"><b>고과종류</b></label>
										<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="전체" readonly/>
									</div>
									<div class="col-md-3 form-group1 form-last">
										<label class="control-label"><b>사원번호</b></label>
											<c:choose>
												<c:when test="${reward != null}">
													<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="${reward.reCode}" readonly/>
												</c:when>
												<c:otherwise>
													<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="${mmCode}" readonly/>
												</c:otherwise>
											</c:choose>
									</div>
									<div class="col-md-3 form-group1 form-last">
										<label class="control-label"><b>사원명</b></label>
										<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="${member.mmName}" readonly/>
									</div>
								</form>
								<div class="clearfix">&nbsp;</div>
						
								<label class="control-label"><b>인사정보</b></label>
								<table class="table table-bordered">
									<tr>
										<th>사원번호</th>
										<td>${member.mmCode}</td>
										<th>성명</th>
										<td>${member.mmName}</td>
										<th>주민번호</th>
										<td>900101-2******</td>
									</tr>
									<tr>
										<th>부서</th>
										<td>${dpName}</td>
										<th>직급</th>
										<td>${ptName}</td>
										<th>재직상태</th>
										<td>재직</td>
									</tr>
								</table> 
								<div class="clearfix">&nbsp;</div>
								
								
									<label class="control-label"><b>고과내역</b></label>
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>순번</th>
												<th>고과번호</th>
												<th>고과내역</th>
												<th>평가등급</th>
												<th>평가날짜</th>
												<th>고과서류첨부</th>
												<th>담당사원명</th>
											</tr>
										</thead>
										<tbody>
										
											<c:if test="${reward != null}">
												<!-- 지급내역 금액만큼 선택하여 tr 늘어나게 하기 -->
												<tr>
													<td>1</td>
													<td>${reward.reCode}</td>
													<td>프로젝트 완료</td>
													<td>${reward.reGrade}</td>
													<td>${reward.reDate}</td>
													<td><a href="<c:url value='/re/fileDownload?reCode=${reward.reCode}'/>">
														${reward.reDocument}</a>
													</td>
													<td>${reward.reMmCode}</td>
												</tr>
											</c:if>
										</tbody>
									</table> 
								</div>
								<div class="clearfix">&nbsp;</div>
					
								<label class="control-label"><b>고과산정 (총 ${rewardCount} 건)</b></label>
								<table class="table table-bordered">
									<tr>
										<th>성과금액</th>
										<c:choose>
											<c:when test="${incentive != null}">
												<td><fmt:formatNumber value="${incentive.inBonus}" pattern="#,###"/></td>
											</c:when>
											<c:otherwise>
												<td>0 원</td>
											</c:otherwise>
										</c:choose>
									</tr>
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