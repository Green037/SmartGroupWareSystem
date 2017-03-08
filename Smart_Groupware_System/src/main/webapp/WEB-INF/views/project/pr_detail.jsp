<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<script>
/* 참여인원 상세보기 */
		$(document).on('click','#pmBtn',function(){
			$('#pmList').modal();
			var prCode = ${project.prCode};
			$.ajax({
				url: '/smart/pm/detail',
				data : {'prCode' : prCode},
				dataType : 'json',
				type : 'POST',
				success : function(data){
					console.log(data);
					$('#pmListTbody').empty();
					$.each(data,function(i, result){
						/* console.log(result.prCode);
						console.log(result.pmLevel); */
						$('#pmListTbody').append(`
								<tr>
									<td>`+result.mmName+`</td>
									<td>`+result.pmLevel+`</td>
									<td>`+result.pmNote+`</td>
								</tr>`);
					});
				}
			});
		});
		
/* 자금상세내역  */
		$(document).on('click','#fuBtn',function(){
			$('#fuList').modal();
			var prCode = ${project.prCode};
			$.ajax({
				url: '/smart/fu/detail',
				data : {'prCode' : prCode},
				dataType : 'json',
				type : 'POST',
				success : function(data){
					/* console.log('h2 fu Ajax!'); */
					$('#fuListTbody').empty();
					$.each(data,function(i, result){
						/* console.log(result.prCode);
						console.log(result.fuCode); */
						$('#fuListTbody').append(`
							<tr>
								<td>`+result.fuHistory+`</td>
								<td>`+result.fuExpectedMoney+`</td>
								<td>`+result.fuUsedMoney+`</td>
							</tr>`);
					}); 
				}
			});
		});
		
		//삭제처리 맴버정보확인
		$(document).on('click','#deleteBtn',function(){
			$('#checkMember').modal();
			var memberData = $('#checkMemberForm').serialize();
			console.log(memberData);
			$.ajax({
				url: '/smart/pr/removeCheck',
				data : memberData,
				dataType : 'json',
				type : 'POST',
				success : function(data){
					console.log('H2 Ajax Remove JSP');
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
		<h2><span class="glyphicon glyphicon-file"> 프로젝트 상세보기</span></h2>
	</center> 
	<marquee behavior="alternate">
		<p style="color:red;">This infomation is detail contents By you selected.</p>
	</marquee> 
	          
	<table class="table table-bordered">
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
				<td colspan="8" style="color:blue;" align="center">WBS(작업분해도)</td>
			</tr>
		</tbody>
	</table>
	<table class="table table-bordered">
			<!-- WBS 넣기 -->
		<thead>
			<tr>
				<th style="width:80px;" align="center">대분류</td>
				<th style="width:130px;" align="center">직무명</td>
				<th style="width:200px;" align="center">세부사항</td>
				<th style="width:170px;" align="center">시작일</th>
				<th style="width:170px;" align="center">종료일</th>
				<th colspan="2" align="center">진행률</td>
				
			</tr>
		</thead>
		<tbody>
			<c:forEach var="wbsList" items="${wbsList}">
				<tr>
					<td>${wbsList.wbsCate}</td>
					<td>${wbsList.wbsName}</td>
					<td>${wbsList.wbsContents}</td>
					<td>${wbsList.wbsStartDate}</td>
					<td>${wbsList.wbsEndDate}</td>
					<td style="width:80px;">${wbsList.wbsProgress}%</td>
					<td>
						<div class="progress progress-bar-xs">
							<div class="progress-bar progress-bar-info" role="progressbar" 
								aria-valuenow="${wbsList.wbsProgress}" aria-valuemin="0" aria-valuemax="100" 
								style="width: ${wbsList.wbsProgress}%;">
							</div>
						</div>                                        
                    </td>
				</tr>
			</c:forEach>
			<tr>
				<td colspan="8" align="center">
					<div class="btn-group">
						<a href="<c:url value='/pr/modify?prCode=${project.prCode}'/>" class="btn btn-primary" >
							<span class="glyphicon glyphicon-edit"></span> 수정
						</a>
						<a href="#" class="btn btn-primary" id="deleteBtn"><span class="glyphicon glyphicon-trash"></span> 삭제</a>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</div>
<c:import url="./pm_list.jsp"></c:import> <!--팝업창, 참여인원리스트  -->
<c:import url="./fu_list.jsp"></c:import> <!--팝업창, 자금상세리스트  -->
<c:import url="../wbs/wbs_checkMemberForm.jsp"></c:import> <!--팝업창, 수정삭제시 사원정보체크 -->
<!-- 본문끝 -->
</div>				
</div>
</div>
</div>
		
<%@ include file="../footer.jsp"%>
</body>
</html>