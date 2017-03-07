<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>스마트 그룹웨어 시스템 (ver 1.1.0)</title>
</head> 

<body>

<%@ include file="../menu.jsp" %>

<!-- contents -->
<div class="page-container">
<div class="left-content">
<div class="inner-content">
<div class="outter-wp">	
<!-- 들어갈 내용 -->

	<div class="container">
	<div class="row">
		<h2>전자 결재 신청</h2>
	</div>
    <form action="<c:url value='/ap/addDoc'/>" method="post" enctype="multipart/form-data">
        	
    	<div class="row">
    		<div class="col-md-3">
				<div class="form-group form-group-sm">
				    <label for="firstname" class="control-label">[문서분류]</label>
				    <input type="text" class="form-control" name="docFileGroup">
				</div>
            </div>
    	</div>

    	<div class ="row">
			<div class="col-md-3">
				<div class="form-group form-group-sm">
				    <label for="firstname" class="control-label">[문서선택]</label>
				    <input type="file" class="form-control" name="docFile">
				</div>
            </div>
    	</div>
    		
		&nbsp;
		<div class="row">

        <div class="row">
             <div class="col-xs-3">

                    <button type="submit" class="btn btn-default"> Submit </button>
                    <button type="reset" class="btn btn-default"> reset </button>
              
             </div>
        </div>

    </form>
</div>
	
<!-- 들어갈 내용 -->
</div>				
</div>
</div>
</div>
	
<%@ include file="../footer.jsp"%>

</body>
</html>