<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>" type="text/javascript"></script>
	<link href="<c:url value='/resources/css/panelSearch.css'/>" rel="stylesheet">
	
	<script>
		$(document).on('click', '#mmButton', function() {	
// 			사원코드 파라미터를 받아 해당 사원 급여 내용을 조회
			
// 			총액
			var sumAmount = 0;

// 			사원 급여 정보 조회
			var mmCode = $('#mCodeCheck').val();
				
			var eiEmployee = ${eiContent.eiEmployee};
			var nhiEmployee = ${nhiContent.nhiEmployee};
			var ppEmployee = ${ppContent.ppEmployee};
			var ohiEmployee = ${ohiContent.ohiBasic};
			
// 			console.log('mmCode : '+ mmCode);
// 			console.log('eiEmployee : '+ eiEmployee);
// 			console.log('nhiEmployee : '+ nhiEmployee);
// 			console.log('ohiEmployee : '+ ohiEmployee);
				
			$.ajax({
				type: 'post',
				url: '/smart/pc/mmContent',
				data: {'mmCode': mmCode},
// 				전역변수에 담기
				async: false,
				success: function(data) {
// 					console.log('data.mmCode : ' + data.mmCode);
// 					console.log('data.mmName : ' + data.mmName);
// 					console.log('data.mmDailyPay : ' + data.mmDailyPay);
						
					$('#mmCode').val(data.mmCode);
					$('#mmName').val(data.mmName);
					$('#mmDailyPay').val(data.mmDailyPay);
						
// 					console.log('mmCode : ' + $('#mmCode').val());
// 					console.log('mmName : ' + $('#mmName').val());
						
//		 			고용보험
					$('#eiAmount').val(Math.round(data.mmDailyPay * eiEmployee));						
//		 			국민건강보험
					$('#nhiAmount').val(Math.round(data.mmDailyPay * nhiEmployee));
// 					연금보험
					$('#ppAmount').val(Math.round(data.mmDailyPay * ppEmployee));
// 					산재보험
					$('#ohiAmount').val(Math.round(data.mmDailyPay * ohiEmployee));
						
					sumAmount = data.mmDailyPay - 
								((Math.round(data.mmDailyPay * eiEmployee)) + (Math.round(data.mmDailyPay * nhiEmployee))
												+ (Math.round(data.mmDailyPay * ppEmployee)));
				
					$('#pcAmount').val(sumAmount);
				}
			});
		});
// 		
// 		console.log('sumAmount : ' + sumAmount);
			
