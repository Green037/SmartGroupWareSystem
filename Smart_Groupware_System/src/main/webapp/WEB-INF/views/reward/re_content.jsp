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
							<li>고과기록정보조회</li>
						</ol>
					</div>
			
					<div class="forms-main">
						<div class="graph-form">
							<div class="validation-form">
								<form>
									<div class="col-md-3 form-group1">
										<label class="control-label"><b>고과연월</b></label>&nbsp;
										<!-- 에러가 있으면 날짜 선택 메세지 말고 에러를 출력 -->
										<!-- 날짜 default : 오늘 / 받기는 날짜를 받지만 자바 코드로 년+월만 추출 -->
										<span style="color:red; font-size:10pt">날짜를 선택하세요.</span>
										<input type="date" class="form-control1 ng-invalid ng-invalid-required">
									</div>
									<div class="col-md-3 form-group1 form-last">
										<label class="control-label"><b>고과종류</b></label>
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
						
								<label class="control-label"><b>인사정보</b></label>
								<table class="table table-bordered">
									<tr>
										<th>사원번호</th>
										<td>13383</td>
										<th>성명</th>
										<td>홍길동</td>
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
											<!-- 지급내역 금액만큼 선택하여 tr 늘어나게 하기 -->
											<tr>
												<td>1</td>
												<td>10010</td>
												<td>프로젝트 완료</td>
												<td>A</td>
												<td>2017-02-17</td>
												<td>ABCDE.pdf</td>
												<td>신사임당</td>
											</tr>
										</tbody>
									</table> 
								</div>
								<div class="clearfix">&nbsp;</div>
					
								<label class="control-label"><b>고과산정 (총 3건)</b></label>
								<table class="table table-bordered">
									<tr>
										<th>성과금액</th>
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