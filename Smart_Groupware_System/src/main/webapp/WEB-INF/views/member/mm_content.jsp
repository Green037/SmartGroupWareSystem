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
					
					<div class="sub-heard-part">
						<ol class="breadcrumb m-b-0">
							<li><a href="/smart"><b>Home</b></a></li>
							<li>개인정보조회</li>
						</ol>
					</div>
			
					<div class="forms-main">
						<div class="graph-form">
							<div class="validation-form">
								<form>
									<div class="col-md-2 form-group1">
										<label class="control-label"><b>사원번호</b></label>&nbsp;
										<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="" disabled>
									</div>
									<div class="col-md-2 form-group1 form-last">
										<label class="control-label"><b>사원이름</b></label>
										<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="" disabled>
									</div>
									<div class="col-md-2 form-group1 form-last">
										<label class="control-label"><b>소속부서</b></label>
										<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="" disabled>
									</div>
									<div class="col-md-2 form-group1 form-last">
										<label class="control-label"><b>직급</b></label>
										<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="" disabled>
									</div>
									<div class="col-md-2 form-group1 form-last">
										<label class="control-label"><b>계약형태</b></label>
										<input type="text" class="form-control1 ng-invalid ng-invalid-required" value="" disabled>
									</div>
								</form>
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
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
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
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</tr>
								</table> 
								<div class="clearfix">&nbsp;</div>
								
								
									<label class="control-label"><b>학력정보</b></label>
									<table class="table table-bordered">
										<thead>
											<tr>
												<th>최종학력</th>
												<th>학교명</th>
												<th>입학날짜</th>
												<th>졸업날짜</th>
												<th>전공</th>
												<th>학점</th>
												<th>최종성적</th>
											</tr>
										</thead>
										<tbody>
										
											<tr>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
												<td></td>
											</tr>
										</tbody>
									</table> 
								</div>
								<div class="clearfix">&nbsp;</div>
									
								<label class="control-label"><b>경력 정보</b></label>
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>경력사항</th>
											<th>경력기간</th>
											<th>입사일</th>
											<th>퇴사일</th>
											<th>직급</th>
											<th>상위업종</th>
											<th>하위업종</th>
											</tr>
										</thead>
									<tbody>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</tbody>
								</table> 
								<div class="clearfix">&nbsp;</div>
								
									<label class="control-label"><b>보유 자격증</b></label>
								<table class="table table-bordered">
									<thead>
										<tr>
											<th>자격증</th>
											<th>발급일자</th>
											<th>발급기관</th>
											<th>자격</th>
											<th>분류</th>
										</thead>
									<tbody>
										<tr>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr>

										</tr>
									</tbody>
								</table> 
								
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