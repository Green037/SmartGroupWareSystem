<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="<c:url value='/resources/js/jquery-1.10.2.min.js'/>"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

<script type="text/javascript">

$(document).ready(function(){
	$("#mytable #checkall").click(function () {
	        if ($("#mytable #checkall").is(':checked')) {
	            $("#mytable input[type=checkbox]").each(function () {
	                $(this).prop("checked", true);
	            });

	        } else {
	            $("#mytable input[type=checkbox]").each(function () {
	                $(this).prop("checked", false);
	            });
	        }
	    });
	    
	    $("[data-toggle=tooltip]").tooltip();
	});




</script>



	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
</head> 
<body>
	<%@ include file="../menu.jsp" %>
	
	<!-- contents -->
	<div class="page-container">
		<div class="left-content">
			<div class="inner-content">
				<div class="outter-wp">	
					<div class="sub-heard-part">
							<ol class="breadcrumb m-b-0">
								<li><a href="index.html">Home</a></li>
								<li class="active">개인 출근 목록</li>
							</ol>
						</div>
					
				<div class="container">
	<div class="row">
		
        
        <div class="col-md-12">
        <div class="table-responsive">

                
              <table id="mytable" class="table table-bordred table-striped">
                   
                   <thead>
                   <th><input type="checkbox" id="checkall" /></th>
                   <th>번호</th>
                   <th>이름</th>
                   <th>부서</th>
                   <th>직급</th>
                   <th>날짜</th>
                   <th>상태</th>

                   </thead>
    <tbody>
    
    <tr>
    <td><input type="checkbox" class="checkthis" /></td>
    <td>Mohsin</td>
    <td>Irshad</td>
    <td>asfasfasf</td>
    <td>asfasf</td>
    <td>isometric.mohsin@gmail.com</td>
    <td>+923335586757</td>
    </tr>
    
 <tr>
    <td><input type="checkbox" class="checkthis" /></td>
    <td>Mohsin</td>
    <td>Irshad</td>
    <td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
    <td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
    <td>isometric.mohsin@gmail.com</td>
    <td>+923335586757</td>
    </tr>
    
    
 <tr>
    <td><input type="checkbox" class="checkthis" /></td>
    <td>Mohsin</td>
    <td>Irshad</td>
    <td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
    <td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
    <td>isometric.mohsin@gmail.com</td>
    <td>+923335586757</td>
    </tr>
    
    
    
 <tr>
    <td><input type="checkbox" class="checkthis" /></td>
    <td>Mohsin</td>
    <td>Irshad</td>
    <td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
    <td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
    <td>isometric.mohsin@gmail.com</td>
    <td>+923335586757</td>
    </tr>
    
    
 <tr>
    <td><input type="checkbox" class="checkthis" /></td>
    <td>Mohsin</td>
    <td>Irshad</td>
    <td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
    <td>CB 106/107 Street # 11 Wah Cantt Islamabad Pakistan</td>
    <td>isometric.mohsin@gmail.com</td>
    <td>+923335586757</td>
    </tr>    
    </tbody>
        
</table>

<div class="clearfix"></div>
<ul class="pagination pull-right">
  <li class="disabled"><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
  <li class="active"><a href="#">1</a></li>
  <li><a href="#">2</a></li>
  <li><a href="#">3</a></li>
  <li><a href="#">4</a></li>
  <li><a href="#">5</a></li>
  <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
</ul>
                
            </div>
            
        </div>
	</div>
</div>

					
					
					
				
				
				
				
				
				
				
					
				</div>				
			</div>
		</div>
	</div>
			
	<%@ include file="../footer.jsp"%>
</body>
</html>