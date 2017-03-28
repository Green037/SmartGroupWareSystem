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
<div class="modal fade" id="fuModifyForm" role="dialog">
<div class="modal-dialog">

<!-- Modal content-->
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 style="color:red;"><span class="glyphicon glyphicon-edit"></span> 자금상세내역수정</h4>
		</div>
		<div class="modal-body">
			<form role="form" id="fuMoForm">
				<div class="form-group">
					<label for="fuCode">
						<span class="glyphicon glyphicon-list-alt"></span> 
						자금코드
					</label>
					<input type="text" class="form-control" name="fuCode" id="fuCode" readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="fuHistory">
						<span class="glyphicon glyphicon-list-alt"></span> 
						세부사용내용
					</label>
					<input type="text" class="form-control" name="fuHistory" id="fuHistory" placeholder="회원완성되면readonly로세팅">
				</div>
				<div class="form-group">
					<label for="fuExpectedMoney">
						<span class="glyphicon glyphicon-usd"></span> 
						예상금액<span style="color:red;">(*뒤는 프로젝트 총금액)</span>
					</label>
					<input type="text" class="form-control" name="fuExpectedMoney" id="fuExpectedMoney" placeholder="특이사항">
				</div>
				<div class="form-group">
					<label for="fuUsedMoney">
						<span class="glyphicon glyphicon-usd"></span> 
						사용금액
					</label>
					<input type="text" class="form-control" name="fuUsedMoney" id="fuUsedMoney" placeholder="특이사항">
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