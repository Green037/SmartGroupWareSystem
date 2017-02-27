<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
								<li class="active">ModifyForms</li>
							</ol>
						</div>
						<!-- Home/메뉴 End -->

						<!--  body폼 시작 -->

						<div class="set-1">
							<div class="graph-2 general">
								<h3 class="inner-tittle two">결재 여부</h3>
								<div class="grid-1">
									<div class="form-body">
										<form class="form-horizontal">
											<div class="form-group">
												<label for="nameinput" class="col-sm-2 control-label">문서 번호 : </label>
												
											<div class="col-sm-3">
												<td>${draft.dftCode}</td>
											</div>
									
											</div>
											<div class="form-group">
												<label for="Emailinput" class="col-sm-2 control-label">문서 제목</label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="dftTitle"> 													
												</div>
																							
											</div>
											<div class="form-group">
												<label for="Passwordinput" class="col-sm-2 control-label">작성자</label>
												<div class="col-sm-3">
													<input type="password" class="form-control1" id="mmCode">
												</div>
											</div>
											
											<div class="form-group">
												<label for="Passwordinput" class="col-sm-2 control-label">결재자</label>
												<div class="col-sm-3">
													<input type="password" class="form-control1" id="dft_Approval">
												</div>
											</div>
												
												
											<div class="form-group">
												<label for="Emailinput" class="col-sm-2 control-label">문서 양식</label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="docName"> 														
												</div>
																							
											</div>
											
											<div class="form-group">
												<label for="Emailinput" class="col-sm-2 control-label">결재 신청 일자</label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="dftDate"> 														
												</div>
																							
											</div>
											
										<div class="form-group">
												<label class="col-sm-2 control-label" for="marrycheck">결재여부</label>
												<div class="col-sm-8">
													<div class="marry-inline1">
														<label for="marrycheck"><input type="radio" name="proState" value=1 id="marrycheck" checked="checked"> 승인</label>
													</div>
													<div class="marry-inline1">
														<label for="marrycheck"><input type="radio" name="proState" value=0 id="marrycheck1" checked="checked"> 반려</label>
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
										
										</form>
									</div>
										<Center>
											<button type="submit" class="btn btn-default">Submit</button>
										</Center>
								</div>
							</div>
						</div>
						
						<!--  body폼 끝 -->

					</div>
				</div>
			</div>
		</div>

		<%@ include file="../footer.jsp"%>
</body>
</html>