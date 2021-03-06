<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<jsp:include page="../fragments/headTag.jsp" />
<!-- Styles required by this views -->
<spring:url value="/resources/vendors/css/select2.min.css" var="select2css" />
<link href="${select2css}" rel="stylesheet" type="text/css"/>
<spring:url value="/resources/vendors/css/datepicker.css" var="datepickercss" />
<link href="${datepickercss}" rel="stylesheet" type="text/css"/>

<spring:url value="/resources/vendors/css/dataTables.bootstrap4.min.css" var="dataTablesCSS" />
<link href="${dataTablesCSS}" rel="stylesheet" type="text/css"/>
<spring:url value="/resources/vendors/css/responsive.dataTables.min.css" var="dataTablesResponsiveCSS" />
<link href="${dataTablesResponsiveCSS}" rel="stylesheet" type="text/css"/>

<spring:url value="/resources/vendors/css/select.dataTables.min.css" var="dataTablesSelectCSS" />
<link href="${dataTablesSelectCSS}" rel="stylesheet" type="text/css"/>

<spring:url value="/resources/vendors/css/buttons.dataTables.min.css" var="dataTablesButtonCSS" />
<link href="${dataTablesButtonCSS}" rel="stylesheet" type="text/css"/>

</head>
<!-- BODY options, add following classes to body to change options

// Header options
1. '.header-fixed'					- Fixed Header

// Brand options
1. '.brand-minimized'       - Minimized brand (Only symbol)

// Sidebar options
1. '.sidebar-fixed'					- Fixed Sidebar
2. '.sidebar-hidden'				- Hidden Sidebar
3. '.sidebar-off-canvas'		- Off Canvas Sidebar
4. '.sidebar-minimized'			- Minimized Sidebar (Only icons)
5. '.sidebar-compact'			  - Compact Sidebar

// Aside options
1. '.aside-menu-fixed'			- Fixed Aside Menu
2. '.aside-menu-hidden'			- Hidden Aside Menu
3. '.aside-menu-off-canvas'	- Off Canvas Aside Menu

// Breadcrumb options
1. '.breadcrumb-fixed'			- Fixed Breadcrumb

// Footer options
1. '.footer-fixed'					- Fixed footer

