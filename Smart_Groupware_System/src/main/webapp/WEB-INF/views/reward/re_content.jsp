<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
		<li class="active">고과기록정보조회(개인)</li>
	</ol>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
				<h3 class="panel-title">고과기록정보조회(개인)</h3>
				<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
				</div>
			<div class="panel-body">
				<form class="form-inline">
					<div class="form-group">
						<label class="control-label"><b>고과연월</b></label>&nbsp;
						<c:choose>
							<c:when test="${reward != null}">
								<input type="text" class="form-control" value="${reward.reDate}" placeholder="YYYY-MM-DD"/>
							</c:when>
							<c:otherwise>
								<input type="text" class="form-control" value="${rewardDate}"  readonly/>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="form-group">
						<label class="control-label"><b>고과종류</b></label>
						<input type="text" class="form-control" value="전체" readonly/>
					</div>
					<div class="form-group">
						<label class="control-label"><b>사원번호</b></label>
							<c:choose>
								<c:when test="${reward != null}">
									<input type="text" class="form-control" value="${reward.reCode}" readonly/>
								</c:when>
								<c:otherwise>
									<input type="text" class="form-control" value="${mmCode}" readonly/>
								</c:otherwise>
							</c:choose>
					</div>
					<div class="form-group">
						<label class="control-label"><b>사원명</b></label>
						<input type="text" class="form-control" value="${member.mmName}" readonly/>
					</div>
				</form>
				<div class="clearfix">&nbsp;</div>
				
				<div>
					<button type="button" class="btn btn-info btn-block">인사정보</button>
					<br/><br/>
				</div>
				
				<table class="table table-bordered">
					<tr>
						<th>사원번호</th>
						<td>${member.mmCode}</td>
						<th>성명</th>
						<td>${member.mmName}</td>
						<th>주민번호</th>
						<td>900101-2******</td>
					</tr>
					<tr>
						<th>부서</th>
						<td>${dpName}</td>
						<th>직급</th>
						<td>${ptName}</td>
						<th>재직상태</th>
						<td>재직</td>
					</tr>
				</table> 
				<div class="clearfix">&nbsp;</div>
				
				<div>
					<button type="button" class="btn btn-info btn-block">고과내역</button>
					<br/><br/>
				</div>
				
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>순번</th>
							<th>고과번호</th>
							<th>고과내역</th>
							<th>평가등급</th>
							<th>평가날짜</th>
							<th>고과서류첨부</th>
							<th>담당사원명</th>
						</tr>
					</thead>
					<tbody>
					
						<c:if test="${reward != null}">
							<!-- 지급내역 금액만큼 선택하여 tr 늘어나게 하기 -->
							<tr>
								<td>1</td>
								<td>${reward.reCode}</td>
								<td>프로젝트 완료</td>
								<td>${reward.reGrade}</td>
								<td>${reward.reDate}</td>
								<td><a href="<c:url value='/re/fileDownload?reCode=${reward.reCode}'/>">
									${reward.reDocument}</a>
								</td>
								<td>${reward.reMmCode}</td>
							</tr>
						</c:if>
					</tbody>
				</table>
				<div class="clearfix">&nbsp;</div>
				
				<div>
					<button type="button" class="btn btn-info btn-block">고과산정(총 ${rewardCount} 건)</button>
					<br/><br/>
				</div>
				
				<table class="table table-bordered">
					<tr>
						<th>성과금액</th>
						<c:choose>
							<c:when test="${incentive != null}">
								<td><fmt:formatNumber value="${incentive.inBonus}" pattern="#,###"/></td>
							</c:when>
							<c:otherwise>
								<td>0 원</td>
							</c:otherwise>
						</c:choose>
					</tr>
				</table>
				<div class="clearfix">&nbsp;</div>
			</div>
		</div>
	</div>
</div>
	
</body>
</html>