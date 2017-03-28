<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<link href="<c:url value='/resources/css/panelSearch.css'/>" rel="stylesheet">
	
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
	
		$(document).ready(function(){
			$('#mainMenu').css('display','none');
			$('#project').css('display','');
		});
		
	//패널 검색폼 여닫기 이벤트 핸들러
		$(document).on('click', '.panel-heading span.clickable', function(e){
		    var $this = $(this);
			if(!$this.hasClass('panel-collapsed')) {
				$this.parents('.panel').find('.panel-body').slideUp();
				$this.addClass('panel-collapsed');
				$this.find('i').removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
			} else {
				$this.parents('.panel').find('.panel-body').slideDown();
				$this.removeClass('panel-collapsed');
				$this.find('i').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
			}
		})
	</script>
</head> 
<c:import url="../mainIndex.jsp"></c:import>
<body>
<!-- 본문 -->
<div class="sub-heard-part">
	<ol class="breadcrumb m-b-0">
		<li><a href="<c:url value='/main/mainIndex'/>">Home</a></li>
		<li class="active">WBS등록</li>
	</ol>
</div>	

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">WBS 등록</h3>
					<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
				</div>
			<div class="panel-body">
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
								<td colspan="3">${mmMap.mmName}</td>
								<td><strong><span class="glyphicon glyphicon-king"></span> 직급</strong></td>
								<td>${mmMap.ptName}</td>
								<td><strong><span class="glyphicon glyphicon-flag"></span> 부서</strong></td>
								<td>${mmMap.ctType}</td>
							</tr>
							<tr>
								<td><strong><span class="glyphicon glyphicon-envelope"></span> 이메일</strong></td>
								<td colspan="2">${mmMap.mmEmail}</td>
								<td><strong><span class="glyphicon glyphicon-earphone"></span> 전화번호</strong></td>
								<td colspan="2">${mmMap.mmTel}</td>
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
					<button type="button" id="wbsAddBtn" class="btn btn-info btn-block" >
						<span class="glyphicon glyphicon-pencil"></span> WBS등록하기
					</button>
					<form action="<c:url value='/wbs/addWbs'/>" method="post">
						<div id="wbsTable" style="display:none;">
							<button type="button" id="addFormBtn" class="btn btn-warning btn-block" >
								<span class="glyphicon glyphicon-pencil"></span> 입력폼추가하기
							</button>
							<input type="hidden" name="prCode" value="${project.prCode}"/>
							<table class="table table-bordered">
								<thead>
									<tr>
										<th style="width:80px;">대분류</th>
										<th style="width:150px;">직무명</th>
										<th>세부사항</th>
										<th style="width:170px;">작업시작일</th>
										<th style="width:170px;">작업종료일</th>
										<th style="width:100px;">완료여부</th>
										<th style="width:70px;">진행률</th>
									</tr>
								</thead>
								<tbody id="addForm">
									<tr>
										<td><input type="text" name="wbsCate" class="form-control" /></td>
										<td><input type="text" name="wbsName" class="form-control" /></td>
										<td><input type="text" name="wbsContents" class="form-control" /></td>
										<td><input type="date" name="wbsStartDate" class="form-control" /></td>
										<td><input type="date" name="wbsEndDate" class="form-control" /></td>
										<td>
											<select name="wbsStatus" class="form-control">
												<option>::선택::</option>
												<option value="진행중">진행중</option>
												<option value="완료">완료</option>
											</select>
										</td>
										<td><input type="text" name="wbsProgresses" class="form-control" /></td>
									</tr>
								</tbody>
								<tbody id="addForm1" >
									<tr>
										<td><input type="text" name="wbsCate" class="form-control" /></td>
										<td><input type="text" name="wbsName" class="form-control" /></td>
										<td><input type="text" name="wbsContents" class="form-control" /></td>
										<td><input type="date" name="wbsStartDate" class="form-control" /></td>
										<td><input type="date" name="wbsEndDate" class="form-control" /></td>
										<td>
											<select name="wbsStatus" class="form-control">
												<option>::선택::</option>
												<option value="진행중">진행중</option>
												<option value="완료">완료</option>
											</select>
										</td>
										<td><input type="text" name="wbsProgresses" class="form-control" /></td>
									</tr>
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
	</div>
</div>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
</body>
</html>