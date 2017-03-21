<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<link href="<c:url value='/resources/css/mainView.css'/>" rel="stylesheet" type="text/css"/>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" />
	
	<script>
	$(document).ready(function () {
		$('[data-toggle="tooltip"]').tooltip();
	    $('.material-button-toggle').on("click", function () {
	        $(this).toggleClass('open');
	        $('.option').toggleClass('scale-on');
	        
	    });
	});
	
	$(document).on('click','#projectInfoBtn',function(){
		$('#memberInfoForm').css('display','none');
		$('#accordion').css('display','');
	});
	
	$(document).on('click','#memberInfoBtn',function(){
		$('#accordion').css('display','none');
		$('#memberInfoForm').css('display','');
	});
	
	
	</script>
</head> 
<body>
<%@ include file="menu.jsp" %>
<!-- contents -->
<div class="page-container">
<div class="left-content">
<div class="inner-content">
<div class="outter-wp">	
<!-- 본문시작 -->
<h1 style="background-color:blue;color:white;">PortFolio - Smart Groupware-System</h1>
<div class="container">
	<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-6">
			
		</div>
	</div>
	
	<div class="row">
      <div class="col-md-4 col-md-offset-4">
        <div class="material-button-anim">
          <ul class="list-inline" id="options">
            <li class="option">
              <button class="material-button option1" type="button" id="memberInfoBtn" data-toggle="tooltip" data-placement="left" title="팀원소개">
                <span class="glyphicon glyphicon-user" aria-hidden="true"></span>
              </button>
            </li>
            <li class="option">
              <button class="material-button option2" type="button" id="projectInfoBtn" data-toggle="tooltip" data-placement="top" title="프로젝트 소개">
                <span class="glyphicon glyphicon-duplicate" aria-hidden="true"></span>
              </button>
            </li>
            <li class="option">
              <button class="material-button option3" type="button" data-toggle="tooltip" data-placement="right" title="후기">
                <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
              </button>
            </li>
          </ul>
          <button class="material-button material-button-toggle" type="button">
            <span class="fa fa-plus" aria-hidden="true"></span>
          </button>
        </div>
      </div>
	</div>
	
	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="display:none;">
	<h1 style="background-color:#3a6bc5;color:white;">프로젝트 소개</h1>
		<div class="panel panel-info">
			<div class="panel-heading" role="tab" id="headingOne">
				<h4 class="panel-title">
				<a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
					#1 인사관리
				</a>
				</h4>
			</div>
			<div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
				<div class="panel-body">
					사원들의 경력 및 자격증정보부터 매일 출퇴근 처리와 근무중 외출/복귀체크, 근외일정시 근외일정관리까지 전반적인 사원관리를 지원합니다
				</div>
			</div>
			<div class="panel-heading" role="tab" id="headingTwo">
				<h4 class="panel-title">
				<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
					#2 프로젝트 관리
				</a>
				</h4>
			</div>
			<div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
				<div class="panel-body">
					인원모집, 상세자금내역등 프로젝트 공고부터 진행중인 프로젝트를 관리하는 작업분해도(WBS), 프로젝트 완료시 평가보고서까지 통합적으로 프로젝트의 효율적인 관리와 진행중인 프로젝트의 작업분해도를 Progress Bar로 표현하여 진행도를 한 눈에 알아볼 수 있게 한다.
				</div>
			</div>
			<div class="panel-heading" role="tab" id="headingThree">
				<h4 class="panel-title">
				<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
					#3 전자결제
				</a>
				</h4>
			</div>
			<div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
				<div class="panel-body">
					사내의 모든 결제관련 기본양식을 제공하며 결제라인 임시저장 및 기안양식 첨부등 결제를 간편하게 할 수 있도록 전자결제 서비스를 지원합니다.
				</div>
			</div>
			<div class="panel-heading" role="tab" id="headingFour">
				<h4 class="panel-title">
				<a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
					#4 급여.고과 관리
				</a>
				</h4>
			</div>
			<div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
				<div class="panel-body">
					근태/프로젝트참여 등의 평가에 따라 인사고과에 반영하고 이를 토대로 성과금 및 급여의 보험료공제, 본인의 급여조회등의 기능을 서비스합니다. 
				</div>
			</div>
		</div>
	</div> 
