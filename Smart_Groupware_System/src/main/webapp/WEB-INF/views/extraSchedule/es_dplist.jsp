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
		//입력값 유효성겁사 - 사원명 제외 null인정안함.
		//var startDay = $('#esStartDate').val();
		var dpCode = $('#dpCode').val();
		/* console.log(dpCode); */
		if($('#esStartDate').val() == null || $('#esStartDate').val() == ''){
			alert('시작일을 입력하세요');
			return;
		}else if($('#esEndDate').val() == null || $('#esEndDate').val() == ''){
			alert('종료일을 입력하세요');
			return;
		}else if($('#dpCode').val() == ':부서선택:'){
			alert('부서를 선택하세요');
			return;
		}
				
		//입력값으로 근태 조회해오기
		var formData = $('#esSearchForm').serialize();
		$('#esContent').empty();
		$.ajax({
			url : '/smart/es/searchAll',
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
							<td>`+esList.mmName+`</td>
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
	
	//사원 포커스 이벤트
	$(document).on('focus','#mmCode',function(){
		var dpCode = $('#dpCode').val();
		$('#mmCode').empty();
		$.ajax({
			url : '/smart/es/searchMm',
			data : {'dpCode':dpCode},
			dataType : 'json',
			type : 'post',
			success : function(data){
				/* console.log('h2 ajax Form searchMm');
				console.log(data[0].mmName); */
				$.each(data, function(i, mmList){
					$('#mmCode').append('<option value="+mmList.mmCode+">'+mmList.mmName+'</option>')
				});
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
<!-- 본문 -->
<div class="forms-main">
<div class="graph-form">
<div class="validation-form">
<div class="container">
	<center>
		<h2><span class="glyphicon glyphicon-search"> 부서 근외조회</span></h2>
	</center>
	<br/>
	
	<button type="button" class="btn btn-success btn-success btn-block">
		<span class="glyphicon glyphicon-search"></span>
		 근외이력을 검색하실 기간과 부서를 입력해주세요.
	</button>
	
	<form id="esSearchForm">
		<table class="table table-hover">
			<tr>
				<td>시작일</td>
				<td><input type="date"  id="esStartDate" name="esStartDate" class="form-control"></td>
				<td>종료일</td>
				<td><input type="date"  id="esEndDate" name="esEndDate" class="form-control"></td>
			</tr>
			<tr>
				<td>부서</td>
				<td>
					<select name="dpCode" id="dpCode" class="form-control1">
						<option>:부서선택:</option>
						<c:forEach var="dpList" items="${dpList}">
							<option value="${dpList.dpCode}">${dpList.dpName}</option>
						</c:forEach>
					</select>
				</td>
				<td>사원</td>
				<td>
					<select name="mmCode" id="mmCode" class="form-control1">
						
					</select>
				</td>
			</tr>
		</table>
		<button type="button" class="btn btn-primary" id="searchBtn">
			<span class="glyphicon glyphicon-search"></span>검색
		</button>
	</form>
	<br/>
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