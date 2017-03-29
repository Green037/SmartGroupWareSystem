<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<link href="<c:url value='/resources/css/evAdd.css'/>" rel="stylesheet" type="text/css"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
	<link href="<c:url value='/resources/css/panelSearch.css'/>" rel="stylesheet">
	<link href="<c:url value='/resources/css/panel.css'/>" rel="stylesheet">
	
	<script>
	// 프로젝트 참여신청 이벤트
	$(document).on('click','#putInBtn',function(){
		$('#putInFor').modal();
		var prCode = $(this).parent().parent().children('#1').text();
		console.log($(this).parent().parent().children('#1'));
		console.log(prCode);
		var mmCode = ${mmCode}; //로그인된 세션의 사원코드를 변수에 담는다
		/* console.log(mmCode);
		console.log(prCode); */
		$('#prCode').val(prCode);
		$('#mmCode').val(mmCode);
	});
	
	// 프로젝트 참여인원 팝업창에서 신청시 submit이벤트
	$(document).on('click','#approvalBtn',function(){
		
		$('#approvalForm').attr({action:"<c:url value='/pr/addPm'/>", method:"post"}).submit();
	});
	
	// 모집중 프로젝트 목록조회 이벤트
	$(document).on('click','#recuitPrBtn',function(){
		$('#showAll').css('display','none');
		$('#showRun').css('display','none');
		$.ajax({
			url : '/smart/pr/list',
			data : {'prProgress':1},
			dataType : 'json',
			type : 'POST',
			success : function(data){
				console.log("h2 PrLIST Form!! Ajax");
				console.log(data); 
				$('#recuitPr').empty();
				$('#recuitPr').css('display','');
				$.each(data, function(i, result){
					$('#recuitPr').append(`
						<tr>
							<td id="1">`+result.prCode+`</td>
							<td><a href="<c:url value='/pr/detail?prCode=`+result.prCode+`'/>">`+result.prName+`</a></td>
							<td>`+result.prMemberCode+`</td>
							<td>`+result.prProgress+`</td>
							<td>`+result.prCate+`</td>
							<td>`+result.prStartDay+`</td>
							<td>
								<button type="button" id="putInBtn" class="btn-info">참여신청</button>
							</td>
						</tr>`);
				});
			}
		});
	});
	
	//진행중 프로젝트 목록조회 이벤트
	$(document).on('click','#runPrBtn',function(){
		$('#showAll').css('display','none');
		$('#recuitPr').css('display','none');
		$.ajax({
			url : '/smart/pr/list',
			data : {'prProgress':2},
			dataType : 'json',
			type : 'POST',
			success : function(data){
				console.log("h2 PrLIST Form!! Ajax");
				console.log(data); 
				$('#showRun').empty();
				$('#showRun').css('display','');
				$.each(data, function(i, result){
					$('#showRun').append(`
						<tr>
							<td>`+result.prCode+`</td>
							<td><a href="<c:url value='/pr/detail?prCode=`+result.prCode+`'/>">`+result.prName+`</a></td>
							<td>`+result.prMemberCode+`</td>
							<td>`+result.prProgress+`</td>
							<td>`+result.prCate+`</td>
							<td>`+result.prStartDay+`</td>
							<td>-</td>
						</tr>`);
				});
			}
		});
	});
	
	//전체목록보기 이벤트
	$(document).on('click','#allPrBtn',function(){
		$('#recuitPr').css('display','none');
		$('#showRun').css('display','none');
		$('#showAll').css('display','');
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
		<li class="active">프로젝트목록</li>
	</ol>
</div>	

<div class="container">
	<div class="page-header">
		<p style="color:red;"> *프로젝트명을 클릭하면 상세보기 화면으로 연결됩니다!! </p>
	</div>
	<div class="col-md-12">
		<div class="panel with-nav-tabs panel-primary">
			<div class="panel-heading">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#tab1primary" data-toggle="tab" id="allPrBtn">전체목록</a></li>
					<li><a href="#" id="recuitPrBtn">인원모집중목록</a></li>
					<li><a href="#" id="runPrBtn">진행중 목록</a></li>
				</ul>
			</div>
			<div class="panel-body">
				<div class="tab-content">
					<div class="tab-pane fade in active" id="tab1primary">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>코드</th>
									<th>프로젝트명</th>
									<th>팀장</th>
									<th>인원모집상황</th>
									<th>분류</th>
									<th>시작일</th>
									<th>#</th>
									
								</tr>
							</thead>
							<tbody id="showAll">
								<c:forEach var="projectList" items="${projectList}">
									<tr>
										<input type="hidden" id="_prCode" value="${projectList.prCode}"/>
										<td id="1">${projectList.prCode}</td>
										<td><a href="<c:url value='/pr/detail?prCode=${projectList.prCode}' />">${projectList.prName}</a></td>
										<td>${projectList.prMemberCode}</td>
										<td>${projectList.prProgress}</td>
										<td>${projectList.prCate}</td>
										<td>${projectList.prStartDay}</td>
										<c:choose>
											<c:when test="${projectList.prProgress eq '모집중'}">
												<td>
													<button type="button" id="putInBtn" class="btn-info">참여신청</button>
												</td>
											</c:when>
											<c:when test="${projectList.prProgress eq '모집완료'}">
												<td>-</td>
											</c:when>
										</c:choose>
									</tr>
								</c:forEach>
							</tbody>
							<tbody id="showRun" style="display:none;">
							
							</tbody>
							<tbody id="recuitPr" style="display:none;">
							
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url="./pm_addForm.jsp"></c:import> <!--팝업창, 참여신청폼  -->
<!-- 본문끝 -->
<script src="<c:url value='/resources/js/bootstrap.min.js'/>" type="text/javascript"></script> 		
</body>
</html>