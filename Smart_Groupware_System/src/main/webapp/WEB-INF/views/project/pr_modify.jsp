<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<link href="<c:url value='/resources/css/panelSearch.css'/>" rel="stylesheet">
	
	<script>
		/*참여인원대기자 리스트연결  */
		$(document).on('click','#pmAddBtn',function(){
			$('#putInForList').modal();
			var prCode = ${project.prCode};
			$.ajax({
				url: '/smart/pm/add',
				data : {'prCode' : prCode},
				dataType : 'json',
				type : 'POST',
				success : function(data){
					$('#pmAddListTbody').empty();
					$.each(data, function(i, result){
						/* console.log('h2 modify Ajax!'); */
						$('#pmAddListTbody').append(`
							<tr>
								<td><input type="hidden" name="pmCode_" value="`+result.pmCode+`"/>`+result.pmCode+`</td>
								<td><input type="hidden" name="prCode_" value="`+result.prCode+`"/>`+result.prCode+`</td>
								<td>`+result.pmLevel+`</td>
								<td>`+result.pmNote+`</td>
								<td>
									<select name="pmApproval_" id="pmApproval_">
										<option value="대기">대기</option>
										<option value="승인">승인</option>
										<option value="반려">반려</option>
									</select>
							</tr>`);
					});
				}
			});
		});
	
		/* 상세자금리스트 연결 */
		$(document).on('click','#fuModifyListBtn',function(){
			$('#fuModifyList').modal();
			var prCode = ${project.prCode};
			$.ajax({
				url: '/smart/fu/modifyList',
				data : {'prCode':prCode},
				dataType : 'json',
				type : 'post',
				success : function(data){
					/* console.log("h2 Ajax pr_Modify!!") */
					$('#fuModifyListTbody').empty();
					$.each(data, function(i, result){
						$('#fuModifyListTbody').append(`
							<tr>
								<td id="_fuCode">`+result.fuCode+`</td>
								<td>`+result.prCode+`</td>
								<td>`+result.fuHistory+`</td>
								<td>`+result.fuExpectedMoney+`</td>
								<td>`+result.fuUsedMoney+`</td>
								<td><button type="button" id="fuModifyBtn">수정</button></td>
							</tr>`);
					});
				}
			});
		});
		
		/* 자금목록 팝업창에서 수정버튼 클릭시 상세정보 가져와서 세팅 */
		$(document).on('click','#fuModifyBtn',function(){
			/* 수정버튼에 해당하는 자금코드를 가져와서 fuCode변수에 할당한다. */
			var fuCode = $(this).parent().parent().children('#_fuCode').text();
			var totalMoney = ${project.prMoney};
			/* console.log(fuCode); */
			
			$('#fuModifyList').modal('hide'); /* 기존의 팝업창을 닫는다 */
			$('#fuModifyForm').modal();
			$('#fuCode').val(fuCode);
			
			$.ajax({
				url: '/smart/fu/modifyValue',
				data : {'fuCode':fuCode},
				dataType : 'json',
				type : 'post',
				success : function(data){
					console.log('H2 Ajax fuModifyValue~ JSP');
					console.log(data.fuHistory);
					$('#fuHistory').val(data.fuHistory);
					$('#fuExpectedMoney').val(data.fuExpectedMoney+'/'+totalMoney);
					$('#fuUsedMoney').val(data.fuUsedMoney);
				}
			});
		});
		
		/* 수정처리 버튼 누르면 DB데이터 수정하고 처리 결과 리턴하여 경고창 띄우기 */
		$(document).on('click','#_fuModifyBtn',function(){
			var funds = $('#fuMoForm').serialize();
			/* console.log(funds); */
			$.ajax({
				url: '/smart/fu/modify',
				data : funds,
				dataType : 'json',
				type : 'post',
				success : function(data){
					/* console.log('수정결과 ajax');
					console.log(data.result); */
					alert('입력에 '+data.result+' 하였습니다.');
				}
			});
			$('#fuModifyForm').modal('hide');
		});
		
		/* 자금목록 팝업창에서 자금내역추가버튼 클릭시 입력폼 연결 */
		$(document).on('click','#fuAddHistoryBtn',function(){
			$('#fuModifyList').modal('hide'); /* 기존의 팝업창을 닫는다 */
			$('#fuAddHistory').modal();
			
			var prCode = ${project.prCode}; 
			$('#_prCode').val(prCode);
		});
		
		/* 내역추가 버튼 누르면 DB에 데이터 입력하고 처리 결과 리턴하여 경고창 띄우기 */
		$(document).on('click','#_fuAddBtn',function(){
			var funds = $('#fuAddHistoryForm').serialize();
			/* console.log(funds); */
			$.ajax({
				url: '/smart/fu/add',
				data : funds,
				dataType : 'json',
				type : 'post',
				success : function(data){
					alert('입력에 '+data.result+' 하였습니다.');
				}
			});
			$('#fuAddHistory').modal('hide');
		});
		
		// wbs수정팝업창 띄우기 이벤트
		$(document).on('click','#WbsModifyBtn',function(){
			var wbsCode = $(this).parent().parent().children('#wbsCode').val();
			/* console.log(wbsCode); */
			//팝업창 열기
			$('#wbsModifyForm').modal();
			//ajax로 wbs내용 가져와 팝업창에 세팅하기
			$.ajax({
				url: '/smart/wbs/detail',
				data : {'wbsCode':wbsCode},
				dataType : 'json',
				type : 'post',
				success : function(data){
					/* console.log(data.check);
					console.log(data.wbs.wbsCode); */
					if(data.check == '성공'){
						$('#_wbsCode').val(data.wbs.wbsCode);
						$('#wbsName').val(data.wbs.wbsName);
						$('#wbsContents').val(data.wbs.wbsContents);
						$('#wbsStartDate').val(data.wbs.wbsStartDate);
						$('#wbsEndDate').val(data.wbs.wbsEndDate);
						$('#wbsProgress').val(data.wbs.wbsProgress);
						$('#wbsUncompleatedReason').val(data.wbs.wbsUncompleatedReason);
						$('#wbsFinalEndDate').val(data.wbs.wbsFinalEndDate);
					}else{
						alert('자료 불러오기에 '+data.check+'하였습니다')
					}
				}
			});
		});
		
		//Wbs 화면 등장이벤트
		$(document).on('click','#showWbsBtn',function(){
			$('#wbsTable').css('display','');
		});
		
		//wbs 수정처리 
		$(document).on('click','#modifyActionBtn',function(){
			var wbsData = $('#actionForm').serialize();
			/* console.log(wbsData); */
			var wbsCode = $('#_wbsCode').val();
			/* console.log(wbsCode); */
			var trTag = '#wbsTr'+wbsCode;
			/* console.log(trTag);
			console.log($(trTag).children('#1').text()); */
			$.ajax({
				url: '/smart/wbs/modifyWbs',
				data : wbsData,
				dataType : 'json',
				type : 'post',
				success : function(data){
					console.log(data.check);
					if(data.check == '성공'){
						// 수정 후 조회해온 자료 화면에 뿌려주기!
						$(trTag).children('#2').empty();
						$(trTag).children('#2').text(data.wbs.wbsName);
						$(trTag).children('#3').empty();
						$(trTag).children('#3').text(data.wbs.wbsContents);
						$(trTag).children('#4').empty();
						$(trTag).children('#4').text(data.wbs.wbsStartDate);
						$(trTag).children('#5').empty();
						$(trTag).children('#5').text(data.wbs.wbsEndDate);
						$(trTag).children('#6').empty();
						$(trTag).children('#6').text(data.wbs.wbsProgress+'%');
						$(trTag).find('#progressBar').attr('aria-valuenow',data.wbs.wbsProgress);
						$(trTag).find('#progressBar').css('width',data.wbs.wbsProgress+'%');
						$('#wbsModifyForm').modal('hide');
					}
					alert('수정이 '+data.check+'하였습니다.');
				}
			});
			
		});
		
		$(document).ready(function(){
			$('#mainMenu').css('display','none');
			$('#project').css('display','');
		});
		
		//패널 검색폼 여닫기 이벤트 핸들러
		$(document).on('click', '.panel-heading span.clickable', function(e){
		    var $this = $(this);
			if(!$this.hasClass('panel-collapsed')) {
				$this.parents('.panel').find('.panel-body').slideUp();
				$this.addClass('panel-collapsed');
				$this.find('i').removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
			} else {
				$this.parents('.panel').find('.panel-body').slideDown();
				$this.removeClass('panel-collapsed');
				$this.find('i').removeClass('glyphicon-chevron-down').addClass('glyphicon-chevron-up');
			}
		})
	</script>
