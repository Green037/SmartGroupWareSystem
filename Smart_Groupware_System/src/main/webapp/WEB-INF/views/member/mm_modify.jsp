<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
<link href="<c:url value='/resources/css/panelSearch.css'/>" rel="stylesheet">

<script>
	$(document).ready(function(){
		$('#mainMenu').css('display','none');
		$('#member').css('display','');
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
		};
	});
</script>
</head> 
<body>
<c:import url="../mainIndex.jsp"></c:import>
<!--본문시작 : 윤재호  -->			
<div class="sub-heard-part">
	<ol class="breadcrumb m-b-0">
		<li><a href="<c:url value='/main/mainIndex'/>">Home</a></li>
		<li class="active">사원정보수정</li>
	</ol>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">사원정보 수정</h3>
					<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
				</div>
			<div class="panel-body">
				<form action="<c:url value='/member/mm_modify'/>" method="POST" >
					<div class="col-md-2 form-group">
						<label class="control-label"><b>사원번호</b></label>&nbsp;
						<input type="text" class="form-control ng-invalid ng-invalid-required" value="${memberContent.mmCode}" id="mmCode" name="mmCode"  readonly>
					</div>
					<div class="col-md-2 form-group form-last">
						<label class="control-label"><b>사원이름</b></label>
						<input type="text" class="form-control ng-invalid ng-invalid-required" value="${memberContent.mmName}" id="mmName" name="mmName" readonly>
					</div>
					<div class="col-md-2 form-group form-last">
						<label class="control-label"><b>소속부서</b></label>
						<input type="text" class="form-control ng-invalid ng-invalid-required" value="${memberContent.dpName}"  id="dpName" name="dpName" readonly>
					</div>
					<div class="col-md-2 form-group form-last">
						<label class="control-label"><b>직급</b></label>
						<input type="text" class="form-control ng-invalid ng-invalid-required" value="${memberContent.ptName}"  id="ptName" name="ptName" readonly>
					</div>
					<div class="col-md-2 form-group form-last">
						<label class="control-label"><b>계약형태</b></label>
						<input type="text" class="form-control ng-invalid ng-invalid-required" value="${memberContent.ctType}"  id="ctType" name="ctType" readonly>
					</div>
			
					<div class="clearfix">&nbsp;</div>
			
					<label class="control-label"><b>인사정보</b></label>
					<table class="table table-bordered">
						<tr>
							<th>입사일</th>
							<th>계약종료일</th>
							<th>일급</th>
							<th>군대여부</th>
							<th>결혼여부</th>
							<th>남은연차</th>
						</tr>
						<tr>
							<td>${memberContent.mmJoinDate}</td>
							<td>${memberContent.mmResignDate}</td>
							<td>${memberContent.mmDailyPay}</td>
							<c:choose>
								<c:when test="${memberContent.mmArmy eq 0}">
									<td>미필</td>
								</c:when>
								<c:when test="${memberContent.mmArmy ne 0}">
									<td>군필</td>
								</c:when>
							</c:choose>
							<c:choose>
								<c:when test="${memberContent.mmMarriage eq 0}">
									<td>미혼</td>
								</c:when>
								<c:when test="${memberContent.mmArmy ne 0}">
									<td>기혼</td>
								</c:when>
							</c:choose>
							<td>${memberContent.mmAnnualLeave}</td>
						</tr>
						<tr>
							<th>이메일주소</th>
							<th>집주소</th>
							<th>연락처</th>
							<th>지급계좌</th>
							<th>계좌번호</th>
							<th>사인</th>
						</tr>
						<tr>
							<td><input type="text" value="${memberContent.mmEmail}" class="form-control1" name="mmEmail"/></td>
							<td><input type="text" value="${memberContent.mmAddress}" class="form-control1" name="mmAddress"/></td>
							<td><input type="text" value="${memberContent.mmTel}" class="form-control1" name="mmTel"/></td>
							<td><input type="text" value="${memberContent.mmBank}" class="form-control1" name="mmBank"/></td>
							<td><input type="text" value="${memberContent.mmAccount}" class="form-control1" name="mmAccount"/></td>
							<td>${memberContent.mmSign}</td>
						</tr>
					</table>
					<div class="clearfix">&nbsp;</div>
					<div align="center">
						<button type="submit" class="btn-info btn-lg" >수정</button> 
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>