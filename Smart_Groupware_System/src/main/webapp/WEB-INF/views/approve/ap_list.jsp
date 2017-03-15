<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<script>
	/* 최종승인 보고서 가져오는 page  */
	$(document).on('click','#putInBtn',function(){
		$('#putInFor').modal();
		var dftCode = $(this).parent().parent().children('#_dftCode').val();
		console.log(dftCode);
		$('#dftCode').val(dftCode);
	});
	
	/* 검색 페이지  */
	$(document).on('click','#searchBtn',function(){
		var formData = $('#apRequirement').serialize();
		$('#apContent').empty();
		
		$.ajax({
			url : '/smart/ap/searchDft',
			data : formData,
			dataType : 'json',
			type : 'post',
			success : function(data){
				console.log('test');
				console.log(data)
				originalContent.style.visibility="hidden";
				$.each(data, function(i,serachList){
					$('#apContent').append(`
							<tr>
								<td>`+serachList.dftCode+`</td>
								<td>`+serachList.dftTitle+`</td>
								<td>`+serachList.docFileGroup+`</td>
								<td>`+serachList.mmName+`</td>
								<td>`+serachList.pMmName+`</td>
								<td>`+serachList.dftDate+`</td>
								<td>`+serachList.proRealTime+`</td>
								<td>`+serachList.dftFinalState+`</td>
							</tr>
							`)
				})
			}
		})
	})
	
	
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
	
	<center>
		<h2><span class="glyphicon glyphicon-file"></span> 결재 목록</h2>
	</center>
	<hr/>
	<!-- 검색조건 -->
	<form class="form-inline" id="apRequirement">
		<div class="form-group">
			<label for="apGroup">분류</label>
			<select name="apGroup">
				<option>::분류::</option>
				<c:forEach var="docList" items="${docList}">
					<option value ="${docList.docFileGroup}">${docList.docFileGroup}</option>
				</c:forEach>
			</select>
		</div>
		<div class="form-group">
			<label for="apindex">차수</label>
			<select name="apProgress">
				<option>::차수::</option>
				<option value="1">1차</option>
				<option value="2">2차</option>
				<option value="3">3차</option>
			</select>
		</div>
		<div class="form-group">
			<label for="apSituation">진행상황</label>
			<select name="apProgress">
				<option>::진행상황::</option>
				<option value="0">대기</option>
				<option value="2">반려</option>
				<option value="1">완료</option>
			</select>
		</div>
		<div class="form-group">
			<label for="prStartDay">기안일:</label>
			<input type="date" class="form-control" id="apStartDay" name="apStartDay">
		</div>
		<div class="form-group">
			<label for="prEndDay">기안일:</label>
			<input type="date" class="form-control" id="apEndDay" name="apEndDay">
		</div>
		
		<button type="button" class="btn btn-primary" id="searchBtn">
			<span class="glyphicon glyphicon-search"></span>검색
		</button>
	</form>
	<hr/>

	<div class="btn-group btn-group-justified">
		<a href="<c:url value='/ap/list?apProgress=1'/>" class="btn btn-success">
			<span class="glyphicon glyphicon-search"></span> 결재 대기 목록
		</a>
		<a href="<c:url value='/ap/list?apProgress=2'/>" class="btn btn-success">
			<span class="glyphicon glyphicon-play"></span> 결재 반려 목록
		</a>
		<a href="<c:url value='/ap/list?apProgress=3'/>" class="btn btn-success">
			<span class="glyphicon glyphicon-check"></span> 결재 완료 목록
		</a>
	</div>
	
	<table class="table table-hover">
		<thead>
			<tr>
				<th>기안번호</th>
				<th>결재명</th>
				<th>기안분류</th>
				<th>기안자</th>
				<th>결재자</th>
				<th>기안등록일자</th>
				<th>최근결재일자</th>
				<th>결재진황현황</th>
				<th>출력</th>
				
			</tr>
		</thead>
		
		<tbody id="apContent">
		
		
		
		</tbody>
		
		
		<tbody id="originalContent" >
			<c:forEach var="pgList" items="${pgList}">
				<tr>
					<input type="hidden" id="dftCode" value="${pgList.dftCode}"/>
					<td>${pgList.dftCode}</td>
					<td><a href="<c:url value='/ap/Content?dftCode=${pgList.dftCode}' />">${pgList.dftTitle}</a></td>
					<td>${pgList.docFileGroup}</td>
					<td>${pgList.mmName}</td>
					<td>${pgList.pMmName}</td>
					<td>${pgList.dftDate}</td>
					<td>${pgList.proRealTime}</td>
					<td>${pgList.dftFinalState}</td>
					
					<c:choose>
							<c:when test="${pgList.dftFinalState eq '3차결재최종승인'}">
								<td>
									<button type="button" id="putInBtn">인쇄</button>
								</td>
							</c:when>
							<c:when test="${pgList.dftFinalState eq '2차결재최종승인'}">
								<td>
									<button type="button" id="putInBtn">인쇄</button>
								</td>
							</c:when>
							<c:when test="${pgList.dftFinalState eq '1차결재최종승인'}">
								<td>
									<button type="button" id="putInBtn">인쇄</button>
								</td>
							</c:when>
					
					</c:choose>
						
				</tr>
			</c:forEach>
		</tbody>
		
	
	</table>
</div>

 
<c:import url="./ap_comPrint.jsp"></c:import> <!--팝업창 --> 

<!-- 본문끝 -->
</div>				
</div>
</div>
</div>
		
<%@ include file="../footer.jsp"%>

</body>
</html>