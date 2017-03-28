<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
	<link href="<c:url value='/resources/css/panelSearch.css'/>" rel="stylesheet">
	
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	
	<script>
	/*자금내역 추가,삭제 */
	$(document).on('click','#addBtn',function(){
	    var addForm = $('#fundsAddForm').html();
	    $('#fundsInput').after(addForm);
	});
	$(document).on('click','#delBtn',function(){
	    console.log($(this).parent().parent());
	    $(this).parent().parent().remove();
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
		<li class="active">프로젝트등록</li>
	</ol>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h3 class="panel-title">프로젝트 등록</h3>
					<span class="pull-right clickable"><i class="glyphicon glyphicon-chevron-up"></i></span>
				</div>
			<div class="panel-body">
				<form class="form-horizontal" action="<c:url value='/pr/add'/>" method="post">
					<div>
						<button type="button" class="btn btn-info btn-block">프로젝트정보</button>
						<br/><br/>
					</div>
					<div class="form-group">
						<label for="prMemberCode" class="col-sm-2 control-label"> 팀장</label>
						<div class="col-sm-3">
							<input type="hidden" name="prMemberCode" id="prMemberCode" value="${mmCode}"/>
							<input type="text" class="form-control" name="mmName" value="${mmMap.mmName}" readonly="readonly">
						</div>
						
						<label for="dftCode" class="col-sm-2 control-label"> 기안코드 </label>
						<div class="col-sm-3">
							<select class="form-control" name="dftCode" id="dftCode">
                            	<option value="0">::선택::</option>
                            	<c:forEach var="docList" items="${docList}">
                            		<option value="${docList.docCode}">${docList.docFileGroup}</option>
                            	</c:forEach>
                            </select>
						</div>
					</div>
					<div class="form-group">
						<label for="prName" class="col-sm-2 control-label">프로젝트명</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="prName" id="prName" placeholder="프로젝트명을 입력하세요">
						</div>
						
						<label for="prMember" class="col-sm-2 control-label">참여인원</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="prMember" id="prMember" placeholder="참여인원을 입력하세요">
						</div>
					</div>
					<div class="form-group">
						<label for="prMoney" class="col-sm-2 control-label">프로젝트자금</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="prMoney" id="prMoney" placeholder="자금 총액을 입력하세요">
						</div>
						
						<label for="prProgress" class="col-sm-2 control-label">진행상황</label>
						<div class="col-sm-3">
							<select name="prProgress" id="prProgress" class="form-control" >
								<option>::선택::</option>
								<option value="모집중">모집중</option>
								<option value="모집완료">모집완료</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="prStartDay" class="col-sm-2 control-label">시작일시</label>
						<div class="col-sm-3">
							<input type="date" class="form-control" name="prStartDay" id="prStartDay">
						</div>
						
						<label for="prCate" class="col-sm-2 control-label">프로젝트분류</label>
						<div class="col-sm-3">
							<select name="prCate" id="prCate" class="form-control" >
								<option>::선택::</option>
								<option value="개발">개발</option>
								<option value="연구">연구</option>
								<option value="유지보수">유지보수</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="prEndDay" class="col-sm-2 control-label">종료일시</label>
						<div class="col-sm-3">
							<input type="date" class="form-control" name="prEndDay" id="prEndDay">
						</div>
						
						<label for="prForProgress" class="col-sm-2 control-label">최종진행여부</label>
						<div class="col-sm-3">
							<select name="prForProgress" id="prForProgress" class="form-control" >
								<option>::선택::</option>
								<option value="승인">승인</option>
								<option value="반려">반려</option>
							</select>
						</div>
					</div>
					<div class="form-group">
						<label for="prGoal" class="col-sm-2 control-label">프로젝트목적</label>
						<div class="col-sm-8">
							<textarea rows="3" cols="80" name="prGoal" id="prGoal"></textarea>
						</div>
					</div>
					
					<div>
						<button type="button" class="btn btn-info btn-block">자금내역</button>
						<br/><br/>
					</div>
					
					<div id="fundsInput">
						<div class="form-group">
							<label for="fuHistory" class="col-sm-2 control-label">자금세부내용</label>
							<div class="col-sm-3">
								<input type="text" name='fuHistory'  placeholder='사용내역' class="form-control"/>	
							</div>
							
							<label for="fuExpectedMoney" class="col-sm-2 control-label">예상금액</label>
							<div class="col-sm-3">
								<input type="text" name='fuExpectedMoney' placeholder='예상금액' class="form-control"/>	
							</div>
							<div>
								<button type="button" id="addBtn" class="btn-success">폼 추가</button>
							</div>
						</div>
					</div>
					<div id="fundsAddForm" style="display:none;">
						<div class="form-group">
							<label for="fuHistory" class="col-sm-2 control-label">자금세부내용</label>
							<div class="col-sm-3">
								<input type="text" name='fuHistory'  placeholder='사용내역' class="form-control"/>	
							</div>
							
							<label for="fuExpectedMoney" class="col-sm-2 control-label">예상금액</label>
							<div class="col-sm-3">
								<input type="text" name='fuExpectedMoney' placeholder='예상금액' class="form-control"/>	
							</div>
							<div>
								<button type="button" id="delBtn" class="btn-danger">삭제</button>
							</div>
						</div>
					</div>
					
					<div>
						<button type="button" class="btn btn-info btn-block">팀장정보</button>
						<br/><br/>
					</div>
					
					<div class="form-group">
						<label for="prMemberCode" class="col-sm-2 control-label">팀장코드</label>
						<div class="col-sm-3">
							<input type="hidden" name="mmCode" id="mmCode" value="${mmCode}"/>
							<input type="text" class="form-control" name="mmName_" value="${mmMap.mmName}" readonly="readonly"/>
						</div>
						
						<label for="pmLevel" class="col-sm-2 control-label">팀장레벨</label>
						<div class="col-sm-3">
							<select name="pmLevel" id="pmLevel" class="form-control">
                                <option value="">::등급::</option>
                                <option value="초급">초급</option>
                                <option value="중급">중급</option>
                                <option value="고급">고급</option>
                            </select>
						</div>
					</div>
					<div class="form-group">
						<label for="pmField" class="col-sm-2 control-label">업무분야</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="pmField" id="pmField" placeholder="업무분야를 입력하세요">
						</div>
						
						<label for="pmStartDate" class="col-sm-2 control-label">프로젝트 참여일</label>
						<div class="col-sm-3">
							<input type="date" class="form-control" name="pmStartDate" id="pmStartDate"/>
						</div>
					</div>
					<div class="form-group">
						<label for="pmNote" class="col-sm-2 control-label">특이사항</label>
						<div class="col-sm-3">
							<input type="text" class="form-control" name="pmNote" id="pmNote" placeholder="특이사항"/>
						</div>
					</div>
					<br/><br/><br/><br/>
					<div align="center">
						<button type="submit" class="btn-success btn-lg">프로젝트등록</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!-- 본문끝 -->

</body>
</html>