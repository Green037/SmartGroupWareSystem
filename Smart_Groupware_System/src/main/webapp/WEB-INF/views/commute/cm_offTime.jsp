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
<div class="modal fade" id="offTime" role="dialog">
<div class="modal-dialog">

<!-- Modal content-->
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 style="color:red;"><span class="glyphicon glyphicon-check"></span> 퇴근체크</h4>
		</div>
		<div class="modal-body">
			<form role="form" id="offTimeForm">
				<div class="form-group">
					<label for="mmCode">
						<span class="glyphicon glyphicon-user"></span> 
						사원코드
					</label>
					<input type="text" class="form-control" name="mmCode" id="mmCode_" readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="mmName">
						<span class="glyphicon glyphicon-user"></span> 
						이름
					</label>
					<input type="text" class="form-control" name="mmName" id="mmName_" readonly="readonly">
				</div>
				<button type="button" class="btn btn-primary btn-success btn-block" id="offTimeBtn">
					<span class="glyphicon glyphicon-off"></span>
					 퇴근체크
				</button>
			</form>
		</div>
		<div class="modal-footer">
			<button type="submit" class="btn btn-default btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
		</div>
	</div>
</div>
</div> 

</body>
</html>