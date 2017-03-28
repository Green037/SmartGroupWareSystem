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
		$(document).on('click','#searchProjectBtn',function(){
			console.log('h2');
			$('#checkMember').modal();
			$('#mmCode').val(31);
			$('#mmPassword').val(123456);
		});
		$(document).on('click','#checkMemberBtn',function(){
			var params = $('#checkMemberForm').serialize();
			console.log(params);
			$.ajax({
				url : '/smart/wbs/checkMember',
				data : params,
				dataType : 'json',
				type : 'POST',
				success : function(data){
					/* console.log('h2 ajax WBS AddForm!');
					console.log(data);  */
					if(data.result){
						$('#prListTbody').empty();
						$.each(data.prList, function(i, result){
						/* console.log(result.prCode); */
							$('#projectList').css('display','');
							$('#prListTbody').append(`
								<tr>
									<td id="prCode_">`+result.prCode+`</td>
									<td>`+result.prName+`</td>
									<td>`+result.prMemberCode+`</td>
									<td>`+result.prProgress+`</td>
									<td>`+result.prCate+`</td>
									<td>`+result.prStartDay+`</td>
									<td>`+result.prEndDay+`</td>
									<td><a href="#" id="choiceBtn" class="btn-danger btn-lg">선택</a></td>
								</tr>`);
						});
						$('#checkMember').modal('hide');
					}else{
						alert(data.check+"이(가) 불일치 합니다 다시 입력해주세요.");
					}
				}
			});
		});
		$(document).on('click','#choiceBtn',function(){
			var prCode = $('#prCode_').text();
			console.log(prCode);
			$('#choiceBtn').attr({href:"<c:url value='/wbs/addForm?prCode="+prCode+"'/>"}).submit();
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
		<li class="active">WBS등록</li>
	</ol>
</div>	
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<a href="#" class="btn btn-info" id="searchProjectBtn" role="button"><span class="glyphicon glyphicon-zoom-in glyphsize"></span> <br/>내프로젝트<br/>검색하기</a>
		</div>   
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">내프로젝트 목록</h3>
					<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
				</div>
			<div class="panel-body">
				<div class="row">
					<table id="projectList" class="table table-hover" style="display:none;">
						<thead>
							<tr>
								<th>코드</th>
								<th>프로젝트명</th>
								<th>팀장</th>
								<th>인원모집상황</th>
								<th>분류</th>
								<th>시작일</th>
								<th>종료일</th>
								<th>#</th>
							</tr>
						</thead>
						<tbody id="prListTbody">
						
						</tbody>
					</table>   
				</div>
			</div>
		</div>
	</div>
</div>
	
<c:import url="./wbs_checkMemberForm.jsp"></c:import>			
<script src="<c:url value='/resources/js/bootstrap.min.js'/>" type="text/javascript"></script> 
</body>
</html>