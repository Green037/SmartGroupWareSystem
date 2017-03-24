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
<div class="modal fade" id="goWorkout" role="dialog">
<div class="modal-dialog">

<!-- Modal content-->
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 style="color:red;"><span class="glyphicon glyphicon-check"></span> 출장 신청</h4>
		</div>
		<div class="modal-body">
			<form role="form" id="WoAddForm">
				<div class="form-group">
					<label for="mmCode">
						<span class="glyphicon glyphicon-user"></span> 
						사원코드
					</label>
					<input type="text" class="form-control" name="mmCode" id="mmCode_2" readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="mmName">
						<span class="glyphicon glyphicon-user"></span> 
						이름
					</label>
					<input type="text" class="form-control" name="mmName" id="mmName_2" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="esStartDate">
						<span class="glyphicon glyphicon-eye-open"></span> 
						시작일시<span style="color:red;"></span>
					</label>
					 <input type="date" class="form-control" name="esStartDate" id="esStartDate2">
				</div>
				<div class="form-group">
					<label for="esEndDate">
						<span class="glyphicon glyphicon-eye-open"></span> 
						종료일시<span style="color:red;"></span>
					</label>
					 <input type="date" class="form-control" name="esEndDate" id="esEndDate2">
				</div>
				<div class="form-group">
					<label for="exCostSort">
						<span class="glyphicon glyphicon-eye-open"></span> 
						출장비용<span style="color:red;"></span>
					</label>
					 <input type="text" class="form-control" name="esCostSort" id="esCostSort">
				</div>

				<div class="form-group">
					<label for="esNote">
						<span class="glyphicon glyphicon-eye-open"></span>
						출장목적<span style="color:red;"></span>
					</label>
					 <input type="text" class="form-control" name="esNote" id="esNote">
				</div>
			
				<button type="button" class="btn btn-default btn-success btn-block" id="WoAddBtn">
					<span class="glyphicon glyphicon-off"></span>
					 출장 신청
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