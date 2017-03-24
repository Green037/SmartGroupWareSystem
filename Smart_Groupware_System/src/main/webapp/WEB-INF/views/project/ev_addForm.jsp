<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<link href="<c:url value='/resources/css/evAdd.css'/>" rel="stylesheet" type="text/css"/>
	<script>
	// 프로젝트 평가보고서 폼 등장!
	$(document).on('click','#evPrAddBtn',function(){
		$('#evPrForm').css('display','');
	});
	
	//숫자인지 체크 하는 함수 
	function numberCheck(num) { 
		for (i=0; i<num.length; i++) { 
			var check = num.substr(i, 1); 
			if (check < "0" || check > "9") return false; 
		} 
		return true; 
	}
	
	/* //입력값 유효성 검사
	$(document).on('click','#evAddBtn',function(){
		if($('input[name="evPrResult"]').val().trim() == ''){
			alert('프로젝트 성과를 입력해주세요!');
			$('input[name="evPrResult"]').focus();
			return;
		}else if($('input[name="evEval"]').val().trim() == ''){
			alert('종합평가 내용을 입력해주세요');
			$('input[name="evPrResult"]').focus();
			return;
		}else if($('input[name="evIntegrity"]').val().trim() == ''){
			alert('성실성 점수를 입력해주세요');
			$('input[name="evIntegrity"]').focus();
			return;
		}else if(!numberCheck($('input[name="evIntegrity"]').val().trim())){
			alert('성실성 점수는 숫자만 입력가능합니다.');
			$('input[name="evIntegrity"]').focus();
			return;
		}else if($('input[name="evProfessional"]').val().trim() == ''){
			alert('전문성 점수를 입력해주세요');
			$('input[name="evProfessional"]').focus();
			return;
		}else if(!numberCheck($('input[name="evProfessional"]').val().trim())){
			alert('전문성 점수는 숫자만 입력가능합니다.');
			$('input[name="evProfessional"]').focus();
			return;
		}else if($('input[name="evSociability"]').val().trim() == ''){
			alert('사교성 점수를 입력해주세요');
			$('input[name="evSociability"]').focus();
			return;
		}else if(!numberCheck($('input[name="evSociability"]').val().trim())){
			alert('사교성 점수는 숫자만 입력가능합니다.');
			$('input[name="evSociability"]').focus();
			return;
		}
	}); */
	
	//고과총점 입력부분에 포커스 이벤트 - 성실,사교,전문성 점수의 평균을 자동으로 연산해서 세팅해주는 이벤트
	$(document).on('focus','#evTotalScore',function(){
		var inScore = $(this).parent().parent().find('#evIntegrity').val();
		var prScore = $(this).parent().parent().find('#evProfessional').val();
		var soScore = $(this).parent().parent().find('#evSociability').val();
		/* console.log(inScore+'+'+prScore+'+'+soScore);  */
			
		// 입력값 유효성검사.
		if(inScore == ''){
			$(this).parent().parent().find('#evIntegrity').focus();
			return;
		}else if(prScore == ''){
			$(this).parent().parent().find('#evProfessional').focus();
			return;
		}else if(soScore == ''){
			$(this).parent().parent().find('#evSociability').focus();
			return;
		}
		
		var average = parseInt((parseInt(inScore)+parseInt(prScore)+parseInt(soScore))/3);
		/* console.log(average); */
		$(this).val(average);
	});
	
	//전자결제창 기본값 세팅하기
	$(document).on('click','#evApprovalBtn',function(){
		$('#approvalForm').modal();
		$.ajax({
			url : '/smart/ap/evApproval',
			dataType : 'json',
			type : 'post',
			success : function(data){
				/* console.log('평가보고서 전자결제 ajax폼'); */
				$('#docCode').empty();
				/* 문서분류 세팅 */
				$.each(data.doc, function(i, doc){
					$('#docCode').append(`
						<option value="`+doc.docCode+`">`+doc.docFileGroup+`</option>`);
				});
				/* 결제라인별 부서세팅 */
				$.each(data.dep, function(i, dep){
					$('#depSearch1').append(`
						<option value="`+dep.dpCode+`">`+dep.dpName+`</option>`);
					$('#depSearch2').append(`
							<option value="`+dep.dpCode+`">`+dep.dpName+`</option>`);
					$('#depSearch3').append(`
							<option value="`+dep.dpCode+`">`+dep.dpName+`</option>`);
				});
				/* 결제라인별 직급세팅 */
				$.each(data.pos, function(i, pos){
					$('#posSearch1').append(`
						<option value="`+pos.ptCode+`">`+pos.ptName+`</option>`);
					$('#posSearch2').append(`
							<option value="`+pos.ptCode+`">`+pos.ptName+`</option>`);
					$('#posSearch3').append(`
							<option value="`+pos.ptCode+`">`+pos.ptName+`</option>`);
				});
			}
		});
	});
	
	/* 1차 결재선  */
	$(document).on('focus','#aprApproval1',function(){
		var department = $('#depSearch1').val();
		var position = $('#posSearch1').val();
			console.log(department);
			console.log(position);
		$.ajax({
			url : '/smart/ap/addMm',
			data : {"dpCode":department, "ptCode":position},
			dataType : 'json',
			type : 'post',
			success : function(data){
				console.log('h1');
				console.log(data);
				$.each(data, function(i, member){
					$('#1').after(`
							<option value="`+member.mmCode+`">`+member.mmName+`</option>
					`)
					});
				}
			
		})
	})
	
	/* 2차 결재선 */
	$(document).on('focus','#aprApproval2',function(){
		var department = $('#depSearch2').val();
		var position = $('#posSearch2').val();
			console.log(department);
			console.log(position);
		$.ajax({
			url : '/smart/ap/addMm',
			data : {"dpCode":department, "ptCode":position},
			dataType : 'json',
			type : 'post',
			success : function(data){
				console.log('h2');
				console.log(data);
				$.each(data, function(i, member){
					$('#2').after(`
							<option value="`+member.mmCode+`">`+member.mmName+`</option>
					`)
					});
			
			}
		})
	})
	
	/* 3차 결재선 */
	$(document).on('focus','#aprApproval3',function(){
		var department = $('#depSearch3').val();
		var position = $('#posSearch3').val();
			console.log(department);
			console.log(position);
		$.ajax({
			url : '/smart/ap/addMm',
			data : {"dpCode":department, "ptCode":position},
			dataType : 'json',
			type : 'post',
			success : function(data){
				console.log('h3');
				console.log(data);
				$.each(data, function(i, member){
					$('#3').after(`
							<option value="`+member.mmCode+`">`+member.mmName+`</option>
					`)
				});
			}
		
		})
	})
	
	/* 결재라인 저장하기  */
	$(document).on('click','#aprSaveBtn',function(){
		console.log('결재선 확인')
		var data = $('#evApprovalForm').serialize();
		console.log('폼데이터확인:'+data); 
		$.ajax ({
			url:'/smart/ap/addApr',
			type : 'POST',
			data : data,
			dataTpye : 'json',
			success : function(data){
				console.log('결재선 원');
				console.log(data);
				if(data !=0){
					alert('입력되었습니다') 
				}else{
					alert('다시 시도하세요')
					}
				}
			
		})
	})
	 	
	/* 결재라인 불러오기 */
	$(document).on('click','#aprGetBtn',function(){
		$('#putInAprFom').modal();
		var mmCode = ${sessionScope.mmCode};
		console.log('h1'+mmCode);
		
		$.ajax({
			url:'/smart/ap/listApr',
			type : 'POST',
			data : { 'mmCode' : mmCode },
			dataType : 'json',
			success : function(data){
				console.log('성공');
				$('#aprListForm').empty();
				console.log(data[0].aprCode);
				$.each(data,function(i, apr){
					$('#aprListForm').append(`
							<tr>
								<td id="1">`+apr.aprCode+`</td>
								<td>`+apr.aprName1+`</td>
								<td>`+apr.aprName2+`</td>
								<td>`+apr.aprName3+`</td>
								<td><button type = "button" id="aprChoBtn">선택</button></td>
							</tr>`);
				})
			
			}
		})
	
	})
	
	/* 결재선 화면에 뿌려주기  */
	$(document).on('click','#aprChoBtn', function(){
		var aprCode = $(this).parent().parent().children('#1').text();
		console.log(aprCode)
		
		$.ajax({
			url: '/smart/ap/selApr',
			data : { 'aprCode' : aprCode },
			type : 'POST',
			dataType : 'json',
			success : function(data){
				console.log('결재선성공');
				console.log('이름:'+data.map1.mmName);
				console.log($('#aprApproval1').val());
				 $('#depSearch1').val(data.map1.dpCode).attr('selected','selected');
				 $('#posSearch1').val(data.map1.ptCode).attr('selected','selected');
				 $('#1').after('<option value="'+data.map1.mmCode+'">'+data.map1.mmName+'</option>');
				 $('#aprApproval1').val(data.map1.mmCode).attr('selected','selected');
				 
				 $('#depSearch2').val(data.map2.dpCode).attr('selected','selected');
				 $('#posSearch2').val(data.map2.ptCode).attr('selected','selected'); 
				 $('#2').after('<option value="'+data.map2.mmCode+'">'+data.map2.mmName+'</option>');
				 $('#aprApproval2').val(data.map2.mmCode).attr('selected','selected'); 
				 
				 $('#depSearch3').val(data.map3.dpCode).attr('selected','selected');
				 $('#posSearch3').val(data.map3.ptCode).attr('selected','selected'); 
				 $('#3').after('<option value="'+data.map3.mmCode+'">'+data.map3.mmName+'</option>');
				 $('#aprApproval3').val(data.map3.mmCode).attr('selected','selected'); 
				 $('#putInAprFom').modal('hide'); 
			}
			
		});
		
	})
	
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
<div class="container">
	<center>
		<h2><span class="glyphicon glyphicon-pencil"> 평가보고서 등록</span></h2>
	</center>
	<marquee behavior="alternate">
		<span style="color:red;">First.</span>
		<span style="color:blue;"> 입력할 평가보고서 종류를 선택하세요.</span>
		<span style="color:red;">Second.</span>
		<span style="color:blue;">작성 후 등록 버튼을 누르면 등록됩니다.</span>
	</marquee>
	
	<div class="row">
		<div class="col-md-12">
			<button class="btn btn-success orange-circle-button" id="evPrAddBtn">
				프로젝트<br />평가보고서<br /><span class="orange-circle-greater-than">Go!!</span>
			</button>
			<button class="btn btn-warning orange-circle-button" id="evApprovalBtn">
				전자결제<br />바로가기<br /><span class="orange-circle-greater-than">Go!!</span>
			</button>
		</div>   
	</div>
	
	<form id="evPrForm" style="display:none;" action="<c:url value='/ev/add'/>" method="post">
		<table class="table table-bordered">
			<thead>
				<tr>
					<th><span class="glyphicon glyphicon-bookmark"></span> 프로젝트코드</th>
					<th colspan="7">
						<input type="hidden" name="prCode" value="${project.prCode}"/>
						<input type="hidden" name="mmCode" value="${project.prMemberCode}"/>
						<center>${project.prCode}</center>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td><span class="glyphicon glyphicon-list-alt"></span> 프로젝트명</td>
					<td colspan="7" align="center">${project.prName}</td>
				</tr>
				<tr>
					<td rowspan="3"><span class="glyphicon glyphicon-king"></span> 팀장</td>
					<td><span class="glyphicon glyphicon-flag"></span> 부서및직급</td>
					<td colspan="5">${mmMap.dpName}   ${mmMap.ptName}</td>
				</tr>
				<tr>
					<td>이름</td>
					<td colspan="5">${mmMap.mmName}</td>
				</tr>
				<tr>
					<td><strong><span class="glyphicon glyphicon-envelope"></span> 이메일</strong></td>
					<td>${mmMap.mmEmail}</td>
					<td><strong><span class="glyphicon glyphicon-earphone"></span> 전화번호</strong></td>
					<td colspan="3">${mmMap.mmTel}</td>
					
				</tr>
				<tr>
					<td><strong><span class="glyphicon glyphicon-usd"></span> 총자금</strong></td>
					<td colspan="7">${project.prMoney}</td>
				</tr>
				<tr>	
					<td><strong><span class="glyphicon glyphicon-calendar"></span> 프로젝트기간</strong></td>
					<td colspan="7">${project.prStartDay} ~ ${project.prEndDay}</td>
				</tr>
				<tr>
					<td><span class="glyphicon glyphicon-comment"></span> 프로젝트성과</td>
					<td colspan="7"><input type="text" class="form-control" name="evPrResult" placeholder="프로젝트 성과를 입력해주세요"/></td>
				</tr>
				<tr>
					<!-- td값 rowspan으로 참여인원 수만큼 값으로 세팅. -->
					<td rowspan="${project.prMember + 1}"><span class="glyphicon glyphicon-check"></span> 팀평가</td>
					<td>성명</td>
					<td>평가</td>
					<td>성실성(100)</td>
					<td>전문성(100)</td>
					<td>사교성(100)</td>
					<td>고과총점</td>
				</tr>
				<c:forEach var="pm" items="${pmList}">
					<tr>
						<input type="hidden" name="mmCodes" value="${pm.mmCode}"/>
						<td style="width:120px;"><input type="text" value="${pm.mmName}" name="mmName" class="form-control" readonly="readonly"/></td>
						<td><input type="text" name="evEvals" class="form-control" id="evEval" placeholder="종합평가"/></td>
						<td style="width:120px;"><input type="text" name="evIntegritys" id="evIntegrity" class="form-control" /></td>
						<td style="width:120px;"><input type="text" name="evProfessionals" id="evProfessional" class="form-control" /></td>
						<td style="width:120px;"><input type="text" name="evSociabilitys" id="evSociability" class="form-control" /></td>
						<td style="width:120px;"><input type="text" name="evTotalScores" id="evTotalScore" class="form-control" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<button type="submit" class="btn btn-warning btn-block" id="evAddBtn">
			<span class="glyphicon glyphicon-pencil"></span> 등록하기
		</button>
	</form>
</div>

<!-- 본문끝 -->
</div>				
</div>
</div>
</div>
<c:import url="./ap_form.jsp"></c:import> <!-- 팝업창 전자결제 -->
<c:import url="../approve/ap_aprAdd.jsp"></c:import> <!-- 팝업창, 결제라인불러오기 -->
<%@ include file="../footer.jsp"%>
</body>
</html>