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
	$(document).on('focus','#dftApproval1',function(){
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
	$(document).on('focus','#dftApproval2',function(){
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
	$(document).on('focus','#dftApproval3',function(){
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
	
	$(document).on('click','#aprSaveBtn',function(){
		console.log('결재선')
		var apr_approval1 =$('#dftApproval1').val();
		var apr_approval2 =$('#dftApproval2').val();
		var apr_approval3 =$('#dftApproval3').val();
		console.log(apr_approval1);
		$.ajax ({
			url:'/smart/ap/addApr',
			type : 'POST',
			data : formData,
			dataTpye : 'json',
			success : function(data){
				console.log('결재선 원')
			}
		})
	})
		
	
	</script>
</head>
<body>

<%@ include file="../menu.jsp"%>
<!-- Home/메뉴  -->
<div class="page-container">
<div class="left-content">
<div class="inner-content">
<div class="outter-wp">
				
<!--  body폼 시작 -->

<div class="container">
	<div class="row">
		<h2>전자 결재 신청</h2>
	</div>
    <form action="<c:url value='/ap/add'/>" method="post" enctype="multipart/form-data">
    
    	<div class="row">
    		<div class="col-md-8">
				<div class="form-group form-group-sm">
				    <label for="firstname" class="control-label">[작성자]</label>
				    <input type="text" class="form-control" name="mmCode" value="${sessionScope.mmCode}">
				</div>
            </div>
    	</div>
    	<div class="row">
    		<div class="col-md-8">
				<div class="form-group form-group-sm">
				    <label for="firstname" class="control-label">[문서제목]</label>
				    <input type="text" class="form-control" name="dftTitle">
				</div>
            </div>
    	</div>
    	
    	<div class="row">
    		<div class="col-md-8">
				<div class="form-group form-group-sm">
				    <label for="firstname" class="control-label">[문서구분]</label>
				    <select name="docCode" id="docCode" class="form-control1">
				    	<option value=0>[문서분류를 선택하세요]</option>
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
				    <input type="file" class="form-control" name="uploadFile">
				</div>
            </div>
    	</div>
    		
		<div class="row" id="approvalForm">
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
								
									<option value=0>[부서을 선택하세요]</option>
									<c:forEach var="dep" items="${dep}">
										<option value="${dep.dpCode}">${dep.dpName}</option>
									</c:forEach>
									
								</select>
											
							</td>
					        <td>
					    
						        <select name="posSearch1" id="posSearch1" class="form-control1">
									<option value=0>[직급을 선택하세요]</option>
									<c:forEach var="pos" items="${pos}">
										<option value="${pos.ptCode}">${pos.ptName}</option>
									</c:forEach>											
								</select>				
							
					        </td>
				        	<td>					        	
					        	<select name="dftApproval1" id="dftApproval1" class="form-control1">
										<option id=1 value=0>[이름을 선택하세요]</option>
										
								</select>						
					        </td>
					      </tr>
					
					   	  <tr>
					        <th class="row">2차 결재자</th>
					        <td>				        
								<select name="depSearch2" id="depSearch2" class="form-control1">
									<option>[부서을 선택하세요]</option>
										<c:forEach var="dep" items="${dep}">
											<option value="${dep.dpCode}">${dep.dpName}</option>
										</c:forEach>						
								</select>
													
							</td>
					        <td>
						        <select name="posSearch2" id="posSearch2" class="form-control1">
									<option>직급을 선택하세요</option>
										<c:forEach var="pos" items="${pos}">
											<option value="${pos.ptCode}">${pos.ptName}</option>
										</c:forEach>															
								</select>
								
					        </td>
					        <td>
					        	<select name="dftApproval2" id="dftApproval2" class="form-control1">
										<option id=2 value=0>[이름을 선택하세요]</option>
							
								</select>
					
					        </td>
					     </tr>
					
					     <tr>
					        <th class="row">3차 결재자</th>
					        <td>
								<select name="depSearch3" id="depSearch3" class="form-control1">
									<option>[부서을 선택하세요]</option>								
										<c:forEach var="dep" items="${dep}">
											<option value="${dep.dpCode}">${dep.dpName}</option>
										</c:forEach>											
								</select>
							
					        <td>
						        <select name="posSearch3" id="posSearch3" class="form-control1">
									<option>[직급을 선택하세]</option>
										<c:forEach var="pos" items="${pos}">
											<option value="${pos.ptCode}">${pos.ptName}</option>
										</c:forEach>															
								</select>
							
					        </td>
					        <td>
					        	<select name="dftApproval3" id="dftApproval3" class="form-control1">
										<option id=3 value=0>[이름을 선택하세요]</option>
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
		<div class="row">
			<div class="col-sm-8">
				<div>
				<label>[문서 임시 저장] </label>&nbsp; &nbsp; 
					<input type="radio" name="dftCheck" value="true" checked="checked">save
					&nbsp; 
					<input type="radio" name="dftCheck" value="false">reject
					&nbsp;
					&nbsp;
			</div>	
		</div>
        <div class="row">
             <div class="col-xs-8">
                    <button type="submit" class="btn btn-default"> Submit </button>
                    <button type="reset" class="btn btn-default"> reset </button>    
             </div>
        </div>

    </form>
</div>

<!--  body폼 끝 -->
</div>
</div>
</div>
</div>
		<%@ include file="../footer.jsp"%>
</body>
</html>