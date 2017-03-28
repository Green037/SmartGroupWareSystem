<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="<c:url value='/resources/css/panelSearch.css'/>" rel="stylesheet">
<link href="<c:url value='/resources/css/panel.css'/>" rel="stylesheet">

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
<script>
//연차신청 
$(document).on('click','#esVaAddBtn',function(){
	$('#goVacation').modal();
	var mmCode = '${sessionScope.mmCode}';
	var mmName = '${sessionScope.mmName}';
	/* console.log('세션코드값, 세션네임값 확인 : '+mmCode+mmName); */
	$('#mmCode_1').val(mmCode);
	$('#mmName_1').val(mmName);
});

//연차신청 버튼 클릭 이벤트 
$(document).on('click','#VaAddBtn',function(){
	var formData = $('#VaAddForm').serialize();
	console.log(formData); 
	if($('#esStartDate').val() == null || $('#esStartDate').val() == '' ){
		alert('시작일을 입력하세요')
		return;
	}else if($('#esEndDate').val() == null || $('#esEndDate').val() == '' ){
		alert('종료일을 입력하세요')
		return;
	}
	$.ajax({
		url : '/smart/es/addEsVa',
		data : formData,
		dataType : 'json',
		type : 'post',
		success : function(data){
			console.log("H2 ajax form esVaAdd Check!");
			console.log(data.check);
			console.log(data);
			console.log(data.extraSchedule.mmName);
			$('#esTbodyDetail').empty();
			$('#esTbodyDetail').css('display','');
			if(data.check =='성공'){
				var checkMessage = '연차신청이 등록되었습니다';
				$('#esTbodyDetail').append(`
					<tr>
						<td>`+data.extraSchedule.esCode+`</td>
						<td>`+data.extraSchedule.mmName+`</td>
						<td>`+data.extraSchedule.esStartDate+`</td>
						<td>`+data.extraSchedule.esEndDate+`</td>
						<td>`+data.extraSchedule.esNote+`</td>
					</tr>`);
			}else if(data.check =='실패'){
				var checkMessage = '연차신청에 실패하였습니다';
			}
			$('#goVacation').modal('hide');
			alert(checkMessage);  
		}
	});
});
//출장신청 
$(document).on('click','#esWorkOutBtn',function(){
	$('#goWorkout').modal();
	var mmCode = '${sessionScope.mmCode}';
	var mmName = '${sessionScope.mmName}';
	/* console.log('세션코드값, 세션네임값 확인 : '+mmCode+mmName); */
	$('#mmCode_2').val(mmCode);
	$('#mmName_2').val(mmName);
});

//출장신청 버튼 클릭 이벤트 
$(document).on('click','#WoAddBtn',function(){
	var formData = $('#WoAddForm').serialize();
	console.log(formData); 
	if($('#esStartDate2').val() == null || $('#esStartDate2').val() == '' ){
		alert('시작일을 입력하세요')
		return;
	}else if($('#esEndDate2').val() == null || $('#esEndDate2').val() == '' ){
		alert('종료일을 입력하세요')
		return;
	}
	$.ajax({
		url : '/smart/es/addEsWo',
		data : formData,
		dataType : 'json',
		type : 'post',
		success : function(data){
			console.log("H2 ajax form esVaAdd Check!");
			console.log(data.check);
			
			if(data.check =='성공'){
				var checkMessage = '출장신청이 등록되었습니다';
				$('#esTbodyDetail').empty();
				$('#esTbodyDetail').css('display','');
				$('#esTbodyDetail').append(`
					<tr>
						<td>`+data.extraSchedule.esCode+`</td>
						<td>`+data.extraSchedule.mmName+`</td>
						<td>`+data.extraSchedule.esStartDate+`</td>
						<td>`+data.extraSchedule.esEndDate+`</td>
						<td>`+data.extraSchedule.esNote+`</td>
					</tr>`);
			}else if(data.check =='실패'){
				var checkMessage = '출장신청에 실패하였습니다';
			}
			$('#goWorkout').modal('hide');
			alert(checkMessage);  
		}
	});
});

$(document).ready(function(){
	$('#mainMenu').css('display','none');
	$('#commute').css('display','');
});

</script>	

</head> 
<body>

<c:import url="../mainIndex.jsp"></c:import>
<!--본문시작 : 윤재호  -->			
<div class="sub-heard-part">
	<ol class="breadcrumb m-b-0">
		<li><a href="<c:url value='/main/mainIndex'/>">Home</a></li>
		<li class="active">근외일정 등록</li>
	</ol>
</div>

<div class="container">
      <div class="row">
        <div class="col-lg-14" align="center">
          <p>
            <button type="button" id="esVaAddBtn" class="btn btn-sq-lg btn-warning">
              	<i class="fa fa-user fa-5x"></i><br/> 연차 신청 <br>
            </button>
           	<button type="button" id="esWorkOutBtn" class="btn btn-sq-lg btn-danger">
             		<i class="fa fa-user fa-5x"></i><br/> 출장 신청 <br>
           	</button>
          </p>
        </div>
	</div>
</div>	

<div class="container">
	<div class="page-header">
		<h1>연차기록부<span class="pull-right label label-default"></span></h1>
	</div>
	<div class="col-md-12">
		<div class="panel with-nav-tabs panel-primary">
			<div class="panel-heading">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#tab1primary" data-toggle="tab">근외일정확인</a></li>
				</ul>
			</div>
			<div class="panel-body">
				<div class="tab-content">
					<div class="tab-pane fade in active" id="tab1primary">
						<table id="esVaList" class="table table-hover">
							<thead>
								<tr>
									<th>번호</th>
									<th>이름</th>
									<th>시작날짜</th>
									<th>복귀날짜</th>
									<th>분류</th>
								</tr>
							</thead>
							<tbody id="esTbodyDetail" style="display:none;">
							
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<c:import url="./es_vacation.jsp"></c:import> <!--팝업창  연차신청  -->
<c:import url="./es_workout.jsp"></c:import> <!--팝업창  연차신청  -->
<script src="<c:url value='/resources/js/bootstrap.min.js'/>" type="text/javascript"></script> 
</body>
</html>