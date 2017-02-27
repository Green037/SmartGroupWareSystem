<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<script>
		$(document).on('click','#pmAddBtn',function(){
			$('#putInForList').modal();
			var prCode = ${project.prCode};
			$.ajax({
				url: '/smart/pm/add',
				data : {'prCode' : prCode},
				dataType : 'json',
				type : 'POST',
				success : function(data){
					$('#pmAddListTbody').empty();
					$.each(data, function(i, result){
						/* console.log('h2 modify Ajax!'); */
						$('#pmAddListTbody').append(`
							<tr>
								<td>`+result.prCode+`</td>
								<td>`+result.pmLevel+`</td>
								<td>`+result.pmNote+`</td>
								<td>
									<select name="pmApproval">
										<option value="대기">대기</option>
										<option value="승인">승인</option>
										<option value="반려">반려</option>
									</select>
							</tr>`);
					});
				}
			});
		});
		$(document).on('click','#pmApprovalBtn',function(){
			/* 팝업창 버튼 이벤트 부터 작업하면 됨. */
			$('#pmApprovalForm').attr({action:"#"})
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
		<h2><span class="glyphicon glyphicon-file"> 프로젝트 수정</span></h2>
		<p>This infomation is detail contents By you selected. You can fix contents.</p>
	</center>
	<form action="<c:url value='/pr/modify'/>" method="post" id="modifyForm">            
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>프로젝트코드</th>
					<th colspan="7">
						<center>${project.prCode}</center>
						<input type="hidden" name="prCode" value="${project.prCode}"/>
					</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>프로젝트명</td>
					<td colspan="7">
						<input type="text" name="prName" value="${project.prName}" class="form-control"/>
					</td>
				</tr>
				<tr>
					<td><strong>팀장</strong></td>
					<td colspan="3">-</td>
					<td><strong>직급</strong></td>
					<td>-</td>
					<td><strong>부서</strong></td>
					<td>-</td>
				</tr>
				<tr>
					<td><strong>이메일</strong></td>
					<td colspan="2">-</td>
					<td><strong>전화번호</strong></td>
					<td colspan="2">-</td>
					<td><strong>참여인원</strong></td>
					<td>
						<span>${pmCount}</span> / ${project.prMember}
						<button type="button" id="pmAddBtn">인원추가</button>
						
					</td>
				</tr>
				<tr>
					<td><strong>총자금</strong></td>
					<td>
						${project.prMoney}
						<button type="button" id="fuModifyBtn">내역수정</button>
					</td>
					<td><strong>시작일</strong></td>
					<td colspan="2"><input type="date" name="prStartDay" value="${project.prStartDay}" class="form-control"/></td>
					<td><strong>종료일</strong></td>
					<td colspan="2"><input type="date" name="prEndDay" value="${project.prEndDay}" class="form-control"/></td>
				</tr>
				<tr>
					<td><strong>팀원모집상황</strong></td>
					<td>
						<input type="radio" name="prProgress" value="모집중"/>모집중
						<input type="radio" name="prProgress" value="모집완료"/>모집완료
						<script>
							$('input:radio[name="prProgress"]:radio[value="${project.prProgress}"]').prop("checked",true);
						</script>
					</td>
					<td><strong>분류</strong></td>
					<td>
						<select name="prCate" id="prCate">
							<option value="개발">개발</option>
							<option value="연구">연구</option>
							<option value="유지보수">유지보수</option>
						</select>
						<script>
							$('#prCate').val('${project.prCate}').attr('selected','selected');
						</script>
					</td>
					<td><strong>진행최종승인여부</strong></td>
					<td>
						<select name="prForProgress" id="prForProgress">
							<option value="승인">승인</option>
							<option value="반려">반려</option>
						</select>
						<script>
							$('#"prForProgress"').val('${project.prForProgress}').attr('selected','selected');
						</script>
					</td>
					<td><strong>프로젝트진행상황</strong></td>
					<td>${project.prFinishCheck}</td>
				</tr>
				<tr>
					<td colspan="8" align="center">
						<div class="btn-group">
							<input type="submit" value="수정" id="modifyBtn" class="btn btn-primary" />
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
<c:import url="./pm_addList.jsp"></c:import> <!-- 팝업창 참여인원 추가 지원자 리스트 -->
<!-- 본문끝 -->
</div>				
</div>
</div>
</div>
		
<%@ include file="../footer.jsp"%>
</body>
</html>