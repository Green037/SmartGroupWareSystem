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
							<li>총고과목록</li>
						</ol>
					</div>
			
					<div class="forms-main">
						<div class="graph-form">
							<div class="validation-form">
								<label class="control-label"><b>고과목록 (총 10건)</b></label>
								<table class="table table-bordered">
									<tr>
										<th>순번</th>
										<th>고과코드</th>
										<th>성과코드</th>
										<th>사원코드</th>
										<th>평가등급</th>
										<th>평가날짜</th>
										<th>고과서류첨부</th>
										<th>담당사원코드</th>
									</tr>
										<!-- 목록 수만큼 출력
											<tr>
												<td></td>
											</tr>
										 -->
								</table> 
								<div class="clearfix">&nbsp;</div>		
								
								<form>
									<div class="col-md-3 form-group1">
										<select class="form-control1">
												<option>-옵션 선택-</option>
												<option value="paCode">급여코드</option>
												<option>사원코드</option>
												<option value="paDay">근무일</option>
												<option value="paCalculateDate">급여산정일</option>
												<option value="paDate">급여지급일</option>
												<option>지급여부</option>
										</select>
										<input type="text" class="form-control1"/>
										<a class="btn green">검색</a>
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