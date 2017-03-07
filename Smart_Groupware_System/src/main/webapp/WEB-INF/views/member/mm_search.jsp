<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.min.css" rel='stylesheet' type='text/css' />
	<!-- Custom CSS -->
<link href="css/style.css" rel='stylesheet' type='text/css' />
	<!-- Graph CSS -->
<link href="css/font-awesome.css" rel="stylesheet"> 
	<!-- jQuery -->
<link href='//fonts.googleapis.com/css?family=Roboto:700,500,300,100italic,100,400' rel='stylesheet' type='text/css'>
	<!-- lined-icons -->
<link rel="stylesheet" href="css/icon-font.min.css" type='text/css' />
	<!-- /js -->
<script src="js/jquery-1.10.2.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<c:url value='/resources/js/jquery-1.10.2.min.js'/>"></script>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
</head> 
<body>

	<%@ include file="../menu.jsp" %>
		<div class="page-container">
		<div class="left-content">
			<div class="inner-content">
				<div class="outter-wp">
		
		<div class="sub-heard-part">
							<ol class="breadcrumb m-b-0">
								<li><a href="index.html">Home</a></li>
								<li class="active">Forms</li>
							</ol>
						</div>
		
		
		  <div id="page-content-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                        <h1 align="center">사원 조회</h1>
					<div class="container">
						<form action = "<c:url value='/searchStaff'/>" method="post" id="mmSearchForm">
							<table class="table table-bordered">
								<tr>
									<th>이름</th>
									<td>
										<input type="text" class="form-control1" id="mmName" name="mmName"
														placeholder="사원 이름">
									</td>
									<th>직급</th>
									<th>
										<select name="ptCode" id="ptCode" class="form-control1">
														<option>:::직급선택:::</option>
															<c:forEach var="position" items="${position}">
			      										<option value="${position.ptCode}">${position.ptName}</option>
			      											</c:forEach> 
			      									</select>
									</th>
									<th>부서</th>
									<th>
										<select name="dpCode" id="dpCode" class="form-control1">
												<option>:::부서선택:::</option>
													<c:forEach var="department" items="${department}">
			      								<option value="${department.dpCode}">${department.dpName}</option>
			      									</c:forEach> 
			      						</select>
										
									</th>
								</tr>
								<tr>
									<th>최종학력</th>
									<th>
										<select name="acCode" id="acCode" class="form-control1">
											<option>:::학력을 선택하세요:::</option>
												<c:forEach var="achieve" items="${achieve}">
			      							<option value="${achieve.acCode}">${achieve.acName}</option>
			      								</c:forEach>
			      						</select> 
									</th>
									<th>보유 자격증</th>
									<td colspan="3">
										<select multiple="multiple" name="lcCode" id="lcCode" class="form-control1">
											
											<c:forEach var="license" items="${license}">
			      							<option value="${license.lcCode}">${license.lcName}</option>
			      							</c:forEach> 
										</select>
									</td>
								</tr>
								<tr>
									<th>입사일</th>
									<td colspan="5">
										<div class="col-sm-2">
													<input type="date" class="form-control1" id="mmJoinDate" name="mmJoinDate"
													placeholder="사원 입사날짜">
										</div>
										<div class="col-sm-2">
													<input type="date" class="form-control1" id="mmJoinDate" name="mmJoinDate"
													placeholder="사원 입사날짜">
										</div>
									</td>
								</tr>
								<tr>
									<th  colspan = "6">
									<div class="form-group" align="center">
										<button type="submit" class="btn btn-default" value="등록" id="searchBtn">검색</button>
										<button type="reset"  class="btn btn-default"  value="다시작성" >다시등록</button>
										</div>
									</th>
								</tr>
							</table>
						</form>
                    </div>
                </div>
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