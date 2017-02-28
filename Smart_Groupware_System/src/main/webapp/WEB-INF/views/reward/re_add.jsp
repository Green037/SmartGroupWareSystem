<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>" type="text/javascript"></script>
	<script>
		$(document).ready(function() {
			
			$('#mmButton').click(function() {
				var mmCode = $('#mCodeCheck').val();
				
				console.log('mmCode : '+ mmCode);
				
				$.ajax({
					type : "post",
					url : "/smart/pc/mmContent",
					data : {"mmCode": mmCode},
					success : function(data) {
// 						alert('data.mmCode : ' + data.mmCode);
// 						alert('data.mmName : ' + data.mmName);
// 						
						$('#mmCode').val(data.mmCode);
						$('#mmName').val(data.mmName);
						
// 						alert('mmCode : ' + $('#mmCode').val());
// 						alert('mmName : ' + $('#mmName').val());
					}
				});
			});
		});
	</script>
</head>
<body>
	<%@ include file="../menu.jsp"%>

	<div class="page-container">
		<div class="left-content">
			<div class="inner-content">
				<div class="outter-wp">
					<!-- Home/메뉴  -->
					<div class="outter-wp">
						
						<div class="sub-heard-part">
							<ol class="breadcrumb m-b-0">
								<li><a href="/smart"><b>Home</b></a></li>
								<li>인사부권한 > 고과내역추가</li>
							</ol>
						</div>

						<div class="set-1">
							<div class="graph-2 general">
								<div class="grid-1">
									<div class="form-body">
										<form class="form-horizontal" method="post" action="<c:url value='/re/add'/>">
											<div class="form-group">
												<label for="mmCode" class="col-sm-2 control-label">사원코드</label>
												<div class="col-sm-3">
													<input type="text" id="mCodeCheck" name="mCodeCheck" class="form-control1" placeholder="입력 후 검색 버튼을 누르세요."/>
													<input type="hidden" id="mmCode" name="mmCode"/>
													<input type="button" class="btn btn-default" name="mmButton" id="mmButton" value="검색"/>
												</div>
											</div>											
											<div class="form-group">
												<label for="mmName" class="col-sm-2 control-label">사원명</label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="mmName" placeholder="사원코드를 검색하세요." disabled/>
												</div>
											</div>
											<div class="form-group">
												<label for="reDate" class="col-sm-2 control-label">평가날짜</label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="reDate" name="reDate" placeholder="YYYY-MM-DD"/>
												</div>
											</div>					
											<div class="form-group">
												<label for="reGrade" class="col-sm-2 control-label">평가등급</label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="reGrade" name="reGrade"/>
												</div>
											</div>
											<div class="form-group">
												<label for="reDocument" class="col-sm-2 control-label">고과서류첨부</label>
												<div class="col-sm-3">
													<input type="file" class="form-control1" id="reDocument" name="reDocument" style="border:0px solid black;"/>
												</div>
											</div>
											<div class="form-group">
												<label for="reMmCode" class="col-sm-2 control-label">담당사원코드</label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="reMmCode" name="reMmCode" value="${reMmCode}" disabled/>
												</div>
											</div>
											<div class="form-group" align="center">
												<button type="submit" class="btn btn-default">등록</button>
												<button type="reset" class="btn btn-default">취소</button>
											</div>
										</form>
										<div class="clearfix">&nbsp;</div>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
	
			</div>
		</div>
	</div>
	
	<%@ include file="../footer.jsp"%>
</body>
</html>