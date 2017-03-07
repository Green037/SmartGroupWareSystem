<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
								<li class="active">근무상태 등록</li>
							</ol>
						</div>
								
	<!-- contents 시작 -->
						<div class="container">
						      <div class="row">
						        <div class="col-lg-14" align="center">
						          <p>
						            <button type="button" id="cmOntimeAddBtn" class="btn btn-sq-lg btn-primary">
						                <i class="fa fa-user fa-5x"></i><br/> 출근 등록 <br>
						            </button>
						            <button type ="button" id="cmOfftimeAddBtn" class="btn btn-sq-lg btn-success">
						              <i class="fa fa-user fa-5x"></i><br/> 퇴근 등록 <br>
						            </button>
						            <button type="button" class="btn btn-sq-lg btn-warning">
						              <i class="fa fa-user fa-5x"></i><br/> 외출 등록 <br>
						            </button>
						            <button type="button" class="btn btn-sq-lg btn-danger">
						              <i class="fa fa-user fa-5x"></i><br/> 외출 복귀 <br>
						            </button>
						          </p>
						        </div>
							</div>
						</div>	
						
						<table id="cmaddList" class="table table-hover" style="display:none;">
							<thead>
								<tr>
									<th>번호</th>
									<th>이름</th>
									<th>직급</th>
									<th>부서</th>
									<th>날짜</th>
									<th>#</th>
								</tr>
							</thead>
							<tbody id="cmaddList">
							
							</tbody>
						</table>
					
						
								</div>				
							</div>
						</div>
					</div>

			
	<%@ include file="../footer.jsp"%>
</body>
</html>