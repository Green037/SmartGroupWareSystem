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
<div class="modal fade" id="fuList" role="dialog">
<div class="modal-dialog">

<!-- Modal content-->
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 style="color:red;"><span class="glyphicon glyphicon-usd"></span> 자금세부사용내용</h4>
		</div>
		<div class="modal-body">
			<div class="container">
			    <table width="550" height="120" class="table-striped">
					<thead>
						<tr>
							<th width="160">세부사용내역</th>
							<th width="160">예상금액</th>
							<th width="230">실제사용금액</th>
						</tr>
					</thead>
					<tbody id="fuListTbody">
						
					</tbody>
				</table>
			</div>
		</div>
		<div class="modal-footer">
			<button type="submit" class="btn btn-default btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
		</div>
	</div>
</div>
</div> 

</body>
</html>