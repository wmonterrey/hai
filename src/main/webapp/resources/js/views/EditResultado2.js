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
  $('#sampleType, #resultLab, #antigen, #result').select2({
	    theme: "bootstrap",
	    width: '100%'
});
  

  $.validator.setDefaults( {
    submitHandler: function () {
    	processResultado();
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
  
  function processResultado(){
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
	}
  
  $('#resultDate').on('keydown',function(event){
	  	event.stopImmediatePropagation();
		    if( event.which == 13 ){
		        event.preventDefault();
		        $('#resultLab').focus();
	  			$('#resultLab').select2('open');
		    }
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
