<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<script>
	/* 1차 결재선  */
	$(document).on('focus','#aprApproval1',function(){
		var department = $('#depSearch1').val();
		var position = $('#posSearch1').val();
			console.log(department);
			console.log(position);
		$.ajax({
			url : '/smart/ap/addMm',
			data : {"dpCode":department, "ptCode":position},
			dataType : 'json',
			type : 'post',
			success : function(data){
				console.log('h1');
				console.log(data);
				$.each(data, function(i, member){
					$('#1').after(`
							<option value="`+member.mmCode+`">`+member.mmName+`</option>
					`)
					});
				}
			
		})
	})
	
	
	/* 2차 결재선 */
	$(document).on('focus','#aprApproval2',function(){
		var department = $('#depSearch2').val();
		var position = $('#posSearch2').val();
			console.log(department);
			console.log(position);
		$.ajax({
			url : '/smart/ap/addMm',
			data : {"dpCode":department, "ptCode":position},
			dataType : 'json',
			type : 'post',
			success : function(data){
				console.log('h2');
				console.log(data);
				$.each(data, function(i, member){
					$('#2').after(`
							<option value="`+member.mmCode+`">`+member.mmName+`</option>
					`)
					});
			
			}
		})
	})
	
	
	/* 3차 결재선 */
	$(document).on('focus','#aprApproval3',function(){
		var department = $('#depSearch3').val();
		var position = $('#posSearch3').val();
			console.log(department);
			console.log(position);
		$.ajax({
			url : '/smart/ap/addMm',
			data : {"dpCode":department, "ptCode":position},
			dataType : 'json',
			type : 'post',
			success : function(data){
				console.log('h3');
				console.log(data);
				$.each(data, function(i, member){
					$('#3').after(`
							<option value="`+member.mmCode+`">`+member.mmName+`</option>
					`)
				});
			}
		
		})
	})
	
		
	/* 결재라인 저장하기  */
	$(document).on('click','#aprSaveBtn',function(){
		console.log('결재선')
		var data = $('#approvalForm').serialize();
		console.log(data);
		$.ajax ({
			url:'/smart/ap/addApr',
			type : 'POST',
			data : data,
			dataTpye : 'json',
			success : function(data){
				console.log('결재선 원');
				console.log(data);
				if(data !=0){
					alert('입력되었습니다') 
				}else{
					alert('다시 시도하세요')
					}
				}
			
		})
	})
	
	 	
	/* 결재라인 불러오기 */
	$(document).on('click','#aprGetBtn',function(){
		$('#putInAprFom').modal();
		var mmCode = $('#mmCode').val();
		console.log('h1'+mmCode);
		
		$.ajax({
			url:'/smart/ap/listApr',
			type : 'POST',
			data : { 'mmCode' : mmCode },
			dataTpye : 'json',
			success : function(data){
				console.log('성공');
				$('#aprListForm').empty();
				console.log(data[0].aprCode);
				$.each(data,function(i, apr){
					$('#aprListForm').append(`
							<tr>
								<td>`+apr.aprCode+`</td>
								<td>`+apr.aprApproval1+`</td>
								<td>`+apr.aprApproval2+`</td>
								<td>`+apr.aprApproval3+`</td>
								<td><button = "button">선택</td>
							</tr>`);
				})
			
			}
		})
	
	})
	
	
	</script>
</head>
<body>

	<%@ include file="../menu.jsp"%>

<div class="page-container">
<div class="left-content">
<div class="inner-content">
<div class="outter-wp">

