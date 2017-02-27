<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<script>
		$(document).ready(function() {
			
			$('#mmButton').click(function() {
				var mmCode = $('#mmCode').val();
				
				alert('mmCode : '+ mmCode);
				
				$.ajax({
					type : "post",
					url : "/smart/pc/mmContent",
					data : mmCode,
					success : function(data) {
						alert('data : ' + data);
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
								<li>총무부권한 > 급여내역추가</li>
							</ol>
						</div>

						<div class="set-1">
							<div class="graph-2 general">
								<div class="grid-1">
									<div class="form-body">
										<form class="form-horizontal" method="post">
											<div class="form-group">
												<label for="mmName" class="col-sm-2 control-label">사원코드</label>
												<div class="col-sm-3">
													<input type="text" id="mmCode" name="mmCode" class="form-control1"/>
													<input type="button" class="btn btn-default" name="mmButton" id="mmButton" value="검색"/>
												</div>
											</div>											
											<div class="form-group">
												<label for="mmEmail" class="col-sm-2 control-label">사원명</label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" value="사원명넣어라" disabled/>
												</div>
											</div>
											<div class="form-group">
												<label for="mmPassword" class="col-sm-2 control-label">급여날짜</label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" name="pcDate" value="${paymentDate}" disabled/>
												</div>
											</div>					
											<div class="form-group">
												<label for="memberInfo" class="col-sm-2 control-label">급여내역</label>
												<div class="col-sm-9">
													<table class="table table-bordered">
														<tr>
															<th>순번</th>
															<th>급여구분</th>
															<th>대분류</th>
															<th>중분류</th>
															<th>급여액</th>
														</tr>
														<tr>
															<td>1</td>
															<td><input type="text" class="form-control1" name="pcSection" value="본봉" disabled/></td>
															<td><input type="text" class="form-control1" name="pcClasificar" value="기본급" disabled/></td>
															<td><input type="text" class="form-control1" name="middleClasificar" value="기본급" disabled/></td>
															<td><input type="text" class="form-control1" value="일급 x 일수" disabled/></td>
														</tr>
														<tr>
															<td>2</td>
															<td><input type="text" class="form-control1" name="pcSection" value="수당" disabled/></td>
															<td><input type="text" class="form-control1" name="pcClasificar" value="성과급" disabled/></td>
															<td><input type="text" class="form-control1" name="middleClasificar" value="성과급" disabled/></td>
															<td><input type="text" class="form-control1" value="0"/></td>
														</tr>
														<tr>
															<td>3</td>
															<td><input type="text" class="form-control1" name="pcSection" value="공제" disabled/></td>
															<td><input type="text" class="form-control1" name="pcClasificar" value="4대보험" disabled/></td>
															<td><input type="text" class="form-control1" name="middleClasificar" value="고용보험" disabled/></td>
															<td><input type="text" class="form-control1" value="본봉 * ${eiContent.eiEmployee}" disabled/></td>
														</tr>
														<tr>
															<td>4</td>
															<td><input type="text" class="form-control1" name="pcSection" value="공제" disabled/></td>
															<td><input type="text" class="form-control1" name="pcClasificar" value="4대보험" disabled/></td>
															<td><input type="text" class="form-control1" name="middleClasificar" value="국민건강보험" disabled/></td>
															<td><input type="text" class="form-control1" value="본봉 * ${nhiContent.nhiEmployee}" disabled/></td>
														</tr>
														<tr>
															<td>5</td>
															<td><input type="text" class="form-control1" name="pcSection" value="공제" disabled/></td>
															<td><input type="text" class="form-control1" name="pcClasificar" value="4대보험" disabled/></td>
															<td><input type="text" class="form-control1" name="middleClasificar" value="연금보험" disabled/></td>
															<td><input type="text" class="form-control1" value="본봉 * ${ppContent.ppEmployee}" disabled/></td>
														</tr>
														<tr>
															<th colspan=4>총급여</th>
															<td><input type="text" class="form-control1" value="1 + 2 - 3 - 4 - 5 - 6" disabled/></td>
														</tr>
													</table> 
												</div>	
											</div>
											<div class="form-group">
												<label for="mmPassword" class="col-sm-2 control-label">담당사원코드</label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" value="로그인한 아이디 넣어라" disabled/>
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