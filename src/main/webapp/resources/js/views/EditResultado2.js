var parametrosGlobales;

function ponerValorParametros (parametros){
	parametrosGlobales=parametros;
}

function hideBotones (){
	$('#btnTipoMuestra').hide();
	$('#btnFechaMuestra').hide();
	$('#btnAntigeno').hide();
	$('#btnResultado').hide();
	$('#btnAntAdicional').hide();
	$('#btnFile').hide();
	$('#btnObs').hide();
	$('#btnTipoMuestra2').hide();
	$('#btnFechaMuestra2').hide();
	$('#btnAntigeno2').hide();
	$('#btnResultado2').hide();
	$('#btnAntAdicional2').hide();
	$('#btnFile2').hide();
	$('#btnObs2').hide();
};
	
function seleccionarEntradaTipoMuestra1(){
	$('#sampleType').val($('#sampleType2').val());
	$('#sampleType').trigger('change');
	//Esconder modal
	$('#modalValidar').modal('hide');
	hideBotones();	
	$.confirm({
	    title: parametrosGlobales.successmessage,
	    content: '<h3>'+parametrosGlobales.selectedentry1+'</h3>',
	    buttons: {
	        ok: function () {
	        	verificarFechaMuestra();
	        }
	    }
	});
}
function seleccionarEntradaTipoMuestra2(){
	$('#sampleType2').val($('#sampleType').val());
	$('#sampleType2').trigger('change');
	var nuevaEntrada = $('#sampleType').select2('data');
	$('#sampleType2Desc').val(nuevaEntrada[0].text);
	$('#sampleType2Desc').trigger('change');
	//Esconder modal
	$('#modalValidar').modal('hide');
	hideBotones();
	$.confirm({
	    title: parametrosGlobales.successmessage,
	    content: '<h3>'+parametrosGlobales.selectedentry2+'</h3>',
	    buttons: {
	        ok: function () {
	        	verificarFechaMuestra();
	        }
	    }
	});
}
function seleccionarEntradaFechaMuestra1(){
	$('#sampleDate').val($('#sampleDate2').val());
	$('#sampleDate').trigger('change');
	//Esconder modal
	$('#modalValidar').modal('hide');
	hideBotones();
	$.confirm({
	    title: parametrosGlobales.successmessage,
	    content: '<h3>'+parametrosGlobales.selectedentry1+'</h3>',
	    buttons: {
	        ok: function () {
	        	verificarAntigeno();
	        }
	    }
	});
}
function seleccionarEntradaFechaMuestra2(){
	$('#sampleDate2').val($('#sampleDate').val());
	$('#sampleDate2').trigger('change');
	//Esconder modal
	$('#modalValidar').modal('hide');
	hideBotones();
	$.confirm({
	    title: parametrosGlobales.successmessage,
	    content: '<h3>'+parametrosGlobales.selectedentry2+'</h3>',
	    buttons: {
	        ok: function () {
	        	verificarAntigeno();
	        }
	    }
	});
}

function seleccionarEntradaAntigeno1(){
	$('#antigen').val($('#antigen2').val());
	$('#antigen').trigger('change');
	//Esconder modal
	$('#modalValidar').modal('hide');
	hideBotones();	
	$.confirm({
	    title: parametrosGlobales.successmessage,
	    content: '<h3>'+parametrosGlobales.selectedentry1+'</h3>',
	    buttons: {
	        ok: function () {
	        	verificarResultado();
	        }
	    }
	});
}
function seleccionarEntradaAntigeno2(){
	$('#antigen2').val($('#antigen').val());
	$('#antigen2').trigger('change');
	//Esconder modal
	$('#modalValidar').modal('hide');
	hideBotones();
	$.confirm({
	    title: parametrosGlobales.successmessage,
	    content: '<h3>'+parametrosGlobales.selectedentry2+'</h3>',
	    buttons: {
	        ok: function () {
	        	verificarResultado();
	        }
	    }
	});
}

