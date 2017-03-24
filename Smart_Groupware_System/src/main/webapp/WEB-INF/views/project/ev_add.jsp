<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<link href="<c:url value='/resources/css/evAdd.css'/>" rel="stylesheet" type="text/css"/>
	<link href="<c:url value='/resources/css/button.css'/>" rel="stylesheet" type="text/css"/>
	
	<script>
		// 사원코드로 프로젝트 찾기
		$(document).on('click','#searchProjectBtn',function(){
			$('#checkMember').modal();
			$('#mmCode').val(31);
			$('#mmPassword').val(123456);
		});
		
		//팀장코드로 프로젝트 확인하기
		$(document).on('click','#checkMemberBtn',function(){
			var params = $('#checkMemberForm').serialize();
			console.log(params);
			$.ajax({
				url : '/smart/wbs/checkMember',
				data : params,
				dataType : 'json',
				type : 'POST',
				success : function(data){
					/* console.log('h2 ajax WBS AddForm!');
					console.log(data);  */
					if(data.result){
						$('#prListTbody').empty();
						$.each(data.prList, function(i, result){
						/* console.log(result.prCode); */
							$('#projectList').css('display','');
							$('#prListTbody').append(`
								<tr>
									<td id="prCode_">`+result.prCode+`</td>
									<td>`+result.prName+`</td>
									<td>`+result.prMemberCode+`</td>
									<td>`+result.prProgress+`</td>
									<td>`+result.prCate+`</td>
									<td>`+result.prStartDay+`</td>
									<td>`+result.prEndDay+`</td>
									<td><a href="#" id="choiceBtn">선택</a></td>
								</tr>`);
						});
						$('#checkMember').modal('hide');
					}else{
						alert(data.check+"이(가) 불일치 합니다 다시 입력해주세요.");
					}
				}
			});
		});
		
		// 선택된 프로젝트 평가보고서 폼 연결하기
		$(document).on('click','#choiceBtn',function(){
			var prCode = $('#prCode_').text();
			console.log(prCode);
			$('#choiceBtn').attr({href:"<c:url value='/ev/addForm?prCode="+prCode+"'/>"}).submit();
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
		
		// 전자결제 신청 
		$(document).on('click','#appApplyBtn',function(){
			var formData = $('#evApprovalForm').serialize();
			console.log(formData);
			/* $.ajax({
				url : 'smart/ap/addApply',
				data : formData
			}); */
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
<div class="container">
	<center>
		<h2><span class="glyphicon glyphicon-pencil"> 평가보고서 등록</span></h2>
	</center>
	<span style="color:red;">First.</span>
	<span style="color:blue;"> 본인의 프로젝트를 먼저 검색하세요</span>
	<span style="color:red;">Second.</span>
	<span style="color:blue;">팀장정보를 체크하고 일치하면 보고서를 작성해주세요</span>
	
	
	<div class="row">
		<div id="ballMenuContainer">
			<div id="menuBall1" class="menuBall">
				<a href="#" id="searchProjectBtn" class="ball blueball">
					<div class="menuText">
						검색
					</div>
				</a>
			</div>
			<div id="menuBall2" class="menuBall">
				<a href="#" id="evApprovalBtn" class="ball redball">
					<div class="menuText">
						전자결제
					</div>
				</a>
			</div>
		</div>
	</div>
	
	<!-- <button type="button" id="searchProjectBtn" class="btn btn-primary">내 프로젝트 검색</button> -->
	<!-- <div class="row">
		<div class="col-md-12">
			<button class="btn btn-primary orange-circle-button" id="searchProjectBtn">
				내프로젝트<br />검색<br /><span class="orange-circle-greater-than">Go!!</span>
			</button>
			전자결제 팝업창 만들어 주면 팀장코드 확인하고 바로 플젝세팅하면됨. 
			<button class="btn btn-warning orange-circle-button" id="evApprovalBtn">
				전자결제<br />바로가기<br /><span class="orange-circle-greater-than">Go!!</span>
			</button>
		</div>   
	</div> -->

	<table id="projectList" class="table table-hover" style="display:none;">
		<thead>
			<tr>
			
				<th>코드</th>
				<th>프로젝트명</th>
				<th>팀장</th>
				<th>인원모집상황</th>
				<th>분류</th>
				<th>시작일</th>
				<th>종료일</th>
				<th>#</th>
			</tr>
		</thead>
		<tbody id="prListTbody">
		
		</tbody>
	</table>
</div>
</div>
</div>

<!-- 본문 끝 -->

</div>				
</div>
</div>
</div>
<c:import url="../wbs/wbs_checkMemberForm.jsp"></c:import>	<!--팝업창 팀장확인  -->
<c:import url="./ap_form.jsp"></c:import> <!-- 팝업창 전자결제 -->
<c:import url="../approve/ap_aprAdd.jsp"></c:import> <!-- 팝업창, 결제라인불러오기 -->
<%@ include file="../footer.jsp"%>
</body>
</html>