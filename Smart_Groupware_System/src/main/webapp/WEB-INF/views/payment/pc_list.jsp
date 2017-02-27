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
							<li>연간급여내역조회</li>
						</ol>
					</div>
			
					<div class="forms-main">
						<div class="graph-form">
							<div class="validation-form">
								<form>
									<div class="col-md-3 form-group1">
										<label class="control-label"><b>연도</b></label>&nbsp;
										<!-- 에러가 있으면 날짜 선택 메세지 말고 에러를 출력 -->
										<!-- 날짜 default : 오늘 / 받기는 날짜를 받지만 자바 코드로 년+월만 추출 -->
										<span style="color:red; font-size:10pt">연도를 선택하세요.</span>
										<input type="date" class="form-control1 ng-invalid ng-invalid-required">
									</div>
									<div class="col-md-3 form-group1 form-last">
										<label class="control-label"><b>소속</b></label>
										<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="전체" disabled>
									</div>
									<div class="col-md-3 form-group1 form-last">
										<label class="control-label"><b>사원번호</b></label>
										<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="13383" disabled>
									</div>
									<div class="col-md-3 form-group1 form-last">
										<label class="control-label"><b>사원명</b></label>
										<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="홍길동" disabled>
									</div>
								</form>
								<div class="clearfix">&nbsp;</div>
						
								<label class="control-label"><b>지급항목 [건수 : 10건]</b></label>
								<table class="table table-bordered">
									<tr>
										<th>순번</th>
										<th>항목</th>
										<th>1월</th>
										<th>2월</th>
										<th>3월</th>
										<th>4월</th>
										<th>5월</th>
										<th>6월</th>
										<th>7월</th>
										<th>8월</th>
										<th>9월</th>
										<th>10월</th>
										<th>11월</th>
										<th>12월</th>
										<th>계</th>
									</tr>
									<tr>
										<td>1</td>
										<td>본봉</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>1,000,000</td>
									</tr>
									<tr>
										<td colspan="2">지급액 계</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
									</tr>
								</table> 
								<div class="clearfix">&nbsp;</div>
								
								<label class="control-label"><b>공제항목 [건수 : 10건]</b></label>
								<table class="table table-bordered">
									<tr>
										<th>순번</th>
										<th>항목</th>
										<th>1월</th>
										<th>2월</th>
										<th>3월</th>
										<th>4월</th>
										<th>5월</th>
										<th>6월</th>
										<th>7월</th>
										<th>8월</th>
										<th>9월</th>
										<th>10월</th>
										<th>11월</th>
										<th>12월</th>
										<th>계</th>
									</tr>
									<tr>
										<td>1</td>
										<td>본봉</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>1,000,000</td>
									</tr>
									<tr>
										<td colspan="2">실지급액계</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
										<td>100,000</td>
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