<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<script>
		$(document).on('click','#searchProjectBtn',function(){
			$('#checkMember').modal();
		});
		$(document).on('click','#checkMemberBtn',function(){
			var params = $('#checkMemberForm').serialize();
			console.log(params);
			$.ajax({
				url : '/smart/wbs/checkMember',
				data : params,
				dataType : 'json',
				type : 'POST',
				success : function(data){
					console.log('h2 ajax WBS AddForm!');
				}
			}); 
		});
	</script>
</head> 
<body>
<%@ include file="../menu.jsp" %>

<!-- contents -->
<div class="page-container">
<div class="left-content">
<div class="inner-content">
<div class="outter-wp">	

<!-- 본문시작 -->
<div class="container">
	<center>
		<h2><span class="glyphicon glyphicon-pencil"> WBS 등록</span></h2>
	</center>
	<marquee behavior="alternate">
		<span style="color:red;">First.</span>
		<span style="color:blue;"> You must search your project.</span>
		<span style="color:red;">Second.</span>
		<span style="color:blue;">Check your password and Write your plan in the form.</span>
	</marquee>
	<button type="button" id="searchProjectBtn" class="btn btn-primary">내 프로젝트 검색</button>
	
	<table class="table table-bordered" id="projectTable" style="display:none;">
		<thead>
			<tr>
				<th><span class="glyphicon glyphicon-bookmark"></span> 프로젝트코드</th>
				<th colspan="7">
					<center>${project.prCode}</center>
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><span class="glyphicon glyphicon-list-alt"></span> 프로젝트명</td>
				<td colspan="7" align="center">${project.prName}</td>
			</tr>
			<tr>
				<td><span class="glyphicon glyphicon-comment"></span> 프로젝트목적</td>
				<td colspan="7">${project.prGoal}</td>
			</tr>
			<tr>
				<td><strong><span class="glyphicon glyphicon-king"></span> 팀장</strong></td>
				<td colspan="3">-</td>
				<td><strong><span class="glyphicon glyphicon-king"></span> 직급</strong></td>
				<td>-</td>
				<td><strong><span class="glyphicon glyphicon-flag"></span> 부서</strong></td>
				<td>-</td>
			</tr>
			<tr>
				<td><strong><span class="glyphicon glyphicon-envelope"></span> 이메일</strong></td>
				<td colspan="2">-</td>
				<td><strong><span class="glyphicon glyphicon-earphone"></span> 전화번호</strong></td>
				<td colspan="2">-</td>
				<td><strong><span class="glyphicon glyphicon-log-in"></span> 참여인원</strong></td>
				<td>
					${pmCount} / ${project.prMember}
					<button type="button" id="pmBtn">상세보기</button>
					
				</td>
			</tr>
			<tr>
				<td><strong><span class="glyphicon glyphicon-usd"></span> 총자금</strong></td>
				<td>
					${project.prMoney}
					<button type="button" id="fuBtn">내역보기</button>
				</td>
				<td><strong><span class="glyphicon glyphicon-calendar"></span> 시작일</strong></td>
				<td colspan="2">${project.prStartDay}</td>
				<td><strong><span class="glyphicon glyphicon-calendar"></span> 종료일</strong></td>
				<td colspan="2">${project.prEndDay}</td>
			</tr>
			<tr>
				<td><strong><span class="glyphicon glyphicon-tasks"></span> 팀원모집상황</strong></td>
				<td>${project.prProgress}</td>
				<td><strong><span class="glyphicon glyphicon-folder-open"></span> 분류</strong></td>
				<td>${project.prCate}</td>
				<td><strong><span class="glyphicon glyphicon-check"></span> 진행최종승인여부</strong></td>
				<td>${project.prForProgress}</td>
				<td><strong><span class="glyphicon glyphicon-hourglass"></span> 프로젝트진행상황</strong></td>
				<td>${project.prFinishCheck}</td>
			</tr>
			<tr>
				<td colspan="8" align="center">
					<div class="btn-group">
						<a href="<c:url value='/pr/modify?prCode=${project.prCode}'/>" class="btn btn-primary" >
							<span class="glyphicon glyphicon-edit"></span> 수정
						</a>
						<a href="#" class="btn btn-primary" ><span class="glyphicon glyphicon-trash"></span> 삭제</a>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</div>


<!-- 본문 끝 -->

</div>				
</div>
</div>
</div>
<c:import url="./wbs_checkMemberForm.jsp"></c:import>			
<%@ include file="../footer.jsp"%>
</body>
</html>