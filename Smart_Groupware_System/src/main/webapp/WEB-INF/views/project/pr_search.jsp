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
				var $this = $('.panel-heading span.clickable');
				$this.parents('.panel').find('.panel-body').slideUp();
				$this.addClass('panel-collapsed');
				$this.find('i').removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
			}
		});
		$('#prTable').css('display','');
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
		<li class="active">근태조회(개인)</li>
	</ol>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-info">
				<div class="panel-heading">
				<h3 class="panel-title">프로젝트검색</h3>
				<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
				</div>
			<div class="panel-body">
				<form class="form-inline" id="prRequirement">
					<div class="form-group">
						<label for="prSize">프로젝트규모</label>
						<select name="prSize" class="form-control">
							<option>::선택::</option>
							<option value="소">소</option>
							<option value="중">중</option>
							<option value="고">대</option>
						</select>
					</div>
					<div class="form-group">
						<label for="pwd">모집상황:</label>
						<select name="prProgress" class="form-control">
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
					<div class="form-group">
						<button type="button" class="btn-primary btn-lg" id="searchBtn">
							<span class="glyphicon glyphicon-search"></span>검색
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>

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

<!-- 본문끝 -->

</body>
</html>