function seleccionarEntradaResultado1(){
	$('#result').val($('#result2').val());
	$('#result').trigger('change');
	//Esconder modal
	$('#modalValidar').modal('hide');
	hideBotones();	
	$.confirm({
	    title: parametrosGlobales.successmessage,
	    content: '<h3>'+parametrosGlobales.selectedentry1+'</h3>',
	    buttons: {
	        ok: function () {
	        	verificarAntAdicional();
	        }
	    }
	});
}
function seleccionarEntradaResultado2(){
	$('#result2').val($('#result').val());
	$('#result2').trigger('change');
	//Esconder modal
	$('#modalValidar').modal('hide');
	hideBotones();
	$.confirm({
	    title: parametrosGlobales.successmessage,
	    content: '<h3>'+parametrosGlobales.selectedentry2+'</h3>',
	    buttons: {
	        ok: function () {
	        	verificarAntAdicional();
	        }
	    }
	});
}

function seleccionarEntradaAntAdicional1(){
	$('#antigenAdditional').val($('#antigenAdditional2').val());
	$('#antigenAdditional').trigger('change');
	//Esconder modal
	$('#modalValidar').modal('hide');
	hideBotones();
	$.confirm({
	    title: parametrosGlobales.successmessage,
	    content: '<h3>'+parametrosGlobales.selectedentry1+'</h3>',
	    buttons: {
	        ok: function () {
	        	verificarFile();
	        }
	    }
	});
}
function seleccionarEntradaAntAdicional2(){
	$('#antigenAdditional2').val($('#antigenAdditional').val());
	$('#antigenAdditional2').trigger('change');
	//Esconder modal
	$('#modalValidar').modal('hide');
	hideBotones();
	$.confirm({
	    title: parametrosGlobales.successmessage,
	    content: '<h3>'+parametrosGlobales.selectedentry2+'</h3>',
	    buttons: {
	        ok: function () {
	        	verificarFile();
	        }
	    }
	});
}

function seleccionarEntradaFile1(){
	$('#file').val($('#file2').val());
	$('#file').trigger('change');
	//Esconder modal
	$('#modalValidar').modal('hide');
	hideBotones();
	$.confirm({
	    title: parametrosGlobales.successmessage,
	    content: '<h3>'+parametrosGlobales.selectedentry1+'</h3>',
	    buttons: {
	        ok: function () {
	        	verificarObs();
	        }
	    }
	});
}
function seleccionarEntradaFile2(){
	$('#file2').val($('#file').val());
	$('#file2').trigger('change');
	//Esconder modal
	$('#modalValidar').modal('hide');
	hideBotones();
	$.confirm({
	    title: parametrosGlobales.successmessage,
	    content: '<h3>'+parametrosGlobales.selectedentry2+'</h3>',
	    buttons: {
	        ok: function () {
	        	verificarObs();
	        }
	    }
	});
}

function seleccionarEntradaObs1(){
	$('#obs').val($('#obs2').val());
	$('#obs').trigger('change');
	//Esconder modal
	$('#modalValidar').modal('hide');
	hideBotones();
	$.confirm({
	    title: parametrosGlobales.successmessage,
	    content: '<h3>'+parametrosGlobales.selectedentry1+'</h3>',
	    buttons: {
	        ok: function () {
	        	saveTheResult();
	        }
	    }
	});
}
function seleccionarEntradaObs2(){
	$('#obs2').val($('#obs').val());
	$('#obs2').trigger('change');
	//Esconder modal
	$('#modalValidar').modal('hide');
	hideBotones();
	$.confirm({
	    title: parametrosGlobales.successmessage,
	    content: '<h3>'+parametrosGlobales.selectedentry2+'</h3>',
	    buttons: {
	        ok: function () {
	        	saveTheResult();
	        }
	    }
	});
}