</head> 
<c:import url="../mainIndex.jsp"></c:import>
<body>
<!-- 본문 -->
<div class="sub-heard-part">
	<ol class="breadcrumb m-b-0">
		<li><a href="<c:url value='/main/mainIndex'/>">Home</a></li>
		<li class="active">프로젝트수정</li>
	</ol>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title"><span class="glyphicon glyphicon-edit"></span>프로젝트 수정</h3>
					<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
				</div>
			<div class="panel-body">
				<form action="<c:url value='/pr/modify'/>" method="post" id="modifyForm">            
					<table class="table table-bordered">
						<thead>
							<tr>
								<th><span class="glyphicon glyphicon-bookmark"></span> 프로젝트코드</th>
								<th colspan="7">
									<center>${project.prCode}</center>
									<input type="hidden" name="prCode" value="${project.prCode}"/>
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><span class="glyphicon glyphicon-list-alt"></span> 프로젝트명</td>
								<td colspan="7">
									<input type="text" name="prName" value="${project.prName}" class="form-control"/>
								</td>
							</tr>
							<tr>
								<td><span class="glyphicon glyphicon-comment"></span> 프로젝트목적</td>
								<td colspan="7">
									<input type="text" name="prGoal" value="${project.prGoal}" class="form-control"/>
								</td>
							</tr>
							<tr>
								<td><strong><span class="glyphicon glyphicon-king"></span> 팀장</strong></td>
								<td colspan="3">
									<input type="text" name="mmName" value="${mmMap.mmName}" class="form-control" readonly="readonly"/>
								</td>
								<td><strong><span class="glyphicon glyphicon-king"></span> 직급</strong></td>
								<td>
									<input type="text" name="ptName" value="${mmMap.ptName}" class="form-control" readonly="readonly"/>
								</td>
								<td><strong><span class="glyphicon glyphicon-flag"></span> 부서</strong></td>
								<td>
									<input type="text" name="ctType" value="${mmMap.ctType}" class="form-control" readonly="readonly"/>
								</td>
							</tr>
							<tr>
								<td><strong><span class="glyphicon glyphicon-envelope"></span> 이메일</strong></td>
								<td colspan="2"><input type="text" name="mmEmail" value="${mmMap.mmEmail}" class="form-control" readonly="readonly"/></td>
								<td><strong><span class="glyphicon glyphicon-earphone"></span> 전화번호</strong></td>
								<td colspan="2"><input type="text" name="mmTel" value="${mmMap.mmTel}" class="form-control" readonly="readonly"/></td>
								<td><strong><span class="glyphicon glyphicon-log-in"></span> 참여인원</strong></td>
								<td>
									<span>${pmCount}</span> / ${project.prMember}
									<button type="button" id="pmAddBtn">인원추가</button>
									
								</td>
							</tr>
							<tr>
								<td><strong><span class="glyphicon glyphicon-usd"></span> 총자금</strong></td>
								<td>
									<input type="text" name="prMoney" value="${project.prMoney}" class="form-control"/>
									<button type="button" id="fuModifyListBtn">내역수정</button>
								</td>
								<td><strong><span class="glyphicon glyphicon-calendar"></span> 시작일</strong></td>
								<td colspan="2"><input type="date" name="prStartDay" value="${project.prStartDay}" class="form-control"/></td>
								<td><strong><span class="glyphicon glyphicon-calendar"></span> 종료일</strong></td>
								<td colspan="2"><input type="date" name="prEndDay" value="${project.prEndDay}" class="form-control"/></td>
							</tr>
							<tr>
								<td><strong><span class="glyphicon glyphicon-tasks"></span> 팀원모집상황</strong></td>
								<td>
									<input type="radio" name="prProgress" value="모집중"/>모집중
									<input type="radio" name="prProgress" value="모집완료"/>모집완료
									<script>
										$('input:radio[name="prProgress"]:radio[value="${project.prProgress}"]').prop("checked",true);
									</script>
								</td>
								<td><strong><span class="glyphicon glyphicon-folder-open"></span> 분류</strong></td>
								<td>
									<select name="prCate" id="prCate">
										<option value="개발">개발</option>
										<option value="연구">연구</option>
										<option value="유지보수">유지보수</option>
									</select>
									<script>
										$('#prCate').val('${project.prCate}').attr('selected','selected');
									</script>
								</td>
								<td><strong><span class="glyphicon glyphicon-check"></span> 진행최종승인여부</strong></td>
								<td>
									<select name="prForProgress" id="prForProgress">
										<option value="승인">승인</option>
										<option value="반려">반려</option>
									</select>
									<script>
										$('#prForProgress').val('${project.prForProgress}').attr('selected','selected');
									</script>
								</td>
								<td><span class="glyphicon glyphicon-hourglass"></span> <strong>프로젝트진행상황</strong></td>
								<td>${project.prFinishCheck}</td>
							<tr>
								<td colspan="8" style="color:blue;" align="center">
									<button type="button" class="btn btn-primary btn-success btn-block" id="showWbsBtn">
										<span class="glyphicon glyphicon-search"></span>
										 WBS(작업분해도)보기
									</button>
								</td>
							</tr>
						</tbody>
					</table>
					<table class="table table-bordered" style="display:none;" id="wbsTable">
							<!-- WBS 넣기 -->
						<thead>
							<tr>
								<th style="width:80px;" align="center">대분류</td>
								<th style="width:130px;" align="center">직무명</td>
								<th style="width:200px;" align="center">세부사항</td>
								<th style="width:170px;" align="center">시작일</th>
								<th style="width:170px;" align="center">종료일</th>
								<th colspan="2" align="center">진행률</td>
								<th style="width:90px;"></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="wbsList" items="${wbsList}">
								<tr id="wbsTr${wbsList.wbsCode}">
									<input type="hidden" id="wbsCode" class="wbsCode" value="${wbsList.wbsCode}"/>
									<td id="1">${wbsList.wbsCate}</td>
									<td id="2">${wbsList.wbsName}</td>
									<td id="3">${wbsList.wbsContents}</td>
									<td id="4">${wbsList.wbsStartDate}</td>
									<td id="5">${wbsList.wbsEndDate}</td>
									<td style="width:80px;" id="6">${wbsList.wbsProgress}%</td>
									<td id="7">
										<div class="progress progress-bar-xs">
											<div class="progress-bar progress-bar-info" id="progressBar" role="progressbar" 
												aria-valuenow="${wbsList.wbsProgress}" aria-valuemin="0" aria-valuemax="100" 
												style="width: ${wbsList.wbsProgress}%;">
											</div>
										</div>                                        
				                    </td>
				                    <td>
				                    	<button type="button" id="WbsModifyBtn">
											<span class="glyphicon glyphicon-edit">수정</span> 
										</button>
				                    </td>
								</tr>
							</c:forEach>
							<tr>
								<td colspan="8" align="center">
									<div class="btn-group">
										<button type="submit" class="btn-primary btn-lg" >
											<span class="glyphicon glyphicon-edit"></span> 수정
										</button>
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<c:import url="./pm_addList.jsp"></c:import> <!-- 팝업창 참여인원 추가 지원자 리스트 -->
<c:import url="./fu_modifyList.jsp"></c:import> <!-- 팝업창 자금상세내역 리스트 -->
<c:import url="./fu_modifyForm.jsp"></c:import> <!-- 팝업창 자금수정폼 -->
<c:import url="./fu_addForm.jsp"></c:import> <!--팝업창 자금내역추가 입력폼  -->
<c:import url="../wbs/wbs_modifyForm.jsp"></c:import> <!--팝업창 WBS수정폼  -->
<!-- 본문끝 -->
<script src="<c:url value='/resources/js/bootstrap.min.js'/>" type="text/javascript"></script> 		
</body>
</html>