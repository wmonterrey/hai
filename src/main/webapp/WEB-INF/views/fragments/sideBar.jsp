<%@ page contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sec"	uri="http://www.springframework.org/security/tags"%>
<div class="sidebar">
    <nav class="sidebar-nav">
        <ul class="nav">
            <li class="nav-item">
                <a class="nav-link" href="<spring:url value="/" htmlEscape="true "/>"><i class="icon-home"></i><spring:message code="home" /></a>
            </li>
            <sec:authorize url="/results/">
            <li class="nav-item">
                <a class="nav-link" href="<spring:url value="/results/searchResult/" htmlEscape="true "/>"><i class="icon-magnifier"></i><spring:message code="searchResult" /></a>
            </li>
            </sec:authorize>
            <sec:authorize url="/results/firstEntry/">
            <li class="nav-item">
                <a class="nav-link" href="<spring:url value="/results/firstEntry/addResult/" htmlEscape="true "/>"><i class="icon-pencil"></i><spring:message code="newResult" /></a>
            </li>
            </sec:authorize>
            <sec:authorize url="/results/secondEntry/">
            <li class="nav-item">
                <a class="nav-link" href="<spring:url value="/results/secondEntry/checkResult/" htmlEscape="true "/>"><i class="icon-directions"></i><spring:message code="secondEntry" /></a>
            </li>
            </sec:authorize>
            
            
            <sec:authorize url="/admin/">
            <li class="nav-item nav-dropdown administracion">
	            <a class="nav-link nav-dropdown-toggle" href="#"><i class="icon-settings"></i><spring:message code="admin" /></a>
	            <ul class="nav-dropdown-items">
	                <li class="nav-item">
	                    <a class="nav-link" href="<spring:url value="/admin/users/" htmlEscape="true "/>"><i class="icon-people"></i><spring:message code="users" /></a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="<spring:url value="/admin/catalogos/" htmlEscape="true "/>"><i class="icon-book-open"></i><spring:message code="seccatalogs" /></a>
	                </li>
	                <li class="nav-item">
	                    <a class="nav-link" href="<spring:url value="/admin/traduccion/" htmlEscape="true "/>"><i class="icon-globe"></i><spring:message code="translation" /></a>
	                </li>
	            </ul>
	        </li>
	        </sec:authorize>
            <li class="nav-item nav-dropdown lenguaje">
	            <a class="nav-link nav-dropdown-toggle" href="#"><i class="fa fa-language"></i><spring:message code="language" /></a>
	            <ul class="nav-dropdown-items">
	                <li class="nav-item">
	                    <a class="nav-link" href="?lang=en"><i class="fa fa-flag"></i>English</a>
	                    <a class="nav-link" href="?lang=es"><i class="icon-flag"></i>Español</a>
	                </li>
	            </ul>
	        </li>
	        
	        <li class="nav-item">
                <a class="nav-link" href="<spring:url value="/logout" htmlEscape="true" />"><i class="icon-logout"></i><spring:message code="logout" /></a>
            </li>
            
        </ul>
    </nav>
    <button class="sidebar-minimizer brand-minimizer" type="button"></button>
</div>