<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script>
		function removeCheck(reCode) {
// 			console.log('reCode : ' + reCode);

			$("#checkMember").modal();
			
			$("#checkMemberBtn").click(function() {
				var memberData = $("#mmPassword").val();
				
// 				console.log('memberData : ' + memberData);

				$.ajax({
					url: '/smart/re/mmContent',
					data : {"memberData": memberData, "reCode": reCode},
					type : 'POST',
					success : function(data) {

						alert('정말 삭제하시겠습니까?');
						
						if (data == true) {
							$('#checkMember').modal('hide');
							
							location.href = "<c:url value='/re/remove'/>";
						} else {
							alert('비밀번호가 일치하지 않습니다.');
						}						
					}
				}); 
			});
		}
	</script>
</head> 
<body>
	<%@ include file="../menu.jsp" %>
	
	<!-- contents -->
	<div class="page-container">
		<div class="left-content">
			<div class="inner-content">
				<div class="outter-wp">
					
					<div class="sub-heard-part">
						<ol class="breadcrumb m-b-0">
							<li><a href="/smart"><b>Home</b></a></li>
							<li>총고과목록</li>
						</ol>
					</div>
			
					<div class="forms-main">
						<div class="graph-form">
							<div class="validation-form">
								<label class="control-label"><b>고과목록 (총 ${rewardCount} 건)</b></label>
								<table class="table table-bordered">
									<tr>
										<th>순번</th>
										<th>고과코드</th>
										<th>사원명</th>
										<th>평가등급</th>
										<th>평가날짜</th>
										<th>고과서류첨부</th>
										<th>담당사원코드</th>
										<th>수정 / 삭제</th>
									</tr>
									
									<c:forEach var="reward" items="${reList}" varStatus="status">
										<tr>
											<td>${status.count}</td>
											<td><a href="<c:url value='/re/mmContent?reCode=${reward.reCode}'/>">${reward.reCode}</a></td>
											<td>${reward.mmCode}</td>
											<td>${reward.reGrade}</td>
											<td>${reward.reDate}</td>
											<td><a href="<c:url value='/re/fileDownload?reCode=${reward.reCode}'/>">${reward.reDocument}</a></td>
											<td>${reward.reMmCode}</td>
											<td>
												<a href="<c:url value='/re/modify?reCode=${reward.reCode}'/>" class="btn btn-primary">
													<span class="glyphicon glyphicon-edit"></span> 수정
												</a>
												<a href="#" onclick="removeCheck(${reward.reCode})" class="btn btn-primary">
													<span class="glyphicon glyphicon-trash"></span> 삭제
												</a>
											</td>
										</tr>
									</c:forEach>
								</table> 
								<div class="clearfix">&nbsp;</div>		
								
								<div align="center">
									<form class="form-inline">
										<div class="form-group">
											<select class="form-control1">
												<option>-옵션 선택-</option>
												<option value="paCode">고과코드</option>
												<option>사원코드</option>
												<option value="paDay">평가등급</option>
												<option value="paCalculateDate">평가날짜</option>
												<option value="paDate">담당사원코드</option>
											</select>
											</div>
											<div class="form-group">
												<input type="text" class="form-control1"/>
											</div>
											<div class="form-group">
												<button class="btn btn-primary" type="submit">검색</button>
											</div>
										</form>
									</div>
								<div class="clearfix">&nbsp;</div>			
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
		
	<c:import url="./re_checkMemberForm.jsp"></c:import>	
	<%@ include file="../footer.jsp"%>
</body>
</html>