-->
<body class="app header-fixed sidebar-fixed aside-menu-fixed aside-menu-hidden">
  <!-- Header -->
  <jsp:include page="../fragments/bodyHeader.jsp" />
  <div class="app-body">
  	<!-- Navigation -->
  	<jsp:include page="../fragments/sideBar.jsp" />
    <!-- Main content -->
    <main class="main">
	  <spring:url value="/results/saveResult/" var="saveResultUrl"></spring:url>
      <!-- Breadcrumb -->
      <ol class="breadcrumb">
        <li class="breadcrumb-item"><a href="<spring:url value="/" htmlEscape="true "/>"><spring:message code="home" /></a></li>
        <li class="breadcrumb-item active"><spring:message code="newResult" /></li>
      </ol>
	  <!-- Container -->
      <div class="container-fluid">

        <div class="animated fadeIn">
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header">
                  <i class="icon-pencil"></i> <spring:message code="result" />
                  <div class="card-actions">
                    
                  </div>
                </div>
                <div class="card-body">

                  <div class="row">

                    <div class="col-md-8">
                      <form action="#" autocomplete="off" id="add-resultado-form">   
                      
                      	<div class="form-group row" hidden>
	                      <label class="col-md-2 col-form-label"><spring:message code="idResult" />:</label>
	                      <div class="col-md-10">
	                      	<div class="input-group">
	                      		<span class="input-group-addon"><i class="fa fa-key"></i></span>
	                        	<input type="text" id="formName" name="formName" readonly value="firstEntry" class="form-control" placeholder="<spring:message code="idResult" />">
	                        </div>
	                      </div>
	                    </div>
                      
                      	<div class="form-group row" hidden>
	                      <label class="col-md-2 col-form-label"><spring:message code="idResult" />:</label>
	                      <div class="col-md-10">
	                      	<div class="input-group">
	                      		<span class="input-group-addon"><i class="fa fa-key"></i></span>
	                        	<input type="text" id="idResult" name="idResult" readonly autocomplete="idResult" value="${resultado.idResult}" class="form-control" placeholder="<spring:message code="idResult" />">
	                        </div>
	                      </div>
	                    </div>
	                    
	                    <div class="form-group row">
	                      <fmt:formatDate value="${resultado.resultDate}" var="dateresult" pattern="yyyy-MM-dd" />
	                      <label class="col-md-2 col-form-label">* <spring:message code="resultDate" />:</label>
	                      <div class="col-md-10">
	                      	<div class="input-prepend input-group">
	                      		<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
	                        	<input type="text" id="resultDate" name="resultDate" value="${dateresult}" class="form-control date-picker" data-date-format="yyyy-mm-dd" data-date-end-date="+0d" placeholder="<spring:message code="resultDate" />">
	                        	<span class="input-group-addon">yyyy-MM-dd</span>
	                        </div>
	                      </div>
	                    </div>
	                    
	                    <div class="form-group row">
	                      <label class="col-md-2 col-form-label">* <spring:message code="resultLab" />:</label>
	                      <div class="col-md-10">
	                      	<div>
		                        <select name="resultLab" id="resultLab" class="form-control select2-single">
			                    	<c:forEach items="${labs}" var="lab">
										<c:choose> 
											<c:when test="${lab.catKey eq resultado.resultLab}">
												<option selected value="${lab.catKey}"><spring:message code="${lab.messageKey}" /></option>
											</c:when>
											<c:otherwise>
												<option value="${lab.catKey}"><spring:message code="${lab.messageKey}" /></option>
											</c:otherwise>
										</c:choose> 
									</c:forEach>
			                    </select>
	                        </div>
	                      </div>
	                    </div>
	                    
	                    <div class="form-group row">
	                      <label class="col-md-2 col-form-label">* <spring:message code="sampleId" />:</label>
	                      <div class="col-md-10">
	                      	<div class="input-group">
	                      		<span class="input-group-addon"><i class="fa fa-key"></i></span>
	                        	<input type="text" id="sampleId" name="sampleId" autocomplete="sampleId" value="${resultado.sampleId}" class="form-control" placeholder="<spring:message code="sampleId" />">
	                        </div>
	                      </div>
	                    </div>
	                    
	                    <div class="form-group row">
	                      <label class="col-md-2 col-form-label"><spring:message code="sampleType" />:</label>
	                      <div class="col-md-10">
	                      	<div>
		                        <select name="sampleType" id="sampleType" class="form-control select2-single">
			                    	<option value=""><spring:message code="empty"/></option>
			                    	<c:forEach items="${sampletypes}" var="tipo">
										<c:choose> 
											<c:when test="${tipo.catKey eq resultado.sampleType}">
												<option selected value="${tipo.catKey}"><spring:message code="${tipo.messageKey}" /></option>
											</c:when>
											<c:otherwise>
												<option value="${tipo.catKey}"><spring:message code="${tipo.messageKey}" /></option>
											</c:otherwise>
										</c:choose> 
									</c:forEach>
			                    </select>
	                        </div>
	                      </div>
	                    </div>
	                    
	                    <div class="form-group row">
	                      <fmt:formatDate value="${resultado.sampleDate}" var="datesample" pattern="yyyy-MM-dd" />
	                      <label class="col-md-2 col-form-label"><spring:message code="sampleDate" />:</label>
	                      <div class="col-md-10">
	                      	<div class="input-prepend input-group">
	                      		<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
	                        	<input type="text" id="sampleDate" name="sampleDate" value="${datesample}" class="form-control date-picker" data-date-format="yyyy-mm-dd" data-date-end-date="+0d" placeholder="<spring:message code="sampleDate" />">
	                        	<span class="input-group-addon">yyyy-MM-dd</span>
	                        </div>
	                      </div>
	                    </div>
	                    
	                    
                        <div class="form-group">
                          <a href="#" class="btn btn-primary openmodal" data-flu="H1N1" data-cat="CAT_H1N1" data-nomitem="<spring:message code="CAT_FLU_1" />" data-toggle="modal"><i class="fa fa-plus"></i> <spring:message code="CAT_FLU_1" /></a>
                          <a href="#" class="btn btn-primary openmodal" data-flu="H3N2" data-cat="CAT_H3N2" data-nomitem="<spring:message code="CAT_FLU_2" />" data-toggle="modal"><i class="fa fa-plus"></i> <spring:message code="CAT_FLU_2" /></a>
                          <a href="#" class="btn btn-primary openmodal" data-flu="B" data-cat="CAT_INFB" data-nomitem="<spring:message code="CAT_FLU_3" />" data-toggle="modal"><i class="fa fa-plus"></i> <spring:message code="CAT_FLU_3" /></a>
                        </div>
                      </form>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->
          
          <div class="row">
            <div class="col-md-12">
              <div class="card">
                <div class="card-header">
                  <i class="icon-pencil"></i> <spring:message code="result" />
                  <div class="card-actions">
                  </div>
                </div>
                <div class="card-body">
                  <div class="row">
                  	<table id="resultados" class="table table-striped table-bordered datatable" width="100%">
		                <thead>
		                	<tr>
		                		<th><spring:message code="fluType" /></th>
		                		<th><spring:message code="antigen" /></th>
			                    <th><spring:message code="res" /></th>
			                    <th><spring:message code="file" /></th>
			                    <th><spring:message code="obs" /></th>
								<th><spring:message code="status" /></th></th>
								<th><spring:message code="pasive" /></th></th>
		                	</tr>
		                </thead>
		                <tbody>
		                </tbody>
		              </table>
                  </div>
                </div>
              </div>
			</div>
			</div>
			<!-- /.row -->
			
        </div>

      </div>
      <!-- /.conainer-fluid -->
      
      <!-- Modal -->
  	  <div class="modal fade" id="modalResult" data-role="modalResult" data-backdrop="static" data-aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<div id="titulo"><h3><spring:message code="confirm" /></h3></div>
				</div>
				<div class="modal-body">
					<div id="cuerpo"></div>
					<form  id="addResultFormModal">   
					
						<div class="form-group row" hidden>
	                      <label class="col-md-2 col-form-label"><spring:message code="fluType" />:</label>
	                      <div class="col-md-10">
	                      	<div class="input-group">
	                      		<span class="input-group-addon"><i class="fa fa-key"></i></span>
	                        	<input type="text" id="fluType" name="fluType" readonly value="${resultado.fluType}" class="form-control" placeholder="<spring:message code="fluType" />">
	                        </div>
	                      </div>
	                    </div>
					
						<div class="form-group row">
	                      <label class="col-md-2 col-form-label"> * <spring:message code="antigen" />:</label>
	                      <div class="col-md-10">
	                      	<div>
		                        <select name="antigen" id="antigen" class="form-control select2-single">
			                    </select>
	                        </div>
	                      </div>
	                    </div>
	                    
	                    <div class="form-group row">
	                      <label class="col-md-2 col-form-label"> * <spring:message code="res" />:</label>
	                      <div class="col-md-10">
	                      	<div>
		                        <select name="result" id="result" class="form-control select2-single">
			                    	<option value=""><spring:message code="empty"/></option>
			                    	<c:forEach items="${titers}" var="ant">
										<c:choose> 
											<c:when test="${ant.catKey eq resultado.antigen}">
												<option selected value="${ant.catKey}"><spring:message code="${ant.messageKey}" /></option>
											</c:when>
											<c:otherwise>
												<option value="${ant.catKey}"><spring:message code="${ant.messageKey}" /></option>
											</c:otherwise>
										</c:choose> 
									</c:forEach>
			                    </select>
	                        </div>
	                      </div>
	                    </div>
						
						<div class="form-group row">
	                      <label class="col-md-2 col-form-label"><spring:message code="antigenAdditional" />:</label>
	                      <div class="col-md-10">
	                      	<div class="input-group">
	                      		<span class="input-group-addon"><i class="fa fa-sort-alpha-asc"></i></span>
	                        	<input type="text" id="antigenAdditional" name="antigenAdditional" autocomplete="antigenAdditional" value="${resultado.antigenAdditional}" class="form-control" placeholder="<spring:message code="antigenAdditional" />">
	                        </div>
	                      </div>
	                    </div>
	                    
	                    <div class="form-group row">
	                      <label class="col-md-2 col-form-label"><spring:message code="file" />:</label>
	                      <div class="col-md-10">
	                      	<div class="input-group">
	                      		<span class="input-group-addon"><i class="fa fa-sort-alpha-asc"></i></span>
	                        	<input type="text" id="file" name="file" autocomplete="file" value="${resultado.file}" class="form-control" placeholder="<spring:message code="file" />">
	                        </div>
	                      </div>
	                    </div> 
	                    
	                    <div class="form-group row">
	                      <label class="col-md-2 col-form-label"><spring:message code="obs" />:</label>
	                      <div class="col-md-10">
	                      	<div class="input-group">
	                      		<span class="input-group-addon"><i class="fa fa-sort-alpha-asc"></i></span>
	                        	<input type="text" id="obs" name="obs" autocomplete="obs" value="${resultado.obs}" class="form-control" placeholder="<spring:message code="obs" />">
	                        </div>
	                      </div>
	                    </div> 
	                    
	                    <div class="form-group row">
	                      <label class="col-md-2 col-form-label"><spring:message code="dataEntryFinished" />:</label>
	                      <div class="col-md-10">
	                      	<div class="input-group">
	                      		<input type="checkbox" id="finalize" name="finalize"> 
	                        </div>
	                      </div>
	                    </div>
	                    
                        <div class="modal-footer">
                          <button type="submit" class="btn btn-primary" id="guardar"><i class="fa fa-save"></i>&nbsp;<spring:message code="save" /></button>
                          <button type="button" class="btn btn-secondary" id="salir" data-dismiss="modal"><i class="fa fa-sign-out"></i>&nbsp;<spring:message code="logout" /></button>
                        </div>
                     </form>
				</div>
			</div>
			<!-- /.modal-content -->
	    </div>
	  <!-- /.modal-dialog -->
	  </div>
	  
    </main>
    
  </div>
  <!-- Pie de p�gina -->
  <jsp:include page="../fragments/bodyFooter.jsp" />

  <!-- Bootstrap and necessary plugins -->
  <jsp:include page="../fragments/corePlugins.jsp" />
  <jsp:include page="../fragments/bodyUtils.jsp" />

  <!-- GenesisUI main scripts -->
  <spring:url value="/resources/js/app.js" var="App" />
  <script src="${App}" type="text/javascript"></script>
  
  <!-- Lenguaje -->
  <c:choose>
	<c:when test="${cookie.ehaiLang.value == null}">
		<c:set var="lenguaje" value="es"/>
	</c:when>
	<c:otherwise>
		<c:set var="lenguaje" value="${cookie.ehaiLang.value}"/>
	</c:otherwise>
  </c:choose>
  
  <!-- Plugins and scripts required by this views -->
  <spring:url value="/resources/vendors/js/jquery.validate.min.js" var="JQueryValidate" />
  <script src="${JQueryValidate}" type="text/javascript"></script>
  <spring:url value="/resources/vendors/js/i18n/validation/messages_{language}.js" var="jQValidationLoc">
      <spring:param name="language" value="${lenguaje}" />
  </spring:url>
  <script src="${jQValidationLoc}"></script>
  <spring:url value="/resources/vendors/js/bootstrap-datepicker.js" var="datepicker" />
  <script src="${datepicker}" type="text/javascript"></script>
  
  <script src="${jQValidationLoc}"></script>
  <spring:url value="/resources/vendors/js/select2.min.js" var="Select2" />
  <script src="${Select2}" type="text/javascript"></script>

  <!-- Custom scripts required by this view -->
  <spring:url value="/resources/js/views/Resultados.js" var="processResultado" />
  <script src="${processResultado}"></script>
  
  <script src="${jQValidationLoc}"></script>
  <spring:url value="/resources/vendors/js/i18n/datatables/label_{language}.json" var="dataTablesLang">
  	<spring:param name="language" value="${lenguaje}" />
  </spring:url>
  <spring:url value="/resources/vendors/js/jquery.dataTables.min.js" var="dataTablesSc" />
  <script src="${dataTablesSc}" type="text/javascript"></script>
  <spring:url value="/resources/vendors/js/dataTables.bootstrap4.min.js" var="dataTablesBsSc" />
  <script src="${dataTablesBsSc}" type="text/javascript"></script>
  <spring:url value="/resources/vendors/js/dataTables.responsive.min.js" var="dataTablesResponsive" />
  <script src="${dataTablesResponsive}" type="text/javascript"></script>
  <spring:url value="/resources/vendors/js/dataTables.select.min.js" var="dataTablesSelect" />
  <script src="${dataTablesSelect}" type="text/javascript"></script>
  <spring:url value="/resources/vendors/js/dataTables.buttons.min.js" var="dataTablesButtons" />
  <script src="${dataTablesButtons}" type="text/javascript"></script>
  
  
<c:set var="successmessage"><spring:message code="process.success" /></c:set>
<c:set var="errormessage"><spring:message code="process.errors" /></c:set>
<c:set var="waitmessage"><spring:message code="process.wait" /></c:set>
<c:set var="dataEntry1FinishedAlert"><spring:message code="dataEntry1FinishedAlert" /></c:set>
<c:set var="blank"><spring:message code="empty" /></c:set>
<c:set var="noResults"><spring:message code="noResults" /></c:set>

<spring:url value="/results/getAntigen/" var="antisUrl"/>
<spring:url value="/results/searchResultCode/" var="searchUrl"/>

<script>
	jQuery(document).ready(function() {
		var parametros = {antisUrl: "${antisUrl}", saveResultUrl: "${saveResultUrl}", successmessage: "${successmessage}",
				errormessage: "${errormessage}",waitmessage: "${waitmessage}", lenguaje: "${lenguaje}", dataEntry1FinishedAlert: "${dataEntry1FinishedAlert}"
					,dataTablesLang: "${dataTablesLang}",blank: "${blank}",searchUrl: "${searchUrl}",noResults: "${noResults}"
		};
		ProcessResultado.init(parametros);
	});
</script>
  
</body>
</html>