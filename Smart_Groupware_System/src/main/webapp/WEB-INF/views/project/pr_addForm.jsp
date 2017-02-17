<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<link href="resources/css/prAdd.css" rel="stylesheet" type="text/css"/>
	<script src="resources/js/jquery-3.1.1.min.js"></script>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
	<script>
	$(document).ready(function () {
	    //Initialize tooltips
	    $('.nav-tabs > li a[title]').tooltip();
	    
	    //Wizard
	    $('a[data-toggle="tab"]').on('show.bs.tab', function (e) {
	        var $target = $(e.target);
	        if ($target.parent().hasClass('disabled')) {
	            return false;
	        }
	    });
	
	    $(".next-step").click(function (e) {
	        var $active = $('.wizard .nav-tabs li.active');
	        $active.next().removeClass('disabled');
	        nextTab($active);
	    });
	    $(".prev-step").click(function (e) {
	        var $active = $('.wizard .nav-tabs li.active');
	        prevTab($active);
	    });
	});
	
	function nextTab(elem) {
	    $(elem).next().find('a[data-toggle="tab"]').click();
	}
	function prevTab(elem) {
	    $(elem).prev().find('a[data-toggle="tab"]').click();
	}
	
	//according menu
	$(document).ready(function(){
	    //Add Inactive Class To All Accordion Headers
		$('.accordion-header').toggleClass('inactive-header');
		
		//Set The Accordion Content Width
		var contentwidth = $('.accordion-header').width();
		$('.accordion-content').css({});
		
		//Open The First Accordion Section When Page Loads
		$('.accordion-header').first().toggleClass('active-header').toggleClass('inactive-header');
		$('.accordion-content').first().slideDown().toggleClass('open-content');
		
		// The Accordion Effect
		$('.accordion-header').click(function () {
			if($(this).is('.inactive-header')) {
				$('.active-header').toggleClass('active-header').toggleClass('inactive-header').next().slideToggle().toggleClass('open-content');
				$(this).toggleClass('active-header').toggleClass('inactive-header');
				$(this).next().slideToggle().toggleClass('open-content');
			} else {
				$(this).toggleClass('active-header').toggleClass('inactive-header');
				$(this).next().slideToggle().toggleClass('open-content');
			}
		});
		return false;
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
				<!-- 본문-->
<!-- 본문 상단 glyphicon -->
				<div class="container">
					<div class="row">
				   		<section>
				        <div class="wizard">
				            <div class="wizard-inner">
				                <div class="connecting-line"></div>
				                <ul class="nav nav-tabs" role="tablist">
				
				                    <li role="presentation" class="active">
				                        <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Step 1">
				                            <span class="round-tab">
				                                <i class="glyphicon glyphicon-folder-open"></i>
				                            </span>
				                        </a>
				                    </li>
				
				                    <li role="presentation" class="disabled">
				                        <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Step 2">
				                            <span class="round-tab">
				                                <i class="glyphicon glyphicon-user"></i>
				                            </span>
				                        </a>
				                    </li>
				                    <li role="presentation" class="disabled">
				                        <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Step 3">
				                            <span class="round-tab">
				                                <i class="glyphicon glyphicon-usd"></i>
				                            </span>
				                        </a>
				                    </li>
				
				                    <li role="presentation" class="disabled">
				                        <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Complete">
				                            <span class="round-tab">
				                                <i class="glyphicon glyphicon-ok"></i>
				                            </span>
				                        </a>
				                    </li>
				                </ul>
				            </div>
	<!-- 본문 상단 glyphicon -->
	<!-- 본문 입력폼 step1-->			
				            <form role="form">
				                <div class="tab-content">
				                    <div class="tab-pane active" role="tabpanel" id="step1">
				                        <div class="step1">
				                            <div class="row">
					                            <div class="col-md-6">
					                                <label for="prMemberCode">팀장</label>
					                                <input type="text" class="form-control" name="prMemberCode" id="prMemberCode">
					                            </div>
					                            <div class="col-md-6">
					                                <label for="drfCode">기안코드</label>
					                                <input type="text" class="form-control" name="drfCode" id="drfCode" >
					                            </div>
				                        	</div>
					                        <div class="row">
					                            <div class="col-md-6">
					                                <label for=""prName"">프로젝트명</label>
					                                <input type="text" class="form-control" name="prName" id="prName" placeholder="프로젝트명을 입력하세요">
					                            </div>
					                            <div class="col-md-6">
					                                <label for="prMember">참여인원</label>
					                                <input type="text" class="form-control" name="prMember" id="prMember" placeholder="참여인원을 입력하세요">
					                            </div>
					                        </div>
					                        <div class="row">
					                            <div class="col-md-6">
					                                <label for="prMoney">프로젝트자금</label>
					                                <input type="text" class="form-control" name="prMoney" id="prMoney" placeholder="Email">
					                           	</div>
					                            <div class="col-md-6">
					                                <label for="prMember">진행상황</label>
					                                <div>
						                                <select name="prMember" id="prMember" class="dropselectsec1" >
							                                <option>::선택::</option>
							                                <option value="모집중">모집중</option>
							                                <option value="모집완료">모집완료</option>
						                                	
						                                </select>
					                                </div>
					                            </div>
					                        </div>
					                        <div class="row">
					                        	<div class="col-md-6">
					                                <label for="prStartDay">시작일시</label>
					                                <input type="date" class="form-control" name="prStartDay" id="prStartDay">
					                            </div>
					                            <div class="col-md-6">
					                                <label for=""prCate"">프로젝트분류</label>
					                                <div>
						                                <select name="prCate" id="prCate" class="dropselectsec1" >
							                                <option>::선택::</option>
							                                <option value="개발">개발</option>
							                                <option value="연구">연구</option>
						                                	<option value="유지보수">유지보수</option>
						                                </select>
					                                </div>
					                            </div>
					                        </div>
					                        <div class="row">
					                            <div class="col-md-6">
					                                <label for="prEndDay">종료일시</label>
					                                <input type="date" class="form-control" name="prEndDay" id="prEndDay">
					                            </div>
					                            <div class="col-md-6">
					                                <label for="prForProgress">최종진행여부</label>
					                                <div>
						                                <select name="prForProgress" id="prForProgress" class="dropselectsec1" >
							                                <option>::선택::</option>
							                                <option value="승인">승인</option>
						                                	<option value="반려">반려</option>
						                                </select>
					                                </div>
					                            </div>
					                        </div>
					                        <div class="row">
					                            <div class="col-md-6">
					                            	<label for="exampleInputEmail1">프로젝트목적</label>
					                            	<div>
					                                	<textarea rows="3" cols="80" name="prGoal" id="prGoal"></textarea>
					                                </div>
					                            </div>
					                        </div>
				                    	</div>        			   
				                        <ul class="list-inline pull-right">
				                            <li><button type="button" class="btn btn-primary next-step">Save and continue</button></li>
				                        </ul>
				                    </div>
<!--본문입력 step1 폼 끝 -->	
				                    <div class="tab-pane" role="tabpanel" id="step2">
				                        <div class="step2">
				                            <div class="step_21">
				                                <div class="row">
				                                 
				                                </div>
				                            </div>
				                            <div class="step-22">
				                            
				                            </div>
				                        </div>
				                        <ul class="list-inline pull-right">
				                            <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
				                            <li><button type="button" class="btn btn-primary next-step">Save and continue</button></li>
				                        </ul>
				                    </div>
				                    <div class="tab-pane" role="tabpanel" id="step3">
				                        <div class="step33">
				                        <h5><strong>Basic Details</strong></h5>
				                        <hr>
				                            <div class="row mar_ned">
				                                
				                            </div>
				                            <div class="row mar_ned">
				                                <div class="col-md-4 col-xs-3">
				                                    <p align="right"><stong>Date of birth</stong></p>
				                                </div>
				                                <div class="col-md-8 col-xs-9">
				                                    <div class="row">
				                                        <div class="col-md-4 col-xs-4 wdth">
				                                            <select name="visa_status" id="visa_status" class="dropselectsec1">
				                                                <option value="">Date</option>
				                                                <option value="2">1</option>
				                                                <option value="1">2</option>
				                                                <option value="4">3</option>
				                                                <option value="5">4</option>
				                                                <option value="6">5</option>
				                                                <option value="3">6</option>
				                                                <option value="7">7</option>
				                                                <option value="8">8</option>
				                                                <option value="9">9</option>
				                                            </select>
				                                        </div>
				                                        <div class="col-md-4 col-xs-4 wdth">
				                                            <select name="visa_status" id="visa_status" class="dropselectsec1">
				                                                <option value="">Month</option>
				                                                <option value="2">Jan</option>
				                                                <option value="1">Feb</option>
				                                                <option value="4">Mar</option>
				                                                <option value="5">Apr</option>
				                                                <option value="6">May</option>
				                                                <option value="3">June</option>
				                                                <option value="7">July</option>
				                                                <option value="8">Aug</option>
				                                                <option value="9">Sept</option>
				                                            </select>
				                                        </div>
				                                        <div class="col-md-4 col-xs-4 wdth">
				                                            <select name="visa_status" id="visa_status" class="dropselectsec1">
				                                                <option value="">Year</option>
				                                                <option value="2">1990</option>
				                                                <option value="1">1991</option>
				                                                <option value="4">1992</option>
				                                                <option value="5">1993</option>
				                                                <option value="6">1994</option>
				                                                <option value="3">1995</option>
				                                                <option value="7">1996</option>
				                                                <option value="8">1997</option>
				                                                <option value="9">1998</option>
				                                            </select>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="row mar_ned">
				                                <div class="col-md-4 col-xs-3">
				                                    <p align="right"><stong>Marital Status</stong></p>
				                                </div>
				                                <div class="col-md-8 col-xs-9">
				                                    <label class="radio-inline">
				                                      <input type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2"> Single
				                                    </label>
				                                    <label class="radio-inline">
				                                      <input type="radio" name="inlineRadioOptions" id="inlineRadio3" value="option3"> Married
				                                    </label>
				                                </div>
				                            </div>
				                            <div class="row mar_ned">
				                                <div class="col-md-4 col-xs-3">
				                                    <p align="right"><stong>Highest Education</stong></p>
				                                </div>
				                                <div class="col-md-8 col-xs-9">
				                                    <select name="highest_qualification" id="highest_qualification" class="dropselectsec">
				                                        <option value=""> Select Highest Education</option>
				                                        <option value="1">Ph.D</option>
				                                        <option value="2">Masters Degree</option>
				                                        <option value="3">PG Diploma</option>
				                                        <option value="4">Bachelors Degree</option>
				                                        <option value="5">Diploma</option>
				                                        <option value="6">Intermediate / (10+2)</option>
				                                        <option value="7">Secondary</option>
				                                        <option value="8">Others</option>
				                                    </select>
				                                </div>
				                            </div>
				                            <div class="row mar_ned">
				                                <div class="col-md-4 col-xs-3">
				                                    <p align="right"><stong>Specialization</stong></p>
				                                </div>
				                                <div class="col-md-8 col-xs-9">
				                                    <input type="text" name="specialization" id="specialization" placeholder="Specialization" class="dropselectsec" autocomplete="off">
				                                </div>
				                            </div>
				                            <div class="row mar_ned">
				                                <div class="col-md-4 col-xs-3">
				                                    <p align="right"><stong>Year of Passed Out</stong></p>
				                                </div>
				                                <div class="col-md-8 col-xs-9">
				                                    <select name="year_of_passedout" id="year_of_passedout" class="birthdrop">
				                                        <option value="">Year</option>
				                                        <option value="1980">1980</option>
				                                        <option value="1981">1981</option>
				                                        <option value="1982">1982</option>
				                                        <option value="1983">1983</option>
				                                        <option value="1984">1984</option>
				                                        <option value="1985">1985</option>
				                                        <option value="1986">1986</option>
				                                        <option value="1987">1987</option>
				                                        <option value="1988">1988</option>
				                                        <option value="1989">1989</option>
				                                        <option value="1990">1990</option>
				                                        <option value="1991">1991</option>
				                                        <option value="1992">1992</option>
				                                        <option value="1993">1993</option>
				                                        <option value="1994">1994</option>
				                                        <option value="1995">1995</option>
				                                        <option value="1996">1996</option>
				                                        <option value="1997">1997</option>
				                                        <option value="1998">1998</option>
				                                        <option value="1999">1999</option>
				                                        <option value="2000">2000</option>
				                                        <option value="2001">2001</option>
				                                        <option value="2002">2002</option>
				                                        <option value="2003">2003</option>
				                                        <option value="2004">2004</option>
				                                        <option value="2005">2005</option>
				                                        <option value="2006">2006</option>
				                                        <option value="2007">2007</option>
				                                        <option value="2008">2008</option>
				                                        <option value="2009">2009</option>
				                                        <option value="2010">2010</option>
				                                        <option value="2011">2011</option>
				                                        <option value="2012">2012</option>
				                                        <option value="2013">2013</option>
				                                        <option value="2014">2014</option>
				                                        <option value="2015">2015</option>
				                                    </select>
				                                </div>
				                            </div>
				                            <div class="row mar_ned">
				                                <div class="col-md-4 col-xs-3">
				                                    <p align="right"><stong>Total Experience</stong></p>
				                                </div>
				                                <div class="col-md-8 col-xs-9">
				                                    <div class="row">
				                                        <div class="col-md-6 col-xs-6 wdth">
				                                            <select name="visa_status" id="visa_status" class="dropselectsec1">
				                                                <option value="">Month</option>
				                                                <option value="2">Jan</option>
				                                                <option value="1">Feb</option>
				                                                <option value="4">Mar</option>
				                                                <option value="5">Apr</option>
				                                                <option value="6">May</option>
				                                                <option value="3">June</option>
				                                                <option value="7">July</option>
				                                                <option value="8">Aug</option>
				                                                <option value="9">Sept</option>
				                                            </select>
				                                        </div>
				                                        <div class="col-md-6 col-xs-6 wdth">
				                                            
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="row mar_ned">
				                               
				                            </div>
				                        </div>
				                        <ul class="list-inline pull-right">
				                            <li><button type="button" class="btn btn-default prev-step">Previous</button></li>
				                            <li><button type="button" class="btn btn-default next-step">Skip</button></li>
				                            <li><button type="button" class="btn btn-primary btn-info-full next-step">Save and continue</button></li>
				                        </ul>
				                    </div>
				                    <div class="tab-pane" role="tabpanel" id="complete">
				                        <div class="step44">
				                            <h5>Completed</h5>
				                            
				                          
				                        </div>
				                    </div>
				                    <div class="clearfix"></div>
				                </div>
				            </form>
				        </div>
				    </section>
				   </div>
				</div>
				
				<!-- 본문끝 -->
			</div>				
		</div>
	</div>
</div>
			
<%@ include file="../footer.jsp"%>

</body>
</html>