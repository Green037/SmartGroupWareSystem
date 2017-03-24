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
<div class="modal fade" id="approvalForm" role="dialog">
<div class="modal-dialog">

<!-- Modal content-->
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 style="color:red;"><span class="glyphicon glyphicon-check"></span> 전자결제신청</h4>
		</div>
		<div class="modal-body">
			<form role="form" id="evApprovalForm">
				<div class="form-group">
					<div class="col-md-12">
						<label for="mmCode">
							<span class="glyphicon glyphicon-user"></span> 
							사원코드
						</label>
						<input type="text" class="form-control" name="mmCode" id="mmCode" value="${sessionScope.mmCode}" readonly="readonly"/>
					</div>				
				</div>
				<div class="form-group">
					<div class="col-md-12">
						<label for="dftTitle">
							<span class="glyphicon glyphicon-user"></span> 
							문서제목
						</label>
						<input type="text" class="form-control" name="dftTitle" id="dftTitle" placeholder="문서제목">
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-12">
						<label for="docCode">
							<span class="glyphicon glyphicon-eye-open"></span> 
							문서구분
						</label>
						<select name="docCode" id="docCode" class="form-control1">
							
						</select>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-12">
						<label for="firstname">
							<span class="glyphicon glyphicon-eye-open"></span> 
							문서선택
						</label>
						<input type="file" class="form-control1" name="uploadFile">
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-12">
						<label for="firstname">
							<span class="glyphicon glyphicon-eye-open"></span> 
							결제선선택
						</label>
						<table class="table table-bordered table-condensed">
							<thead>
								<tr>
									<th></th>
									<th class="col">부서</th>
									<th class="col">직급</th>
									<th class="col">직원 이름</th>
								</tr>
							</thead>
 
							<tbody id="selectAllAprForm">
								<tr>
									<th class="row">1차 결재자</th>
									<td>
										<select name="depSearch1" id="depSearch1" class="form-control1">
											<option value=0>[부서]</option>
												<c:forEach var="dep" items="${dep}">
												<option value="${dep.dpCode}">${dep.dpName}</option>
												</c:forEach>
										</select>
									</td>
									<td>
										<select name="posSearch1" id="posSearch1" class="form-control1">
											<option value=0>[직급]</option>
												<c:forEach var="pos" items="${pos}">
												<option value="${pos.ptCode}">${pos.ptName}</option>
												</c:forEach>											
										</select>				
									</td>
									<td>					        	
										<select name="aprApproval1" id="aprApproval1" class="form-control1">
											<option id=1 value=0>[이름]</option>
										</select>						
									</td>
								</tr>
							<tr>
								<th class="row">2차 결재자</th>
								<td>				        
									<select name="depSearch2" id="depSearch2" class="form-control1">
										<option>[부서]</option>
											<c:forEach var="dep" items="${dep}">
												<option value="${dep.dpCode}">${dep.dpName}</option>
											</c:forEach>						
									</select>
								</td>
								<td>
									<select name="posSearch2" id="posSearch2" class="form-control1">
										<option>[직급]</option>
											<c:forEach var="pos" items="${pos}">
												<option value="${pos.ptCode}">${pos.ptName}</option>
											</c:forEach>															
									</select>
								</td>
								<td>
									<select name="aprApproval2" id="aprApproval2" class="form-control1">
										<option id=2 value=0>[이름]</option>
									</select>
								</td>
							</tr>
							<tr>
								<th class="row">3차 결재자</th>
								<td>
									<select name="depSearch3" id="depSearch3" class="form-control1">
										<option>[부서]</option>								
											<c:forEach var="dep" items="${dep}">
											<option value="${dep.dpCode}">${dep.dpName}</option>
											</c:forEach>											
									</select>
								</td>
								<td>
									<select name="posSearch3" id="posSearch3" class="form-control1">
										<option>[직급]</option>
											<c:forEach var="pos" items="${pos}">
												<option value="${pos.ptCode}">${pos.ptName}</option>
											</c:forEach>															
									</select>
								</td>
								<td>
									<select name="aprApproval3" id="aprApproval3" class="form-control1">
										<option id=3 value=0>[이름]</option>
									</select>
								</td>
							</tr>  
						</table>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-12">
						<button class="col-sm-6" type="button" id="aprSaveBtn">결재라인저장</button>					
						<button class="col-sm-6" type="button" id="aprGetBtn">결재라인불러오기</button>	
					</div>
					<input type="text" name="aprCode" hidden="hidden" value="0">
				</div>
				<div class="form-group" align="center">
					<button type="submit" class="btn btn-primary"> 전자결제신청 </button>
					<button type="reset" class="btn btn-primary" > 다시작성 </button>    
				</div>
			</form>
		</div>
	</div>
</div>
</div> 

</body>
</html>