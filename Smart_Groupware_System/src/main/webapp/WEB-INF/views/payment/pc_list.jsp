<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
		<li class="active">연급여내역조회(개인)</li>
	</ol>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
				<h3 class="panel-title">연간급여내역조회(개인)</h3>
				<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
				</div>
			<div class="panel-body">
				<form class="form-inline">
					<div class="form-group">
						<label class="control-label"><b>연도</b></label>&nbsp;
						<!-- 에러가 있으면 날짜 선택 메세지 말고 에러를 출력 -->
						<!-- 날짜 default : 오늘 / 받기는 날짜를 받지만 자바 코드로 년+월만 추출 -->
						<span style="color:red; font-size:10pt">연도를 입력하세요.</span>
						<input type="text" class="form-control" value="${pcYear}" placeholder="YYYY">
					</div>
					<div class="form-group">
						<label class="control-label"><b>소속</b></label>
						<input type="text" class="form-control" value="${dpName}" readonly>
					</div>
					<div class="form-group">
						<label class="control-label"><b>사원번호</b></label>
						<input type="text" class="form-control" value="${member.mmCode}" readonly>
					</div>
					<div class="form-group">
						<label class="control-label"><b>사원명</b></label>
						<input type="text" class="form-control" value="${member.mmName}" readonly>
					</div>
				</form>
				<div class="clearfix">&nbsp;</div>
				
				<div>
					<button type="button" class="btn btn-info btn-block">지급항목</button>
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
						<td>본봉</td>
						<c:choose>
							<c:when test="${payList != null}">
								<c:forEach var="payList" items="${payList}">
									<td><fmt:formatNumber value="${payList.mmDailyPay}" pattern="#,###"/></td>
								</c:forEach>
								<c:forEach begin="${fn:length(payList) + 1}" end="12">
									<td>0</td>
								</c:forEach>
							</c:when>
							<c:when test="${payList == null}">
								<c:forEach begin="1" end="12">
									<td>0</td>
								</c:forEach>
							</c:when>
						</c:choose>
						<td>1,000,000</td>
					</tr>
					<tr>
						<td>2</td>
						<td>성과금</td>
						<c:choose>
							<c:when test="${payList != null}">
								<c:forEach var="payList" items="${payList}">
									<td><fmt:formatNumber value="${payList.inAmount}" pattern="#,###"/></td>
								</c:forEach>
								<c:forEach begin="${fn:length(payList) + 1}" end="12">
									<td>0</td>
								</c:forEach>
							</c:when>
							<c:when test="${payList == null}">
								<c:forEach begin="1" end="12">
									<td>0</td>
								</c:forEach>
							</c:when>
						</c:choose>
						<td>1,000,000</td>
					</tr>
					<tr>
						<th colspan="2">계</th>
						<c:choose>
							<c:when test="${payList != null}">
								<c:forEach var="payList" items="${payList}">
									<td><fmt:formatNumber value="${payList.mmDailyPay + payList.inAmount}" pattern="#,###"/></td>
								</c:forEach>
								<c:forEach begin="${fn:length(payList) + 1}" end="12">
									<td>0</td>
								</c:forEach>
							</c:when>
							<c:when test="${payList == null}">
								<c:forEach begin="1" end="12">
									<td>0</td>
								</c:forEach>
							</c:when>
						</c:choose>
						<td>100,000</td>
					</tr>
				</table> 
				<div class="clearfix">&nbsp;</div>
				
				<div>
					<button type="button" class="btn btn-info btn-block">공제항목</button>
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
						<td>고용보험</td>
						<c:choose>
							<c:when test="${payList != null}">
								<c:forEach var="payList" items="${payList}">
									<td><fmt:formatNumber value="${payList.eiAmount}" pattern="#,###"/></td>
								</c:forEach>
								<c:forEach begin="${fn:length(payList) + 1}" end="12">
									<td>0</td>
								</c:forEach>
							</c:when>
							<c:when test="${payList == null}">
								<c:forEach begin="1" end="12">
									<td>0</td>
								</c:forEach>
							</c:when>
						</c:choose>
						<td>1,000,000</td>
					</tr>
					<tr>
						<td>2</td>
						<td>국민건강보험</td>
						<c:choose>
							<c:when test="${payList != null}">
								<c:forEach var="payList" items="${payList}">
									<td><fmt:formatNumber value="${payList.nhiAmount}" pattern="#,###"/></td>
								</c:forEach>
								<c:forEach begin="${fn:length(payList) + 1}" end="12">
									<td>0</td>
								</c:forEach>
							</c:when>
							<c:when test="${payList == null}">
								<c:forEach begin="1" end="12">
									<td>0</td>
								</c:forEach>
							</c:when>
						</c:choose>
						<td>1,000,000</td>
					</tr>
					<tr>
						<td>3</td>
						<td>산재보험</td>
						<c:choose>
							<c:when test="${payList != null}">
								<c:forEach var="payList" items="${payList}">
									<td><fmt:formatNumber value="${payList.ohiAmount}" pattern="#,###"/></td>
								</c:forEach>
								<c:forEach begin="${fn:length(payList) + 1}" end="12">
									<td>0</td>
								</c:forEach>
							</c:when>
							<c:when test="${payList == null}">
								<c:forEach begin="1" end="12">
									<td>0</td>
								</c:forEach>
							</c:when>
						</c:choose>
						<td>1,000,000</td>
					</tr>
					<tr>
						<td>4</td>
						<td>연금보험</td>
						<c:choose>
							<c:when test="${payList != null}">
								<c:forEach var="payList" items="${payList}">
									<td><fmt:formatNumber value="${payList.ppAmount}" pattern="#,###"/></td>
								</c:forEach>
								<c:forEach begin="${fn:length(payList) + 1}" end="12">
									<td>0</td>
								</c:forEach>
							</c:when>
							<c:when test="${payList == null}">
								<c:forEach begin="1" end="12">
									<td>0</td>
								</c:forEach>
							</c:when>
						</c:choose>
						<td>1,000,000</td>
					</tr>
					<tr>
						<th colspan="2">계</th>
						<c:choose>
							<c:when test="${payList != null}">
								<c:forEach var="payList" items="${payList}">
									<td><fmt:formatNumber value="${payList.eiAmount + payList.nhiAmount + payList.ohiAmount + payList.ppAmount}" pattern="#,###"/></td>
								</c:forEach>
								<c:forEach begin="${fn:length(payList) + 1}" end="12">
									<td>0</td>
								</c:forEach>
							</c:when>
							<c:when test="${payList == null}">
								<c:forEach begin="1" end="12">
									<td>0</td>
								</c:forEach>
							</c:when>
						</c:choose>
						<td>100,000</td>
					</tr>
				</table> 
				<div class="clearfix">&nbsp;</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>