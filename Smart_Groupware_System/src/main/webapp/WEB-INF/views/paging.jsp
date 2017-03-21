<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="paginate">

	<c:if test="${param.currentPageNo ne param.firstPageNo}">
    	<a href="javascript:goPage('${servletPath}', ${param.prevPageNo}, ${param.recordsPerPage}, '${sortItem}', '${sortMethod}', '${cri.keyfield}', '${cri.keyword}', '${cri.compare}')" class="prev">이전</a>
	</c:if>

    <span>
        <c:forEach var="i" begin="${param.startPageNo}" end="${param.endPageNo}" step="1">
            <c:choose>
                <c:when test="${i eq param.currentPageNo}">
					<b><font size=+1><a href="javascript:goPage('${servletPath}', ${i}, ${param.recordsPerPage}, '${sortItem}', '${sortMethod}', '${cri.keyfield}', '${cri.keyword}', '${cri.compare}')" class="choice">${i}</a></font></b>
                </c:when>
                <c:otherwise>
                	<a href="javascript:goPage('${servletPath}', ${i}, ${param.recordsPerPage}, '${sortItem}', '${sortMethod}', '${cri.keyfield}', '${cri.keyword}', '${cri.compare}'">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </span>
    
    <c:if test="${param.currentPageNo ne param.finalPageNo}">
	    <a href="javascript:goPage('${servletPath}', ${param.nextPageNo}, ${param.recordsPerPage}, '${sortItem}', '${sortMethod}', '${cri.keyfield}', '${cri.keyword}', '${cri.compare}'))" class="next">다음</a>
	</c:if>
</div>