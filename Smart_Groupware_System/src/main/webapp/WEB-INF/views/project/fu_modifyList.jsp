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
<div class="modal fade" id="fuModifyList" role="dialog">
<div class="modal-dialog modal-lg">

<!-- Modal content-->
<form>
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 style="color:red;"><span class="glyphicon glyphicon-check"></span>자금사용내역</h4>
		</div>
		<div class="modal-body">
			<div class="container">
				<table width="860" height="120">
					<thead>
						<tr>
							<th width="130">자금코드</th>
							<th width="130">프로젝트코드</th>
							<th width="200">상세사용내역</th>
							<th width="150">예상금액</th>
							<th width="150">사용금액</th>
							<th width="100">#</th>
						</tr>
					</thead>
					<tbody id="fuModifyListTbody">
						
					</tbody>
				</table>
			</div>
		</div>
		<div class="modal-footer">
			<button type="button" id="fuAddHistoryBtn" class="btn btn-success">
				<span class="glyphicon glyphicon-off"></span>자금내역추가
			</button>		
		</div>
	</div>
</form>
</div>
</div> 

</body>
</html>