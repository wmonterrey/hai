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
        <li class="breadcrumb-item active"><spring:message code="edit" /></li>
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
	                        	<input type="text" id="formName" name="formName" readonly value="secondEntry" class="form-control" placeholder="<spring:message code="idResult" />">
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
	                      <fmt:formatDate value="${resultadoAnterior.resultDate}" var="dateresult" pattern="yyyy-MM-dd" />
	                      <label class="col-md-2 col-form-label">* <spring:message code="resultDate" />:</label>
	                      <div class="col-md-10">
	                      	<div class="input-prepend input-group">
	                      		<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
	                        	<input type="text" id="resultDate" readonly name="resultDate" value="${dateresult}" class="form-control date-picker" data-date-format="yyyy-mm-dd" data-date-end-date="+0d" placeholder="<spring:message code="resultDate" />">
	                        	<span class="input-group-addon">yyyy-MM-dd</span>
	                        </div>
	                      </div>
	                    </div>
	                    
	                    <div class="form-group row">
	                      <label class="col-md-2 col-form-label">* <spring:message code="resultLab" />:</label>
	                      <div readonly class="col-md-10">
	                      	<div>
		                        <select name="resultLab2" id="resultLab2" disabled class="form-control select2-single">
		                        	<option value=""><spring:message code="empty"/></option>
			                    	<c:forEach items="${labs}" var="lab">
										<c:choose> 
											<c:when test="${lab.catKey eq resultadoAnterior.resultLab}">
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
	                      <input type="text" readonly hidden id="resultLab" name="resultLab" autocomplete="resultLab" value="${resultadoAnterior.resultLab}" class="form-control">
	                    </div>
	                    
	                    <div class="form-group row">
	                      <label class="col-md-2 col-form-label">* <spring:message code="sampleId" />:</label>
	                      <div class="col-md-10">
	                      	<div class="input-group">
	                      		<span class="input-group-addon"><i class="fa fa-key"></i></span>
	                        	<input type="text" readonly id="sampleId" name="sampleId" autocomplete="sampleId" value="${resultadoAnterior.sampleId}" class="form-control" placeholder="<spring:message code="sampleId" />">
	                        </div>
	                      </div>
	                    </div>
	                    
	                    <div class="form-group row">
	                      <label id="tmLabel" name="tmLabel" class="col-md-2 col-form-label"><spring:message code="sampleType" />:</label>
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
	                      <label id="fmLabel" name="fmLabel" class="col-md-2 col-form-label"><spring:message code="sampleDate" />:</label>
	                      <div class="col-md-10">
	                      	<div class="input-prepend input-group">
	                      		<span class="input-group-addon"><i class="fa fa-calendar"></i></span>
	                        	<input type="text" id="sampleDate" name="sampleDate" value="${datesample}" class="form-control date-picker" data-date-format="yyyy-mm-dd" data-date-end-date="+0d" placeholder="<spring:message code="sampleDate" />">
	                        	<span class="input-group-addon">yyyy-MM-dd</span>
	                        </div>
	                      </div>
	                    </div>
	                    
	                    <div class="form-group row">
	                      <label class="col-md-2 col-form-label"><spring:message code="fluType" />:</label>
	                      <div class="col-md-10">
	                      	<div class="input-group">
	                      		<span class="input-group-addon"><i class="fa fa-key"></i></span>
	                        	<input type="text" id="fluType" name="fluType" readonly value="${resultadoAnterior.fluType}" class="form-control" placeholder="<spring:message code="fluType" />">
	                        </div>
	                      </div>
	                    </div>
					
						<div class="form-group row">
	                      <label id="antLabel" name="antLabel" class="col-md-2 col-form-label"> * <spring:message code="antigen" />:</label>
	                      <div class="col-md-10">
	                      	<div>
		                        <select name="antigen" id="antigen" class="form-control select2-single">
		                        	<option value=""><spring:message code="empty"/></option>
			                    	<c:forEach items="${antigenos}" var="antig">
										<c:choose> 
											<c:when test="${antig.catKey eq resultado.antigen}">
												<option selected value="${antig.catKey}"><spring:message code="${antig.messageKey}" /></option>
											</c:when>
											<c:otherwise>
												<option value="${antig.catKey}"><spring:message code="${antig.messageKey}" /></option>
											</c:otherwise>
										</c:choose> 
									</c:forEach>
			                    </select>
	                        </div>
	                      </div>
	                    </div>
	                    
	                    <div class="form-group row">
	                      <label id="resLabel" name="resLabel" class="col-md-2 col-form-label"> * <spring:message code="res" />:</label>
	                      <div class="col-md-10">
	                      	<div>
		                        <select name="result" id="result" class="form-control select2-single">
			                    	<option value=""><spring:message code="empty"/></option>
			                    	<c:forEach items="${titers}" var="result">
										<c:choose> 
											<c:when test="${result.catKey eq resultado.result}">
												<option selected value="${result.catKey}"><spring:message code="${result.messageKey}" /></option>
											</c:when>
											<c:otherwise>
												<option value="${result.catKey}"><spring:message code="${result.messageKey}" /></option>
											</c:otherwise>
										</c:choose> 
									</c:forEach>
			                    </select>
	                        </div>
	                      </div>
	                    </div>
						
						<div class="form-group row">
	                      <label id="addLabel" name="addLabel" class="col-md-2 col-form-label"><spring:message code="antigenAdditional" />:</label>
	                      <div class="col-md-10">
	                      	<div class="input-group">
	                      		<span class="input-group-addon"><i class="fa fa-sort-alpha-asc"></i></span>
	                        	<input type="text" id="antigenAdditional" name="antigenAdditional" autocomplete="antigenAdditional" value="${resultado.antigenAdditional}" class="form-control" placeholder="<spring:message code="antigenAdditional" />">
	                        </div>
	                      </div>
	                    </div>
	                    
	                    <div class="form-group row">
	                      <label id="fileLabel" name="fileLabel" class="col-md-2 col-form-label"><spring:message code="file" />:</label>
	                      <div class="col-md-10">
	                      	<div class="input-group">
	                      		<span class="input-group-addon"><i class="fa fa-sort-alpha-asc"></i></span>
	                        	<input type="text" id="file" name="file" autocomplete="file" value="${resultado.file}" class="form-control" placeholder="<spring:message code="file" />">
	                        </div>
	                      </div>
	                    </div> 
	                    
	                    <div class="form-group row">
	                      <label id="obsLabel" name="obsLabel" class="col-md-2 col-form-label"><spring:message code="obs" />:</label>
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
	                    
                        <div class="form-group">
                          <button type="submit" class="btn btn-primary" id="guardar"><i class="fa fa-save"></i>&nbsp;<spring:message code="save" /></button>
                          <a href="<spring:url value="/results/secondEntry/checkResult/" htmlEscape="true "/>" class="btn btn-danger"><i class="fa fa-sign-out"></i>&nbsp;<spring:message code="logout" /></a>
                        </div>
	                    
                      </form>
                      <input type="text" readonly hidden id="sampleType2" name="sampleType2" autocomplete="sampleType2" value="${resultadoAnterior.sampleType}" class="form-control">
                      <input type="text" readonly hidden id="sampleType2Desc" name="sampleType2Desc" autocomplete="sampleType2Desc" value="${tipoMuestra}" class="form-control">
                      <fmt:formatDate value="${resultadoAnterior.sampleDate}" var="datesample2" pattern="yyyy-MM-dd" />
                      <input type="text" readonly hidden id="sampleDate2" name="sampleDate2" autocomplete="sampleDate2" value="${datesample2}" class="form-control">
                      <input type="text" readonly hidden id="antigen2" name="antigen2" autocomplete="antigen2" value="${resultadoAnterior.antigen}" class="form-control">
                      <input type="text" readonly hidden id="result2" name="result2" autocomplete="result2" value="${resultadoAnterior.result}" class="form-control">
                      <input type="text" readonly hidden id="antigenAdditional2" name="antigenAdditional2" autocomplete="antigenAdditional2" value="${resultadoAnterior.antigenAdditional}" class="form-control">
                      <input type="text" readonly hidden id="file2" name="file2" autocomplete="file2" value="${resultadoAnterior.file}" class="form-control">
                      <input type="text" readonly hidden id="obs2" name="obs2" autocomplete="obs2" value="${resultadoAnterior.obs}" class="form-control">
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <!-- /.col -->
          </div>
          <!-- /.row -->
          
          
        </div>

      </div>
      <!-- /.conainer-fluid -->
      <!-- Modal -->
  	  <div class="modal fade" id="modalValidar" tabindex="-1" role="dialog" aria-labelledby="smallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header">
					<div id="titulo"><h2 class="modal-title"><spring:message code="diffentry" /></h2></div>
				</div>
				<div class="modal-body">
					<div id="variableName">
					</div>
					<div id="cuerpo">
					</div>
					<div id="cuerpo2">
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" id="btnTipoMuestra" class="btn btn-info" onclick="seleccionarEntradaTipoMuestra1()"><spring:message code="select1entry" /></button>
					<button type="button" id="btnFechaMuestra" class="btn btn-info" onclick="seleccionarEntradaFechaMuestra1()"><spring:message code="select1entry" /></button>
					<button type="button" id="btnAntigeno" class="btn btn-info" onclick="seleccionarEntradaAntigeno1()"><spring:message code="select1entry" /></button>
					<button type="button" id="btnResultado" class="btn btn-info" onclick="seleccionarEntradaResultado1()"><spring:message code="select1entry" /></button>
					<button type="button" id="btnAntAdicional" class="btn btn-info" onclick="seleccionarEntradaAntAdicional1()"><spring:message code="select1entry" /></button>
					<button type="button" id="btnFile" class="btn btn-info" onclick="seleccionarEntradaFile1()"><spring:message code="select1entry" /></button>
					<button type="button" id="btnObs" class="btn btn-info" onclick="seleccionarEntradaObs1()"><spring:message code="select1entry" /></button>
					<button type="button" id="btnTipoMuestra2" class="btn btn-warning" onclick="seleccionarEntradaTipoMuestra2()"><spring:message code="select2entry" /></button>
					<button type="button" id="btnFechaMuestra2" class="btn btn-warning" onclick="seleccionarEntradaFechaMuestra2()"><spring:message code="select2entry" /></button>
					<button type="button" id="btnAntigeno2" class="btn btn-warning" onclick="seleccionarEntradaAntigeno2()"><spring:message code="select2entry" /></button>
					<button type="button" id="btnResultado2" class="btn btn-warning" onclick="seleccionarEntradaResultado2()"><spring:message code="select2entry" /></button>
					<button type="button" id="btnAntAdicional2" class="btn btn-warning" onclick="seleccionarEntradaAntAdicional2()"><spring:message code="select2entry" /></button>
					<button type="button" id="btnFile2" class="btn btn-warning" onclick="seleccionarEntradaFile2()"><spring:message code="select2entry" /></button>
					<button type="button" id="btnObs2" class="btn btn-warning" onclick="seleccionarEntradaObs2()"><spring:message code="select2entry" /></button>
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
  <spring:url value="/resources/js/views/EditResultado2.js" var="processResultado" />
  <script src="${processResultado}"></script>
  
  <script src="${jQValidationLoc}"></script>
  
  