// 		급여 합산
		$(document).on('click', '#sumBtn', function() {	
// 		$('#inAmount').keydown(function() {
				
			sumAmount = $('#pcAmount').val();
			
			console.log('sumBtn sumAmount : ' + sumAmount);
			console.log('inAmount val : ' + $('#inAmount').val());
	 			
			var result = parseInt($('#inAmount').val()) + parseInt(sumAmount);
					
			console.log('sumBtn result : ' + result);
					
			$("#pcAmount").val(result);
		});
		
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
		<li class="active">총무부권한 > 급여내역추가</li>
	</ol>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
				<h3 class="panel-title">총무부권한 > 급여내역추가</h3>
				<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
				</div>
			<div class="panel-body">
				<form class="form-horizontal" id="paAddForm" method="post" action="<c:url value='/pa/add'/>">
					<div class="form-group">
						<label for="mmName" class="col-sm-2 control-label">사원코드</label>
						<div class="col-sm-4 form-inline">
							<input type="text" id="mCodeCheck" name="mCodeCheck" class="form-control" placeholder="입력 후 검색버튼 CLICK!!"/>
							<input type="hidden" id="mmCode" name="mmCode"/>
							<a class="btn-success btn-lg" id="mmButton">검색</a>
						</div>
					</div>
					<div class="form-group">
						<label for="mmName" class="col-sm-2 control-label">사원명</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="mmName" name="mmName" placeholder="사원코드를 검색하세요." readOnly/>
						</div>
					</div>
					<div class="form-group">
						<label for="pcDate" class="col-sm-2 control-label">급여날짜</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" id="pcDate" name="pcDate" value="${paymentDate}" readOnly/>
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
									<td><input type="text" class="form-control" id="pcSection" name="pcSection" value="본봉" readOnly/></td>
									<td><input type="text" class="form-control" name="pcClasificar" value="기본급" readOnly/></td>
									<td><input type="text" class="form-control" name="middleClasificar" value="기본급" readOnly/></td>
									<td><input type="text" class="form-control" name="mmDailyPay" id="mmDailyPay" value="0" readOnly/></td>
								</tr>
								<tr>
									<td>2</td>
									<td><input type="text" class="form-control" name="pcSection" value="수당" readOnly/></td>
									<td><input type="text" class="form-control" name="pcClasificar" value="성과급" readOnly/></td>
									<td><input type="text" class="form-control" name="middleClasificar" value="성과급" readOnly/></td>
									<td><input type="text" class="form-control" name="inAmount" id="inAmount" value="0"/></td>
								</tr>
								<tr>
									<td>3</td>
									<td><input type="text" class="form-control" name="pcSection" value="공제" readOnly/></td>
									<td><input type="text" class="form-control" name="pcClasificar" value="4대보험" readOnly/></td>
									<td><input type="text" class="form-control" name="middleClasificar" value="고용보험" readOnly/></td>
									<td><input type="text" class="form-control" name="eiAmount" id="eiAmount" value="0" readOnly/></td>
								</tr>
								<tr>
									<td>4</td>
									<td><input type="text" class="form-control" name="pcSection" value="공제" readOnly/></td>
									<td><input type="text" class="form-control" name="pcClasificar" value="4대보험" readOnly/></td>
									<td><input type="text" class="form-control" name="middleClasificar" value="국민건강보험" readOnly/></td>
									<td><input type="text" class="form-control" name="nhiAmount" id="nhiAmount" value="0" readOnly/></td>
								</tr>
								<tr>
									<td>5</td>
									<td><input type="text" class="form-control" name="pcSection" value="공제" readOnly/></td>
									<td><input type="text" class="form-control" name="pcClasificar" value="4대보험" readOnly/></td>
									<td><input type="text" class="form-control" name="middleClasificar" value="연금보험" readOnly/></td>
									<td><input type="text" class="form-control" name="ppAmount" id="ppAmount" value="0" readOnly/></td>
								</tr>
								<tr>
									<td>6</td>
									<td><input type="text" class="form-control" name="pcSection" value="공제" readOnly/></td>
									<td><input type="text" class="form-control" name="pcClasificar" value="4대보험" readOnly/></td>
									<td><input type="text" class="form-control" name="middleClasificar" value="산재보험" readOnly/></td>
									<td><input type="text" class="form-control" name="ohiAmount" id="ohiAmount" value="0" readOnly/></td>
								</tr>
								<tr>
									<th colspan=4>
										총급여
										<a class="btn-info btn-lg" id="sumBtn">계산</a>
									</th>
									<td><b><input type="text" class="form-control" id="pcAmount" value="0" readOnly/></b></td>
								</tr>
							</table> 
						</div>	
					</div>
					<div class="form-group">
						<label for="mmPassword" class="col-sm-2 control-label">담당사원코드</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="paMmCode" value="${paMmCode}" readOnly/>
						</div>
					</div>
					<div class="form-group" align="center">
						<button type="submit" class="btn-success btn-lg">등록</button>
						<button type="reset" class="btn-success btn-lg">취소</button>
					</div>
				</form>
				<div class="clearfix">&nbsp;</div>
			</div>
		</div>
	</div>
</div>
<script src="<c:url value='/resources/js/bootstrap.min.js'/>" type="text/javascript"></script> 		
</body>
</html>