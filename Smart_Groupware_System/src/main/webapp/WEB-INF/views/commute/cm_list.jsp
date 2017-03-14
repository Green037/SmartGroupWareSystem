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
		var formData = $('#cmSearchForm').serialize();
		$('#cmContent').empty();
		var mmName = '${sessionScope.mmName}';
		$.ajax({
			url : '/smart/cm/search',
			data : formData,
			dataType : 'json',
			type : 'post',
			success : function(data){
				console.log('h2');
				console.log(data[0].cmCode);
				$.each(data, function(i, cmList){
					$('#cmContent').append(`
						<tr>
							<td>`+cmList.cmCode+`</td>
							<td>`+mmName+`</td>
							<td>`+cmList.cmOnTime+`</td>
							<td>`+cmList.cmOffTime+`</td>
							<td>`+cmList.cmDate+`</td>
							<td>`+cmList.cmCheckToday+`</td>
						</tr>`);
				}); 
			}
		});
		$('#cmTable').css('display','');
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
		<h2><span class="glyphicon glyphicon-search"> 근태 조회</span></h2>
	</center>
	<br/>
	
	<button type="button" class="btn btn-success btn-success btn-block">
		<span class="glyphicon glyphicon-search"></span>
		 출퇴근이력을 검색하실 기간을 입력해주세요.
	</button>
	
	<form class="form-inline" id="cmSearchForm">
		<div class="form-group">
			<label for="cmStartDay">시작일:</label>
			<input type="date" class="form-control" id="cmStartDay" name="cmStartDay">
		</div>
		<div class="form-group">
			<label for="cmEndDay">종료일:</label>
			<input type="date" class="form-control" id="cmEndDay" name="cmEndDay">
		</div>
		
		<button type="button" class="btn btn-primary" id="searchBtn">
			<span class="glyphicon glyphicon-search"></span>검색
		</button>
	</form>
	<br/><br/><br/><br/>
</div>
</div>
</div>
</div>	
	<table class="table table-hover" id="cmTable" style="display:none;">
		<thead>
			<tr>
				<th>코드</th>
				<th>사원이름</th>
				<th>출근시간</th>
				<th>퇴근시간</th>
				<th>날짜</th>
				<th>근태체크</th>
			</tr>
		</thead>
		<tbody id="cmContent">
			
		</tbody>
	</table>
	
<!-- 본문끝 -->
</div>				
</div>
</div>
</div>
<%@ include file="../footer.jsp"%>
</body>
</html>