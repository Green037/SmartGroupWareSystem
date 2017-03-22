<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<link href="<c:url value='/resources/css/evAdd.css'/>" rel="stylesheet" type="text/css"/>
	<link href="<c:url value='/resources/css/button.css'/>" rel="stylesheet" type="text/css"/>
	
	<script>
		$(document).on('click','#searchProjectBtn',function(){
			$('#checkMember').modal();
			$('#mmCode').val(31);
			$('#mmPassword').val(123456);
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
			$('#choiceBtn').attr({href:"<c:url value='/ev/addForm?prCode="+prCode+"'/>"}).submit();
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
		<h2><span class="glyphicon glyphicon-pencil"> 평가보고서 등록</span></h2>
	</center>
	<span style="color:red;">First.</span>
	<span style="color:blue;"> 본인의 프로젝트를 먼저 검색하세요</span>
	<span style="color:red;">Second.</span>
	<span style="color:blue;">팀장정보를 체크하고 일치하면 보고서를 작성해주세요</span>
	
	
	<div class="row">
		<div id="ballMenuContainer">
			<div id="menuBall1" class="menuBall">
				<a href="#" id="searchProjectBtn" class="ball blueball">
					<div class="menuText">
						검색
					</div>
				</a>
			</div>
			<div id="menuBall2" class="menuBall">
				<a href="#" id="evApprovalBtn" class="ball redball">
					<div class="menuText">
						전자결제
					</div>
				</a>
			</div>
		</div>
	</div>
	
	<!-- <button type="button" id="searchProjectBtn" class="btn btn-primary">내 프로젝트 검색</button> -->
	<!-- <div class="row">
		<div class="col-md-12">
			<button class="btn btn-primary orange-circle-button" id="searchProjectBtn">
				내프로젝트<br />검색<br /><span class="orange-circle-greater-than">Go!!</span>
			</button>
			전자결제 팝업창 만들어 주면 팀장코드 확인하고 바로 플젝세팅하면됨. 
			<button class="btn btn-warning orange-circle-button" id="evApprovalBtn">
				전자결제<br />바로가기<br /><span class="orange-circle-greater-than">Go!!</span>
			</button>
		</div>   
	</div> -->

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
<c:import url="../wbs/wbs_checkMemberForm.jsp"></c:import>			
<%@ include file="../footer.jsp"%>
</body>
</html>