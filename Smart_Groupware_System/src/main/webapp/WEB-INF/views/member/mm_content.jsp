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
	
<form action="<c:url value='/member/mm_modify'/>" method="GET" >
	<div class="sub-heard-part">
		<ol class="breadcrumb m-b-0">
			<li><a href="<c:url value='/main/mainIndex'/>"><b>Home</b></a></li>
			<li>개인정보조회</li>
			<li><button type="submit" class="btn btn-primary">수정</button></li>
		</ol>
	</div>
</form>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">사원정보</h3>
					<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
				</div>
			<div class="panel-body">
				<form>
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
				</form>
				<div class="clearfix">&nbsp;</div>
		
				<div>
					<button type="button" class="btn btn-info btn-block">사원정보</button>
					<br/><br/>
				</div>
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
						<td>${memberContent.mmEmail}</td>
						<td>${memberContent.mmAddress}</td>
						<td>${memberContent.mmTel}</td>
						<td>${memberContent.mmBank}</td>
						<td>${memberContent.mmAccount}</td>
						<td>${memberContent.mmSign}</td>
					</tr>
				</table> 
				<div class="clearfix">&nbsp;</div>
				<div>
					<button type="button" class="btn btn-info btn-block">학력정보</button>
					<br/><br/>
				</div>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>최종학력</th>
							<th>학교명</th>
							<th>입학날짜</th>
							<th>졸업날짜</th>
							<th>전공</th>
							<th>학점</th>
							<th>최종성적</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${memberContentMc.acName}</td>
							<td>${memberContentMc.mcSchoolName}</td>
							<td>${memberContentMc.mcAdmissionDate}</td>
							<td>${memberContentMc.mcGraduationDate}</td>
							<td>${memberContentMc.mcMajor}</td>
							<td>${memberContentMc.mcJumsu}</td>
							<td>${memberContentMc.mcGrade}</td>
						</tr>
					</tbody>
				</table> 
				<div class="clearfix">&nbsp;</div>
					
				<div>
					<button type="button" class="btn btn-info btn-block">경력정보</button>
					<br/><br/>
				</div>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>경력사항</th>
							<th>경력기간</th>
							<th>입사일</th>
							<th>퇴사일</th>
							<th>직급</th>
							<th>상위업종</th>
							<th>하위업종</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="memberContentCr" items="${memberContentCr}">
							<tr>
								<td>${memberContentCr.crData}</td>
								<td>${memberContentCr.crService}</td>
								<td>${memberContentCr.crPastJoinDay}</td>
								<td>${memberContentCr.crPastResignDay}</td>
								<td>${memberContentCr.crResponsibility}</td>
								<td>${memberContentCr.maType}</td>
								<td>${memberContentCr.miType}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table> 
				<div class="clearfix">&nbsp;</div>
				
				<div>
					<button type="button" class="btn btn-info btn-block">자격증정보</button>
					<br/><br/>
				</div>
				<table class="table table-bordered">
					<thead>
						<tr>
							<th>자격증</th>
							<th>발급일자</th>
							<th>발급기관</th>
							<th>자격</th>
							<th>분류</th>
						</thead>
					<tbody>
					<c:forEach var="memberContentLc" items="${memberContentLc}">
						<tr>
							<td>${memberContentLc.lcName}</td>
							<td>${memberContentLc.mlIssueDate}</td>
							<td>${memberContentLc.lcOrganization}</td>
							<td>${memberContentLc.lcType}</td>
							<td>${memberContentLc.lcNote}</td>
						</tr>
					</c:forEach>
					</tbody>
				</table> 
				<div class="clearfix">&nbsp;</div>
			</div>
		</div>
	</div>
</div>
	
</body>
</html>