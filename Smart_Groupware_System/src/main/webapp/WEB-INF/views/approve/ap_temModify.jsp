<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	
	
	
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
			    <form action="<c:url value='/ap/add'/>" method="post" >
			    
					<div class="row">
			    		<div class="col-md-8">
							<div class="form-group form-group-sm">
							    <input type="hidden" class="form-control" name="mmCode" value="${draft[0].dftCode}" >
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
							    <input type="file" class="form-control" name="uploadFile">
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
								        	<select name="aprApproval1" id="aprApproval1" class="form-control1">
													<option id=1 value="${draft[0].aprApproval1}">${draft[0].aprApproval1}</option>
													
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
								        	<select name="aprApproval2" id="aprApproval2" class="form-control1">
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
								        	<select name="aprApproval3" id="aprApproval3" class="form-control1">
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
					&nbsp;
					<div class="row">
			           	 <div class="col-sm-12">
			                    <button type="submit" class="btn btn-default"  align="center"> 기안 재요청 </button>  
			             </div>
			        </div>	
			    </form>
			<hr />   
			<div class="row">
				<a href="<c:url value='/ap/list?dftCode=${pgList.dftCode}'/>" class="btn btn-primary" >
						<span class="glyphicon glyphicon-edit"></span> 목록
				</a>
				<a href="<c:url value='/ap/add'/>" class="btn btn-primary" >기안신청하기
				</a>
			</div>
		
			</div>
			
			&nbsp;
			&nbsp;
		
		

			<!--  body폼 끝 -->
</div>
</div>
</div>
</div>
		<%@ include file="../footer.jsp"%>
</body>
</html>