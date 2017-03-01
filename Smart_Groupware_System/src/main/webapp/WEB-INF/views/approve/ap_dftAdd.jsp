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
						<!--/sub-heard-part-->
						<div class="sub-heard-part">
							<ol class="breadcrumb m-b-0">
								<li><a href="index.html">Home</a></li>
								<li class="active">Forms</li>
							</ol>
						</div>
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
										    <input type="text" class="form-control" name="mmCode" placeholder="name">
										</div>
						            </div>
						    	</div>
						    	<div class="row">
						    		<div class="col-md-3">
										<div class="form-group form-group-sm">
										    <label for="firstname" class="control-label">[제목]</label>
										    <input type="text" class="form-control" name="dftTitle" placeholder="title">
										</div>
						            </div>
						    	</div>
						    	
						    	<div class="row">
						    		<div class="col-md-3">
										<div class="form-group form-group-sm">
										    <label for="firstname" class="control-label">[문서구분]</label>
										    <input type="text" class="form-control" name="docCode" >
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
																<option>우리은행</option>
																<option>국민은행</option>
																<option>하나은행</option>
																<option>기업은행</option>
																<option>시티은행</option>
															</select>
														</div>
													</td>
											        <td>
												        <select name="Position" id="Position" class="form-control1">
																	<option>직급을 선택하세요</option>
																	<option>신한은행</option>
																	<option>농협</option>
																	<option>우리은행</option>
																	<option>국민은행</option>
																	<option>하나은행</option>
																	<option>기업은행</option>
																	<option>시티은행</option>
														</select>
											        </td>
											        <td>
											        	<select name="dftApproval1" id="dftApproval1" class="form-control1">
																<option>0</option>
																<option>1</option>
																<option>2</option>
																<option>3</option>
																<option>4</option>
															
														</select>
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
																<option>우리은행</option>
																<option>국민은행</option>
																<option>하나은행</option>
																<option>기업은행</option>
																<option>시티은행</option>
															</select>
														</div>
													</td>
											        <td>
												        <select name="Position" id="Position" class="form-control1">
																	<option>직급을 선택하세요</option>
																	<option>신한은행</option>
																	<option>농협</option>
																	<option>우리은행</option>
																	<option>국민은행</option>
																	<option>하나은행</option>
																	<option>기업은행</option>
																	<option>시티은행</option>
														</select>
											        </td>
											        <td>
											        	<select name="dftApproval2" id="dftApproval2" class="form-control1">
																<option>0</option>
																<option>1</option>
																<option>2</option>
																<option>3</option>
																<option>4</option>
														</select>
											        </td>
											 
											      </tr>
											
											     <tr>
											        <th class="row">3차 결재자</th>
											        <td>
											        	<div>
															<select name="Department" id="Department" class="form-control1">
																<option>부서을 선택하세요</option>
																<option>신한은행</option>
																<option>농협</option>
																<option>우리은행</option>
																<option>국민은행</option>
																<option>하나은행</option>
																<option>기업은행</option>
																<option>시티은행</option>
															</select>
														</div>
													</td>
											        <td>
												        <select name="Position" id="Position" class="form-control1">
																	<option>직급을 선택하세요</option>
																	<option>신한은행</option>
																	<option>농협</option>
																	<option>우리은행</option>
																	<option>국민은행</option>
																	<option>하나은행</option>
																	<option>기업은행</option>
																	<option>시티은행</option>
														</select>
											        </td>
											        <td>
											        	<select name="dftApproval3" id="dftApproval3" class="form-control1">
																<option>0</option>
																<option>1</option>
																<option>2</option>
																<option>3</option>
																<option>4</option>	
														</select>
											        </td>
											      </tr>  
											  </table>
										</main>   
									</div>
								</div> 
								&nbsp;
								<div class="row">
								<label class="col-sm-2 control-label" for="marrycheck">[문서 임시 저장] </label>
									<div class="col-sm-8">
										<div class="marry-inline1">
											<label for="marrycheck"><input type="radio" name="dftCheck" value="true" checked="checked">save</label>	
										</div>
										<div class="marry-inline1">
											<label for="marrycheck"><input type="radio" name="dftCheck" value="false">no save</label>
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