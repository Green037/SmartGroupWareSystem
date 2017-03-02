<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<script>
/* 참여인원 상세보기 */
		$(document).on('click','#pmBtn',function(){
			$('#pmList').modal();
			var prCode = ${project.prCode};
			$.ajax({
				url: '/smart/pm/detail',
				data : {'prCode' : prCode},
				dataType : 'json',
				type : 'POST',
				success : function(data){
					$('#pmListTbody').empty();
					$.each(data,function(i, result){
						/* console.log(result.prCode);
						console.log(result.pmLevel); */
						$('#pmListTbody').append(`
								<tr>
									<td>`+result.prCode+`</td>
									<td>`+result.pmLevel+`</td>
									<td>`+result.pmNote+`</td>
								</tr>`);
					});
				}
			});
		});
		
/* 자금상세내역  */
		$(document).on('click','#fuBtn',function(){
			$('#fuList').modal();
			var prCode = ${project.prCode};
			$.ajax({
				url: '/smart/fu/detail',
				data : {'prCode' : prCode},
				dataType : 'json',
				type : 'POST',
				success : function(data){
					/* console.log('h2 fu Ajax!'); */
					$('#fuListTbody').empty();
					$.each(data,function(i, result){
						/* console.log(result.prCode);
						console.log(result.fuCode); */
						$('#fuListTbody').append(`
							<tr>
								<td>`+result.fuHistory+`</td>
								<td>`+result.fuExpectedMoney+`</td>
								<td>`+result.fuUsedMoney+`</td>
							</tr>`);
					}); 
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
<div class="container">
	<center>
		<h2><span class="glyphicon glyphicon-file"> 기안반려 상세보기</span></h2>
	</center> 
	<marquee behavior="alternate">
		<p style="color:red;">This infomation is detail contents By you selected.</p>
	</marquee>           
	<table class="table table-bordered">
		<thead>
			<tr>
				<th><span class="glyphicon glyphicon-bookmark"></span> 기안코드</th>
				<th colspan="8">
					<center>${draft.dftCode}</center>
				</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td >기안제목</td>
				<td colspan="8" align="center">${draft.dftTitle}</td>
			</tr>
			<tr>
				<td>반려사유</td>
				<td colspan="8"></td>
			</tr>
			
			<tr>
				<td><strong>분류</strong></td>
				<td>프로젝트/고과/임금</td>
				<td></span> 기안등록날자</td>
				<td>${draft.dftDate}</td>
				<td></span> 반려결재날자</td>
				<td>${draft.dftDate}</td>
			</tr>
			
			
			<tr>
				<td><strong>기안자</strong></td>
				<td>${draft.mmCode}</td>
				<td><strong>직급</strong></td>
				<td>-</td>
				<td><strong>부서</strong></td>
				<td>-</td>
			</tr>
			
			<tr>
				<td>결재자</td>
				<td>${draft.proApproval}</td>
				<td>직급</td>
				<td>-</td>
				<td>부서</td>
				<td>-</td>
			</tr>
			
			<tr>
				<td>결재진행현황</td>
				<td>${draft.dftFinalState}</td>
				<td>파일</td>
				<td colspan="6">업로드된 파일</td>
			</tr>
		
			<tr>
				<td colspan="8" align="center">
					<div class="btn-group">
						<a href="<c:url value='/pr/modify?prCode=${project.prCode}'/>" class="btn btn-primary" >
							<span class="glyphicon glyphicon-edit"></span> 목록
						</a>
						<a href="#" class="btn btn-primary" ><span class="glyphicon glyphicon-trash"></span> 삭제</a>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
	
</div>

<%-- 
<c:import url="./pm_list.jsp"></c:import> <!--팝업창, 참여인원리스트  -->
<c:import url="./fu_list.jsp"></c:import> <!--팝업창, 자금상세리스트  -->
 --%>

<!-- 본문끝 -->
</div>				
</div>
</div>
</div>
		
<%@ include file="../footer.jsp"%>
</body>
</html>