<c:set var="successmessage"><spring:message code="process.success" /></c:set>
<c:set var="errormessage"><spring:message code="process.errors" /></c:set>
<c:set var="waitmessage"><spring:message code="process.wait" /></c:set>
<c:set var="dataEntry2FinishedAlert"><spring:message code="dataEntry2FinishedAlert" /></c:set>
<c:set var="blank"><spring:message code="empty" /></c:set>
<c:set var="entry1"><spring:message code="entry1" /></c:set>
<c:set var="entry2"><spring:message code="entry2" /></c:set>
<c:set var="selectedentry1"><spring:message code="selectedentry1" /></c:set>
<c:set var="selectedentry2"><spring:message code="selectedentry2" /></c:set>
<c:set var="difentrycorrected"><spring:message code="difentrycorrected" /></c:set>


<script>
	jQuery(document).ready(function() {
		var parametros = {saveResultUrl: "${saveResultUrl}", successmessage: "${successmessage}",
				errormessage: "${errormessage}",waitmessage: "${waitmessage}", lenguaje: "${lenguaje}", dataEntry2FinishedAlert: "${dataEntry2FinishedAlert}"
					,blank: "${blank}",entry1: "${entry1}",entry2: "${entry2}", selectedentry1: "${selectedentry1}", selectedentry2: "${selectedentry2}" , selectedentry2: "${selectedentry2}", difentrycorrected: "${difentrycorrected}"
		};
		ponerValorParametros(parametros);
		ProcessResultado.init();
		hideBotones();
	});
	  
</script>
  
</body>
</html>