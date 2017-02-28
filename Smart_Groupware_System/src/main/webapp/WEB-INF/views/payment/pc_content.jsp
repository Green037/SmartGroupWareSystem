<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
										<!-- 에러가 있으면 날짜 선택 메세지 말고 에러를 출력 -->
										<!-- 날짜 default : 오늘 / 받기는 날짜를 받지만 자바 코드로 년+월만 추출 -->
										<span style="color:red; font-size:10pt">날짜를 입력하세요.</span>
										<input type="text" class="form-control1 ng-invalid ng-invalid-required" placeholder="YYYY-MM-DD">
									</div>
									<div class="col-md-3 form-group1 form-last">
										<label class="control-label"><b>급여종류</b></label>
										<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="전체" disabled>
									</div>
									<div class="col-md-3 form-group1 form-last">
										<label class="control-label"><b>사원번호</b></label>
										<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="${member.mmCode}" disabled>
									</div>
									<div class="col-md-3 form-group1 form-last">
										<label class="control-label"><b>사원명</b></label>
										<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="${member.mmName}" disabled>
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
										<td>회계부</td>
										<th>직급</th>
										<td>사원</td>
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
											<!-- 지급내역 금액만큼 선택하여 tr 늘어나게 하기 -->
											<tr>
												<td>1</td>
												<td>본봉</td>
												<td>20</td>
												<!-- fmt:format 적용하여 자리대로 끊어줄 것 -->
												<td align="right">2,000,000</td>
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
											<!-- 4대보험 금액만큼 선택하여 tr 늘어나게 하기 -->
											<tr>
												<td>1</td>
												<td>고용보험</td>
												<td>2017</td>
												<!-- fmt:format 적용하여 자리대로 끊어줄 것 -->
												<td align="right">10,000</td>
											</tr>
										</tbody>
									</table> 
								</div>
								<div class="clearfix">&nbsp;</div>
					
								<label class="control-label"><b>지급금액</b></label>
								<table class="table table-bordered">
									<tr>
										<th>총지급액 (<b>3</b> 건)</th>
										<td align="right">2,000,000</td>
										<th>공제액 (<b>3</b> 건)</th>
										<td align="right">800,000</td>
										<th>실수령액</th>
										<td>1,200,000</td>
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