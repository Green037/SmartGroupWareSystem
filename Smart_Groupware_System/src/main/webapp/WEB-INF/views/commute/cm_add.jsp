<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>

<script>
	//출근버튼 클릭시 이벤트 - 세션의 접속자 코드, 네임 가져와 팝업창에 세팅함.
	$(document).on('click','#cmOntimeAddBtn',function(){
		$('#onTime').modal();
		var mmCode = '${sessionScope.mmCode}';
		var mmName = '${sessionScope.mmName}';
		/* console.log('세션코드값, 세션네임값 확인 : '+mmCode+mmName); */
		$('#mmCode').val(mmCode);
		$('#mmName').val(mmName);
	});
	
	//출근버튼 클릭시 이벤트 - ajax로 입력처리 후 맵타입으로 리턴받아 입력성공여부 체크.
	$(document).on('click','#onTimeBtn',function(){
		var formData = $('#onTimeForm').serialize();
		/* console.log(formData); */
		$.ajax({
			url : '/smart/cm/addOnTime',
			data : formData,
			dataType : 'json',
			type : 'post',
			success : function(data){
				/* console.log("H2 ajax form Ontime Check!");
				console.log(data.check); */
				if(data.check=='성공'){
					var checkMessage = '출근체크 되었습니다';
				}else if(data.check=='실패'){
					var checkMessage = '출근체크에 실패하였습니다';
				}else{
					var checkMessage = data.check;
				}
				$('#onTime').modal('hide');
				alert(checkMessage);
			}
		});
	});
	
	//퇴근체크 버튼 클릭 이벤트 - 세션 아이디, 네임값 세팅.
	$(document).on('click','#cmOfftimeAddBtn',function(){
		$('#offTime').modal();
		var mmCode = '${sessionScope.mmCode}';
		var mmName = '${sessionScope.mmName}';
		/* console.log('세션코드값, 세션네임값 확인 : '+mmCode+mmName); */
		$('#mmCode_').val(mmCode);
		$('#mmName_').val(mmName);
	});
	
	//퇴근버튼 클릭 이벤트 - ajax로 수정처리 후 맵타입으로 리턴받아 수정성공여부 체크.
	$(document).on('click','#offTimeBtn',function(){
		var formData = $('#offTimeForm').serialize();
		/* console.log(formData); */
		$.ajax({
			url : '/smart/cm/addOffTime',
			data : formData,
			dataType : 'json',
			type : 'post',
			success : function(data){
				console.log("H2 ajax form Offtime Check!");
				console.log(data.check); 
				if(data.check=='성공'){
					var checkMessage = '퇴근체크 되었습니다';
				}else if(data.check=='실패'){
					var checkMessage = '퇴근체크에 실패하였습니다';
				}else{
					var checkMessage = data.check;
				}
				$('#offTime').modal('hide');
				alert(checkMessage);
			}
		});
	});
	
	//외출등록 
	$(document).on('click','#cmGoOutBtn',function(){
		$('#goOut').modal();
		var mmCode = '${sessionScope.mmCode}';
		var mmName = '${sessionScope.mmName}';
		/* console.log('세션코드값, 세션네임값 확인 : '+mmCode+mmName); */
		$('#mmCode_1').val(mmCode);
		$('#mmName_1').val(mmName);
	});
	
	//외출등록 버튼 클릭 이벤트 - 기존 출근 기록 가져와서 외출시간 등록하기.
	$(document).on('click','#goOutBtn',function(){
		var formData = $('#goOutForm').serialize();
		console.log(formData); 
		$.ajax({
			url : '/smart/cm/addGoOut',
			data : formData,
			dataType : 'json',
			type : 'post',
			success : function(data){
				console.log("H2 ajax form GoOutTime Check!");
				console.log(data.check); 
				if(data.check=='성공'){
					var checkMessage = '외출등록 되었습니다';
				}else if(data.check=='실패'){
					var checkMessage = '외출등록에 실패하였습니다';
				}else{
					var checkMessage = data.check;
				}
				$('#goOut').modal('hide');
				alert(checkMessage);
			}
		});
	});
	
	//외출복귀
	$(document).on('click','#cmReturnBtn',function(){
		$('#goReturn').modal();
		var mmCode = '${sessionScope.mmCode}';
		var mmName = '${sessionScope.mmName}';
		/* console.log('세션코드값, 세션네임값 확인 : '+mmCode+mmName); */
		$('#mmCode_2').val(mmCode);
		$('#mmName_2').val(mmName);
	});
	
	//외출복귀 버튼 클릭 이벤트 - 기존 외출자 기록 가져와서 외출복귀시간 등록하기.
	$(document).on('click','#goReturnBtn',function(){
		var formData = $('#goReturnForm').serialize();
		console.log(formData); 
		$.ajax({
			url : '/smart/cm/addReturn',
			data : formData,
			dataType : 'json',
			type : 'post',
			success : function(data){
				console.log("H2 ajax form returnTime Check!");
				console.log(data.check); 
				if(data.check=='성공'){
					var checkMessage = '외출복귀등록 되었습니다';
				}else if(data.check=='실패'){
					var checkMessage = '외출복귀등록에 실패하였습니다';
				}else{
					var checkMessage = data.check;
				}
				$('#goReturn').modal('hide');
				alert(checkMessage);
			}
		});
	});
</script>
</head> 
<body>
<%@ include file="../menu.jsp" %>
<div class="page-container">
<div class="left-content">
<div class="inner-content">
<div class="outter-wp">	
<!--본문시작 : 윤재호  -->			
<div class="sub-heard-part">
	<ol class="breadcrumb m-b-0">
		<li><a href="/">Home</a></li>
		<li class="active">근무상태 등록</li>
	</ol>
</div>
<div class="container">
      <div class="row">
        <div class="col-lg-14" align="center">
          <p>
            <button type="button" id="cmOntimeAddBtn" class="btn btn-sq-lg btn-primary">
                <i class="fa fa-user fa-5x"></i><br/> 출근 등록 <br>
            </button>
            <button type ="button" id="cmOfftimeAddBtn" class="btn btn-sq-lg btn-success">
              <i class="fa fa-user fa-5x"></i><br/> 퇴근 등록 <br>
            </button>
            <button type="button" id="cmGoOutBtn" class="btn btn-sq-lg btn-warning">
              <i class="fa fa-user fa-5x"></i><br/> 외출 등록 <br>
            </button>
            <button type="button" id="cmReturnBtn" class="btn btn-sq-lg btn-danger">
              <i class="fa fa-user fa-5x"></i><br/> 외출 복귀 <br>
            </button>
          </p>
        </div>
	</div>
</div>	

<table id="cmaddList" class="table table-hover" style="display:none;">
	<thead>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>직급</th>
			<th>부서</th>
			<th>날짜</th>
			<th>#</th>
		</tr>
	</thead>
	<tbody id="cmaddList">
	
	</tbody>
</table>

<!-- 본문 끝 -->
</div>				
</div>
</div>
</div>
<c:import url="./cm_onTime.jsp"></c:import> <!--팝업창 출근체크  -->
<c:import url="./cm_offTime.jsp"></c:import> <!--팝업창 퇴근체크  -->
<c:import url="./cm_goOut.jsp"></c:import> <!--팝업창 외출등록  -->
<c:import url="./cm_goReturn.jsp"></c:import> <!--팝업창 외출복귀  -->

<%@ include file="../footer.jsp"%>
</body>
</html>