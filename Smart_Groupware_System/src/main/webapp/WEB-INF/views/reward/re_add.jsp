<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<link href="<c:url value='/resources/css/panelSearch.css'/>" rel="stylesheet">
	
	<script>
		$(document).ready(function() {
			
			$('#mmButton').click(function() {
				var mmCode = $('#mmCode').val();
				
				console.log('mmCode : '+ mmCode);
				
				$.ajax({
					type : "post",
					url : "/smart/pc/mmContent",
					data : {"mmCode": mmCode},
					success : function(data) {
// 						alert('data.mmCode : ' + data.mmCode);
// 						alert('data.mmName : ' + data.mmName);
// 						
						$('#mmCode').val(data.mmCode);
						$('#mmName').val(data.mmName);
						
// 						alert('mmCode : ' + $('#mmCode').val());
// 						alert('mmName : ' + $('#mmName').val());
					}
				});
			});
		});
		
		$(document).ready(function(){
			$('#mainMenu').css('display','none');
			$('#payment').css('display','');
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
		<li class="active">인사부권한 > 고과내역추가</li>
	</ol>
</div>

<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-info">
				<div class="panel-heading">
				<h3 class="panel-title">인사부권한 > 고과내역추가</h3>
				<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
				</div>
			<div class="panel-body">
				<form class="form-horizontal" method="post" action="<c:url value='/re/add'/>" enctype="multipart/form-data">
					<div class="form-group">
						<div class="row">
							<label for="mmCode" class="col-sm-2 control-label">
								<span class="glyphicon glyphicon-user"></span> 사원코드
							</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" name="mmCode" id="mmCode"/>
							</div>
							<div class="col-sm-3">
								<a class="btn-success btn-lg" id="mmButton">검색</a>
							</div>
						</div>				
					</div>
					<div class="form-group">
						<div class="row">
							<label for="mmName" class="col-sm-2 control-label">
								<span class="glyphicon glyphicon-user blue"></span>사원이름
							</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="mmName" name="mmName" placeholder="코드로 검색하세요" readonly/>
							</div>
							
							<label for="reGrade" class="col-sm-2 control-label">
								<span class="glyphicon glyphicon-user"></span> 평가등급
							</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="reGrade" name="reGrade"/>
							</div>
						</div>				
					</div>
					<div class="form-group">
						<div class="row">
							<label for="reDate" class="col-sm-2 control-label">
								<span class="glyphicon glyphicon-calendar blue"></span>평가날짜
							</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="reDate" name="reDate" placeholder="YYYY-MM-DD"/>
							</div>
							
							<label for="uploadFile" class="col-sm-2 control-label">
								<span class="glyphicon glyphicon-calendar blue"></span>고과서류첨부
							</label>
							<div class="col-sm-3">
								<input type="file" class="form-control" id="uploadFile" name="uploadFile" style="border:0px solid black;"/>
							</div>
						</div>				
					</div>
					<div class="form-group">
						<div class="row">
							<label for="reMmCode" class="col-sm-2 control-label">
								<span class="glyphicon glyphicon-user"></span> 담당사원코드
							</label>
							<div class="col-sm-3">
								<input type="text" class="form-control" id="reMmCode" name="reMmCode" value="${reMmCode}" readonly/>
							</div>
						</div>
					</div>
					<br/><br/><br/><br/>
					<div class="form-group" align="center">
						<button type="submit" class="btn-primary btn-lg">등록</button>
						<button type="reset" class="btn-primary btn-lg">다시작성</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
<script src="<c:url value='/resources/js/bootstrap.min.js'/>" type="text/javascript"></script> 		
</body>
</html>