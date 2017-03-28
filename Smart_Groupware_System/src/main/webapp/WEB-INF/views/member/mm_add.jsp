<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
<link href="<c:url value='/resources/css/panelSearch.css'/>" rel="stylesheet">

<script>
	/*경력, 자격증정보 추가, 삭제폼  */
	$(document).on('click','.addcr',function(){
	    var addcr = $('#addcrCopy').html();
	    $('#addcr').after(addcr);
	});
	$(document).on('click','.delcr',function(){
	    console.log($(this).parent().parent());
	    $(this).parent().parent().remove();
	});
	
	$(document).on('click','.addlc',function(){
	    var addlc = $('#addlcCopy').html();
	    $('#addlc').after(addlc);
	});
	$(document).on('click','.dellc',function(){
	    console.log($('this').parent());
	    $(this).parent().parent().remove();
	});
	/* $(document).ready(function(){
		$('.page-container').empty();	
	}); */
	
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
<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>

</head>
<body>
<c:import url="../mainIndex.jsp"></c:import>
<!--본문시작 : 윤재호  -->			
<div class="sub-heard-part">
	<ol class="breadcrumb m-b-0">
		<li><a href="<c:url value='/main/mainIndex'/>">Home</a></li>
		<li class="active">사원 등록</li>
	</ol>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">사원정보 등록폼</h3>
					<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
				</div>
			<div class="panel-body">
				<form class="form-horizontal" action="<c:url value='/member/mm_add'/>" method="post">
					<div>
						<button type="button" class="btn btn-info btn-block">사원정보</button>
						<br/><br/>
					</div>
					<div class="form-group">
						<label for="mmName" class="col-sm-2 control-label"> 사원이름 </label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="mmName" name="mmName"
								placeholder="사원 이름" >
						</div>
						
						<label for="mmEmail" class="col-sm-2 control-label"> Email </label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="mmEmail" name="mmEmail"
								placeholder="사원 이메일">
						</div>
					</div>
					<div class="form-group">
						<label for="mmPassword" class="col-sm-2 control-label"> 비밀번호 </label>
						<div class="col-sm-3">
							<input type="password" class="form-control" id="mmPassword" name="mmPassword"
							placeholder="비밀번호">
						</div>
					</div>
					<div class="form-group">
						<label for="memberInfo" class="col-sm-2 control-label"> 사원계약정보 </label>
						<div class="col-sm-2">
							<select name="ctCode" id="ctCode" class="form-control">
								<option>:::계약형태:::</option>
								<c:forEach var="contract" items="${contract}">
									<option value="${contract.ctCode}">${contract.ctType}</option>
								</c:forEach> 
							</select>
						</div>
						<div class="col-sm-2">
							<select name="ptCode" id="ptCode" class="form-control">
								<option>:::직급:::</option>
								<c:forEach var="position" items="${position}">
									<option value="${position.ptCode}">${position.ptName}</option>
								</c:forEach> 
							</select>
						</div>
						<div class="col-sm-2">
							<select name="dpCode" id="dpCode" class="form-control">
								<option>:::부서:::</option>
								<c:forEach var="department" items="${department}">
   									<option value="${department.dpCode}">${department.dpName}</option>
   								</c:forEach> 
   							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="mmDailyPay" class="col-sm-2 control-label"> 일급 </label>
						<div class="col-sm-2">
							<input type="text" class="form-control" id="mmDailyPay" name="mmDailyPay" placeholder="사원 일급">
						</div>
					</div>	
					<div class="form-group">
						<label for="mmJoinDate" class="col-sm-2 control-label"> 입사 날짜 </label>
						<div class="col-sm-3">
							<input type="date" class="form-control" id="mmJoinDate" name="mmJoinDate" placeholder="사원 입사날짜">
						</div>
					
						<label for="mmAnnualLeave" class="col-sm-2 control-label"> 남은 연차 </label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="mmAnnualLeave" name="mmAnnualLeave" placeholder="남은 연차">
						</div>
					</div>
					<div class="form-group">
						<label for="mmAddress" class="col-sm-2 control-label"> 주소 </label>
						<div class="col-sm-8">
							<input type="text" class="form-control" id="mmAddress" name="mmAddress" placeholder="사원 주소">
						</div>
					</div>
					<div class="form-group">
						<label for="mmTel" class="col-sm-2 control-label"> 연락처 </label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="mmTel" name="mmTel" placeholder=" - 를 빼고 입력하세요">
						</div>
					</div>
					<div class="form-group">
						<label class="col-sm-2 control-label" for="mmArmy"> 군필여부 </label>
						<div class="col-sm-3">
							<div class="radio-inline">
								<label for="mmArmy">
								<input type="radio" name="mmArmy" value="1" id="mmArmy" checked="checked"> 군필 </label>
							</div>
							<div class="radio-inline">
								<label for="mmArmy">
								<input type="radio" name="mmArmy" value="0" id="mmArmy" checked="checked"> 미필 </label>
							</div>
						</div>
					
						<label class="col-sm-2 control-label" for="mmMarriage"> 결혼여부 </label>
						<div class="col-sm-3">
							<div class="radio-inline">
								<label for="mmMarriage">
								<input type="radio" name="mmMarriage" value="1" id="mmMarriage" checked="checked"> 기혼 </label>
							</div>
							<div class="radio-inline">
								<label for="mmMarriage">
								<input type="radio" name="mmMarriage" value="0" id="mmMarriage" checked="checked"> 미혼 </label>
							</div>
						</div>
					</div>
					<div>
						<button type="button" class="btn btn-info btn-block">학력정보</button>
						<br/><br/>
					</div>
					<div class="form-group">
						<label for="ac_code" class="col-sm-2 control-label"> 최종학력 </label>
						<div class="col-sm-3">
							<select name="acCode" id="acCode" class="form-control">
								<option>:::학력을 선택하세요:::</option>
								<c:forEach var="achieve" items="${achieve}">
   									<option value="${achieve.acCode}">${achieve.acName}</option>
   								</c:forEach> 
							</select>
						</div>
					
						<label for="mcSchoolName" class="col-sm-2 control-label"> 학교명 </label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="mcSchoolName" name="mcSchoolName" placeholder="학교명">
						</div>
					</div>
					<div class="form-group">
						<label for="mcMajor" class="col-sm-2 control-label"> 전공 </label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="mcMajor" name="mcMajor" placeholder="전공">
						</div>
					
						<label for="mcGrade" class="col-sm-2 control-label"> 최종성적 </label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="mcGrade" name="mcGrade" placeholder="최종성적">
						</div>
					</div>
					<div class="form-group">
						<label for="mcJumsu" class="col-sm-2 control-label"> 졸업학점 </label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="mcJumsu" name="mcJumsu" placeholder="졸업학점">
						</div>
					</div>
					<div class="form-group">
						<label for="mcAdmissionDate" class="col-sm-2 control-label"> 입학 날짜 </label>
						<div class="col-sm-3">
							<input type="date" class="form-control" id="mcAdmissionDate" name="mcAdmissionDate">
						</div>
					
						<label for="mcGraduationDate" class="col-sm-2 control-label"> 졸업 날짜 </label>
						<div class="col-sm-3">
							<input type="date" class="form-control" id="mcGraduationDate" name="mcGraduationDate">
						</div>
					</div>
					<div>
						<button type="button" class="btn btn-info btn-block">경력사항</button>
						<br/><br/>
					</div>			
					<div id="addcr">
						<div class="form-group">
							<label for="crinput" class="col-sm-2 control-label"> 경력사항 </label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="crData" name="crData"
									placeholder="경력사항">	
							</div>
							
							<label for="crinput" class="col-sm-2 control-label"> 기간 </label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="crService" name="crService"
									placeholder="기간">	
							</div>
						</div>
						<div class="form-group">
							<label for="crinput" class="col-sm-2 control-label"> 입사날짜</label>
							<div class="col-sm-3">
								<input type="date" class="form-control" id="crPastJoinDay" name="crPastJoinDay" placeholder="입사날짜">	
							</div>
							
							<label for="crinput" class="col-sm-2 control-label"> 퇴사날짜 </label>
							<div class="col-sm-3">
								<input type="date" class="form-control" id="crPastResignDay" name="crPastResignDay" placeholder="퇴사날짜">	
							</div>
						</div>
						<div class="form-group">
							<label for="crinput" class="col-sm-2 control-label"> 직책 </label>
							<div class="col-sm-2">
								<input type="text" class="form-control" id="crResponsibility" name="crResponsibility"
									placeholder="직책">	
							</div>
							<label for="crinput" class="col-sm-1 control-label"> 업종(상) </label>
							<div class="col-sm-2">
								<select name="maCodes" id="maCodes" class="form-control">
									<option>:::상위업종:::</option>
									<c:forEach var="majorTypeOfBusiness" items="${majorTypeOfBusiness}">
										<option value="${majorTypeOfBusiness.maCode}">${majorTypeOfBusiness.maType}</option>
									</c:forEach> 
								</select>
							</div>
							<label for="crinput" class="col-sm-1 control-label"> 업종(하) </label>
							<div class="col-sm-2">
								<select name="miCodes" id="miCodes"
									class="form-control">
									<option>:::하위업종:::</option>
									<c:forEach var="minorTypeOfBusiness" items="${minorTypeOfBusiness}">
										<option value="${minorTypeOfBusiness.miCode}">${minorTypeOfBusiness.miType}</option>
									</c:forEach> 
								</select>
							</div>
							<button type = "button" class = "addcr">추가</button>
	     				</div>
					</div>
					<div id="addcrCopy" style="display:none;">
						<div class="merong">
							<div class="form-group">
								<label for="crinput" class="col-sm-2 control-label"> 경력사항 </label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="crData" name="crData"
										placeholder="경력사항">	
								</div>
								
								<label for="crinput" class="col-sm-2 control-label"> 기간 </label>
								<div class="col-sm-3">
									<input type="text" class="form-control" id="crService" name="crService"
										placeholder="기간">	
								</div>
							</div>
							<div class="form-group">
								<label for="crinput" class="col-sm-2 control-label"> 입사날짜</label>
								<div class="col-sm-3">
									<input type="date" class="form-control" id="crPastJoinDay" name="crPastJoinDay" placeholder="입사날짜">	
								</div>
								
								<label for="crinput" class="col-sm-2 control-label"> 퇴사날짜 </label>
								<div class="col-sm-3">
									<input type="date" class="form-control" id="crPastResignDay" name="crPastResignDay" placeholder="퇴사날짜">	
								</div>
							</div>
							<div class="form-group">
								<label for="crinput" class="col-sm-2 control-label"> 직책 </label>
								<div class="col-sm-2">
									<input type="text" class="form-control" id="crResponsibility" name="crResponsibility"
										placeholder="직책">	
								</div>
								<label for="crinput" class="col-sm-1 control-label"> 업종(상) </label>
								<div class="col-sm-2">
									<select name="maCodes" id="maCodes" class="form-control">
										<option>:::상위업종:::</option>
										<c:forEach var="majorTypeOfBusiness" items="${majorTypeOfBusiness}">
											<option value="${majorTypeOfBusiness.maCode}">${majorTypeOfBusiness.maType}</option>
										</c:forEach> 
									</select>
								</div>
								<label for="crinput" class="col-sm-1 control-label"> 업종(하) </label>
								<div class="col-sm-2">
									<select name="miCodes" id="miCodes"
										class="form-control">
										<option>:::하위업종:::</option>
										<c:forEach var="minorTypeOfBusiness" items="${minorTypeOfBusiness}">
											<option value="${minorTypeOfBusiness.miCode}">${minorTypeOfBusiness.miType}</option>
										</c:forEach> 
									</select>
								</div>
								<button type = "button" class = "addcr">추가</button>
		     					<button type = "button" class = "delcr">삭제</button>	
							</div>
						</div>
					</div>
					<div>
						<button type="button" class="btn btn-info btn-block">자격증정보</button>
						<br/><br/>
					</div>							
					<div id="addlc">
						<div class="form-group">
							<label for="licenseselector" class="col-sm-2 control-label"> 보유 자격증 </label>
							<div class="col-sm-3">
								<select name="lcCodes" id="lcCodes" class="form-control">
									<option>:::보유자격증:::</option>
									<c:forEach var="license" items="${license}">
   										<option value="${license.lcCode}">${license.lcName}</option>
   									</c:forEach> 
								</select>
							</div>
							<label for="licenseselector" class="col-sm-2 control-label"> 발급일자 </label>
							<div class="col-sm-3">
								<input type="date" class="form-control" id="mlIssueDate" name="mlIssueDate" placeholder="자격증 발급일자">
							</div>
							<button type = "button" class = "addlc">추가</button>
						</div>
					</div>
					<div id="addlcCopy" style="display:none;">
						<div>
							<div class="form-group">
							<label for="licenseselector" class="col-sm-2 control-label"> 보유 자격증 </label>
							<div class="col-sm-3">
								<select name="lcCodes" id="lcCodes" class="form-control">
									<option>:::보유자격증:::</option>
									<c:forEach var="license" items="${license}">
   										<option value="${license.lcCode}">${license.lcName}</option>
   									</c:forEach> 
								</select>
							</div>
							<label for="licenseselector" class="col-sm-2 control-label"> 발급일자 </label>
							<div class="col-sm-3">
								<input type="date" class="form-control" id="mlIssueDate" name="mlIssueDate" placeholder="자격증 발급일자">
							</div>
								<button type = "button" class = "addlc">추가</button>
								<button type = "button" class = "dellc">삭제</button>
							</div>
						</div>
					</div>
					<div>
						<button type="button" class="btn btn-info btn-block">급여통장정보</button>
						<br/><br/>
					</div>
					<div class="form-group">
						<label for="mmBank" class="col-sm-2 control-label">지급은행</label>
						<span style="color:red; font-size:10pt">사용중인 은행을 선택하세요</span>
						<div class="col-sm-3">
							<select name="mmBank" id="mmBank" class="form-control">
								<option>은행을 선택하세요</option>
								<option>신한은행</option>
								<option>농협</option>
								<option>우리은행</option>
								<option>국민은행</option>
								<option>하나은행</option>
								<option>기업은행</option>
								<option>시티은행</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="mmAccount" class="col-sm-2 control-label">계좌번호</label>
						<div class="col-sm-4">
							<input type="text" class="form-control" id="mmAccount" name="mmAccount" placeholder="은행계좌를 입력하세요(-제외)">
						</div>
					</div>
					<div align="center">
						<button type="submit" class="btn-success btn-lg">사원정보등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 본문끝 -->
</body>
</html>