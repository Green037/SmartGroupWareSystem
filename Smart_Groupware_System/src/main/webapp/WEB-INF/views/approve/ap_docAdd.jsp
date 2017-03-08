<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
<div class="modal fade" id="putInDocFom" role="dialog">
<div class="modal-dialog">

<!-- 본문 시작 -->
<div class="modal-content">
		<div class="modal-header">
			<div class="row">
				<h2>전자 결재 신청</h2>
			</div>
		</div>
		
		<div class="modal-body">
		
			<form action="<c:url value='/ap/addDocument'/>" method="post" enctype="multipart/form-data" id="DocumentForm">
	        	
		    	<div class="row">
		    		<div class="col-md-3">
						<div class="form-group form-group-sm">
						    <label for="firstname" class="control-label">[문서분류]</label>
						    <input type="text" class="form-control" name="docFileGroup" id="docFileGroup">
						</div>
		            </div>
		    	</div>
		
		    	<div class ="row">
					<div class="col-md-3">
						<div class="form-group form-group-sm">
						    <label for="firstname" class="control-label">[문서선택]</label>
						    <input type="file" class="form-control" name="docFile" id="docFile">
						</div>
		            </div>
		    	</div>
		    		
				&nbsp;
		
				<div class="col-xs-3">
				       <button type="button" id="DocumentBtn">등록</button> 
				 <!-- <input type="submit" id="DocumentBtn">등록 -->
				</div>

	   		</form>	
		</div>
		
</div>


<!-- 본문 끝 -->
</div>
</div>	
</body>
</html>