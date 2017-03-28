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
				var $this = $('.panel-heading span.clickable');
				$this.parents('.panel').find('.panel-body').slideUp();
				$this.addClass('panel-collapsed');
				$this.find('i').removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
			}
		});
		$('#cmTable').css('display','');
	});
	
	$(document).ready(function(){
		$('#mainMenu').css('display','none');
		$('#commute').css('display','');
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
		<li class="active">근태조회(개인)</li>
	</ol>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-info">
				<div class="panel-heading">
				<h3 class="panel-title">출퇴근 이력을 검색하실 기간을 입력해 주세요.</h3>
				<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
				</div>
			<div class="panel-body">
				<form class="form-inline" id="cmSearchForm">
					<div class="form-group">
						<label for="cmStartDay">시작일:</label>
						<input type="date" class="form-control" id="cmStartDay" name="cmStartDay">
					</div>
					<div class="form-group">
						<label for="cmEndDay">종료일:</label>
						<input type="date" class="form-control" id="cmEndDay" name="cmEndDay">
					</div>
					<div class="form-group">
						<button type="button" id="searchBtn">
							<span class="glyphicon glyphicon-search"></span>검색
						</button>
					</div>
				</form>
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


</body>
</html>