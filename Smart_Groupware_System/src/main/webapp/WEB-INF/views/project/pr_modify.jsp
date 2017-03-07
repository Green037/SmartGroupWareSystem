<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
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
		$(document).on('click','#WbsModifyBtn',function(){
			var wbsCode = $(this).parent().parent().children('#wbsCode').val();
			console.log(wbsCode);
			//팝업창 열기
			$('#wbsModifyForm').modal();
			//ajax로 wbs내용 가져와 팝업창에 세팅하기
			$.ajax({
				url: '/smart/wbs/detail',
				data : {"wbsCode":wbsCode},
				dataType : 'json',
				type : 'post',
				success : function(data){
					console.log(data.check);
					console.log(data.wbs.wbsCode);
					/*여기부터 작업해야함. 작업분해도 클릭시 열리는 형식으로 바꿀것. */
					if(data.check == '성공'){
						$('#wbsCode').val(wbsCode);
						$('#wbsName').val(data.wbs.wbsName);
						$('#wbsContents').val(data.wbs.wbsContents);
						$('#wbsStartDate').val(data.wbs.wbsStartDate);
						$('#wbsEndDate').val(data.wbs.wbsEndDate);
						$('#wbsProgress').val(data.wbs.wbsProgress);
						$('#wbsUncompleatedReason').val(data.wbs.wbsUncompleatedReason);
						$('#wbsFinalEndDate').val(data.wbs.wbsFinalEndDate);
					}
				}
			});
		});
	</script>
</head> 

<body>
<%@ include file="../menu.jsp" %>

<!-- contents -->
<div class="page-container">
<div class="left-content">
<div class="inner-content">
<div class="outter-wp">	
<!-- 본문시작 -->
<div class="container">
	<center>
		<h2><span class="glyphicon glyphicon-file"> 프로젝트 수정</span></h2>
	</center>
	<marquee behavior="alternate">
		<p style="color:red;">This infomation is detail contents By you selected. You can fix contents.</p>
	</marquee>
	
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
					<td colspan="3">-</td>
					<td><strong><span class="glyphicon glyphicon-king"></span> 직급</strong></td>
					<td>-</td>
					<td><strong><span class="glyphicon glyphicon-flag"></span> 부서</strong></td>
					<td>-</td>
				</tr>
				<tr>
					<td><strong><span class="glyphicon glyphicon-envelope"></span> 이메일</strong></td>
					<td colspan="2">-</td>
					<td><strong><span class="glyphicon glyphicon-earphone"></span> 전화번호</strong></td>
					<td colspan="2">-</td>
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
							$('#"prForProgress"').val('${project.prForProgress}').attr('selected','selected');
						</script>
					</td>
					<td><span class="glyphicon glyphicon-hourglass"></span> <strong>프로젝트진행상황</strong></td>
					<td>${project.prFinishCheck}</td>
				<tr>
					<td colspan="8" style="color:blue;" align="center">WBS(작업분해도)</td>
				</tr>
			</tbody>
		</table>
		<table class="table table-bordered">
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
					<tr>
						<input type="hidden" id="wbsCode" value="${wbsList.wbsCode}"/>
						<td>${wbsList.wbsCate}</td>
						<td>${wbsList.wbsName}</td>
						<td>${wbsList.wbsContents}</td>
						<td>${wbsList.wbsStartDate}</td>
						<td>${wbsList.wbsEndDate}</td>
						<td style="width:80px;">${wbsList.wbsProgress}%</td>
						<td>
							<div class="progress progress-bar-xs">
								<div class="progress-bar progress-bar-info" role="progressbar" 
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
							<a href="<c:url value='/pr/modify?prCode=${project.prCode}'/>" class="btn btn-primary" >
								<span class="glyphicon glyphicon-edit"></span> 수정
							</a>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
<c:import url="./pm_addList.jsp"></c:import> <!-- 팝업창 참여인원 추가 지원자 리스트 -->
<c:import url="./fu_modifyList.jsp"></c:import> <!-- 팝업창 자금상세내역 리스트 -->
<c:import url="./fu_modifyForm.jsp"></c:import> <!-- 팝업창 자금수정폼 -->
<c:import url="./fu_addForm.jsp"></c:import> <!--팝업창 자금내역추가 입력폼  -->
<c:import url="../wbs/wbs_modifyForm.jsp"></c:import> <!--팝업창 WBS수정폼  -->
<!-- 본문끝 -->
</div>				
</div>
</div>
</div>
		
<%@ include file="../footer.jsp"%>
</body>
</html>