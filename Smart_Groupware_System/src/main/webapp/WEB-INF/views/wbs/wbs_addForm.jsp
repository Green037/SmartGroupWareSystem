<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<script>
	/* WBS입력폼 등장 ! */
		$(document).on('click','#wbsAddBtn',function(){
			$('#wbsTable').css('display','');
			$('#addForm1').css('display','none');
		});
		
	/* 입력폼추가 이벤트 */
		$(document).on('click','#addFormBtn',function(){
			var addForm = $('#addForm1').html();
			$('#addForm').append(addForm);
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
		<span style="color:blue;"> If you want insert WBS, Click insert button.</span>
		<span style="color:red;">Second.</span>
		<span style="color:blue;"> Write your plan in the form.</span>
	</marquee>
	
	<table class="table table-bordered" id="projectTable">
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
				<td>${pmCount} / ${project.prMember}</td>
			</tr>
			<tr>
				<td><strong><span class="glyphicon glyphicon-usd"></span> 총자금</strong></td>
				<td>${project.prMoney}</td>
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
		</tbody>
	</table>
	<button type="button" id="wbsAddBtn" class="btn btn-primary btn-block" >
		<span class="glyphicon glyphicon-pencil"></span> WBS등록하기
	</button>
</div>
<div class="forms-main">
<div class="graph-form">
<div class="validation-form">
	<form action="<c:url value='/wbs/addWbs'/>" method="post">
		<div id="wbsTable" style="display:none;">
			<button type="button" id="addFormBtn" class="btn btn-warning btn-block" >
				<span class="glyphicon glyphicon-pencil"></span> 입력폼추가하기
			</button>
			<input type="hidden" name="prCode" value="${project.prCode}"/>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th style="width:100px;">대분류</th>
						<th style="width:240px;">직무명</th>
						<th>세부사항</th>
						<th style="width:170px;">작업시작일</th>
						<th style="width:170px;">작업종료일</th>
						<th style="width:100px;">완료여부</th>
						<th style="width:100px;">진행률</th>
					</tr>
				</thead>
				<tbody id="addForm">
					<tr>
						<td><input type="text" name="wbsCate" class="form-control1" /></td>
						<td><input type="text" name="wbsName" class="form-control1" /></td>
						<td><input type="text" name="wbsContents" class="form-control1" /></td>
						<td><input type="date" name="wbsStartDate" class="form-control1" /></td>
						<td><input type="date" name="wbsEndDate" class="form-control1" /></td>
						<td>
							<select name="wbsStatus" class="form-control1">
								<option>::선택::</option>
								<option value="진행중">진행중</option>
								<option value="완료">완료</option>
							</select>
						</td>
						<td><input type="text" name="wbsProgresses" class="form-control1" /></td>
					</tr>
				</tbody>
				<tbody id="addForm1" >
					<tr>
						<td><input type="text" name="wbsCate" class="form-control1" /></td>
						<td><input type="text" name="wbsName" class="form-control1" /></td>
						<td><input type="text" name="wbsContents" class="form-control1" /></td>
						<td><input type="date" name="wbsStartDate" class="form-control1" /></td>
						<td><input type="date" name="wbsEndDate" class="form-control1" /></td>
						<td>
							<select name="wbsStatus" class="form-control1">
								<option>::선택::</option>
								<option value="진행중">진행중</option>
								<option value="완료">완료</option>
							</select>
						</td>
						<td><input type="text" name="wbsProgresses" class="form-control1" /></td>
					</tr>
					<!-- 폼추가 부터 작업해야함. -->
				</tbody>
			</table>
			<button type="submit" class="btn btn-primary btn-block">
				<span class="glyphicon glyphicon-pencil"></span> 등록하기
			</button>
		</div>
	</form>
</div>
</div>
</div>
<!-- 본문끝 -->
</div>				
</div>
</div>
</div>
<%@ include file="../footer.jsp"%>
</body>
</html>