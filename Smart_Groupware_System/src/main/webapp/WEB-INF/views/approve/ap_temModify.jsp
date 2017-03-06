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
					<h2>전자 결재 신청</h2>
				</div>
			    <form action="<c:url value='/ap/add'/>" method="post" >
			    
			    	<div class="row">
			    		<div class="col-md-3">
							<div class="form-group form-group-sm">
							    <label for="firstname" class="control-label">[작성자]</label>
							    <input type="text" class="form-control" name="mmCode" value="${draft[0].dftCode}">
							</div>
			            </div>
			    	</div>
			    	<div class="row">
			    		<div class="col-md-3">
							<div class="form-group form-group-sm">
							    <label for="firstname" class="control-label">[제목]</label>
							    <input type="text" class="form-control" name="dftTitle" value="${draft[0].dftTitle}">
							</div>
			            </div>
			    	</div>
			    	
			    	<div class="row">
			    		<div class="col-md-3">
							<div class="form-group form-group-sm">
							    <label for="firstname" class="control-label">[문서구분]</label>
							    <input type="text" class="form-control" name="docCode" value="${draft[0].docCode}" >
							</div>
			            </div> 
			            
			            <div class="col-md-3">
							<div class="form-group form-group-sm">
							    <label for="firstname" class="control-label">[문서선택]</label>
							    <input type="file" class="form-control" name="dftFile" >
							</div>
			            </div>   
			    	</div>

				
					<div class="row">
						<div class="col-sm-8">
						<label for="firstname" class="control-label">[결재자 추가]</label>
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
								        	<div>
												<select name="Department" id="Department" class="form-control1">
													<option>부서을 선택하세요</option>
													<option>신한은행</option>
													<option>농협</option>
												</select>
											</div>
										</td>
								        <td>
									        <select name="Position" id="Position" class="form-control1">
														<option>직급을 선택하세요</option>
														<option>신한은행</option>
														<option>농협</option>													
											</select>
								        </td>
								        <td>
								        	 <input type="text" class="form-control" name="dftApproval1" value="${draft[0].dftApproval1}" >
								        </td>
								 
								      </tr>
								
								   	  <tr>
								        <th class="row">2차 결재자</th>
								        <td>
								        	<div>
												<select name="Department" id="Department" class="form-control1">
													<option>부서을 선택하세요</option>
													<option>신한은행</option>
													<option>농협</option>									
												</select>
											</div>
										</td>
								        <td>
									        <select name="Position" id="Position" class="form-control1">
														<option>직급을 선택하세요</option>
														<option>신한은행</option>
														<option>농협</option>														
											</select>
								        </td>
								        <td>
								        	<input type="text" class="form-control" name="dftApproval2" value="${draft[0].dftApproval2}" >
								        </td>
								 
								      </tr>
								
								     <tr>
								        <th class="row">3차 결재자</th>
								        <td>
												<select name="Department" id="Department" class="form-control1">
													<option>부서을 선택하세요</option>
													<option>신한은행</option>
													<option>농협</option>												
												</select>
										</td>
								        <td>
									        <select name="Position" id="Position" class="form-control1">
														<option>직급을 선택하세요</option>
														<option>신한은행</option>
														<option>농협</option>														
											</select>
								        </td>
								        <td>
								        <input type="text" class="form-control" name="dftApproval3" value="${draft[0].dftApproval3}" >
								        </td>
								      </tr>  
								  </table>
								  
								  <div class="row">
						             <div class="col-xs-3">
					                    <button type="submit"> 저장 </button>
					                    <button type="reset" > 불러오기 </button>
						             </div>
			        			</div>
			        			  
							</main>   
						</div>
					</div> 
					&nbsp;
					<div class="row">
					<label class="col-sm-2 control-label" for="dftCheck">[문서 임시 저장] </label>
						<div class="col-sm-8">
							<div>
								<input type="radio" name="dftCheck" value="true" checked="checked">save
							</div>
							<div>
								<input type="radio" name="dftCheck" value="false">no save
							</div>
						</div>
					
			        <div class="row">
			             <div class="col-xs-3">
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