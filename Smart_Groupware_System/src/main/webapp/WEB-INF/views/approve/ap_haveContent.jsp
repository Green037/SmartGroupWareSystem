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

<!--/sub-heard-part-->
<div class="sub-heard-part">
	<ol class="breadcrumb m-b-0">
		<li><a href="index.html">Home</a></li>
		<li class="active">결재 요청</li>
	</ol>
</div>
<!-- Home/메뉴 End -->

<!--  body폼 시작 -->

	<div class="set-1">
		<div class="graph-2 general">
			<h3 class="inner-tittle two">결재 여부</h3>
			<div class="grid-1">
				<div class="form-body">
				
					<form  class="form-horizontal" action="<c:url value='/ap/proAdd'/>" method="post" >
	<div class="form-group">
		<label for="nameinput" class="col-sm-2 control-label">문서 번호</label> 	
	<div class="col-sm-3">
		<input type="text" class="form-control1" name="dftCode" value="${draft.dftCode}" readonly="readonly">
	</div>
	
	<!-- 결재 순번값을 가져오기 위해서 hidden으로 처리-->
	<div class="col-sm-3">
		<input type="hidden" class="form-control1" name="dftDegree" value="${draft.dftDegree}" readonly="readonly" >
	</div>
	<!-- 결재 순번값을 가져오기 위해서 hidden으로 처리-->
	
	</div>
	<div class="form-group">
		<label for="Emailinput" class="col-sm-2 control-label">문서 제목</label>
		<div class="col-sm-3">
			<input type="text" class="form-control1" name="dftTitle" value="${draft.dftTitle}" readonly="readonly"> 													
		</div>
													
	</div>
	<div class="form-group">
		<label for="Passwordinput" class="col-sm-2 control-label">작성자</label>
		<div class="col-sm-3">
			<input type="text" class="form-control1" name="mmCode" value="${draft.mmCode}" readonly="readonly">
		</div>
	</div>
	
	<div class="form-group">
		<label for="Passwordinput" class="col-sm-2 control-label">결재자</label>
		<div class="col-sm-3">
			<input type="text" class="form-control1" name="dft_Approval" value="${draft.proApproval}"readonly="readonly">
		</div>
	</div>
		
		
	<div class="form-group">
		<label for="Emailinput" class="col-sm-2 control-label">문서 양식</label>
		<div class="col-sm-3">
			<input type="text" class="form-control1" name="docCode" value="${draft.docCode}" readonly="readonly"> 														
		</div>
													
	</div>
	
	<div class="form-group">
		<label for="Emailinput" class="col-sm-2 control-label">문서 파일</label>
		<div class="col-sm-3">
			<input type="text" class="form-control1" name="docFileOri" value="${draft.dftFileOri}" readonly="readonly"> 														
		</div>
													
	</div>
	
	<div class="form-group">
		<label for="Emailinput" class="col-sm-2 control-label">결재 등록 일자</label>
		<div class="col-sm-3">
			<input type="text" class="form-control1" name="dftDate" value="${draft.dftDate}" readonly="readonly"> 														
					</div>
																
				</div>
				
			<div class="form-group">
					<label class="col-sm-2 control-label" for="marrycheck">결재여부</label>
					<div class="col-sm-8">
						<div class="marry-inline1">
							<label for="marrycheck"><input type="radio" name="proState" value=1 id="proState" checked="checked"> 승인</label>
						</div>
						<div class="marry-inline1">
							<label for="marrycheck"><input type="radio" name="proState" value=2 id="proState1"> 반려</label>
						</div>
					</div>
				</div>	
				
			
			<div class="form-group">
					<label for="txtarea1" class="col-sm-2 control-label">반려사유</label>
					<div class="col-sm-8">
						<textarea name="proReason" id="txtarea1" cols="50" rows="4"
							class="form-control1"></textarea>
					</div>
			</div>
			
			<Center>
				<button type="submit" class="btn btn-default">Submit</button>
			</Center>
			
			</form>
		</div>
			
	</div>
								
</div>
</div>

<!-- 본문 끝 -->
</div>
</div>
</div>
</div>
</body>
</html>
								