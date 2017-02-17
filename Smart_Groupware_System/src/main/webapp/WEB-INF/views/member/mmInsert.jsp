<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
						<!-- Home/메뉴 End -->

						<!--  body폼 시작 -->

						<div class="set-1">
							<div class="graph-2 general">
								<h3 class="inner-tittle two">사원 등록</h3>
								<div class="grid-1">
									<div class="form-body">
										<form class="form-horizontal">
											<div class="form-group">
												<label for="nameinput" class="col-sm-2 control-label">사원 이름</label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="nameinput"
														placeholder="이름을 입력하세요">
												</div>
												<div class="col-sm-2">
													<p class="help-block"></p>
												</div>
											</div>
											<div class="form-group">
												<label for="Emailinput" class="col-sm-2 control-label">Email</label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="Emailinput" 
															placeholder="이메일을 입력하세요">
												</div>
																							
											</div>
											<div class="form-group">
												<label for="Passwordinput" class="col-sm-2 control-label">비밀번호</label>
												<div class="col-sm-3">
													<input type="password" class="form-control1"
														id="Passwordinput" placeholder="비밀번호를 입력하세요">
												</div>
											</div>
												
											<div class="form-group">
												<label class="col-sm-2 control-label" for="Armycheck">군필여부</label>
												<div class="col-sm-8">
													<div class="radio-inline1">
														<label for="Armycheck"><input type="radio" name="Armycheck" value="gun_yes" id="Armycheck" checked="checked"> 군필</label>
													</div>
													<div class="radio-inline1">
														<label for="Armycheck"><input type="radio" name="Armycheck" value="gun_no" id="Armycheck1" checked="checked"> 미필</label>
													</div>
												</div>
											</div>
											
											<div class="form-group">
												<label class="col-sm-2 control-label" for="marrycheck">결혼여부</label>
												<div class="col-sm-8">
													<div class="marry-inline1">
														<label for="marrycheck"><input type="radio" name="Armycheck" value="gun_yes" id="marrycheck" checked="checked"> 기혼</label>
													</div>
													<div class="marry-inline1">
														<label for="marrycheck"><input type="radio" name="Armycheck" value="gun_no" id="marrycheck1" checked="checked"> 미혼</label>
													</div>
												</div>
											</div>
		
											<div class="form-group">
												<label for="checkbox" class="col-sm-2 control-label">Checkbox
													Inline</label>
												<div class="col-sm-8">
													<div class="checkbox-inline">
														<label><input type="checkbox"> Unchecked</label>
													</div>
													<div class="checkbox-inline">
														<label><input type="checkbox" checked="">
															Checked</label>
													</div>
													<div class="checkbox-inline">
														<label><input type="checkbox" disabled="">
															Disabled Unchecked</label>
													</div>
													<div class="checkbox-inline">
														<label><input type="checkbox" disabled=""
															checked=""> Disabled Checked</label>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label for="Bankselector" class="col-sm-2 control-label">지급은행</label>
												<div class="col-sm-2">
													<select name="Bankselector" id="Bankselector"
														class="form-control1">
														<option>은행을 선택하세요</option>
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
												<label for="Bankpin" class="col-sm-2 control-label">계좌번호</label>
												<div class="col-sm-3">
													<input type="text" class="form-control1"
														id="Bankpin" placeholder="은행계좌를 입력하세요">
												</div>
											</div>
											
											
											
											<div class="form-group">
												<label for="txtarea1" class="col-sm-2 control-label">Textarea</label>
												<div class="col-sm-8">
													<textarea name="txtarea1" id="txtarea1" cols="50" rows="4"
														class="form-control1"></textarea>
												</div>
											</div>
											<div class="form-group">
												<label for="radio" class="col-sm-2 control-label">Radio</label>
												<div class="col-sm-8">
													<div class="radio block">
														<label><input type="radio"> Unchecked</label>
													</div>
													<div class="radio block">
														<label><input type="radio" checked="">
															Checked</label>
													</div>
													<div class="radio block">
														<label><input type="radio" disabled="">
															Disabled Unchecked</label>
													</div>
													<div class="radio block">
														<label><input type="radio" disabled="" checked="">
															Disabled Checked</label>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label for="radio" class="col-sm-2 control-label">Radio
													Inline</label>
												<div class="col-sm-8">
													<div class="radio-inline">
														<label><input type="radio"> Unchecked</label>
													</div>
													<div class="radio-inline">
														<label><input type="radio" checked="">
															Checked</label>
													</div>
													<div class="radio-inline">
														<label><input type="radio" disabled="">
															Disabled Unchecked</label>
													</div>
													<div class="radio-inline">
														<label><input type="radio" disabled="" checked="">
															Disabled Checked</label>
													</div>
												</div>
											</div>
											<div class="form-group">
												<label for="smallinput"
													class="col-sm-2 control-label label-input-sm">Small
													Input</label>
												<div class="col-sm-8">
													<input type="text" class="form-control1 input-sm"
														id="smallinput" placeholder="Small Input">
												</div>
											</div>
											<div class="form-group">
												<label for="mediuminput" class="col-sm-2 control-label">Medium
													Input</label>
												<div class="col-sm-8">
													<input type="text" class="form-control1" id="mediuminput"
														placeholder="Medium Input">
												</div>
											</div>
											<div class="form-group mb-n">
												<label for="largeinput"
													class="col-sm-2 control-label label-input-lg">Large
													Input</label>
												<div class="col-sm-8">
													<input type="text" class="form-control1 input-lg"
														id="largeinput" placeholder="Large Input">
												</div>
											</div>
										</form>
									</div>
										<Center><button type="submit" class="btn btn-default">Submit</button></Center>
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