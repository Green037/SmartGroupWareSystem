<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>

<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
<link href="<c:url value='/resources/css/panelSearch.css'/>" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>

<script type="text/javascript">
	//검색버튼 클릭시 ajax사용하여 조회해서 뿌려주기
	$(document).on('click','#mmListSearchBtn',function(){
		$('#mmListTbody').empty();
		$('#mmListForm').css('display','');
		var formData = $('#mmSearchForm').serialize();
		console.log(formData);
		$.ajax({
			url : '/smart/member/mm_listSearch',
			data : formData,
			dataType : 'json',
			type : 'post',
			success : function(data){
				/* console.log('H2 Ajax Form Search');
				console.log(data[0].mmName); */
				$.each(data, function(i, mmList){
					$('#mmListTbody').append(`
						<tr>
							<td>`+mmList.mmCode+`</td>
							<td><a href="<c:url value='/member/mm_view?mmCode=`+mmList.mmCode+`'/>">`+mmList.mmName+`</a></td>
							<td>`+mmList.dpName+`</td>
							<td>`+mmList.ptName+`</td>
							<td>`+mmList.ctType+`</td>
						</tr>
						`);
				});
				var $this = $('.panel-heading span.clickable');
				$this.parents('.panel').find('.panel-body').slideUp();
				$this.addClass('panel-collapsed');
				$this.find('i').removeClass('glyphicon-chevron-up').addClass('glyphicon-chevron-down');
			}
		});
	});
	
	$(document).ready(function(){
		$('#mainMenu').css('display','none');
		$('#member').css('display','');
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
		<li class="active">사원조회</li>
	</ol>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-info">
				<div class="panel-heading">
					<h3 class="panel-title">검색하실 조건를 입력해주세요</h3>
					<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
				</div>
			<div class="panel-body">
				<form id="mmSearchForm">
					<table class="table table-bordered">
						<tr>
							<th>이름</th>
							<td>
								<input type="text" class="form-control" id="mmName" name="mmName" placeholder="사원 이름">
							</td>
							<th>직급</th>
							<th>
								<select name="ptCode" id="ptCode" class="form-control">
									<option value="0">:::직급선택:::</option>
									<c:forEach var="position" items="${position}">
										<option value="${position.ptCode}">${position.ptName}</option>
									</c:forEach> 
								</select>
							</th>
							<th>부서</th>
							<th>
								<select name="dpCode" id="dpCode" class="form-control">
									<option value="0">:::부서선택:::</option>
										<c:forEach var="department" items="${department}">
											<option value="${department.dpCode}">${department.dpName}</option>
										</c:forEach> 
								</select>
							</th>
						</tr>
						<tr>
							<th>최종학력</th>
							<th>
								<select name="acCode" id="acCode" class="form-control">
									<option value="0">:::학력을 선택하세요:::</option>
									<c:forEach var="achieve" items="${achieve}">
										<option value="${achieve.acCode}">${achieve.acName}</option>
									</c:forEach>
								</select> 
							</th>
							<th>보유 자격증</th>
							<td colspan="3">
								<select name="lcCode" id="lcCode" class="form-control">
									<option value="0">:::자격증을 선택하세요:::</option>
									<c:forEach var="license" items="${license}">
										<option value="${license.lcCode}">${license.lcName}</option>
									</c:forEach> 
								</select>
							</td>
						</tr>
						<tr>
							<th  colspan = "6">
								<div class="button-group" align="center">
									<button type="button" class="btn-info btn-lg" id="mmListSearchBtn">검색</button>
									<button type="reset"  class="btn-info btn-lg"  value="다시작성" >다시작성</button>
								</div>
							</th>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
</div>
<div class="sub-heard-part">
	<ol class="breadcrumb m-b-0" align="center">
		<li><h3><span class="glyphicon glyphicon-user blue">사원리스트</h3></li>
	</ol>
</div>
<div align="center" id="mmListForm" style="display:none;">		
	<div class="container">
		<form id="mmListShowForm" >
			<table id="mmList" class="table table-hover" >
				<thead>
					<tr>
						<th>사원번호</th>
						<th>사원 이름</th>
						<th>소속부서</th>
						<th>직급</th>
						<th>계약형태</th>
					</tr>
				</thead>
				<tbody id="mmListTbody">
						
				</tbody>
			</table>
		</form>
	</div>
</div>
</body>
</html>