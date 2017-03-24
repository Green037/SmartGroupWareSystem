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
			
			if(data.check =='성공'){
				var checkMessage = '연차신청이 등록되었습니다';
			}else if(data.check =='실패'){
				var checkMessage = '연차신청에 실패하였습니다';
			}
			$('#goVacation').modal('hide');
			alert(checkMessage);  
		}
	});
});


</script>	

</head> 
<body>
<%@ include file="../menu.jsp" %>
	
	<!-- contents -->
<div class="page-container">
<div class="left-content">
<div class="inner-content">
<div class="outter-wp">	
	<!-- 본문시작 -->
	<div class="sub-heard-part">
		<ol class="breadcrumb m-b-0">
			<li><a href="/">Home</a></li>
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
            	<button type="button" id="esOutWorkBtn" class="btn btn-sq-lg btn-danger">
              		<i class="fa fa-user fa-5x"></i><br/> 출장 신청 <br>
            	</button>
          	</p>
		    </div>
		</div>
	</div>	

<table id="esVaList" class="table table-hover" style="display:none;">
	<thead>
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>직급</th>
			<th>부서</th>
			<th>시작날짜</th>
			<th>복귀날짜</th>
		</tr>
	</thead>
	<tbody id="esVaList">
	
	</tbody>
</table>
				
					
					
					
	<!--  본문 종료 -->
</div>				
</div>
</div>
</div>
<c:import url="./es_vacation.jsp"></c:import> <!--팝업창  연차신청  -->


<%@ include file="../footer.jsp"%>
</body>
</html>