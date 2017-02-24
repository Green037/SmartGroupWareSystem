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
								<h3 class="inner-tittle two">사원 등록</h3>
								<div class="grid-1">
									<div class="form-body">
										<form class="form-horizontal">
											<div class="form-group">
												<label for="nameinput" class="col-sm-2 control-label">문서 번호</label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="nameinput"
														placeholder="이름을 입력하세요">
												</div>
												<div class="col-sm-2">
													<p class="help-block"></p>
												</div>
											</div>
											<div class="form-group">
												<label for="Emailinput" class="col-sm-2 control-label">문서 제목</label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="Emailinput" 
															placeholder="이메일을 입력하세요">
												</div>
																							
											</div>
											<div class="form-group">
												<label for="Passwordinput" class="col-sm-2 control-label">작성자</label>
												<div class="col-sm-3">
													<input type="password" class="form-control1"
														id="Passwordinput" placeholder="비밀번호를 입력하세요">
												</div>
											</div>
												
											<div class="form-group">
												<label for="smallinput"
													class="col-sm-2 control-label label-input-sm">문서 양식</label>
												<div class="col-sm-8">
													<input type="text" class="form-control1 input-sm"
														id="smallinput" placeholder="Small Input">
												</div>
											</div>
											
											<div class="grid-1">
											<div class="form-group">
												<label for="Bankselector" class="col-sm-2 control-label">1차 결재자</label>
												<div class="col-sm-2">
													<select name="Bankselector" id="Bankselector"
														class="form-control1">
														<option>부서을 선택하세요</option>
														<option> 신한은행</option>
														<option> 농협</option>
														<option> 우리은행</option>
														<option> 국민은행</option>
														<option> 하나은행</option>
														<option> 기업은행</option>
														<option> 시티은행</option>
													</select>
													<select name="Bankselector" id="Bankselector"
														class="form-control1">
														<option>직급을 선택하세요</option>
														<option> 신한은행</option>
														<option> 농협</option>
														<option> 우리은행</option>
														<option> 국민은행</option>
														<option> 하나은행</option>
														<option> 기업은행</option>
														<option> 시티은행</option>
													</select>
													<select name="Bankselector" id="Bankselector"
														class="form-control1">
														<option>이름을 선택하세요</option>
														<option> 신한은행</option>
														<option> 농협</option>
														<option> 우리은행</option>
														<option> 국민은행</option>
														<option> 하나은행</option>
														<option> 기업은행</option>
														<option> 시티은행</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label for="Bankselector" class="col-sm-2 control-label">1차 결재자</label>
												<div class="col-sm-2">
													<select name="Bankselector" id="Bankselector"
														class="form-control1">
														<option>부서을 선택하세요</option>
														<option> 신한은행</option>
														<option> 농협</option>
														<option> 우리은행</option>
														<option> 국민은행</option>
														<option> 하나은행</option>
														<option> 기업은행</option>
														<option> 시티은행</option>
													</select>
													<select name="Bankselector" id="Bankselector"
														class="form-control1">
														<option>직급을 선택하세요</option>
														<option> 신한은행</option>
														<option> 농협</option>
														<option> 우리은행</option>
														<option> 국민은행</option>
														<option> 하나은행</option>
														<option> 기업은행</option>
														<option> 시티은행</option>
													</select>
													<select name="Bankselector" id="Bankselector"
														class="form-control1">
														<option>이름을 선택하세요</option>
														<option> 신한은행</option>
														<option> 농협</option>
														<option> 우리은행</option>
														<option> 국민은행</option>
														<option> 하나은행</option>
														<option> 기업은행</option>
														<option> 시티은행</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label for="Bankselector" class="col-sm-2 control-label">1차 결재자</label>
												<div class="col-sm-2">
													<select name="Bankselector" id="Bankselector"
														class="form-control1">
														<option>부서을 선택하세요</option>
														<option> 신한은행</option>
														<option> 농협</option>
														<option> 우리은행</option>
														<option> 국민은행</option>
														<option> 하나은행</option>
														<option> 기업은행</option>
														<option> 시티은행</option>
													</select>
													<select name="Bankselector" id="Bankselector"
														class="form-control1">
														<option>직급을 선택하세요</option>
														<option> 신한은행</option>
														<option> 농협</option>
														<option> 우리은행</option>
														<option> 국민은행</option>
														<option> 하나은행</option>
														<option> 기업은행</option>
														<option> 시티은행</option>
													</select>
													<select name="Bankselector" id="Bankselector"
														class="form-control1">
														<option>이름을 선택하세요</option>
														<option> 신한은행</option>
														<option> 농협</option>
														<option> 우리은행</option>
														<option> 국민은행</option>
														<option> 하나은행</option>
														<option> 기업은행</option>
														<option> 시티은행</option>
													</select>
												</div>
											</div>									
												<button type="submit" class="btn btn-default">결재라인 저장</button>
												<button type="reset" class="btn btn-default">불러오기</button>
											</div>
										</form>
									</div>
										<Center>
											<button type="submit" class="btn btn-default">Submit</button>
											<button type="reset" class="btn btn-default">Reset</button>
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