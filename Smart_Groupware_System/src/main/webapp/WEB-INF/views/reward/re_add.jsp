<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
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
										<form class="form-horizontal" method="post">
											<div class="form-group">
												<label for="mmCode" class="col-sm-2 control-label">사원코드</label>
												<div class="col-sm-3">
													<span style="color:red">사원코드넣어라</span>
													<input type="hidden" id="mmCode" name="mmCode"/>
													<a class="btn green">검색</a>
												</div>
											</div>											
											<div class="form-group">
												<label for="mmName" class="col-sm-2 control-label">사원명</label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" name="mmName" id="mmName" value="사원명넣어라" disabled/>
												</div>
											</div>
											<div class="form-group">
												<label for="reDate" class="col-sm-2 control-label">평가날짜</label>
												<div class="col-sm-3">
													<input type="date" class="form-control1" id="reDate" name="reDate"/>
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
													<input type="text" class="form-control1" id="reMmCode" name="reMmCode" value="로그인한 아이디 넣어라" disabled/>
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