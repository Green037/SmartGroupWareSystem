<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<link href="<c:url value='/resources/css/mainView.css'/>" rel="stylesheet" type="text/css"/>
	<link href="<c:url value='/resources/css/mainAni.css'/>" rel="stylesheet" type="text/css"/>
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
		$('#menualForm').css('display','none');
		$('#memberInfoForm').css('display','none');
		$('#reviewForm').css('display','none');
		$('#accordion').css('display','');
	});
	
	$(document).on('click','#memberInfoBtn',function(){
		$('#menualForm').css('display','none');
		$('#accordion').css('display','none');
		$('#reviewForm').css('display','none');
		$('#memberInfoForm').css('display','');
	});
	
	$(document).on('click','#reviewBtn',function(){
		$('#menualForm').css('display','none');
		$('#accordion').css('display','none');
		$('#memberInfoForm').css('display','none');
		$('#reviewForm').css('display','');
	});
	
	$(document).on('click','#menualBtn',function(){
		$('#menualForm').css('display','');
	});
	
	// 케러셀. 이벤트핸들러
	$(document).ready( function() {
	    $('#myCarousel').carousel({
	    	interval:   4000
		});
		
		var clickEvent = false;
		$('#myCarousel').on('click', '.nav a', function() {
				clickEvent = true;
				$('.nav li').removeClass('active');
				$(this).parent().addClass('active');		
		}).on('slid.bs.carousel', function(e) {
			if(!clickEvent) {
				var count = $('.nav').children().length -1;
				var current = $('.nav li.active');
				current.removeClass('active').next().addClass('active');
				var id = parseInt(current.data('slide-to'));
				if(count == id) {
					$('.nav li').first().addClass('active');	
				}
			}
			clickEvent = false;
		});
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
<h1 align="center" style="background-color:blue;color:white;">Smart Groupware System Info</h1>

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
              <button class="material-button option2" type="button" id="projectInfoBtn" data-toggle="tooltip" data-placement="top" title="Project Info">
                <span class="glyphicon glyphicon-duplicate" aria-hidden="true"></span>
              </button>
            </li>
            <li class="option">
              <button class="material-button option3" type="button" id="reviewBtn" data-toggle="tooltip" data-placement="right" title="후기">
                <span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
              </button>
            </li>
          </ul>
          <button class="material-button material-button-toggle" type="button" id="menualBtn">
            <span aria-hidden="true">클릭!!</span>
          </button>
        </div>
      </div>
	</div>
	
	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true" style="display:none;">
	<h1 align="center" style="background-color:#3a6bc5;color:white;">Project Info</h1>
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
					#4 급여 / 고과 관리
				</a>
				</h4>
			</div>
			<div id="collapseFour" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingFour">
				<div class="panel-body">
					사원들의 근태를 일 수로 계산하여 급여를 산정하고, 프로젝트 성과와 이력 평가를 인사고과에 반영하여 이를 토대로 성과금에 적용합니다. 결재가 이뤄진 후 급여를 이체합니다. 
				</div>
			</div>
		</div>
	</div> 
</div>

<!-- 팀원 정보 -->
<div class="container" id="memberInfoForm" style="display:none;">
<h1 align="center" style="background-color:#3a6bc5;color:white;">Member Review</h1>
	<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-6">
			<div class="well well-sm">
				<div class="row">
					<div class="col-sm-6 col-md-4">
						<img src="<c:url value='/resources/images/eunbeego.jpg'/>" alt="" class="img-rounded img-responsive" />
					</div>
					<div class="col-sm-6 col-md-8">
						<h4>고은비</h4>
						<small><cite title="San Francisco, USA">스마트정보교육원 <i class="glyphicon glyphicon-map-marker"></i></cite></small>
						<br/><br/>
						<p>
							<i class="glyphicon glyphicon-envelope"></i> <a href="https://github.com/Green037/">github.com/Green037</a><br/>
							<i class="glyphicon glyphicon-globe"></i> <a href="http://diaryofgreen.tistory.com/">diaryofgreen.tistory.com</a><br/>
							<i class="glyphicon glyphicon-gift"></i> 팀장, 급여관리, 고과관리, 파일 업로드/다운로드, 로그인시 RSA 암호화
						</p>
					</div>
				</div>
			</div>
		</div>
        <div class="col-xs-12 col-sm-6 col-md-6">
            <div class="well well-sm">
                <div class="row">
                    <div class="col-sm-6 col-md-4">
                        <img src="<c:url value='/resources/images/bsy.jpg'/>" alt="" class="img-rounded img-responsive" />
                    </div>
                    <div class="col-sm-6 col-md-8">
                        <h4>방상엽</h4>
                        <small><cite title="San Francisco, USA">스마트정보교육원 <i class="glyphicon glyphicon-map-marker"></i></cite></small>
                        <br/><br/>
                        <p>
                        	<i class="glyphicon glyphicon-envelope"></i> <a href="https://github.com/freebsy/">github.com/freebsy</a><br/>
                            <i class="glyphicon glyphicon-globe"></i> <a href="http://blog.naver.com/freekisuj">blog.naver.com/freekisuj</a><br/>
                            <i class="glyphicon glyphicon-gift"></i>인사관리,근외일정</p>
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
                        <img src="<c:url value='/resources/images/img2.jpg'/>" alt="" class="img-rounded img-responsive"/>
                    </div>
                    <div class="col-sm-6 col-md-8">
                        <h4>윤재호</h4>
                        <small><cite title="San Francisco, USA">스마트정보교육원 <i class="glyphicon glyphicon-map-marker"></i></cite></small>
                        <br/><br/>
                        <p>
                        	<i class="glyphicon glyphicon-envelope"></i> <a href="https://github.com/rang1536/">github.com/rang1536</a><br/>
                            <i class="glyphicon glyphicon-globe"></i> <a href="http://blog.naver.com/rang1536">blog.naver.com/rang1536</a><br/>
                            <i class="glyphicon glyphicon-gift"></i> 팀의중심!<br/>
							출퇴근관리,프로젝트관리,WBS,메인페이지  
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-6">
            <div class="well well-sm">
                <div class="row">
                    <div class="col-sm-6 col-md-4">
                        <img src="<c:url value='/resources/images/image_hsa.jpg'/>" alt="" class="img-rounded img-responsive" />
                    </div>
                    <div class="col-sm-6 col-md-8">
                        <h4>홍수아</h4>
                        <small><cite title="San Francisco, USA">스마트정보교육원 <i class="glyphicon glyphicon-map-marker"></i></cite></small>
                        <br/><br/>
                        <p>
                        	<i class="glyphicon glyphicon-envelope"></i> <a href="https://github.com/hsa3737/">github.com/hsa3737</a><br/>
                            <i class="glyphicon glyphicon-globe"></i> <a href="http://blog.naver.com/hsa3737">blog.naver.com/hsa3737</a><br/>
                            <i class="glyphicon glyphicon-gift"></i>전자결재, 문서함</p>
                            
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 후기 -->
<div class="container" id="reviewForm" style="display:none;">
<h1 align="center" style="background-color:#3a6bc5;color:white;">Team Member Info</h1>
	<div class="row">
		<div class="col-xs-12 col-sm-6 col-md-6">
			<div class="well well-sm">
				<div class="row">
					<div class="col-sm-6 col-md-4">
						<img src="<c:url value='/resources/images/eunbeego.jpg'/>" alt="" class="img-rounded img-responsive" />
					</div>
					<div class="col-sm-6 col-md-8">
						<h4>고은비</h4>
						<small><cite title="San Francisco, USA">스마트정보교육원 <i class="glyphicon glyphicon-map-marker"></i></cite></small>
						<br/><br/>
						<p>
							팀원 간의 의견 조율과 협동이 얼마나 중요한지 배웠습니다. 요구 사항 분석부터 단위 테스트까지 실무에서 활용할 수 있는 기술을 배웠으며, 다양한 시각으로 코드를 바라볼 수 있게 된 계기가 됐습니다.
						</p>
					</div>
				</div>
			</div>
		</div>
        <div class="col-xs-12 col-sm-6 col-md-6">
            <div class="well well-sm">
                <div class="row">
                    <div class="col-sm-6 col-md-4">
                        <img src="<c:url value='/resources/images/bsy.jpg'/>" alt="" class="img-rounded img-responsive" />
                    </div>
                    <div class="col-sm-6 col-md-8">
                        <h4>방상엽</h4>
                        <small><cite title="San Francisco, USA">스마트정보교육원 <i class="glyphicon glyphicon-map-marker"></i></cite></small>
                        <br/><br/>
                        <p>
                        	프로젝트를 진행하며 실무경험을 느낄 수 있어서 매우 좋은 경험이라 생각하였고 팀원들과의 소통 능력 등 많은 것들을 배울 수 있어서 매우 값진 시간 이었습니다.</p>
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
                        <img src="<c:url value='/resources/images/img2.jpg'/>" alt="" class="img-rounded img-responsive"/>
                    </div>
                    <div class="col-sm-6 col-md-8">
                        <h4>윤재호</h4>
                        <small><cite title="San Francisco, USA">스마트정보교육원 <i class="glyphicon glyphicon-map-marker"></i></cite></small>
                        <br/><br/>
                        <p>
                        	공동작업을 하며 최대한 팀에 맞춰가려고 노력하였으며, 진행간 다른 팀원의 오류나 진행등을 같이 체크해주며 즐겁게 작업하였습니다.
                        </p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-12 col-sm-6 col-md-6">
            <div class="well well-sm">
                <div class="row">
                    <div class="col-sm-6 col-md-4">
                        <img src="<c:url value='/resources/images/image_hsa.jpg'/>" alt="" class="img-rounded img-responsive" />
                    </div>
                    <div class="col-sm-6 col-md-8">
                        <h4>홍수아</h4>
                        <small><cite title="San Francisco, USA">스마트정보교육원 <i class="glyphicon glyphicon-map-marker"></i></cite></small>
                        <br/><br/>
                        <p>
                        	프로젝트를 진행하면서, 미숙했던 부분에 대해 다시 한번 완벽하게 공부 할 수 있게 되어 뜻 깊은 시간이었습니다.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="container" id="menualForm" style="display:none;">
	<div id="myCarousel" class="carousel slide" data-ride="carousel">
<!-- Wrapper for slides -->
	<div class="carousel-inner">
		<div class="item active">
		<img src="http://placehold.it/1200x400/16a085/ffffff&text=Employee">
			<div class="carousel-caption">
				<h3>
					출퇴근관리 
				</h3>
				<p>
					출퇴근등록 - Ajax를 사용하여 SinglePage로 출근,퇴근,외출 등록 구현.<br/>
					출퇴근조회 - 로그인된 개인기록만 조회(날짜입력필수)<br/>
					부서출퇴근기록조회 - 부서별 출퇴근 조회
				</p>
				<h3>
					인사관리
				</h3>
				<p>
					출퇴근등록 - Ajax를 사용하여 SinglePage로 출근,퇴근,외출 등록 구현.<br/>
					출퇴근조회 - 로그인된 개인기록만 조회(날짜입력필수)<br/>
					부서출퇴근기록조회 - 부서별 출퇴근 조회
				</p>
				
			</div>
		</div>
	    <!-- End Item -->
		<div class="item">
		<img src="http://placehold.it/1200x400/e67e22/ffffff&text=Projects">
			<div class="carousel-caption">
				<h3>
				프로젝트관리</h3>
				<p>
					목록 - Ajax로 진행상황별 조회. 제목 클릭 -> 상세보기 -> 수정,삭제기능<br/>
					등록 - 프로젝트,총자금,팀장정보 분할등록<br/>
					검색 - 프로젝트 규모,기간별 조건으로 검색가능. Defalut = 전체조회
				</p>
				<h3>
				WBS</h3>
				<p>
					등록 - Ajax로 팀장정보 확인 후 팀장만 WBS 등록 가능<br/>
					완료보고서 - 팀장만 등록가능. 전자결제 팝업창으로 바로 결제요청가능.
				</p>
			</div>
		</div>
	<!-- End Item -->
		<div class="item">
		<img src="http://placehold.it/1200x400/2980b9/ffffff&text=Approval">
			<div class="carousel-caption">
				<h3>
				전자결제 목록</h3>
				<p>
					임시목록 - 결제요청된 문서중 반려자료 보관.
					결재목록 - 결제대기중인 문서목록. 결제자만 
				</p>
			</div>
		</div>
	<!-- End Item -->
		<div class="item">
		<img src="http://placehold.it/1200x400/8e44ad/ffffff&text=Services">
			<div class="carousel-caption">
				<h3>
				Headline</h3>
				<p>
				Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod
				tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. Lorem
				ipsum dolor sit amet, consetetur sadipscing elitr.</p>
			</div>
		</div>
	<!-- End Item -->
	</div>
<!-- End Carousel Inner -->
	<ul class="nav nav-pills nav-justified">
		<li data-target="#myCarousel" data-slide-to="0" class="active"><a href="#">인사관리<small>사용설명서</small></a></li>
		<li data-target="#myCarousel" data-slide-to="1"><a href="#">프로젝트<small>사용설명서</small></a></li>
		<li data-target="#myCarousel" data-slide-to="2"><a href="#">전자결제<small>사용설명서</small></a></li>
		<li data-target="#myCarousel" data-slide-to="3"><a href="#">인사,고과<small>사용설명서</small></a></li>
	</ul>
</div>
<!-- End Carousel -->
</div>
<!-- 본문끝 -->
</div>				
</div>
</div>
</div>
<%@ include file="footer.jsp"%>
</body>
</html>