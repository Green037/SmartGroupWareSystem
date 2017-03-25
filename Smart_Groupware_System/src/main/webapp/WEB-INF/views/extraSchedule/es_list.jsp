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
		var formData = $('#esSearchForm').serialize();
		$('#esContent').empty();
		var mmName = '${sessionScope.mmName}';
		$.ajax({
			url : '/smart/es/search',
			data : formData,
			dataType : 'json',
			type : 'post',
			success : function(data){
				console.log('h2');
				console.log(data[0].esCode);
				$.each(data, function(i, esList){
					$('#esContent').append(`
						<tr>
							<td>`+esList.esCode+`</td>
							<td>`+mmName+`</td>
							<td>`+esList.esStartDate+`</td>
							<td>`+esList.esEndDate+`</td>
							<td>`+esList.esCostSort+`</td>
							<td>`+esList.esNote+`</td>
						</tr>`);
				}); 
			}
		});
		$('#esTable').css('display','');
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
		<h2><span class="glyphicon glyphicon-search"> 근외 조회</span></h2>
	</center>
	<br/>
	
	<button type="button" class="btn btn-success btn-success btn-block">
		<span class="glyphicon glyphicon-search"></span>
		 검색하실 근외기간을 입력해주세요.
	</button>
	
	<form class="form-inline" id="esSearchForm">
		<div class="form-group">
			<label for="esStartDate">시작일:</label>
			<input type="date" class="form-control" id="esStartDate" name="esStartDate">
		</div>
		<div class="form-group">
			<label for="esEndDate">종료일:</label>
			<input type="date" class="form-control" id="esEndDate" name="esEndDate">
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
	<table class="table table-hover" id="esTable" style="display:none;">
		<thead>
			<tr>
				<th>코드</th>
				<th>사원이름</th>
				<th>시작일</th>
				<th>종료일</th>
				<th>비용</th>
				<th>분류</th>
			</tr>
		</thead>
		<tbody id="esContent">
			
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