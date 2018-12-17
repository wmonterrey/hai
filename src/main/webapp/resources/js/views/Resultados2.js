var ProcessResultado2 = function () {
	
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
  $('#resultDateLabel').hide();
  $('#resultLabLabel').hide();
  $('#resultDate').focus();
  $('#resultDate').select();
  handleDatePickers(parametros.lenguaje);	 
  $('#sampleType, #resultLab, #resH1N1pdmCA09').select2({
	    theme: "bootstrap",
	    width: '100%'
});

  $.validator.setDefaults( {
    submitHandler: function () {
      processSolicitud();
    }
  } );

  $( '#add-resultado-form' ).validate( {
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
        	required: true
        },
        sampleDate: {
            required: false
        },
        resultDate: {
            required: true
        },
        resH1N1pdmCA09:{
        	required: false,
            maxlength: 50
        },
        resultLab:{
        	required: true
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
  
  function processSolicitud(){
	  $.blockUI({ message: parametros.waitmessage });
	    $.post( parametros.saveResultUrl
	            , $( '#add-resultado-form' ).serialize()
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
						$('#sampleId').val('');
						$('#sampleType').val('').trigger("change");
						$('#sampleDate').val('');
						$('#resH1N1pdmCA09').val('').trigger("change");
						$('#resH1N1pdmMI15').val('').trigger("change");
						$('#resNicaH3N2').val('').trigger("change");
						$('#resH3N2TX12').val('').trigger("change");
						$('#resH3N2SW13').val('').trigger("change");
						$('#resH3N2HK14').val('').trigger("change");
						$('#resBPH13').val('').trigger("change");
						$('#resBBR08').val('').trigger("change");
						$('#resNicaB').val('').trigger("change");
						$('#resNicaYamagata').val('').trigger("change");
						$('#resNicaVictoria').val('').trigger("change");
						$('#obs').val('');
						$('#file').val('');
						$('#finalize').prop("checked", false);
						$('#sampleId').focus();
						$.unblockUI();
					}
	            }
	            , 'text' )
		  		.fail(function(XMLHttpRequest, textStatus, errorThrown) {
		    		alert( "error:" + errorThrown);
		    		$.unblockUI();
		  		});
	}
  
  $('#resultDate').on('keydown',function(event){
	  	event.stopImmediatePropagation();
		    if( event.which == 13 ){
		        event.preventDefault();
		        $('#resultLab').focus();
	  			$('#resultLab').select2('open');
		    }
	  });
  
  $('#resultDate').change(function() {
      $('#resultDateLabel').show();
  });
  
  $('#resultLab').change(function() {
      $('#resultLabLabel').show();
  });
  
  $('#resultLab').on(
		    'select2:close',
		    function () {
		    	$('#sampleId').focus();
		    }
		);
  
  $('#sampleId').on('keydown',function(event){
	  	event.stopImmediatePropagation();
		    if( event.which == 13 ){
		        event.preventDefault();
	  			$('#sampleType').focus();
	  			$('#sampleType').select2('open');
		    }
	  });
  
  $('#sampleType').on(
		    'select2:close',
		    function () {
		    	$('#sampleDate').focus();
		    }
		);
  

  $('#sampleDate').on('keydown',function(event){
	  	event.stopImmediatePropagation();
		    if( event.which == 13 ){
		        event.preventDefault();
	  			$('#resH1N1pdmCA09').focus();
	  			$('#resH1N1pdmCA09').select2('open');
		    }
	  });
 
  


  
  $('#obs').on('keydown',function(event){
  	event.stopImmediatePropagation();
	    if( event.which == 13 ){
	        event.preventDefault();
  			$('#finalize').focus();
	    }
  });
  
  $('#finalize').change(function() {
      if(this.checked) {
      	alert(parametros.dataEntry2FinishedAlert);
      }      
  });

  }
 };
}();
