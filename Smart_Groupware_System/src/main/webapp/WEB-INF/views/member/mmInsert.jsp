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
								<h3 class="inner-tittle two"> 사원 등록 </h3>
								<div class="grid-1">
									<div class="form-body">
										<form class="form-horizontal">
											
											<div class="form-group">
												<label for="nameinput" class="col-sm-2 control-label"> 사원이름 </label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="nameinput"
														placeholder="사원 이름">
												</div>
												<div class="col-sm-2">
													<p class="help-block"></p>
												</div>
											</div>
											
											<div class="form-group">
												<label for="Emailinput" class="col-sm-2 control-label"> Email </label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="Emailinput"
														placeholder="사원 이메일">
												</div>

											</div>
											<div class="form-group">
												<label for="Passwordinput" class="col-sm-2 control-label"> 비밀번호 </label>
												<div class="col-sm-3">
													<input type="password" class="form-control1"
														id="Passwordinput" placeholder="비밀번호">
												</div>
											</div>

											<div class="form-group">
												<label for="dayliyPayinput" class="col-sm-2 control-label"> 일급 </label>
												<div class="col-sm-2">
													<input type="text" class="form-control1"
														id="dayliyPay" placeholder="사원 일급">
												</div>
											</div>	
			
											<div class="form-group">
												<label for="joinDateinput" class="col-sm-2 control-label"> 입사 날짜 </label>
												<div class="col-sm-2">
													<input type="date" class="form-control1"
														id="joinDateinput" placeholder="사원 입사날짜">
												</div>
											</div>	
											
											
											<div class="form-group">
												<label for="annualLeaveinput" class="col-sm-2 control-label"> 남은 연차 </label>
												<div class="col-sm-2">
													<input type="text" class="form-control1"
														id="annualLeaveinput" placeholder="남은 연차">
												</div>
											</div>
											
											<div class="form-group">
												<label for="addressinput" class="col-sm-2 control-label"> 주소 </label>
												<div class="col-sm-8">
													<input type="text" class="form-control1"
														id="addressinput" placeholder="사원 주소">
												</div>
											</div>
											
											<div class="form-group">
												<label for="telinput" class="col-sm-2 control-label"> 연락처 </label>
												<div class="col-sm-3">
													<input type="text" class="form-control1"
														id="telinput" placeholder="연락처">
												</div>
												
											</div>
											


											<div class="form-group">
												<label class="col-sm-2 control-label" for="Armycheck"> 군필여부 </label>
												<div class="col-sm-8">
													<div class="radio-inline1">
														<label for="Armycheck"><input type="radio"
															name="Armycheck" value="gun_yes" id="Armycheck"
															checked="checked"> 군필 </label>
													</div>
													<div class="radio-inline1">
														<label for="Armycheck"><input type="radio"
															name="Armycheck" value="gun_no" id="Armycheck1"
															checked="checked"> 미필 </label>
													</div>
												</div>
											</div>

											<div class="form-group">
												<label class="col-sm-2 control-label" for="marrycheck"> 결혼여부 </label>
												<div class="col-sm-8">
													<div class="marry-inline1">
														<label for="marrycheck"><input type="radio"
															name="Armycheck" value="gun_yes" id="marrycheck"
															checked="checked"> 기혼 </label>
													</div>
													<div class="marry-inline1">
														<label for="marrycheck"><input type="radio"
															name="Armycheck" value="gun_no" id="marrycheck1"
															checked="checked"> 미혼 </label>
													</div>
												</div>
											</div>
											
											<div class="form-group">
												<label for="schoolselector" class="col-sm-2 control-label"> 최종학력 </label>
												<div class="col-sm-2">
													<select name="Bankselector" id="schoolselector"
														class="form-control1">
														<option> 학력을 선택하세요</option>
													</select>
												</div>
											</div>
											
											<div class="form-group">
												<label for="schoolNameinput" class="col-sm-2 control-label"> 학교명 </label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="schoolNameinput"
														placeholder="학교명">
												</div>
											</div>
											
											<div class="form-group">
												<label for="majorinput" class="col-sm-2 control-label"> 전공 </label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="majorinput"
														placeholder="전공">
												</div>
											</div>
											
											<div class="form-group">
												<label for="jumsuinput" class="col-sm-2 control-label"> 최종성적 </label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="jumsuinput"
														placeholder="최종성적">
												</div>
											</div>
											
											<div class="form-group">
												<label for="gradeinput" class="col-sm-2 control-label"> 졸업학점 </label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="gradeinput"
														placeholder="졸업학점">
												</div>
											</div>
											
											
											<div class="form-group">
												<label for="admissionDateinput" class="col-sm-2 control-label"> 입학 날짜 </label>
												<div class="col-sm-2">
													<input type="date" class="form-control1"
														id="admissionDateinput">
												</div>
											</div>
											
											<div class="form-group">
												<label for="graduationDateinput" class="col-sm-2 control-label"> 졸업 날짜 </label>
												<div class="col-sm-2">
													<input type="date" class="form-control1"
														id="graduationDateinput">
												</div>
											</div>

											



											<div class="form-group">
												<label for="checkbox" class="col-sm-2 control-label"> 보유 자격증 </label>
												<div class="col-sm-8">
													<div class="checkbox-inline1">
														<label><input type="checkbox"> Unchecked</label>
													</div>
													<div class="checkbox-inline1">
														<label><input type="checkbox" checked="">
															Checked</label>
													</div>
												</div>
											</div>


											<div class="form-group">
												<label for="Bankselector" class="col-sm-2 control-label">지급은행</label>
												<div class="col-sm-2">
													<select name="Bankselector" id="Bankselector"
														class="form-control1">
														<option>은행을 선택하세요</option>
														<option>신한은행</option>
														<option>농협</option>
														<option>우리은행</option>
														<option>국민은행</option>
														<option>하나은행</option>
														<option>기업은행</option>
														<option>시티은행</option>
													</select>
												</div>
											</div>
											<div class="form-group">
												<label for="Bankpin" class="col-sm-2 control-label">계좌번호</label>
												<div class="col-sm-3">
													<input type="text" class="form-control1" id="Bankpin"
														placeholder="은행계좌를 입력하세요(-제외)">
												</div>
											</div>



											<div class="form-group">
												<label for="txtarea1" class="col-sm-2 control-label">기타 사항</label>
												<div class="col-sm-8">
													<textarea name="txtarea1" id="txtarea1" cols="50" rows="4"
														class="form-control1"></textarea>
												</div>
											</div>

											<div class="form-group">
												<center>
													<button type="submit" class="btn btn-default">등록</button>
												</center>
											</div>
											<!--사원등록 end -->




										</form>
									</div>

								</div>
							</div>
						</div>



						<!--  body폼 끝 -->


					</div>
				</div>
			</div>
		</div>
	</div>



	<%@ include file="../footer.jsp"%>
</body>
</html>