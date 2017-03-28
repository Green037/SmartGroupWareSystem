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
<div class="modal fade" id="fuAddHistory" role="dialog">
<div class="modal-dialog">

<!-- Modal content-->
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 style="color:red;"><span class="glyphicon glyphicon-edit"></span> 자금내역추가</h4>
		</div>
		<div class="modal-body">
			<form role="form" id="fuAddHistoryForm">
				<div class="form-group">
					<label for="prCode">
						<span class="glyphicon glyphicon-list-alt"></span> 
						프로젝트코드
					</label>
					<input type="text" class="form-control" name="prCode" id="_prCode" readonly="readonly"/>
				</div>
				<div class="form-group">
					<label for="fuHistory">
						<span class="glyphicon glyphicon-list-alt"></span> 
						세부사용내용
					</label>
					<input type="text" class="form-control" name="fuHistory" id="fuHistory" placeholder="자금을 사용할 세부내용을 입력하세요">
				</div>
				<div class="form-group">
					<label for="fuExpectedMoney">
						<span class="glyphicon glyphicon-usd"></span> 
						예상금액
					</label>
					<input type="text" class="form-control" name="fuExpectedMoney" id="fuExpectedMoney" placeholder="사용예상금액">
				</div>
				<button type="button" class="btn btn-default btn-success btn-block" id="_fuAddBtn">
					<span class="glyphicon glyphicon-off"></span>
					 내역추가
				</button>
			</form>
		</div>
		<div class="modal-footer">
			
		</div>
	</div>
<!-- 본문 끝 -->	
</div>
</div> 

</body>
</html>