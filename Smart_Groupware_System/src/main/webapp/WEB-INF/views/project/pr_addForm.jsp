<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<link href="<c:url value='/resources/css/prAdd.css'/>" rel="stylesheet" type="text/css"/>
	<link href="<c:url value='/resources/css/prAdd2.css'/>" rel="stylesheet" type="text/css"/>
	<script src="<c:url value='/resources/js/jquery-3.1.1.min.js'/>"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
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
	$(document).ready(function() {
	    $("#add_row").on("click", function() {
	        // Dynamic Rows Code
	        
	        // Get max row id and set new id, 마지막 행수를 증가시켜주는 코드인듯.
	        var newid = 0;
	        $.each($("#tab_logic tr"), function() { /* tab_logic << 테이블아이디명 */
	            if (parseInt($(this).data("id")) > newid) { // 추가되는 테이블 row포함한 태그 id값, 초기값은 0
	                newid = parseInt($(this).data("id"));
	            }
	        });
	        newid++; //추가되는 행의 값은 마지막 추가된 코드의 id값에 +1
	        
	        var tr = $("<tr></tr>", { //tr변수에 tr태그를 추가 시키고 id값에 addr+newId값으로 세팅하고, data-id값으로는 newId값 지정.
	            id: "addr"+newid,
	            "data-id": newid
	        });
	        
	        // loop through each td and create new elements with name of newid
	        $.each($("#tab_logic tbody tr:nth(0) td"), function() { //기존테이블테그중 th태그가 없는 tr태그의 td부분만 가져오는건가..
	            var cur_td = $(this); // 결국 추가되는 입력폼부분전체 td태그들
	            
	            var children = cur_td.children(); //td태그들 안에 실제 input태그들인듯.
	            
	            // add new td and element if it has a nane
	            if ($(this).data("name") != undefined) { //data()메서드로 td태그의 data-name값을 가져와서 비교함.
	                var td = $("<td></td>", { // td변수에 td태그의 data-name이 복제하려면 프로토타입의 네임값을 가져와서 세팅함.
	                    "data-name": $(cur_td).data("name")
	                });
	                
	                var c = $(cur_td).find($(children[0]).prop('tagName')).clone().val(""); //td태그내의 input태그 내용을 복제함.
	                c.attr("name", $(cur_td).data("name")); //input태그에 name값을 기존의 네임과 동일하게 함.
	                c.appendTo($(td)); // td태그 다음에 새로 세팅된 c의 내용을 추가함.
	                td.appendTo($(tr)); // tr태그 다음에 새로 세팅된 td내용을 추가함.
	            } else {
	                var td = $("<td></td>", {
	                    'text': $('#tab_logic tr').length
	                }).appendTo($(tr));
	            }
	        });
	        
	        // add delete button and td
	        /*
	        $("<td></td>").append(
	            $("<button class='btn btn-danger glyphicon glyphicon-remove row-remove'></button>")
	                .click(function() {
	                    $(this).closest("tr").remove();
	                })
	        ).appendTo($(tr));
	        */
	        
	        // add the new row
	        $(tr).appendTo($('#tab_logic')); //기존 테이블 다음으로 생성된 tr태그를 붙임.
	        
	        $(tr).find("td button.row-remove").on("click", function() {
	             $(this).closest("tr").remove(); //삭제버튼 클릭시 상위 tr태그(즉 입력폼)을 삭제함.
	        });
	});

	    // Sortable Code
	    var fixHelperModified = function(e, tr) {
	        var $originals = tr.children();
	        var $helper = tr.clone();
	    
	        $helper.children().each(function(index) {
	            $(this).width($originals.eq(index).width())
	        });
	        
	        return $helper;
	    };
	  
	    $(".table-sortable tbody").sortable({
	        helper: fixHelperModified      
	    }).disableSelection();

	    $(".table-sortable thead").disableSelection();

	    $("#add_row").trigger("click");
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
				                                <i class="glyphicon glyphicon-usd"></i>
				                            </span>
				                        </a>
				                    </li>
				                    <li role="presentation" class="disabled">
				                        <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Step 3">
				                            <span class="round-tab">
				                                <i class="glyphicon glyphicon-user"></i>
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
				            <form role="form" action="<c:url value='/pr/add'/>" method="post">
				                <div class="tab-content">
				                    <div class="tab-pane active" role="tabpanel" id="step1">
				                        <div class="step1">
				                            <div class="row">
					                            <div class="col-md-6">
					                                <label for="prMemberCode">팀장</label>
					                                <input type="text" class="form-control" name="prMemberCode" id="prMemberCode">
					                            </div>
					                            <div class="col-md-6">
					                                <label for="dftCode">기안코드</label>
					                                <input type="text" class="form-control" name="dftCode" id="dftCode" >
					                            </div>
				                        	</div>
					                        <div class="row">
					                            <div class="col-md-6">
					                                <label for="prName">프로젝트명</label>
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
					                                <label for="prProgress">진행상황</label>
					                                <div>
						                                <select name="prProgress" id="prProgress" class="dropselectsec1" >
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
				                            <li><button type="button" class="btn btn-primary next-step">다음</button></li>
				                        </ul>
				                    </div>
<!--본문입력 step1 폼 끝 -->	
				                    <div class="tab-pane" role="tabpanel" id="step2">
				                        <div class="step2">
				                            <div class="step_21">
											<div class="container">
											    <div class="row clearfix">
											    	<div class="col-md-12 table-responsive">
														<table class="table table-bordered table-hover table-sortable" id="tab_logic">
															<thead>
																<tr>
																	<th class="text-center">
																		자금세부사용내역
																	</th>
																	<th class="text-center">
																		예상금액
																	</th>
																	<th class="text-center" style="border-top: 1px solid #ffffff; border-right: 1px solid #ffffff;">
																	</th>
																</tr>
															</thead>
															<tbody>
											    				<tr id='addr0' data-id="0" class="hidden">
																	<td data-name="fuHistory">
																	    <input type="text" name='fuHistory'  placeholder='사용내역' class="form-control"/>
																	</td>
																	<td data-name="fuExpectedMoney">
																	    <input type="text" name='fuExpectedMoney' placeholder='예상금액' class="form-control"/>
																	</td>
																	<td data-name="del">
											                            <button name="delBtn" class='btn btn-danger glyphicon glyphicon-remove row-remove'>삭제</button>
											                        </td>
																</tr>
															</tbody>
														</table>
													</div>
												</div>
												<a id="add_row" class="btn btn-default pull-right">폼추가</a>
											</div>
				                                <!--스텝2 -->
				                               
				                            </div>
				                            <div class="step-22">
				                            
				                            </div>
				                        </div>
				                        <ul class="list-inline pull-right">
				                            <li><button type="button" class="btn btn-default prev-step">이전</button></li>
				                            <li><button type="button" class="btn btn-primary next-step">다음</button></li>
				                        </ul>
				                    </div>
				                    <div class="tab-pane" role="tabpanel" id="step3">
				                        <div class="step33">
				                        <h5><strong>프로젝트 팀장</strong></h5>
				                        <hr>
				                            <div class="row mar_ned">
				                                
				                            </div>
				                            <div class="row mar_ned">
				                                <div class="col-md-4 col-xs-3">
				                                    <p align="right"><stong>팀장코드</stong></p>
				                                </div>
				                                <div class="col-md-8 col-xs-9">
				                                    <div class="row">
				                                        <div class="col-md-4 col-xs-4 wdth">
				                                            <input type="text" class="form-control" name="mmCode" id="mmCode"/>
				                                        </div>
				                                        <div class="col-md-4 col-xs-4 wdth">
				                                            <select name="pmLevel" id="pmLevel" class="dropselectsec1">
				                                                <option value="">::등급::</option>
				                                                <option value="초급">초급</option>
				                                                <option value="중급">중급</option>
				                                                <option value="고급">고급</option>
				                                                
				                                            </select>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="row mar_ned">
				                                <div class="col-md-4 col-xs-3">
				                                    <p align="right"><stong>업무분야</stong></p>
				                                </div>
				                                <div class="col-md-8 col-xs-9">
				                                    <input type="text" class="form-control" name="pmField" id="pmField" placeholder="업무분야를 입력하세요">
				                                </div>
				                            </div>
				                            <div class="row mar_ned">
				                                <div class="col-md-4 col-xs-3">
				                                    <p align="right"><stong>프로젝트 참여일</stong></p>
				                                </div>
				                                <div class="col-md-8 col-xs-9">
				                                   <input type="date" class="form-control" name="pmStartDate" id="pmStartDate"/>
				                                </div>
				                            </div>
				                            <div class="row mar_ned">
				                                <div class="col-md-4 col-xs-3">
				                                    <p align="right"><stong>특이사항</stong></p>
				                                </div>
				                                <div class="col-md-8 col-xs-9">
				                                    <input type="text" class="form-control" name="pmNote" id="pmNote" placeholder="특이사항"/>
				                                </div>
				                            </div>
				                        </div>
				                        <ul class="list-inline pull-right">
				                            <li><button type="button" class="btn btn-default prev-step">이전</button></li>
				                            <li><button type="button" class="btn btn-default next-step">지나가기</button></li>
				                            <li><button type="button" class="btn btn-primary btn-info-full next-step">다음</button></li>
				                        </ul>
				                    </div>
				                    <div class="tab-pane" role="tabpanel" id="complete">
				                        <div class="step44">
				                           <input type="submit" value="등록" />
				                            
				                          
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