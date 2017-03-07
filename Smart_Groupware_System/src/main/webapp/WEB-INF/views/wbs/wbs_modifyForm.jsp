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
<div class="modal fade" id="wbsModifyForm" role="dialog">
<div class="modal-dialog">

<!-- Modal content-->
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 style="color:red;"><span class="glyphicon glyphicon-edit"></span> WBS수정</h4>
		</div>
		<div class="modal-body">
			<form role="form" id="wbsMoForm">
				<div class="form-group">
					<label for="wbsCode">
						<span class="glyphicon glyphicon-list-alt"></span> 
						WBS코드
					</label>
					<input type="text" class="form-control" name="wbsCode" id="wbsCode" readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="wbsName">
						<span class="glyphicon glyphicon-list-alt"></span> 
						직무명
					</label>
					<input type="text" class="form-control" name="wbsName" id="wbsName" />
				</div>
				<div class="form-group">
					<label for="wbsContents">
						<span class="glyphicon glyphicon-usd"></span> 
						세부내용
					</label>
					<input type="text" class="form-control" name="wbsContents" id="wbsContents"/>
				</div>
				<div class="form-group">
					<label for="wbsStartDate">
						<span class="glyphicon glyphicon-usd"></span> 
						시작일
					</label>
					<input type="date" class="form-control" name="wbsStartDate" id="wbsStartDate" />
				</div>
				<div class="form-group">
					<label for="wbsEndDate">
						<span class="glyphicon glyphicon-usd"></span> 
						종료일
					</label>
					<input type="date" class="form-control" name="wbsEndDate" id="wbsEndDate" />
				</div>
				<div class="form-group">
					<label for="wbsProgress">
						<span class="glyphicon glyphicon-usd"></span> 
						진행률
					</label>
					<input type="text" class="form-control" name="wbsProgress" id="wbsProgress"/>
				</div>
				<div class="form-group">
					<label for="wbsUncompleatedReason">
						<span class="glyphicon glyphicon-usd"></span> 
						미완사유<span style="color:red;">(*미완료시만입력)</span>
					</label>
					<input type="text" class="form-control" name="wbsUncompleatedReason" id="wbsUncompleatedReason"/>
				</div>
				<div class="form-group">
					<label for="wbsFinalEndDate">
						<span class="glyphicon glyphicon-usd"></span> 
						완료일<span style="color:red;">(*미완료시만입력)</span>
					</label>
					<input type="date" class="form-control" name="wbsFinalEndDate" id="wbsFinalEndDate"/>
				</div>
				
				<button type="button" class="btn btn-default btn-success btn-block" id="_fuModifyBtn">
					<span class="glyphicon glyphicon-off"></span>
					 내용수정
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