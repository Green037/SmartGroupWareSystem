<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<link href="<c:url value='/resources/css/evAdd.css'/>" rel="stylesheet" type="text/css"/>
	<script>
		$(document).on('click','#searchProjectBtn',function(){
			console.log('h2');
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
					/* console.log('h2 ajax WBS AddForm!');
					console.log(data);  */
					if(data.result){
						$('#prListTbody').empty();
						$.each(data.prList, function(i, result){
						/* console.log(result.prCode); */
							$('#projectList').css('display','');
							$('#prListTbody').append(`
								<tr>
									<td id="prCode_">`+result.prCode+`</td>
									<td>`+result.prName+`</td>
									<td>`+result.prMemberCode+`</td>
									<td>`+result.prProgress+`</td>
									<td>`+result.prCate+`</td>
									<td>`+result.prStartDay+`</td>
									<td>`+result.prEndDay+`</td>
									<td><a href="#" id="choiceBtn">선택</a></td>
								</tr>`);
						});
						$('#checkMember').modal('hide');
					}else{
						alert(data.check+"이(가) 불일치 합니다 다시 입력해주세요.");
					}
				}
			});
		});
		$(document).on('click','#choiceBtn',function(){
			var prCode = $('#prCode_').text();
			console.log(prCode);
			$('#choiceBtn').attr({href:"<c:url value='/wbs/addForm?prCode="+prCode+"'/>"}).submit();
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
	<!-- <button type="button" id="searchProjectBtn" class="btn btn-primary">내 프로젝트 검색</button> -->
	<div class="row">
		<div class="col-md-12">
			<button class="btn btn-warning orange-circle-button" id="searchProjectBtn">
				내프로젝트<br />검색<br /><span class="orange-circle-greater-than">></span>
			</button>
		</div>   
	</div>
	
	<table id="projectList" class="table table-hover" style="display:none;">
		<thead>
			<tr>
				<th>코드</th>
				<th>프로젝트명</th>
				<th>팀장</th>
				<th>인원모집상황</th>
				<th>분류</th>
				<th>시작일</th>
				<th>종료일</th>
				<th>#</th>
			</tr>
		</thead>
		<tbody id="prListTbody">
		
		</tbody>
	</table>
</div>
</div>
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