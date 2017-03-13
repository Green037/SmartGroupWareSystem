<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<script>
	// 검색버튼 클릭 이벤트 - ajax로 검색결과 들고 와서 뿌려주기
	$(document).on('click','#searchBtn',function(){
		var formData = $('#prRequirement').serialize();
		$('#prContent').empty();
		$.ajax({
			url : '/smart/pr/search',
			data : formData,
			dataType : 'json',
			type : 'post',
			success : function(data){
				console.log('h2');
				$.each(data, function(i, prList){
					$('#prContent').append(`
						<tr>
							<td>`+prList.prCode+`</td>
							<td><a href="<c:url value='/pr/detail?prCode=`+prList.prCode+`'/>">`+prList.prName+`</a></td>
							<td>`+prList.prMemberCode+`</td>
							<td>`+prList.prProgress+`</td>
							<td>`+prList.prCate+`</td>
							<td>`+prList.prStartDay+`</td>
							<td>`+prList.prEndDay+`</td>
						</tr>`);
				});
			}
		});
		$('#prTable').css('display','');
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
<!-- 본문 -->
<div class="forms-main">
<div class="graph-form">
<div class="validation-form">
<div class="container">
	<center>
		<h2><span class="glyphicon glyphicon-pencil"> 프로젝트 검색</span></h2>
	</center>
	<marquee behavior="alternate">
		<span style="color:red;">First.</span>
		<span style="color:blue;"> Write your search requirement in the Form</span>
		<span style="color:red;">Second.</span>
		<span style="color:blue;"> If you click search-button, System will search data.</span>
	</marquee>
	<br/><br/><br/>
	
	<form class="form-inline" id="prRequirement">
		<div class="form-group">
			<label for="prSize">프로젝트규모</label>
			<select name="prSize">
				<option>::선택::</option>
				<option value="소">소</option>
				<option value="중">중</option>
				<option value="고">대</option>
			</select>
		</div>
		<div class="form-group">
			<label for="pwd">모집상황:</label>
			<select name="prProgress">
				<option>::선택::</option>
				<option value="모집중">모집중</option>
				<option value="모집완료">모집완료</option>
			</select>
		</div>
		<div class="form-group">
			<label for="prStartDay">시작일:</label>
			<input type="date" class="form-control" id="prStartDay" name="prStartDay">
		</div>
		<div class="form-group">
			<label for="prEndDay">종료일:</label>
			<input type="date" class="form-control" id="prEndDay" name="prEndDay">
		</div>
		
		<button type="button" class="btn btn-primary" id="searchBtn">
			<span class="glyphicon glyphicon-search"></span>검색
		</button>
	</form>
	<br/><br/><br/><br/>
	
	<table class="table table-hover" id="prTable" style="display:none;">
		<thead>
			<tr>
				<th>코드</th>
				<th>프로젝트명</th>
				<th>팀장</th>
				<th>인원모집상황</th>
				<th>분류</th>
				<th>시작일</th>
				<th>종료일</th>
			</tr>
		</thead>
		<tbody id="prContent">
			
		</tbody>
	</table>
</div>
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