<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
							<li>고과기록정보조회</li>
						</ol>
					</div>
			
					<div class="forms-main">
						<div class="graph-form">
							<div class="validation-form">
								<form class="form-horizontal" method="post" action="<c:url value='/re/modify'/>">	
									<div class="col-md-3 form-group1">
										<label class="control-label"><b>고과연월</b></label>&nbsp;
										<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="${reward.reDate}" placeholder="YYYY-MM-DD"/>
									</div>
									<div class="col-md-3 form-group1 form-last">
										<label class="control-label"><b>고과종류</b></label>
										<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="전체" readonly/>
									</div>
									<div class="col-md-3 form-group1 form-last">
										<label class="control-label"><b>사원번호</b></label>
										<input type="text" class="form-control1 ng-invalid ng-invalid-required" name="reCode" value="${reward.reCode}" readonly/>
									</div>
									<div class="col-md-3 form-group1 form-last">
										<label class="control-label"><b>사원명</b></label>
										<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="${member.mmName}" readonly/>
									</div>
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
								
									<div class="form-group">
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
													<tr>
														<td>1</td>
														<td>${reward.reCode}</td>
														<td>프로젝트 완료</td>
														<td><input type="text" name="reGrade" id="reGrade" class="form-control1" value="${reward.reGrade}"></td>
														<td><input type="text" name="reDate" id="reDate" class="form-control1" value="${reward.reDate}"></td>
														<td>
															<a href="<c:url value='/re/fileDownload?reCode=${reward.reCode}'/>">${reward.reDocument}</a>
														</td>
														<td>${reward.reMmCode}</td>
													</tr>
												</c:if>
											</tbody>
										</table> 
									</div>
									<div class="clearfix">&nbsp;</div>
								
									<div class="form-group">
										<label class="control-label"><b>고과산정 (총 ${rewardCount} 건)</b></label>
										<div class="form-group">
											<table class="table table-bordered">
												<tr>
													<th>성과금액</th>
													<td><input type="text" name="inBonus" id="inBonus" class="form-control1" value="${incentive.inBonus}"/></td>
												</tr>
											</table>
										</div>
									</div>	
									<div class="form-group1" align="center">
										<button type="submit" class="btn btn-default">수정</button>
										<button type="reset" class="btn btn-default">초기화</button>
									</div>
								</form>
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