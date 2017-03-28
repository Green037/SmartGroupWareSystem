<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<link href="<c:url value='/resources/css/panelSearch.css'/>" rel="stylesheet">

	<script>
	$(document).ready(function(){
		$('#mainMenu').css('display','none');
		$('#payment').css('display','');
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
		<li class="active">연간고과내역조회(개인)</li>
	</ol>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
				<h3 class="panel-title">연간고과내역조회(개인)</h3>
				<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
				</div>
			<div class="panel-body">
				<form class="form-inline">
					<div class="form-group">
						<label class="control-label"><b>연도</b></label>&nbsp;
						<!-- 에러가 있으면 날짜 선택 메세지 말고 에러를 출력 -->
						<!-- 날짜 default : 오늘 / 받기는 날짜를 받지만 자바 코드로 년+월만 추출 -->
						<span style="color:red; font-size:10pt">연도를 입력하세요.</span>
						<input type="text" class="form-control" value="2017" placeholder="YYYY">
					</div>
					<div class="form-group">
						<label class="control-label"><b>소속</b></label>
						<input type="text" class="form-control" value="${dpName}" readonly/>
					</div>
					<div class="form-group">
						<label class="control-label"><b>사원번호</b></label>
						<input type="text" class="form-control" value="${mmCode}" readonly/>
					</div>
					<div class="form-group">
						<label class="control-label"><b>사원명</b></label>
						<input type="text" class="form-control" value="${member.mmName}" readonly/>
					</div>
				</form>
				<div class="clearfix">&nbsp;</div>
	
				<div>
					<button type="button" class="btn btn-info btn-block">고과항목 [건수 : ${rewardCount} 건]</button>
					<br/><br/>
				</div>
				<table class="table table-bordered">
					<tr>
						<th>순번</th>
						<th>항목</th>
						<th>1월</th>
						<th>2월</th>
						<th>3월</th>
						<th>4월</th>
						<th>5월</th>
						<th>6월</th>
						<th>7월</th>
						<th>8월</th>
						<th>9월</th>
						<th>10월</th>
						<th>11월</th>
						<th>12월</th>
						<th>계</th>
					</tr>
					<tr>
						<td>1</td>
						<td>프로젝트</td>
						<td>1</td>
						<td>1</td>
						<td>2</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<td>2</td>
						<td>이력</td>
						<td>1</td>
						<td>1</td>
						<td>2</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
						<td>1</td>
					</tr>
					<tr>
						<th colspan="2">고과 계</th>
						<td>1</td>
						<td>1</td>
						<td>2</td>
						<td>3</td>
						<td>3</td>
						<td>2</td>
						<td>3</td>
						<td>3</td>
						<td>2</td>
						<td>2</td>
						<td>2</td>
						<td>2</td>
						<td>10</td>
					</tr>
				</table> 
			</div>
		</div>
	</div>
</div>	

</body>
</html>