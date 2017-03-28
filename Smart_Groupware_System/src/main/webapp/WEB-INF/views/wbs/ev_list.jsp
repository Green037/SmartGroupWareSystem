<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<!-- menu.jsp에서 부터 작업시작할것. 날짜연산안됨. 서비스에 로직수정할 것. -->
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<link href="<c:url value='/resources/css/panelSearch.css'/>" rel="stylesheet">
	<link href="<c:url value='/resources/css/panel.css'/>" rel="stylesheet">
	
	<script>
		$(document).on('click','#evAppShowBtn',function(){
			var prCode = $(this).parent().parent().children('#prCode').val();
			console.log(prCode);
			$('#prListForm').attr({action:"<c:url value='/ev/EvDetail?prCode="+prCode+"'/>",method:"post"}).submit();
		});
		
		$(document).ready(function(){
			$('#mainMenu').css('display','none');
			$('#project').css('display','');
		});
				
	</script>
</head> 
<c:import url="../mainIndex.jsp"></c:import>
<body>
<!-- 본문 -->
<div class="sub-heard-part">
	<ol class="breadcrumb m-b-0">
		<li><a href="<c:url value='/main/mainIndex'/>">Home</a></li>
		<li class="active">완료보고서 목록</li>
	</ol>
</div>


<div class="container">
	<div class="page-header">
		<p style="color:red;"> *완료보고서가 등록된 목록만 보여집니다!! </p>
	</div>
	<div class="col-md-12">
		<div class="panel with-nav-tabs panel-primary">
			<div class="panel-heading">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#tab1primary" data-toggle="tab" id="allPrBtn">완료된 프로젝트목록</a></li>
				</ul>
			</div>
			<div class="panel-body">
				<div class="tab-content">
					<div class="tab-pane fade in active" id="tab1primary">
						<form id="prListForm">
							<table id="projectList" class="table table-hover">
								<thead>
									<tr>
										<th>코드</th>
										<th>프로젝트명</th>
										<th>팀장</th>
										<th>인원참여</th>
										<th>분류</th>
										<th>시작일</th>
										<th>종료일</th>
										<th>#</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="projectList" items="${projectList}">
										<tr>
											<input type="hidden" name="prCode" id="prCode" value="${projectList.prCode}"/>
											<td>${projectList.prCode}</td>
											<td>${projectList.prName}</a></td>
											<td>${projectList.mmName}</td>
											<td>${projectList.prMember}명</td>
											<td>${projectList.prCate}</td>
											<td>${projectList.prStartDay}</td>
											<td>${projectList.prEndDay}</td>
											<td><button type="button" id="evAppShowBtn" class="btn-info">평가보고서 보기</button></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	

</body>
</html>