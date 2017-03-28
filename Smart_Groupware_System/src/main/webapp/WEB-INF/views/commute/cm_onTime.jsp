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
<div class="modal fade" id="onTime" role="dialog">
<div class="modal-dialog">

<!-- Modal content-->
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 style="color:red;"><span class="glyphicon glyphicon-check"></span> 출근체크</h4>
		</div>
		<div class="modal-body">
			<form role="form" id="onTimeForm">
				<div class="form-group">
					<label for="mmCode">
						<span class="glyphicon glyphicon-user"></span> 
						사원코드
					</label>
					<input type="text" class="form-control" name="mmCode" id="mmCode" readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="mmName">
						<span class="glyphicon glyphicon-user"></span> 
						이름
					</label>
					<input type="text" class="form-control" name="mmName" id="mmName" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="cmExceptionInput">
						<span class="glyphicon glyphicon-eye-open"></span> 
						예외사항<span style="color:red;">(*예외발생시에만 입력하세요)</span>
					</label>
					<input type="text" class="form-control" name="cmExceptionInput" id="cmExceptionInput" placeholder="예외시 입력">
				</div>
				<div class="form-group">
					<label for="cmExceptionReson">
						<span class="glyphicon glyphicon-eye-open"></span> 
						예외사유<span style="color:red;">(*예외발생시에만 입력하세요)</span>
					</label>
					<input type="text" class="form-control" name="cmExceptionReson" id="cmExceptionReson" placeholder="예외 발생 사유">
				</div>
				<button type="button" class="btn btn-default btn-success btn-block" id="onTimeBtn">
					<span class="glyphicon glyphicon-off"></span>
					 출근체크
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