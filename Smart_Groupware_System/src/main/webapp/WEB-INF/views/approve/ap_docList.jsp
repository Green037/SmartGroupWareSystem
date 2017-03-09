<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<script>
	/* 문서 입력 페이지 불러오기  */
		$(document).on('click','#putInDoc',function(){
			$('#putInDocFom').modal();
		});
	
	/* 문서 등록 요청 */
		$(document).on('click','#DocumentBtn',function(){
			console.log('h1')
			var form = $('#DocumentForm')[0];
	        var formData = new FormData(form);
	        console.log(formData); 
	             $.ajax({
	                url: '/SMART/ap/addDoc',
	                type : "POST",
	        		data : formData,
	        		dataType : "json",
	        		contentType: false,
	                processData: false,
	                cache: false,
	        		success : function(data) {
						if(data.check ='성공'){
							/* alert('입력되었습니다') */
							
						}else{
							alert('다시 입력해주세요')
						}
						$('#putInDocFom').modal('hide');
	                }
	             
	            });
	         });	
	</script>
	
</head> 
<body>

<%@ include file="../menu.jsp" %>
	
<!-- contents -->

<div class="page-container">
<div class="left-content">
<div class="inner-content">
<div class="outter-wp">

<!-- 본문 시작 -->	
		
		<div class="sub-heard-part">
			<ol class="breadcrumb m-b-0">
				<li><a href="/smart"><b>Home</b></a></li>
				<li>문서 양식 </li>
			</ol>
		</div>

		<div class="forms-main">
			<div class="graph-form">
				<div class="validation-form">						
					<label class="control-label"><b>문서 양식 [건수 : 10건]</b></label>	
					
					</div> &nbsp;
					
					<table class="table table-bordered">
					
						<tr>
							<th>문서번호</th>
							<th width="600">문서이름</th>
							<th>Download</th>
						</tr>
						
						<c:forEach var="docList" items="${docList}">
						
							<tr>
								<td>${docList.docCode}</td>
								<td>${docList.docFileGroup}</td>
								<td>경로0[다운로드]</td>
							</tr>
						
						</c:forEach>
							
					</table> 
					
					<div class="clearfix">
						&nbsp;
					</div>
				
				<!-- 관리자만 보이는 메뉴 -->				
				<td>
					<button type="button" class="btn-success" id="putInDoc">문서양식 추가</button>
				</td>				
				<!-- 관리자만 보이는 메뉴 -->

			</div>
		</div>

<c:import url="./ap_docAdd.jsp"></c:import> <!--팝업창 --> 

<!-- 본문 끝 -->				
</div>
</div>
</div>
</div>	


<%@ include file="../footer.jsp"%>
	

</body>
</html>