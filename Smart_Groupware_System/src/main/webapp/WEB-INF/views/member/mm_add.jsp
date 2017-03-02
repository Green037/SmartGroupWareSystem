<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<c:url value='/resources/js/jquery-1.10.2.min.js'/>"></script>
<script>
$(document).on('click','.addcr',function(){
    var addcr = $('#addcrCopy').html();
    $('#addcr').prepend(addcr);
});
$(document).on('click','.delcr',function(){
    console.log($('this').parent());
    $(this).parent().remove();
});

$(document).on('click','.addlc',function(){
    var addlc = $('#addlcCopy').html();
    $('#addlc').prepend(addlc);
});
$(document).on('click','.dellc',function(){
    console.log($('this').parent());
    $(this).parent().remove();
});

</script>
<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>

</head>

<body>
	<%@ include file="../menu.jsp"%>

	<div class="page-container">
		<div class="left-content">
			<div class="inner-content">
				<div class="outter-wp">
					<!-- Home/메뉴  -->
					<div class="outter-wp">
						<!--/sub-heard-part-->
						<div class="sub-heard-part">
							<ol class="breadcrumb m-b-0">
								<li><a href="index.html">Home</a></li>
								<li class="active">Forms</li>
							</ol>
						</div>
						<!-- Home/메뉴 End -->

						<!--  body폼 시작 -->

						<div class="set-1">
							<div class="graph-2 general">
								<h3 class="inner-tittle two"> 사원 등록 </h3>
								<div class="grid-1">
									<div class="form-body">
										<form class="form-horizontal" action="<c:url value='/member/mm_add'/>" method="post">
											
											<div class="form-group">
												<label for="mmName" class="col-sm-2 control-label"> 사원이름 </label>
												<span style="color:red; font-size:10pt">이름</span>
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="mmName" name="mmName"
														placeholder="사원 이름">
												</div>
											</div>
											
											<div class="form-group">
												<label for="mmEmail" class="col-sm-2 control-label"> Email </label>
												<span style="color:red; font-size:10pt">사용중인 이메일</span>
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="mmEmail" name="mmEmail"
														placeholder="사원 이메일">
												</div>

											</div>
											<div class="form-group">
												<label for="mmPassword" class="col-sm-2 control-label"> 비밀번호 </label>
												<span style="color:red; font-size:10pt">사용할 비밀번호</span>
												<div class="col-sm-3">
													<input type="password" class="form-control1" id="mmPassword" name="mmPassword"
													placeholder="비밀번호">
												</div>
											</div>
											
											
											<div class="form-group">
												<label for="memberInfo" class="col-sm-2 control-label"> 사원계약정보 </label>
												<div class="col-sm-1">
													<select name="ctCode" id="ctCode"
														class="form-control1">
														<option> 계약형태</option>
															<c:forEach var="contract" items="${contract}">
			      											<option value="${contract.ctCode}">${contract.ctType}</option>
			      											</c:forEach> 
			      									</select>
												</div>
												
												<div class="col-sm-1">
													<select name="ptCode" id="ptCode"
														class="form-control1">
														<option> 직급</option>
															<c:forEach var="position" items="${position}">
			      										<option value="${position.ptCode}">${position.ptName}</option>
			      											</c:forEach> 
			      									</select>
												</div>
												
												<div class="col-sm-1">
													<select name="dpCode" id="dpCode"
														class="form-control1">
														<option> 부서</option>
															<c:forEach var="department" items="${department}">
			      										<option value="${department.dpCode}">${department.dpName}</option>
			      											</c:forEach> 
			      									</select>
												</div>
															
											</div>
											

											<div class="form-group">
												<label for
												="mmDailyPay" class="col-sm-2 control-label"> 일급 </label>
												<div class="col-sm-2">
													<input type="text" class="form-control1" id="mmDailyPay" name="mmDailyPay"
													placeholder="사원 일급">
												</div>
											</div>	
			
											<div class="form-group">
												<label for="mmJoinDate" class="col-sm-2 control-label"> 입사 날짜 </label>
												<span style="color:red; font-size:10pt">날짜를 선택하세요.</span>
												<div class="col-sm-2">
													<input type="date" class="form-control1" id="mmJoinDate" name="mmJoinDate"
													placeholder="사원 입사날짜">
												</div>
											</div>	
											
											
											<div class="form-group">
												<label for="mmAnnualLeave" class="col-sm-2 control-label"> 남은 연차 </label>
												<div class="col-sm-2">
													<input type="text" class="form-control1" id="mmAnnualLeave" name="mmAnnualLeave"
													placeholder="남은 연차">
												</div>
											</div>
											
											<div class="form-group">
												<label for="mmAddress" class="col-sm-2 control-label"> 주소 </label>
												<span style="color:red; font-size:10pt">거주 주소</span>
												<div class="col-sm-8">
													<input type="text" class="form-control1" id="mmAddress" name="mmAddress"
													placeholder="사원 주소">
												</div>
											</div>
											
											<div class="form-group">
												<label for="mmTel" class="col-sm-2 control-label"> 연락처 </label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="mmTel" name="mmTel"
													placeholder="연락처">
												</div>
												
											</div>
											
											<div class="form-group">
												<label class="col-sm-2 control-label" for="mmArmy"> 군필여부 </label>
												<div class="col-sm-8">
													<div class="radio-inline1">
														<label for="mmArmy"><input type="radio"
															name="mmArmy" value="1" id="mmArmy"
															checked="checked"> 군필 </label>
													</div>
													<div class="radio-inline1">
														<label for="mmArmy"><input type="radio"
															name="mmArmy" value="0" id="mmArmy"
															checked="checked"> 미필 </label>
													</div>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label" for="mmMarriage"> 결혼여부 </label>
												<div class="col-sm-8">
													<div class="marry-inline1">
														<label for="mmMarriage"><input type="radio"
															name="mmMarriage" value="1" id="mmMarriage"
															checked="checked"> 기혼 </label>
													</div>
													<div class="marry-inline1">
														<label for="mmMarriage"><input type="radio"
															name="mmMarriage" value="0" id="mmMarriage"
															checked="checked"> 미혼 </label>
													</div>
												</div>
											</div>
											
											<div class="form-group">
												<label for="ac_code" class="col-sm-2 control-label"> 최종학력 </label>
												<div class="col-sm-2">
													<select name="acCode" id="acCode"
														class="form-control1">
														<option> 학력을 선택하세요</option>
															<c:forEach var="achieve" items="${achieve}">
			      										<option value="${achieve.acCode}">${achieve.acName}</option>
			      											</c:forEach> 
														
													</select>
												</div>
											</div>
											
											<div class="form-group">
												<label for="mcSchoolName" class="col-sm-2 control-label"> 학교명 </label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="mcSchoolName" name="mcSchoolName"
														placeholder="학교명">
												</div>
											</div>
											
											<div class="form-group">
												<label for="mcMajor" class="col-sm-2 control-label"> 전공 </label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="mcMajor" name="mcMajor"
														placeholder="전공">
												</div>
											</div>
											
											<div class="form-group">
												<label for="mcGrade" class="col-sm-2 control-label"> 최종성적 </label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="mcGrade" name="mcGrade"
														placeholder="최종성적">
												</div>
											</div>
											
											<div class="form-group">
												<label for="mcJumsu" class="col-sm-2 control-label"> 졸업학점 </label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="mcJumsu" name="mcJumsu"
														placeholder="졸업학점">
												</div>
											</div>
											
											
											<div class="form-group">
												<label for="mcAdmissionDate" class="col-sm-2 control-label"> 입학 날짜 </label>
												<div class="col-sm-2">
													<input type="date" class="form-control1"
														id="mcAdmissionDate" name="mcAdmissionDate">
												</div>
											</div>
											
											<div class="form-group">
												<label for="mcGraduationDate" class="col-sm-2 control-label"> 졸업 날짜 </label>
												<div class="col-sm-2">
													<input type="date" class="form-control1"
														id="mcGraduationDate" name="mcGraduationDate">
												</div>
											</div>			
											
										<div id="addcr">
											<div class="form-group">
												<label for="crinput" class="col-sm-2 control-label"> 경력사항 </label>
												<div class="col-sm-1">
													<input type="text" class="form-control1" id="crData" name="crData"
														placeholder="경력사항">	
												</div>
												<div class="col-sm-1">
													<input type="text" class="form-control1" id="crService" name="crService"
														placeholder="기간">	
												</div>
												<div class="col-sm-2">
													<input type="date" class="form-control1" id="crPastJoinDay" name="crPastJoinDay"
														placeholder="입사날짜">	
												</div>
												<div class="col-sm-2">
													<input type="date" class="form-control1" id="crPastResignDay" name="crPastResignDay"
														placeholder="퇴사날짜">	
												</div>
												<div class="col-sm-1">
													<input type="text" class="form-control1" id="crResponsibility" name="crResponsibility"
														placeholder="직책">	
												</div>
												<div class="col-sm-1">
													<select name="maCodes" id="maCodes"
														class="form-control1">
														<option> 상위업종</option>
															<c:forEach var="majorTypeOfBusiness" items="${majorTypeOfBusiness}">
			      										<option value="${majorTypeOfBusiness.maCode}">${majorTypeOfBusiness.maType}</option>
			      											</c:forEach> 
			      									</select>
												</div>
												
												<div class="col-sm-1">
													<select name="miCodes" id="miCodes"
														class="form-control1">
														<option> 하위업종</option>
															<c:forEach var="minorTypeOfBusiness" items="${minorTypeOfBusiness}">
			      										<option value="${minorTypeOfBusiness.miCode}">${minorTypeOfBusiness.miType}</option>
			      											</c:forEach> 
			      									</select>
												</div>
												
												
												<button type = "button" class = "addcr">추가</button>
           									    	
											</div>
										</div>
										
										<div id="addcrCopy" style="display:none;">
											<div class="form-group">
												<label for="crinput" class="col-sm-2 control-label"> 경력사항 </label>
												<div class="col-sm-1">
													<input type="text" class="form-control1" id="crData" name="crData"
														placeholder="경력사항">	
												</div>
												<div class="col-sm-1">
													<input type="text" class="form-control1" id="crService" name="crService"
														placeholder="기간">	
												</div>
												<div class="col-sm-2">
													<input type="date" class="form-control1" id="crPastJoinDay" name="crPastJoinDay"
														placeholder="입사날짜">	
												</div>
												<div class="col-sm-2">
													<input type="date" class="form-control1" id="crPastResignDay" name="crPastResignDay"
														placeholder="퇴사날짜">	
												</div>
												<div class="col-sm-1">
													<input type="text" class="form-control1" id="crResponsibility" name="crResponsibility"
														placeholder="직책">	
												</div>
												
												<div class="col-sm-1">
													<select name="maCodes" id="maCodes"
														class="form-control1">
														<option> 상위업종</option>
															<c:forEach var="majorTypeOfBusiness" items="${majorTypeOfBusiness}">
			      										<option value="${majorTypeOfBusiness.maCode}">${majorTypeOfBusiness.maType}</option>
			      											</c:forEach> 
			      									</select>
												</div>
												
												<div class="col-sm-1">
													<select name="miCodes" id="miCodes"
														class="form-control1">
														<option> 하위업종</option>
															<c:forEach var="minorTypeOfBusiness" items="${minorTypeOfBusiness}">
			      										<option value="${minorTypeOfBusiness.miCode}">${minorTypeOfBusiness.miType}</option>
			      											</c:forEach> 
			      									</select>
												</div>
												
												<button type = "button" class = "addcr">추가</button>
           									    <button type = "button" class = "delcr">삭제</button>		
											</div>
										</div>
																			
										<div id="addlc">
											<div class="form-group">
												<label for="licenseselector" class="col-sm-2 control-label"> 보유 자격증 </label>
												<div class="col-sm-2">
													<select name="lcCodes" id="lcCodes"
														class="form-control1">
															<c:forEach var="license" items="${license}">
			      										<option value="${license.lcCode}">${license.lcName}</option>
			      											</c:forEach> 
													</select>
												</div>
												
												<div class="col-sm-2">
													<input type="date" class="form-control1" id="mlIssueDate" name="mlIssueDate"
													placeholder="자격증 발급일자">
												</div>
												
												<button type = "button" class = "addlc">추가</button>
											</div>
										</div>
										
										<div id="addlcCopy" style="display:none;">
											<div class="form-group">
												<label for="licenseselector" class="col-sm-2 control-label"> 보유 자격증 </label>
												<div class="col-sm-2">
													<select name="lcCodes" id="lcCodes"
														class="form-control1">
															<c:forEach var="license" items="${license}">
			      										<option value="${license.lcCode}">${license.lcName}</option>
			      											</c:forEach> 
													</select>
												</div>
												
												<div class="col-sm-2">
													<input type="date" class="form-control1" id="mlIssueDate" name="mlIssueDate"
													placeholder="자격증 발급일자">
												</div>
												
												<button type = "button" class = "addlc">추가</button>
												<button type = "button" class = "dellc">삭제</button>
											</div>
										</div>
											
											
											<div class="form-group">
												<label for="mmBank" class="col-sm-2 control-label">지급은행</label>
												<span style="color:red; font-size:10pt">사용중인 은행을 선택하세요</span>
												<div class="col-sm-2">
													<select name="mmBank" id="mmBank"
														class="form-control1">
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
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="mmAccount" name="mmAccount"
														placeholder="은행계좌를 입력하세요(-제외)">
												</div>
											</div>



											<!-- <div class="form-group">
												<label for="txtarea1" class="col-sm-2 control-label">기타 사항</label>
												<div class="col-sm-8">
													<textarea name="txtarea1" id="txtarea1" cols="50" rows="4"
														class="form-control1"></textarea>
												</div>
											</div> -->

											<div class="form-group" align="center">
													<button type="submit" class="btn btn-default">등록</button>
											</div>
											<!--사원등록 end -->




										</form>
									</div>

								</div>
							</div>
						</div>



						<!--  body폼 끝 -->


					</div>
				</div>
			</div>
		</div>
	</div>



	<%@ include file="../footer.jsp"%>
</body>
</html>