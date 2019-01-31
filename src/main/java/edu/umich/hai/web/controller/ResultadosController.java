package edu.umich.hai.web.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import edu.umich.hai.domain.Resultado;
import edu.umich.hai.language.MessageResource;
import edu.umich.hai.service.AuditTrailService;
import edu.umich.hai.service.MessageResourceService;
import edu.umich.hai.service.ResultadoService;
import edu.umich.hai.service.UsuarioService;
import edu.umich.hai.users.model.UserSistema;





@Controller
@RequestMapping("/results/*")
public class ResultadosController {
	private static final Logger logger = LoggerFactory.getLogger(ResultadosController.class);
	
	@Resource(name="messageResourceService")
	private MessageResourceService messageResourceService;

	
	@Resource(name="usuarioService")
	private UsuarioService usuarioService;
	
	@Resource(name="resultadoService")
	private ResultadoService resultadoService;
	
	@Resource(name="auditTrailService")
	private AuditTrailService auditTrailService;
	
	
	@RequestMapping(value = "/searchResult/", method = RequestMethod.GET)
    public String obtenerResultados(Model model) throws ParseException { 	
    	logger.debug("Mostrando Pagina de busqueda de resultados en JSP");
    	List<MessageResource> allantigens = new ArrayList<MessageResource>();
    	List<MessageResource> estados = messageResourceService.getCatalogo("CAT_STA");
    	model.addAttribute("estados", estados);
    	List<MessageResource> labs = messageResourceService.getCatalogo("CAT_LAB");
    	model.addAttribute("labs", labs);
    	List<MessageResource> sampletypes = messageResourceService.getCatalogo("CAT_SMP");
    	model.addAttribute("sampletypes", sampletypes);
    	List<MessageResource> fluTypes = messageResourceService.getCatalogo("CAT_FLU");
    	model.addAttribute("fluTypes", fluTypes);
    	List<MessageResource> antigens = messageResourceService.getCatalogo("CAT_H1N1");
    	allantigens.addAll(antigens);
    	antigens = messageResourceService.getCatalogo("CAT_H3N2");
    	allantigens.addAll(antigens);
    	antigens = messageResourceService.getCatalogo("CAT_INFB");
    	allantigens.addAll(antigens);
    	model.addAttribute("allantigens", allantigens);
    	List<MessageResource> results = messageResourceService.getCatalogo("CAT_TIT");
    	model.addAttribute("results", results);
    	List<UserSistema> usuarios = this.usuarioService.getActiveUsers();
    	model.addAttribute("usuarios", usuarios);
    	return "resultados/search";
	}
	
	
	@RequestMapping(value = "/getAntigen/", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody List<MessageResource> fetchAntigens(@RequestParam(value = "fluType", required = true) String fluType
    		)  {
        logger.info("Obteniendo antigenos " + fluType);
        List<MessageResource> datos = messageResourceService.getCatalogo(fluType);
        for (MessageResource anti:datos) {
        	String descCatalogo;
    		descCatalogo = (LocaleContextHolder.getLocale().getLanguage().equals("en")) ? anti.getEnglish(): anti.getSpanish();
    		anti.setMessageKey(descCatalogo);
    	}
        return datos;
    }
	
	@RequestMapping(value = "/searchResult/", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody List<Resultado> fetchResultados(@RequestParam(value = "sampleId", required = false) String sampleId,
    		@RequestParam(value = "fecResultadoRange", required = false, defaultValue = "") String fecResultadoRange,
    		@RequestParam(value = "resultLab", required = true) String resultLab,
    		@RequestParam(value = "estado", required = true) String estado,
    		@RequestParam(value = "sampleType", required = true) String sampleType,
    		@RequestParam(value = "fluType", required = true) String fluType,
    		@RequestParam(value = "antigen", required = true) String antigen,
    		@RequestParam(value = "result", required = true) String result,
    		@RequestParam(value = "usrResult", required = true) String usrResult
    		) throws ParseException {
        logger.info("Obteniendo resultados");
        Long desde = null;
        Long hasta = null;
        if (!fecResultadoRange.matches("")) {
        	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        	desde = formatter.parse(fecResultadoRange.substring(0, 10)).getTime();
        	hasta = formatter.parse(fecResultadoRange.substring(fecResultadoRange.length()-10, fecResultadoRange.length())).getTime();
        }
        List<Resultado> datos = resultadoService.getResultadosFiltro(sampleId, desde, hasta, resultLab, sampleType, estado, usrResult,fluType,antigen,result);
        if (datos == null){
        	logger.debug("Nulo");
        }
        else {
        	for (Resultado resultado:datos) {
        		MessageResource mr = null;
        		String descCatalogo = null;
        		mr = this.messageResourceService.getMensaje(resultado.getResultLab(),"CAT_LAB");
        		if(mr!=null) {
        			descCatalogo = (LocaleContextHolder.getLocale().getLanguage().equals("en")) ? mr.getEnglish(): mr.getSpanish();
        			resultado.setResultLab(descCatalogo);
        		}
        		mr = this.messageResourceService.getMensaje(resultado.getSampleType(),"CAT_SMP");
        		if(mr!=null) {
        			descCatalogo = (LocaleContextHolder.getLocale().getLanguage().equals("en")) ? mr.getEnglish(): mr.getSpanish();
        			resultado.setSampleType(descCatalogo);
        		}
        	}
        }
        return datos;
    }
	
	@RequestMapping(value = "/searchResultCode/", method = RequestMethod.GET, produces = "application/json")
    public @ResponseBody List<Resultado> fetchResultadosCode(@RequestParam(value = "sampleId", required = true) String sampleId,
    		@RequestParam(value = "resultDate", required = true) String resultDate,
    		@RequestParam(value = "resultLab", required = true) String resultLab
    		) throws ParseException {
        logger.info("Obteniendo resultados");
        Long desde = null;
        Long hasta = null;
        if (!resultDate.matches("")) {
        	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        	desde = formatter.parse(resultDate.substring(0, 10)).getTime();
        	hasta = formatter.parse(resultDate.substring(0, 10)).getTime();
        }
        List<Resultado> datos = resultadoService.getResultadosFiltro(sampleId, desde, hasta, resultLab, "ALL", "ALL", "ALL","ALL","ALL","ALL");
        if (datos == null){
        	logger.debug("Nulo");
        }
        return datos;
    }
	
	
    @RequestMapping(value = "/firstEntry/addResult/", method = RequestMethod.GET)
	public String initAddResultForm(Model model) {
    	logger.debug("Agregar resultado");
	    List<MessageResource> sampletypes = messageResourceService.getCatalogo("CAT_SMP");
    	model.addAttribute("sampletypes", sampletypes);
    	List<MessageResource> titers = messageResourceService.getCatalogo("CAT_TIT");
    	model.addAttribute("titers", titers);
    	List<MessageResource> labs = messageResourceService.getCatalogo("CAT_LAB");
    	model.addAttribute("labs", labs);
    	Resultado resultado = new Resultado();
    	model.addAttribute("resultado", resultado);
		return "resultados/enterForm";
	}
    
    @RequestMapping(value = "/firstEntry/editResult/{idResult}/", method = RequestMethod.GET)
	public String initUpdateResultForm(@PathVariable("idResult") String idResult, Model model) {
    	Resultado resultado = this.resultadoService.getResultado(idResult);
		if(resultado!=null && resultado.getEstado()=='0' && resultado.getPasive()=='0'){
			model.addAttribute("resultado", resultado);
			List<MessageResource> sampletypes = messageResourceService.getCatalogo("CAT_SMP");
	    	model.addAttribute("sampletypes", sampletypes);
	    	List<MessageResource> titers = messageResourceService.getCatalogo("CAT_TIT");
	    	model.addAttribute("titers", titers);
	    	List<MessageResource> labs = messageResourceService.getCatalogo("CAT_LAB");
	    	model.addAttribute("labs", labs);
	    	List<MessageResource> antigenos = null;
	    	String tipoFlu = resultado.getFluType();
	    	if(tipoFlu.equals("H1N1")) {
	    		antigenos = messageResourceService.getCatalogo("CAT_H1N1");
	    	} else if(tipoFlu.equals("H3N2")) {
	    		antigenos = messageResourceService.getCatalogo("CAT_H3N2");
	    	} else if(tipoFlu.equals("B")) {
	    		antigenos = messageResourceService.getCatalogo("CAT_INFB");
	    	}
	    	model.addAttribute("antigenos", antigenos);
			return "resultados/editForm";
		}
		else{
			return "403";
		}
	}
    
    
	
	@RequestMapping(value = "/secondEntry/checkResult/", method = RequestMethod.GET)
    public String obtenerResultados2Entry(Model model) throws ParseException { 	
    	logger.debug("Mostrando Pagina de busqueda de resultados en JSP");
    	
    	List<Resultado> resultados = this.resultadoService.getResultados2Entry();
    	model.addAttribute("resultados", resultados);
    	for (Resultado resultado:resultados) {
    		MessageResource mr = null;
    		String descCatalogo = null;
    		mr = this.messageResourceService.getMensaje(resultado.getResultLab(),"CAT_LAB");
    		if(mr!=null) {
    			descCatalogo = (LocaleContextHolder.getLocale().getLanguage().equals("en")) ? mr.getEnglish(): mr.getSpanish();
    			resultado.setResultLab(descCatalogo);
    		}
    		mr = this.messageResourceService.getMensaje(resultado.getSampleType(),"CAT_SMP");
    		if(mr!=null) {
    			descCatalogo = (LocaleContextHolder.getLocale().getLanguage().equals("en")) ? mr.getEnglish(): mr.getSpanish();
    			resultado.setSampleType(descCatalogo);
    		}
    	}
    	return "resultados/list2Entry";
	}
    
    @RequestMapping(value = "/secondEntry/editResult/{idResult}/", method = RequestMethod.GET)
	public String initUpdate2ResultForm(@PathVariable("idResult") String idResult, Model model) {
    	Resultado resultadoAnterior = this.resultadoService.getResultado(idResult);
		if(resultadoAnterior!=null && resultadoAnterior.getPasive()=='0' && (resultadoAnterior.getEstado()=='1' || resultadoAnterior.getEstado()=='2')){
			Resultado resultado;
			model.addAttribute("resultadoAnterior", resultadoAnterior);
			if(resultadoAnterior.getEstado()=='1') {
				resultado = new Resultado();
				resultado.setIdResult(idResult);
			}
			else {
				resultado = this.resultadoService.getResultado(idResult);
			}
			List<MessageResource> sampletypes = messageResourceService.getCatalogo("CAT_SMP");
	    	model.addAttribute("sampletypes", sampletypes);
	    	List<MessageResource> titers = messageResourceService.getCatalogo("CAT_TIT");
	    	model.addAttribute("titers", titers);
	    	List<MessageResource> labs = messageResourceService.getCatalogo("CAT_LAB");
	    	model.addAttribute("labs", labs);
	    	List<MessageResource> antigenos = null;
	    	String tipoFlu = resultadoAnterior.getFluType();
	    	if(tipoFlu.equals("H1N1")) {
	    		antigenos = messageResourceService.getCatalogo("CAT_H1N1");
	    	} else if(tipoFlu.equals("H3N2")) {
	    		antigenos = messageResourceService.getCatalogo("CAT_H3N2");
	    	} else if(tipoFlu.equals("B")) {
	    		antigenos = messageResourceService.getCatalogo("CAT_INFB");
	    	}
	    	model.addAttribute("antigenos", antigenos);
	    	model.addAttribute("resultado", resultado);
			return "resultados/editForm2";
		}
		else{
			return "403";
		}
	}
    
    
    
    @RequestMapping( value="/saveResult/", method=RequestMethod.POST)
	public ResponseEntity<String> processResultForm( @RequestParam(value="idResult", required=false, defaultValue="" ) String idResult
			, @RequestParam(value="formName", required=true) String formName
	        , @RequestParam(value="sampleId", required=true) String sampleId
	        , @RequestParam( value="sampleType", required=false ) String sampleType
	        , @RequestParam( value="sampleDate", required=false, defaultValue="" ) String sampleDate
	        , @RequestParam( value="resultDate", required=true ) String resultDate
	        , @RequestParam( value="resultLab", required=true) String resultLab
	        , @RequestParam( value="fluType", required=true) String fluType
	        , @RequestParam( value="antigen", required=true) String antigen
	        , @RequestParam( value="result", required=true) String result
	        , @RequestParam( value="antigenAdditional", required=false) String antigenAdditional
	        , @RequestParam( value="obs", required=false) String obs
	        , @RequestParam( value="file", required=false) String file
	        , @RequestParam( value="finalize", required=false) boolean finalize
	        )
	{
    	try{
			Resultado resultado = new Resultado();
			UserSistema usuarioActual = this.usuarioService.getUser(SecurityContextHolder.getContext().getAuthentication().getName());
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			Date dateSample = null;
			
			if(!sampleDate.equals("")) {
				dateSample = formatter.parse(sampleDate);
			}
			Date dateResult = formatter.parse(resultDate);
			//Si el idResult viene en blanco es un nuevo resultado
			if (idResult.equals("")){
				//Crear un nuevo resultado, pone estado en digitacion 1
				idResult = new UUID(authentication.getName().hashCode(),new Date().hashCode()).toString();
				resultado.setIdResult(idResult);
				resultado.setRecordUser(authentication.getName());
				resultado.setRecordDate(new Date());
			}
			//Si el idResult no viene en blanco hay que editar el resultado, pone el estado en completo
			else{
				//Recupera el resultado de la base de datos
				resultado = this.resultadoService.getResultado(idResult);
			}
			resultado.setSampleId(sampleId);
			resultado.setSampleType(sampleType);
			resultado.setSampleDate(dateSample);
			resultado.setResultDate(dateResult);
			resultado.setResultLab(resultLab);
			resultado.setFluType(fluType);
			resultado.setAntigen(antigen);
			resultado.setResult(result);
			resultado.setUsrResult(usuarioActual);
			resultado.setAntigenAdditional(antigenAdditional);
			resultado.setObs(obs);
			resultado.setFile(file);
			if(formName.matches("firstEntry") && finalize) {
				resultado.setEstado('1');
			}
			else if(formName.matches("secondEntry") && !finalize) {
				resultado.setEstado('2');
			}
			else if(formName.matches("secondEntry") && finalize) {
				resultado.setEstado('3');
			}
			
			
			WebAuthenticationDetails wad  = (WebAuthenticationDetails) authentication.getDetails();
			resultado.setDeviceid(wad.getRemoteAddress());
			//Actualiza el resultado
			this.resultadoService.saveResultado(resultado);
			return createJsonResponse(resultado);
    	}
		catch (DataIntegrityViolationException e){
			String message = e.getMostSpecificCause().getMessage();
			Gson gson = new Gson();
		    String json = gson.toJson(message);
			return new ResponseEntity<String>( json, HttpStatus.CREATED);
		}
		catch(Exception e){
			Gson gson = new Gson();
		    String json = gson.toJson(e.toString());
			return new ResponseEntity<String>( json, HttpStatus.CREATED);
		}
    	
	}
    
    private ResponseEntity<String> createJsonResponse( Object o ){
	    HttpHeaders headers = new HttpHeaders();
	    headers.set("Content-Type", "application/json");
	    Gson gson = new Gson();
	    String json = gson.toJson(o);
	    return new ResponseEntity<String>( json, headers, HttpStatus.CREATED );
	}
    
    
}
