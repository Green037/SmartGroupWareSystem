<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
							<li>월급여조회</li>
						</ol>
					</div>
			
					<div class="forms-main">
						<div class="graph-form">
							<div class="validation-form">
								<form>
									<div class="col-md-3 form-group1">
										<label class="control-label"><b>급여연월</b></label>&nbsp;
										<input type="text"  value="${payDate}" class="form-control1 ng-invalid ng-invalid-required" placeholder="YYYY-MM-DD">
									</div>
									<div class="col-md-3 form-group1 form-last">
										<label class="control-label"><b>급여종류</b></label>
										<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="전체" readonly>
									</div>
									<div class="col-md-3 form-group1 form-last">
										<label class="control-label"><b>사원번호</b></label>
										<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="${member.mmCode}" readonly>
									</div>
									<div class="col-md-3 form-group1 form-last">
										<label class="control-label"><b>사원명</b></label>
										<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="${member.mmName}" readonly>
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
										<th>이메일</th>
										<td>${member.mmEmail}</td>
									</tr>
									<tr>
										<th>부서</th>
										<td>${dpName}</td>
										<th>직급</th>
										<td>${ptName}</td>
										<th>재직상태</th>
										<td>재직</td>
									</tr>
									<tr>
										<th>본사입사일</th>
										<td>${member.mmJoinDate}</td>
										<th>급여계좌</th>
										<td>${member.mmBank}</td>
										<th>급여계좌번호</th>
										<td>${member.mmAccount}</td>
									</tr>
								</table> 
								<div class="clearfix">&nbsp;</div>
								
								<div class="col-md-6 graph-2">
									<label class="control-label"><b>지급내역</b></label>
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>순번</th>
												<th>급여항목</th>
												<th>급여일자</th>
												<th>금액</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>본봉</td>
												<td>${pcList.pcDate}</td>
												<td><fmt:formatNumber value="${pcList.mmDailyPay}" pattern="#,###"/></td>
											</tr>
											<tr>
												<td>2</td>
												<td>성과금</td>
												<td>${pcList.pcDate}</td>
												<td><fmt:formatNumber value="${pcList.inAmount}" pattern="#,###"/></td>
											</tr>
										</tbody>
									</table> 
								</div>
								<div class="col-md-6 graph-2 second">
									<label class="control-label"><b>공제내역</b></label>
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>순번</th>
												<th>급여항목</th>
												<th>기준연도</th>
												<th>금액</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td>1</td>
												<td>고용보험</td>
												<td>${payYear}</td>
												<td align="right"><fmt:formatNumber value="${pcList.eiAmount}" pattern="#,###"/></td>
											</tr>
											<tr>
												<td>2</td>
												<td>국민건강보험</td>
												<td>${payYear}</td>
												<td align="right"><fmt:formatNumber value="${pcList.nhiAmount}" pattern="#,###"/></td>
											</tr>
											<tr>
												<td>3</td>
												<td>산재보험 [연구및개발]</td>
												<td>${payYear}</td>
												<td align="right"><fmt:formatNumber value="${pcList.ohiAmount}" pattern="#,###"/></td>
											</tr>
											<tr>
												<td>4</td>
												<td>연금보험</td>
												<td>${payYear}</td>
												<td align="right"><fmt:formatNumber value="${pcList.ppAmount}" pattern="#,###"/></td>
											</tr>
										</tbody>
									</table> 
								</div>
								<div class="clearfix">&nbsp;</div>
					
								<label class="control-label"><b>지급금액</b></label>
								<table class="table table-bordered">
									<tr>
										<th>총지급액 (총 <b>2</b> 건)</th>
										<td align="right"><fmt:formatNumber value="${pcList.mmDailyPay + pcList.inAmount}" pattern="#,###"/></td>
										<th>공제액 (총 <b>4</b> 건)</th>
										<td align="right"><fmt:formatNumber value="${pcList.eiAmount + pcList.nhiAmount + pcList.ppAmount}" pattern="#,###"/></td>
										<th>실수령액</th>
										<td><fmt:formatNumber value="${(pcList.mmDailyPay + pcList.inAmount) - (pcList.eiAmount + pcList.nhiAmount + pcList.ppAmount)}" pattern="#,###"/></td>
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