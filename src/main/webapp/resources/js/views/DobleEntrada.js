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
  init: function (parametros) {	
	  $('#resultDate').focus();
  
  handleDatePickers(parametros.lenguaje);	 
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
  
  function verificarTipoMuestra(){
	  if($('#sampleType').val()!=$('#sampleType2').val()){
		  var nuevaEntrada = $('#sampleType').select2('data');
		  $('#variableName').html('<h3>'+$('#tmLabel').text() +'</h3>');
		  $('#cuerpo').html('<h4>'+parametros.entry1+': '+$('#sampleType2Desc').val() +'</h4>');
		  $('#cuerpo2').html('<h4>'+parametros.entry2+': '+nuevaEntrada[0].text +'</h4>');
		  $('#btnTipoMuestra').show();
		  $('#btnTipoMuestra2').show();
		  $('#modalValidar').modal('show');
	  }
	  else{
		  verificarFechaMuestra();
	  }
	}
  
  function verificarFechaMuestra(){
	  if($('#sampleDate').val()!=$('#sampleDate2').val()){
		  $('#variableName').html('<h3>'+$('#fmLabel').text() +'</h3>');
		  $('#cuerpo').html('<h4>'+parametros.entry1+': '+$('#sampleDate2').val() +'</h4>');
		  $('#cuerpo2').html('<h4>'+parametros.entry2+': '+$('#sampleDate').val() +'</h4>');
		  $('#btnFechaMuestra').show();
		  $('#btnFechaMuestra2').show();
		  $('#modalValidar').modal('show');
	  }
	  else{
		  saveTheResult();
	  }
	}
  
  function saveTheResult(){
	  $.blockUI({ message: parametros.waitmessage });
	    $.post( parametros.saveResultUrl
	            , $( 'form' ).serialize()
	            , function( data )
	            {
	    			resultado = JSON.parse(data);
	    			if (resultado.idResult === undefined) {
	    				data = data.replace(/u0027/g,"");
	    				toastr.error(data, parametros.errormessage, {
	    					    closeButton: true,
	    					    progressBar: true,
	    					  });
	    				$.unblockUI();
					}
					else{
						var mensaje = resultado.sampleId + '</br>' + resultado.resultLab + '</br>' + resultado.resultDate;
						toastr.success(mensaje, parametros.successmessage, {
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
  
  $('#finalize').change(function() {
      if(this.checked) {
      	alert(parametros.dataEntry2FinishedAlert);
      }      
  });

  }
 };
 
}();
