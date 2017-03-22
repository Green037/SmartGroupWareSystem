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
	// 프로젝트 참여신청 이벤트
	$(document).on('click','#putInBtn',function(){
		$('#putInFor').modal();
		var prCode = $(this).parent().parent().children('#_prCode').val();
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
				/* console.log("h2 PrLIST Form!! Ajax");
				console.log(data); */
				$('#recuitPr').empty();
				$('#recuitPr').css('display','');
				$.each(data, function(i, result){
					$('#recuitPr').append(`
						<tr>
							<td>`+result.prCode+`</td>
							<td><a href="<c:url value='/pr/detail?prCode=`+result.prCode+`'/>">`+result.prName+`</a></td>
							<td>`+result.prMemberCode+`</td>
							<td>`+result.prProgress+`</td>
							<td>`+result.prCate+`</td>
							<td>`+result.prStartDay+`</td>
							<td>
								<button type="button" id="putInBtn">참여신청</button>
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
				/* console.log("h2 PrLIST Form!! Ajax");
				console.log(data); */
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
<div class="container">
	<p style="color:red;">프로젝트명을 클릭하면 상세보기 화면으로 연결됩니다!! </p>
	    
	<div class="row">
		<div id="ballMenuContainer">
			<div id="menuBall1" class="menuBall">
				<a href="#" id="recuitPrBtn" class="ball blueball">
					<div class="menuText">
						모집중
					</div>
				</a>
			</div>

			<div id="menuBall2" class="menuBall">
				<a href="#" id="runPrBtn" class="ball redball">
					<div class="menuText">
						진행중
					</div>
				</a>
			</div>

			<div id="menuBall3" class="menuBall">
				<a href="#" id="allPrBtn" class="ball greenball">
					<div class="menuText">
						전체목록
					</div>
				</a>
			</div>
		</div>
	</div>
   
   <!--  <div class="row">
		<div class="col-md-12">
			<button class="btn btn-primary orange-circle-button" id="recuitPrBtn">
				팀원모집중<br />목록보기<br /><span class="orange-circle-greater-than">Go!!</span>
			</button>
			<button class="btn btn-warning orange-circle-button" id="runPrBtn">
				진행중인<br />목록보기<br /><span class="orange-circle-greater-than">Go!!</span>
			</button>
			<button class="btn btn-success orange-circle-button" id="allPrBtn">
				전체<br />목록보기<br /><span class="orange-circle-greater-than">Go!!</span>
			</button>
		</div>   
	</div> -->
	      
	<%-- 기존 리스트 선택 버튼.
	<div class="btn-group btn-group-justified">
		<a href="<c:url value='/pr/list?prProgress=1'/>" class="btn btn-success">
			<span class="glyphicon glyphicon-search"></span> 팀원모집중목록보기
		</a>
		<a href="<c:url value='/pr/list?prProgress=2'/>" class="btn btn-success">
			<span class="glyphicon glyphicon-play"></span> 진행중인프로젝트목록보기
		</a>
		<a href="<c:url value='/pr/list?prProgress=3'/>" class="btn btn-success">
			<span class="glyphicon glyphicon-check"></span> 완료된프로젝트목록보기
		</a>
	</div> --%>
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
					<td>${projectList.prCode}</td>
					<td><a href="<c:url value='/pr/detail?prCode=${projectList.prCode}' />">${projectList.prName}</a></td>
					<td>${projectList.prMemberCode}</td>
					<td>${projectList.prProgress}</td>
					<td>${projectList.prCate}</td>
					<td>${projectList.prStartDay}</td>
					<c:choose>
						<c:when test="${projectList.prProgress eq '모집중'}">
							<td>
								<button type="button" id="putInBtn">참여신청</button>
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
<c:import url="./pm_addForm.jsp"></c:import> <!--팝업창, 참여신청폼  -->
<!-- 본문끝 -->
</div>				
</div>
</div>
</div>
		
<%@ include file="../footer.jsp"%>

</body>
</html>