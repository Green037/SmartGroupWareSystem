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
	
	$(document).ready(function(){
		$('#mainMenu').css('display','none');
		$('#commute').css('display','');
	})
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
<!--본문시작 : 윤재호  -->			
<div class="sub-heard-part">
	<ol class="breadcrumb m-b-0">
		<li><a href="<c:url value='/main/mainIndex'/>">Home</a></li>
		<li class="active">근외일정검색(개인)</li>
	</ol>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-info">
				<div class="panel-heading">
				<h3 class="panel-title">근외일정검색(개인)</h3>
				<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
				</div>
			<div class="panel-body">
				<form class="form-inline" id="esSearchForm">
					<div class="form-group">
						<label for="esStartDate">시작일:</label>
						<input type="date" class="form-control" id="esStartDate" name="esStartDate">
					</div>
					<div class="form-group">
						<label for="esEndDate">종료일:</label>
						<input type="date" class="form-control" id="esEndDate" name="esEndDate">
					</div>
					
					<button type="button" class="btn-primary btn-lg" id="searchBtn">
						<span class="glyphicon glyphicon-search"></span>검색
					</button>
				</form>
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
<!-- 본문 -->
<%-- <div class="forms-main">
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
	</table> --%>
	
<!-- 본문끝 -->
<script src="<c:url value='/resources/js/bootstrap.min.js'/>" type="text/javascript"></script> 
</body>
</html>