</div>

<!-- 팀원 정보 -->
<div class="container" id="memberInfoForm" style="display:none;">
<h1 style="background-color:#3a6bc5;color:white;">Team-Member Intro</h1>
	<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-6">
			<div class="well well-sm">
				<div class="row">
					<div class="col-sm-6 col-md-4">
						<img src="http://placehold.it/380x500" alt="" class="img-rounded img-responsive" />
					</div>
					<div class="col-sm-6 col-md-8">
						<h4>윤재호</h4>
						<small><cite title="San Francisco, USA">스마트정보교육원<i class="glyphicon glyphicon-map-marker">
						</i></cite></small>
						<br /><br />
						<p>
							<i class="glyphicon glyphicon-envelope"></i><a href="https://github.com/rang1536/">github.com/rang1536
							<br />
							<i class="glyphicon glyphicon-globe"></i><a href="http://blog.naver.com/rang1536">blog.naver.com/rang1536</a>
							<br />
							<i class="glyphicon glyphicon-gift"></i>출퇴근,프로젝트담당
						</p>
					</div>
				</div>
			</div>
		</div>
        <div class="col-xs-12 col-sm-6 col-md-6">
            <div class="well well-sm">
                <div class="row">
                    <div class="col-sm-6 col-md-4">
                        <img src="http://placehold.it/380x500" alt="" class="img-rounded img-responsive" />
                    </div>
                    <div class="col-sm-6 col-md-8">
                        <h4>윤재호</h4>
                        <small><cite title="San Francisco, USA">스마트정보교육원<i class="glyphicon glyphicon-map-marker">
                        </i></cite></small>
                        <br /><br />
                        <p>
                            <i class="glyphicon glyphicon-envelope"></i><a href="https://github.com/rang1536/">github.com/rang1536
                            <br />
                            <i class="glyphicon glyphicon-globe"></i><a href="http://blog.naver.com/rang1536">blog.naver.com/rang1536</a>
                            <br />
                            <i class="glyphicon glyphicon-gift"></i>출퇴근,프로젝트담당</p>
                        <!-- Split button -->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-12 col-sm-6 col-md-6">
            <div class="well well-sm">
                <div class="row">
                    <div class="col-sm-6 col-md-4">
                        <img src="http://placehold.it/380x500" alt="" class="img-rounded img-responsive" />
                    </div>
                    <div class="col-sm-6 col-md-8">
                        <h4>윤재호</h4>
                        <small><cite title="San Francisco, USA">스마트정보교육원<i class="glyphicon glyphicon-map-marker">
                        </i></cite></small>
                        <br /><br />
                        <p>
                            <i class="glyphicon glyphicon-envelope"></i><a href="https://github.com/rang1536/">github.com/rang1536
                            <br />
                            <i class="glyphicon glyphicon-globe"></i><a href="http://blog.naver.com/rang1536">blog.naver.com/rang1536</a>
                            <br />
                            <i class="glyphicon glyphicon-gift"></i>출퇴근,프로젝트담당</p>
                        <!-- Split button -->
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-6">
            <div class="well well-sm">
                <div class="row">
                    <div class="col-sm-6 col-md-4">
                        <img src="http://placehold.it/380x500" alt="" class="img-rounded img-responsive" />
                    </div>
                    <div class="col-sm-6 col-md-8">
                        <h4>윤재호</h4>
                        <small><cite title="San Francisco, USA">스마트정보교육원<i class="glyphicon glyphicon-map-marker">
                        </i></cite></small>
                        <br /><br />
                        <p>
                            <i class="glyphicon glyphicon-envelope"></i><a href="https://github.com/rang1536/">github.com/rang1536
                            <br />
                            <i class="glyphicon glyphicon-globe"></i><a href="http://blog.naver.com/rang1536">blog.naver.com/rang1536</a>
                            <br />
                            <i class="glyphicon glyphicon-gift"></i>출퇴근,프로젝트담당</p>
                        <!-- Split button -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 본문끝 -->
</div>				
</div>
</div>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>