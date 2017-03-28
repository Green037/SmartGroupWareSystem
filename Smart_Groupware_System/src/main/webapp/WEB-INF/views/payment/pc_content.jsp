<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<li class="active">월급여조회(개인)</li>
	</ol>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
				<h3 class="panel-title">월급여조회(개인)</h3>
				<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
				</div>
			<div class="panel-body">
				<form class="form-inline">
					<div class="form-group">
						<label class="control-label"><b>급여연월</b></label>&nbsp;
						<input type="text"  value="${payDate}" class="form-control" placeholder="YYYY-MM-DD">
					</div>
					<div class="form-group">
						<label class="control-label"><b>급여종류</b></label>
						<input type="text" class="form-control" value="전체" readonly>
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
					<button type="button" class="btn btn-info btn-block">인사정보</button>
					<br/><br/>
				</div>
				<table class="table table-bordered">
					<tr>
						<th>사원번호</th>
						<td>${member.mmCode}</td>
						<th>성명</th>
						<td>${member.mmName}</td>
						<th>이메일</th>
						<td>${member.mmEmail}</td>
					</tr>
					<tr>
						<th>부서</th>
						<td>${dpName}</td>
						<th>직급</th>
						<td>${ptName}</td>
						<th>재직상태</th>
						<td>재직</td>
					</tr>
					<tr>
						<th>본사입사일</th>
						<td>${member.mmJoinDate}</td>
						<th>급여계좌</th>
						<td>${member.mmBank}</td>
						<th>급여계좌번호</th>
						<td>${member.mmAccount}</td>
					</tr>
				</table> 
				<div class="clearfix">&nbsp;</div>
				
				<div>
					<button type="button" class="btn btn-info btn-block">지급내역</button>
					<br/><br/>
				</div>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>순번</th>
							<th>급여항목</th>
							<th>급여일자</th>
							<th>금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>본봉</td>
							<td>${pcList.pcDate}</td>
							<td><fmt:formatNumber value="${pcList.mmDailyPay}" pattern="#,###"/></td>
						</tr>
						<tr>
							<td>2</td>
							<td>성과금</td>
							<td>${pcList.pcDate}</td>
							<td><fmt:formatNumber value="${pcList.inAmount}" pattern="#,###"/></td>
						</tr>
					</tbody>
				</table>
				
				<div>
					<button type="button" class="btn btn-info btn-block">공제내역</button>
					<br/><br/>
				</div>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>순번</th>
							<th>급여항목</th>
							<th>기준연도</th>
							<th>금액</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>1</td>
							<td>고용보험</td>
							<td>${payYear}</td>
							<td align="right"><fmt:formatNumber value="${pcList.eiAmount}" pattern="#,###"/></td>
						</tr>
						<tr>
							<td>2</td>
							<td>국민건강보험</td>
							<td>${payYear}</td>
							<td align="right"><fmt:formatNumber value="${pcList.nhiAmount}" pattern="#,###"/></td>
						</tr>
						<tr>
							<td>3</td>
							<td>산재보험 [연구및개발]</td>
							<td>${payYear}</td>
							<td align="right"><fmt:formatNumber value="${pcList.ohiAmount}" pattern="#,###"/></td>
						</tr>
						<tr>
							<td>4</td>
							<td>연금보험</td>
							<td>${payYear}</td>
							<td align="right"><fmt:formatNumber value="${pcList.ppAmount}" pattern="#,###"/></td>
						</tr>
					</tbody>
				</table> 
				<div class="clearfix">&nbsp;</div>
	
				<div>
					<button type="button" class="btn btn-info btn-block">지급금액</button>
					<br/><br/>
				</div>
				<table class="table table-bordered">
					<tr>
						<th>총지급액 (총 <b>2</b> 건)</th>
						<td align="right"><fmt:formatNumber value="${pcList.mmDailyPay + pcList.inAmount}" pattern="#,###"/></td>
						<th>공제액 (총 <b>4</b> 건)</th>
						<td align="right"><fmt:formatNumber value="${pcList.eiAmount + pcList.nhiAmount + pcList.ppAmount}" pattern="#,###"/></td>
						<th>실수령액</th>
						<td><fmt:formatNumber value="${(pcList.mmDailyPay + pcList.inAmount) - (pcList.eiAmount + pcList.nhiAmount + pcList.ppAmount)}" pattern="#,###"/></td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</div>
	
</body>
</html>