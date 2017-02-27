<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<script>
	$(function(){ $("#docAdd").click(function(){
		$.ajax({ 
			type: 'get' , 
			url: '/ap/docAdd' , 
			dataType : 'json' , 
			success: function(data) { 
				console.log("ok?");
				} 
			});	
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
								<div class="control-label" style="text-align:right" id="docAdd">[ 문서추가 ]
									<button type="button" id="docBtn">등록</button>
								</div>
								</div> &nbsp;
								
								<table class="table table-bordered">
								
									<tr>
										<th>차수</th>
										<th width="600">문서이름</th>
										<th>Dowload</th>
									</tr>
									<tr>
										<td>1</td>
										<td>프로젝트초안</td>
										<td>경로0[다운로드]</td>
									</tr>
									
									<tr>
										<td>2</td>									
										<td>프로젝트최종</td>
										<td>경로1[다운로드]</td>
									</tr>
									
									<tr>
										<td>3</td>
										<td>출퇴근양식</td>
										<td>경로2[다운로드]</td>
												
									</tr>
									
									<tr>
										<td>4</td>
										<td>임금양식</td>
										<td>경로3[다운로드]</td>
									</tr>
									
									<tr>
										<td>5</td>
										<td>고과_자격증</td>
										<td>경로5[다운로드]</td>
									</tr>
									
									<tr>
										<td>5</td>
										<td>고과_인사</td>
										<td>경로6[다운로드]</td>
									</tr>
										
								</table> 
								<div class="clearfix">&nbsp;</div>
								
					
							</div>
						</div>
					</div>
				
				</div>
			</div>
		</div>
	</div>	
			
	<%@ include file="../footer.jsp"%>

</body>
</html>