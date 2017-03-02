<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
</head> 

<body>
<!--본문시작  -->
<div class="modal fade" id="checkMember" role="dialog">
<div class="modal-dialog">

<!-- Modal content-->
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 style="color:red;"><span class="glyphicon glyphicon-check"></span> 팀장정보확인</h4>
		</div>
		<div class="modal-body">
			<form role="form" id="checkMemberForm">
				<div class="form-group">
					<label for="mmCode">
						<span class="glyphicon glyphicon-user"></span> 
						팀장코드
					</label>
					<input type="text" class="form-control" name="mmCode" id="mmCode" placeholder="사원코드를 입력하세요">
				</div>
				<div class="form-group">
					<label for="mmPassword">
						<span class="glyphicon glyphicon-lock"></span> 
						비밀번호
					</label>
					<input type="password" class="form-control" name="mmPassword" id="mmPassword" placeholder="비밀번호를 입력하세요">
				</div>
				<button type="button" class="btn btn-default btn-success btn-block" id="checkMemberBtn">
					<span class="glyphicon glyphicon-off"></span>
					 프로젝트조회
				</button>
			</form>
		</div>
		<div class="modal-footer">
			
		</div>
	</div>
</div>
</div> 

</body>
</html>