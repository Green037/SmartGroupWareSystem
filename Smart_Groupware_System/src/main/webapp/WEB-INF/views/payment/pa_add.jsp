<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>" type="text/javascript"></script>
	<script>
		$(document).ready(function() {	
// 			사원코드 파라미터를 받아 해당 사원 급여 내용을 조회
			
// 			총액
			var sumAmount = 0;

// 			사원 급여 정보 조회
			$('#mmButton').click(function() {
				var mmCode = $('#mCodeCheck').val();
				
				var eiEmployee = ${eiContent.eiEmployee};
				var nhiEmployee = ${nhiContent.nhiEmployee};
				var ppEmployee = ${ppContent.ppEmployee}; 
				
// 				console.log('mmCode : '+ mmCode);
// 				console.log('eiEmployee : '+ eiEmployee);
// 				console.log('nhiEmployee : '+ nhiEmployee);
				
				$.ajax({
					type: 'post',
					url: '/smart/pc/mmContent',
					data: {'mmCode': mmCode},
// 					전역변수에 담기
					async: false,
					success: function(data) {
// 						console.log('data.mmCode : ' + data.mmCode);
// 						console.log('data.mmName : ' + data.mmName);
// 						console.log('data.mmDailyPay : ' + data.mmDailyPay);
						
						$('#mmCode').val(data.mmCode);
						$('#mmName').val(data.mmName);
						$('#mmDailyPay').val(data.mmDailyPay);
						
// 						console.log('mmCode : ' + $('#mmCode').val());
// 						console.log('mmName : ' + $('#mmName').val());
						
//		 				고용보험
						$('#eiAmount').val(data.mmDailyPay * eiEmployee);						
//		 				국민건강보험
						$('#nhiAmount').val(data.mmDailyPay * nhiEmployee);
// 						연금보험
						$('#ppAmount').val(data.mmDailyPay * ppEmployee);
						
						sumAmount = data.mmDailyPay - 
									((data.mmDailyPay * eiEmployee) + (data.mmDailyPay * nhiEmployee) + (data.mmDailyPay * ppEmployee));
					
						$('#pcAmount').val(sumAmount);
					}
				});
			});
			
// 			console.log('sumAmount : ' + sumAmount);
			
			$('#sumBtn').click(function() {
// 			$('#inAmount').keydown(function() {
				
				sumAmount = $('#pcAmount').val();
				
				console.log('sumBtn sumAmount : ' + sumAmount);
				console.log('inAmount val : ' + $('#inAmount').val());
	 				
				var result = parseInt($('#inAmount').val()) + parseInt(sumAmount);
					
				console.log('sumBtn result : ' + result);
					
				$("#pcAmount").val(result);
			});
			
// 			alert('final sumAmount : ' + sumAmount);
		});
	</script>
</head>
<body>
	<%@ include file="../menu.jsp"%>

	<div class="page-container">
		<div class="left-content">
			<div class="inner-content">
				<div class="outter-wp">
					<!-- Home/메뉴  -->
					<div class="outter-wp">
						
						<div class="sub-heard-part">
							<ol class="breadcrumb m-b-0">
								<li><a href="/smart"><b>Home</b></a></li>
								<li>총무부권한 > 급여내역추가</li>
							</ol>
						</div>

						<div class="set-1">
							<div class="graph-2 general">
								<div class="grid-1">
									<div class="form-body">
										<form class="form-horizontal" method="post" action="<c:url value='/pa/add'/>">
											<div class="form-group">
												<label for="mmName" class="col-sm-2 control-label">사원코드</label>
												<div class="col-sm-3">
													<input type="text" id="mCodeCheck" name="mCodeCheck" class="form-control1" placeholder="입력 후 검색 버튼을 누르세요."/>
													<input type="hidden" id="mmCode" name="mmCode"/>
													<a class="btn blue" id="mmButton">검색</a>
												</div>
											</div>											
											<div class="form-group">
												<label for="mmName" class="col-sm-2 control-label">사원명</label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="mmName" name="mmName" placeholder="사원코드를 검색하세요." disabled/>
												</div>
											</div>
											<div class="form-group">
												<label for="pcDate" class="col-sm-2 control-label">급여날짜</label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="pcDate" name="pcDate" value="${paymentDate}" disabled/>
												</div>
											</div>					
											<div class="form-group">
												<label for="memberInfo" class="col-sm-2 control-label">급여내역</label>
												<div class="col-sm-9">
													<table class="table table-bordered">
														<tr>
															<th>순번</th>
															<th>급여구분</th>
															<th>대분류</th>
															<th>중분류</th>
															<th>급여액</th>
														</tr>
														<tr>
															<td>1</td>
															<td><input type="text" class="form-control1" id="pcSection" name="pcSection" value="본봉" disabled/></td>
															<td><input type="text" class="form-control1" name="pcClasificar" value="기본급" disabled/></td>
															<td><input type="text" class="form-control1" name="middleClasificar" value="기본급" disabled/></td>
															<td><input type="text" class="form-control1" name="pcAmount" id="mmDailyPay" value="0" disabled/></td>
														</tr>
														<tr>
															<td>2</td>
															<td><input type="text" class="form-control1" name="pcSection" value="수당" disabled/></td>
															<td><input type="text" class="form-control1" name="pcClasificar" value="성과급" disabled/></td>
															<td><input type="text" class="form-control1" name="middleClasificar" value="성과급" disabled/></td>
															<td><input type="text" class="form-control1" name="pcAmount" id="inAmount" value="0"/></td>
														</tr>
														<tr>
															<td>3</td>
															<td><input type="text" class="form-control1" name="pcSection" value="공제" disabled/></td>
															<td><input type="text" class="form-control1" name="pcClasificar" value="4대보험" disabled/></td>
															<td><input type="text" class="form-control1" name="middleClasificar" value="고용보험" disabled/></td>
															<td><input type="text" class="form-control1" name="pcAmount" id="eiAmount" value="0" disabled/></td>
														</tr>
														<tr>
															<td>4</td>
															<td><input type="text" class="form-control1" name="pcSection" value="공제" disabled/></td>
															<td><input type="text" class="form-control1" name="pcClasificar" value="4대보험" disabled/></td>
															<td><input type="text" class="form-control1" name="middleClasificar" value="국민건강보험" disabled/></td>
															<td><input type="text" class="form-control1" name="pcAmount" id="nhiAmount" value="0" disabled/></td>
														</tr>
														<tr>
															<td>5</td>
															<td><input type="text" class="form-control1" name="pcSection" value="공제" disabled/></td>
															<td><input type="text" class="form-control1" name="pcClasificar" value="4대보험" disabled/></td>
															<td><input type="text" class="form-control1" name="middleClasificar" value="연금보험" disabled/></td>
															<td><input type="text" class="form-control1" name="pcAmount" id="ppAmount" value="0" disabled/></td>
														</tr>
														<tr>
															<th colspan=4>
																총급여
																<a class="btn blue" id="sumBtn">계산</a>
															</th>
															<td><b><input type="text" class="form-control1" id="pcAmount" value="0" disabled/></b></td>
														</tr>
													</table> 
												</div>	
											</div>
											<div class="form-group">
												<label for="mmPassword" class="col-sm-2 control-label">담당사원코드</label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" name="paMmCode" value="${paMmCode}" disabled/>
												</div>
											</div>
											<div class="form-group" align="center">
												<button type="submit" class="btn btn-default">등록</button>
												<button type="reset" class="btn btn-default">취소</button>
											</div>
										</form>
										<div class="clearfix">&nbsp;</div>
									</div>

								</div>
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="../footer.jsp"%>
</body>
</html>