function verificarTipoMuestra(){
	if($('#sampleType').val()!=$('#sampleType2').val()){
	  var nuevaEntrada = $('#sampleType').select2('data');
	  $('#variableName').html('<h3>'+$('#tmLabel').text() +'</h3>');
	  $('#cuerpo').html('<h4>'+parametrosGlobales.entry1+': '+$('#sampleType2Desc').val() +'</h4>');
	  $('#cuerpo2').html('<h4>'+parametrosGlobales.entry2+': '+nuevaEntrada[0].text +'</h4>');
	  $('#btnTipoMuestra').show();
	  $('#btnTipoMuestra2').show();
	  //Mostrar modal
	  $('#modalValidar').modal('show');
	}
	else{
		  verificarFechaMuestra();
	}
}

function verificarFechaMuestra(){
  if($('#sampleDate').val()!=$('#sampleDate2').val()){
	  $('#variableName').html('<h3>'+$('#fmLabel').text() +'</h3>');
	  $('#cuerpo').html('<h4>'+parametrosGlobales.entry1+': '+$('#sampleDate2').val() +'</h4>');
	  $('#cuerpo2').html('<h4>'+parametrosGlobales.entry2+': '+$('#sampleDate').val() +'</h4>');
	  $('#btnFechaMuestra').show();
	  $('#btnFechaMuestra2').show();
	  //Mostrar el modal
	  $('#modalValidar').modal('show');
  }
  else{
	  verificarAntigeno();
  }
}

function verificarAntigeno(){
	if($('#antigen').val()!=$('#antigen2').val()){
	  $('#variableName').html('<h3>'+$('#antLabel').text() +'</h3>');
	  $('#cuerpo').html('<h4>'+parametrosGlobales.entry1+': '+$('#antigen2').val() +'</h4>');
	  $('#cuerpo2').html('<h4>'+parametrosGlobales.entry2+': '+$('#antigen').val() +'</h4>');
	  $('#btnAntigeno').show();
	  $('#btnAntigeno2').show();
	  //Mostrar modal
	  $('#modalValidar').modal('show');
	}
	else{
		verificarResultado();
	}
}

function verificarResultado(){
	if($('#result').val()!=$('#result2').val()){
	  $('#variableName').html('<h3>'+$('#resLabel').text() +'</h3>');
	  $('#cuerpo').html('<h4>'+parametrosGlobales.entry1+': '+$('#result2').val() +'</h4>');
	  $('#cuerpo2').html('<h4>'+parametrosGlobales.entry2+': '+$('#result').val() +'</h4>');
	  $('#btnResultado').show();
	  $('#btnResultado2').show();
	  //Mostrar modal
	  $('#modalValidar').modal('show');
	}
	else{
		verificarAntAdicional();
	}
}

function verificarAntAdicional(){
	  if($('#antigenAdditional').val()!=$('#antigenAdditional2').val()){
		  $('#variableName').html('<h3>'+$('#addLabel').text() +'</h3>');
		  $('#cuerpo').html('<h4>'+parametrosGlobales.entry1+': '+$('#antigenAdditional2').val() +'</h4>');
		  $('#cuerpo2').html('<h4>'+parametrosGlobales.entry2+': '+$('#antigenAdditional').val() +'</h4>');
		  $('#btnAntAdicional').show();
		  $('#btnAntAdicional2').show();
		  //Mostrar el modal
		  $('#modalValidar').modal('show');
	  }
	  else{
		  verificarFile();
	  }
	}

function verificarFile(){
	  if($('#file').val()!=$('#file2').val()){
		  $('#variableName').html('<h3>'+$('#fileLabel').text() +'</h3>');
		  $('#cuerpo').html('<h4>'+parametrosGlobales.entry1+': '+$('#file2').val() +'</h4>');
		  $('#cuerpo2').html('<h4>'+parametrosGlobales.entry2+': '+$('#file').val() +'</h4>');
		  $('#btnFile').show();
		  $('#btnFile2').show();
		  //Mostrar el modal
		  $('#modalValidar').modal('show');
	  }
	  else{
		  verificarObs();
	  }
	}

