<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<c:url value='/resources/js/jquery-1.10.2.min.js'/>"></script>
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
							<li>사원조회 리스트</li>
						</ol>
					</div>
			
					<div class="forms-main">
						<div class="graph-form">
							<div class="validation-form">
								<form>
									<div class="col-sm-2">
									<select  name="dpCode" id="dpCode" class="form-control1">
										<option> 부서</option>
										<c:forEach var="department" items="${department}">
     										<option value="${department.dpCode}">${department.dpName}</option>
     									</c:forEach> 
     									</select>
									</div>
									<div class="col-sm-2">
									<select name="ptCode" id="ptCode" class="form-control1">
										<option> 직급</option>
										<c:forEach var="position" items="${position}">
     										<option value="${position.ptCode}">${position.ptName}</option>
     									</c:forEach> 
     									</select>
									</div>
									<div class="col-sm-2">
									<select multiple="multiple" name="lcCodes" id="lcCodes" class="form-control1">
										<option> 보유자격증</option>
										<c:forEach var="license" items="${license}">
      										<option value="${license.lcCode}">${license.lcName}</option>
      									</c:forEach> 
										</select>
									</div>
								</form>
								<div class="clearfix">&nbsp;</div>
						
								
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
									
							
								<div class="clearfix">&nbsp;</div>
								
								
								
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