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
	                url: '/smart/ap/addDoc',
	                type : "POST",
	        		data : formData,
	        		dataType : "json",
	        		contentType: false,
	                processData: false,
	                cache: false,
	        		success : function(data) {
						if(data.check ='성공'){
							alert('입력되었습니다');
							$('#putInDocFom').modal('hide');
							console.log('안녕1'+data)
							$.each(data.selDoc,function(i,resultMap){
								$('#docTbody').append(`
										<tr>
											<td>`+resultMap.docCode+`</td>
											<td>`+resultMap.docFileGroup+`</td>
											<td>`+resultMap.docFileOri+`</td>
											<td><button="button">다운로드</td>
										</tr>
										`)
							})
						}else{
							alert('다시 입력해주세요');
						}						
	                }
	             
	            });
	         });
			
		/* 문서 구분 검색 */
		$(document).on('click','#docSearchBtn',function(){
			var docFileGroup = $('#docRequirement').serialize();
			console.log('h1'+docFileGroup);
			$('#docTbody').empty();
			$('#docSerachTbody').empty();
			$.ajax({
				url : '/smart/ap/searchDoc',
				data : docFileGroup,
				dataType : 'json',
				type : 'post',
				success : function(data){
					console.log('h2')
					console.log(data[0].docCode)
					$.each(data,function(i,document){
						$('#docSerachTbody').append(`
								<tr>
									<td>`+document.docCode+`</td>
									<td>`+document.docFileGroup+`</td>
									<td>`+document.docFileOri+`</td>
									<td>다운로드</td>
								</tr>
								`)
					})
				
				}
			})
			
		})
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
					<form class="form-inline" id="docRequirement">
						<div class="form-group">
							<label for="docFileGroup">분류</label>
							<select name="docFileGroup">
								<option value="0">::분류::</option>
								<c:forEach var="docList" items="${docList}">
									<option value ="${docList.docFileGroup}">${docList.docFileGroup}</option>
								</c:forEach>
							</select>
						</div>
						
						<button type="button" class="btn btn-primary" id="docSearchBtn">
							<span class="glyphicon glyphicon-search"></span>검색
						</button>
					</form>
					
					<table class="table table-bordered">
						<thead>
							<tr>
								<th>문서번호</th>
								<th>문서분류</th>
								<th width="600">문서이름</th>
								<th>Download</th>
							</tr>
						</thead>
						
						<tbody id="docSerachTbody">
						
						
						</tbody>
						
						<tbody id="docTbody">
							<c:forEach var="docList" items="${docList}">
							
								<tr>
									<td>${docList.docCode}</td>
									<td>${docList.docFileGroup}</td>
									<td>${docList.docFileOri}</td>
									<td><a href="<c:url value='/ap/docDownFile?docCode=${docList.docCode}'/>">다운받기</a></td>
								</tr>
							
							</c:forEach>
						</tbody>
							
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