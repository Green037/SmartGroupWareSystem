<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<link href="<c:url value='/resources/css/evAdd.css'/>" rel="stylesheet" type="text/css"/>
	<link href="<c:url value='/resources/css/panelSearch.css'/>" rel="stylesheet">
	<link href="<c:url value='/resources/css/panel.css'/> rel="stylesheet">
	
	<script>
	//전자결제창 기본값 세팅하기
	$(document).on('click','#evApprovalBtn',function(){
		$('#approvalForm').modal();
		$.ajax({
			url : '/smart/ap/evApproval',
			dataType : 'json',
			type : 'post',
			cache : false,
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
	
	// 전자결제 신청 
	$(document).on('click','#appApplyBtn',function(){
		var formData = $('#evApprovalForm').serialize();
		console.log(formData);
		/* $.ajax({
			url : 'smart/ap/addApply',
			data : formData
		}); */
	});
	
	// 완료보고서 작성된 플젝 리스트로 돌아가기 이벤트.
	/* $(document).on('click','#evPrListBtn',function(){
		$('#reloadListForm').attr({action:'<c:url value="/ev/list"/>',method:"post"}).submit();
	}); */
	
	$(document).ready(function(){
		$('#mainMenu').css('display','none');
		$('#project').css('display','');
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
		<li class="active">완료보고서 상세보기</li>
	</ol>
</div>	

<div class="container">
	<div class="row">
		<div class="col-md-12" align="center">
			<a href="<c:url value="/ev/list"/>" class="btn btn-info" id="evPrListBtn" role="button"><span class="glyphicon glyphicon-step-backward glyphsize"></span> <br/>리스트<br/>돌아가기</a>
			<a href="#" class="btn btn-info" id="evApprovalBtn" role="button"><span class="glyphicon glyphicon-ok-sign glyphsize"></span> <br/>전자결제<br/>바로가기</a>
		</div>   
	</div>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">내프로젝트 목록</h3>
					<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
				</div>
			<div class="panel-body">
				<form id="evPrForm">
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
								<td colspan="7">${prEval.evPrResult}</td>
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
							<c:forEach var="evalList" items="${evalList}">
								<tr>
									<input type="hidden" name="mmCodes" value="${evalList.mmCode}"/>
									<td style="width:120px;">${evalList.mmName}</td>
									<td>${evalList.evEval}</td>
									<td style="width:120px;">${evalList.evIntegrity}</td>
									<td style="width:120px;">${evalList.evProfessional}</td>
									<td style="width:120px;">${evalList.evSociability}</td>
									<td style="width:120px;">${evalList.evTotalScore}</td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td colspan="8" align="center">
									<br/><br/>
									<h3>상기와 같이 프로젝트를 보고합니다.</h3>
									<br/><br/><br/>
									<h3 align="right">팀장 ${mmMap.mmName}</h3>
								</td>
							</tr>
						</tfoot>
					</table>
		<!-- <button type="submit" class="btn btn-warning btn-block" id="evAddBtn">
			<span class="glyphicon glyphicon-pencil"></span> 등록하기
		</button> -->
				</form>
			</div>
		</div>
	</div>
</div>
<br/><br/><br/><br/><br/><br/><br/><br/>
<c:import url="./ap_form.jsp"></c:import> <!-- 팝업창 전자결제 -->
<c:import url="../approve/ap_aprAdd.jsp"></c:import> <!-- 팝업창, 결제라인불러오기 -->
<script src="<c:url value='/resources/js/bootstrap.min.js'/>" type="text/javascript"></script> 
</body>
</html>