<!-- Home/메뉴  -->
<div class="outter-wp">
	
				
			<!--  body폼 시작 -->

			<div class="container">
				<div class="row">
					<h2>저장 문서</h2>
				</div>
				<hr />   
			    <form action="<c:url value='/ap/add'/>" enctype="multipart/form-data" method="post" >
			    
					<div class="row">
			    		<div class="col-md-8">
							<div class="form-group form-group-sm">
							    <input type="hidden" class="form-control" name="mmCode" value="${draft[0].mmCode}" >
							</div>
			            </div>
			    	</div>
			    	
					<div class="row">
			    		<div class="col-md-8">
							<div class="form-group form-group-sm">
							    <label for="firstname" class="control-label">[작성자]</label>
							    <input type="text" class="form-control" name="mmName" value="${draft[0].mmName}">
							</div>
			            </div>
			    	</div>
			    	
			    	
					<div class="row">
				    		<div class="col-md-8">
								<div class="form-group form-group-sm">
								    <label for="firstname" class="control-label">[문서제목]</label>
								    <input type="text" class="form-control" name="dftTitle" value="${draft[0].dftTitle}">
								</div>
				            </div>
				    </div>
							    

					<div class="row">
			    		<div class="col-md-8">
							<div class="form-group form-group-sm">
							    <label for="firstname" class="control-label">[문서구분]</label>
							    <select name="docCode" id="docCode" class="form-control1">
							    
							    	<option value="${draft[0].docCode}">${selectDoc}</option>
									<c:forEach var="doc" items="${doc}">
										<option value="${doc.docCode}">${doc.docFileGroup}</option>								   
									</c:forEach>							
								</select>
							</div>
			            </div>   
			    	</div>
			    	
					<div class ="row">
						<div class="col-md-8">
							<div class="form-group form-group-sm">
							    <label for="firstname" class="control-label">[문서선택]</label>
						
							    <div>
							   		<input type="file" class="form-control" name="uploadFile">
							    </div>
							</div>
			            </div>
			    	</div>

				
					<div class="row">
						<div class="col-sm-8">
						<label for="firstname" class="control-label">[결재선 추가]</label>
					    	 <main>
								  <table class="table table-bordered table-condensed">
								    <thead>
								      <tr>
								        <th></th>
								        <th class="col">부서</th>
								        <th class="col">직급</th>
								        <th class="col">직원 이름</th>
								      </tr>
								    </thead>
								    <tbody>
								      <tr>
								        <th class="row">1차 결재자</th>
								        <td>
								      
											<select name="depSearch1" id="depSearch1" class="form-control1">
											
												<option value=0>${depMap.dep1}</option>
												<c:forEach var="dep" items="${dep}">
													<option value="${dep.dpCode}">${dep.dpName}</option>
												</c:forEach>
												
											</select>
														
										</td>
								        <td>
								    
									        <select name="posSearch1" id="posSearch1" class="form-control1">
												<option value=0>${ptMap.pt1}</option>
												<c:forEach var="pos" items="${pos}">
													<option value="${pos.ptCode}">${pos.ptName}</option>
												</c:forEach>											
											</select>				
										
								        </td>
							        	<td>					        	
								        	<select name="aprApproval1" id="aprApproval1" class="form-control1">
													<option id=1 value="${draft[0].aprApproval1}">${nameMap.name1}</option>
													
											</select>						
								        </td>
								      </tr>
								
								   	  <tr>
								        <th class="row">2차 결재자</th>
								        <td>				        
											<select name="depSearch2" id="depSearch2" class="form-control1">
												<option>${depMap.dep2}</option>
													<c:forEach var="dep" items="${dep}">
														<option value="${dep.dpCode}">${dep.dpName}</option>
													</c:forEach>						
											</select>
																
										</td>
								        <td>
									        <select name="posSearch2" id="posSearch2" class="form-control1">
												<option>${ptMap.pt2}</option>
													<c:forEach var="pos" items="${pos}">
														<option value="${pos.ptCode}">${pos.ptName}</option>
													</c:forEach>															
											</select>
											
								        </td>
								        <td>
								        	<select name="aprApproval2" id="aprApproval2" class="form-control1">
													<option id=2 value="${draft[0].aprApproval2}">${nameMap.name2}</option>
										
											</select>
								
								        </td>
								     </tr>
								
								     <tr>
								        <th class="row">3차 결재자</th>
								        <td>
											<select name="depSearch3" id="depSearch3" class="form-control1">
												<option>${depMap.dep3}</option>								
													<c:forEach var="dep" items="${dep}">
														<option value="${dep.dpCode}">${dep.dpName}</option>
													</c:forEach>											
											</select>
										
								        <td>
									        <select name="posSearch3" id="posSearch3" class="form-control1">
												<option>${ptMap.pt3}</option>
													<c:forEach var="pos" items="${pos}">
														<option value="${pos.ptCode}">${pos.ptName}</option>
													</c:forEach>															
											</select>
										
								        </td>
								        <td>
								        	<select name="aprApproval3" id="aprApproval3" class="form-control1">
													<option id=3 value="${draft[0].aprApproval3}">${nameMap.name3}</option>
											</select>
									
								        </td>
								      </tr>  
								  </table>
								&nbsp;
								<div class="row">
									<div class="col-sm-12">
									 	<button class="col-sm-6" type="button" id="aprSaveBtn">결재라인저장</button>					
										<button class="col-sm-6" type="button" id="aprGetBtn">결재라인불러오기</button>									
									</div>
								</div>	  
							</main>   
						</div>
					</div>
					&nbsp;
					&nbsp;
					<hr />  
					<div class="row">
						
			           	 <div class="col-sm-12">
			                   <button type="submit" class="col-sm-8" align="center"> 기안 재요청 </button>
			             </div>
			            
			        </div>	
			        
			    </form>
			 <hr />  
				<div class="row">
					<a href="<c:url value='/ap/list?dftCode=${pgList.dftCode}'/>" class="btn btn-primary" >
							<span class="glyphicon glyphicon-edit"></span> 결재목록
					</a>
					<a href="<c:url value='/ap/temList'/>" class="btn btn-primary" >임시목록
					</a>
				</div>
		
			</div>
			
			&nbsp;
			&nbsp;
		
<c:import url="./ap_aprAdd.jsp"></c:import> <!--팝업창 --> 
<!--  body폼 끝 -->
</div>
</div>
</div>
</div>
		<%@ include file="../footer.jsp"%>
</body>
</html>