function verificarObs(){
	  if($('#obs').val()!=$('#obs2').val()){
		  $('#variableName').html('<h3>'+$('#obsLabel').text() +'</h3>');
		  $('#cuerpo').html('<h4>'+parametrosGlobales.entry1+': '+$('#obs2').val() +'</h4>');
		  $('#cuerpo2').html('<h4>'+parametrosGlobales.entry2+': '+$('#obs').val() +'</h4>');
		  $('#btnObs').show();
		  $('#btnObs2').show();
		  //Mostrar el modal
		  $('#modalValidar').modal('show');
	  }
	  else{
		  saveTheResult();
	  }
	}

function saveTheResult(){
	  $.blockUI({ message: parametrosGlobales.waitmessage });
	    $.post( parametrosGlobales.saveResultUrl
	            , $( 'form' ).serialize()
    , function( data )
    {
		resultado = JSON.parse(data);
		if (resultado.idResult === undefined) {
			data = data.replace(/u0027/g,"");
			toastr.error(data, parametrosGlobales.errormessage, {
				    closeButton: true,
				    progressBar: true,
				  });
			$.unblockUI();
		}
		else{
			var mensaje = resultado.sampleId + '</br>' + resultado.resultLab + '</br>' + resultado.resultDate;
			toastr.success(mensaje, parametrosGlobales.successmessage, {
		    closeButton: true,
		    progressBar: true,
		  });
			$.unblockUI();
		}
    }
    , 'text' )
	.fail(function(XMLHttpRequest, textStatus, errorThrown) {
		alert( "error:" + errorThrown);
		    		$.unblockUI();
		  		});
	    $.unblockUI();
}

var ProcessResultado = function () {
	
	var handleDatePickers = function (idioma) {
	    if (jQuery().datepicker) {
	        $('.date-picker').datepicker({
	            language: idioma,
	            autoclose: true
	        });
	        $('body').removeClass("modal-open"); // fix bug when inline picker is used in modal
	    }
	};
	
	
return {
  //main function to initiate the module
  init: function () {	
	  $('#resultDate').focus();
  
  handleDatePickers(parametrosGlobales.lenguaje);	 
  $('#sampleType, #resultLab2, #antigen, #result').select2({
	    theme: "bootstrap",
	    width: '100%'
});
 
  

  $.validator.setDefaults( {
    submitHandler: function () {
    	verificarEntradas();
    }
  } );

  $('form').each(function () {
    $(this).validate({
    rules: {
    	idResult: {
            required: false,
            maxlength: 50
        },
        sampleId: {
            required: true,
            maxlength: 50
        },
        sampleType:{
        	required: false
        },
        sampleDate: {
            required: false
        },
        resultDate: {
            required: true
        },
        resultLab:{
        	required: true
        },
        antigen:{
        	required: true
        },
        result:{
        	required: true
        },
        file:{
        	maxlength: 50, required: false
        },
        antigenAdditional:{
        	maxlength: 250, required: false
        },
        obs: {
        	maxlength: 500, required: false
        }
    },
    errorElement: 'em',
    errorPlacement: function ( error, element ) {
      // Add the `help-block` class to the error element
      error.addClass( 'form-control-feedback' );
      if ( element.prop( 'type' ) === 'checkbox' ) {
        error.insertAfter( element.parent( 'label' ) );
      } else {
        error.insertAfter( element );
      }
    },
    highlight: function ( element, errorClass, validClass ) {
      $( element ).addClass( 'form-control-danger' ).removeClass( 'form-control-success' );
      $( element ).parents( '.form-group' ).addClass( 'has-danger' ).removeClass( 'has-success' );
    },
    unhighlight: function (element, errorClass, validClass) {
      $( element ).addClass( 'form-control-success' ).removeClass( 'form-control-danger' );
      $( element ).parents( '.form-group' ).addClass( 'has-success' ).removeClass( 'has-danger' );
    }
  });
      
  });  
  
  function verificarEntradas() {
	  verificarTipoMuestra();
  }
  
  $('#finalize').change(function() {
      if(this.checked) {
      	alert(parametrosGlobales.dataEntry2FinishedAlert);
      }      
  });

  }
 };
 
}();
