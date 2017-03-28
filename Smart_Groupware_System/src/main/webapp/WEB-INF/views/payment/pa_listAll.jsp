<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<link href="<c:url value='/resources/css/panelSearch.css'/>" rel="stylesheet">
	<script type="text/javascript" src="<c:url value='/resources/js/script.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/search.js'/>"></script>

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
<body onload="initSelectOptionRadio(${paging.recordsPerPage}, '${sortItem}', '${sortMethod}');">
<div class="sub-heard-part">
	<ol class="breadcrumb m-b-0">
		<li><a href="<c:url value='/main/mainIndex'/>">Home</a></li>
		<li class="active">총급여목록(총무부)</li>
	</ol>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
				<h3 class="panel-title">총급여목록(총무부)</h3>
				<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
				</div>
			<div class="panel-body">
				<table width="100%">
					<tr>
						<td>
							<select id="select_count">
								<option value=3>3개씩 보기</option>
								<option value=5>5개씩 보기</option>
								<option value=10>10개씩 보기</option>
								<option value=20>20개씩 보기</option>
								<option value=50>50개씩 보기</option>
							</select>
						</td>
					</tr>
				</table>
				<div class="clearfix">&nbsp;</div>
				
				<table class="table table-bordered">
					<tr>
						<th>순번</th>
						<th>급여코드</th>
						<th>사원코드</th>
						<th>일급</th>
						<th>성과급</th>
						<th>기본급</th>
						<th>실급여</th>
						<th>산정일</th>
						<th>지급일</th>
						<th>지급여부</th>
						<th>담당사원</th>
					</tr>
					
					<c:forEach var="paymentView" items="${paList}" varStatus="status">
						<tr>
							<td>${status.count}</td>
							<td><a href="<c:url value='/pc/mmContent?pcCode=${paymentView.pcCode}'/>">${paymentView.pcCode}</a></td>
							<td>${paymentView.mmCode}</td>
							<td><fmt:formatNumber value="${paymentView.mmDailyPay}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${paymentView.paIncentive}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${paymentView.paSalary}" pattern="#,###"/></td>
							<td><fmt:formatNumber value="${paymentView.paSumSalary}" pattern="#,###"/></td>
							<td>${paymentView.paCalculateDate}</td>
							<td>${paymentView.paDate}</td>
							<td>${paymentView.paPossible}</td>
							<td>${paymentView.paMmCode}</td>
						</tr>
					</c:forEach>
				</table>
				
				<!-- Paging -->
				<table border=0 width=100%>
					<tr>
						<td align='right'>
							<jsp:include page="<c:url value='smart/paging'/>" flush="true">
								<jsp:param name="recordsPerPage" value="${paging.recordsPerPage}" />
								<jsp:param name="sortItem" value="${sortItem}" />
								<jsp:param name="sortMethod" value="${sortMethod}" />
								<jsp:param name="cri" value="${cri}" />
								
							    <jsp:param name="firstPageNo" value="${paging.firstPageNo}" />
							    <jsp:param name="prevPageNo" value="${paging.prevPageNo}" />
							    <jsp:param name="startPageNo" value="${paging.startPageNo}" />
							    <jsp:param name="currentPageNo" value="${paging.currentPageNo}" />
							    <jsp:param name="endPageNo" value="${paging.endPageNo}" />
							    <jsp:param name="nextPageNo" value="${paging.nextPageNo}" />
							    <jsp:param name="finalPageNo" value="${paging.finalPageNo}" />
							</jsp:include>
						</td>
					</tr>
				</table>
				
				<div class="clearfix">&nbsp;</div>		
								
				<div align="center">
					<form method="post" name="search" class="form-inline">
						<div class="form-group">
							<select name="keyfield" class="form-control">
								<option>-옵션 선택-</option>
								<option value="paCode"
									<c:out value="${cri.keyfield eq 'paCode' ? 'selected' : ''}"/>>
									급여코드
								</option>
								<option value="mmDailyPay"
									<c:out value="${cri.keyfield eq 'mmDailyPay' ? 'selected' : ''}"/>>
									일급
								</option>
								<option value="inAmount"
									<c:out value="${cri.keyfield eq 'inAmount' ? 'selected' : ''}"/>>
									성과급
								</option>
								<option value="mmCode"
									<c:out value="${cri.keyfield eq 'mmCode' ? 'selected' : ''}"/>>
									사원코드
								</option>
								<option value="pcDate"
									<c:out value="${cri.keyfield eq 'pcDate' ? 'selected' : ''}"/>>
									급여지급일
								</option>
								<option value="paMmCode"
									<c:out value="${cri.keyfield eq 'paDate' ? 'selected' : ''}"/>>
									담당사원코드
								</option>
							</select>
						</div>
						<div class="form-group">
							<input type="radio" name="compare" value="equals"
								<c:out value="${(cri.compare eq null) || (cri.compare eq 'equals') ? 'checked' : ''}" />>같음
							<input type="radio" name="compare" value="contains"
								<c:out value="${cri.compare eq 'contains' ? 'checked' : ''}" />>포함
						</div>										
						<div class="form-group">
							<input type="text" name="keyword" value="${cri.keyword}" class="form-control"
								onkeydown = "if (event.keyCode == 13) document.getElementById('btnSearch').click()">
						</div>
						<div class="form-group">
							<input type="button" id="btnSearch" value="검색" class="btn-success btn-lg" onclick="searchCheck(form)"/>
						</div>
					</form>
				</div>
				<div class="clearfix">&nbsp;</div>	
			</div>
		</div>
	</div>
</div>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
</body>
</html>