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
	  $('#sampleId').focus();
  
  handleDatePickers(parametros.lenguaje);	 
  $('#sampleType, #resultLab, #antigen, #result').select2({
	    theme: "bootstrap",
	    width: '100%'
});
  

  $.validator.setDefaults( {
    submitHandler: function () {
      processSolicitud();
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
  
  function processSolicitud(){
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
						var table1 = $('#resultados').DataTable({
						      "oLanguage": {
						          "sUrl": parametros.dataTablesLang
						      },
						      "bFilter": true, 
						      "bInfo": true, 
						      "bPaginate": true, 
						      "bDestroy": true,
						      "responsive": true
						  });
						  //table1.clear().draw();
						table1.row.add([resultado.fluType,resultado.antigen,resultado.result,resultado.file,resultado.obs,resultado.estado,resultado.pasive]);
						$('#antigen').val('').trigger('change');
						$('#result').val('').trigger('change');
						$('#antigen').focus();
						$.unblockUI();
					}
	            }
	            , 'text' )
		  		.fail(function(XMLHttpRequest, textStatus, errorThrown) {
		    		alert( "error:" + errorThrown);
		    		$.unblockUI();
		  		});
	}
  
  $('#finalize').change(function() {
      if(this.checked) {
      	alert(parametros.dataEntry1FinishedAlert);
      }      
  });
  
  $(".openmodal").click(function(){ 
	if ($('#add-resultado-form').valid()){
		$('#fluType').val($(this).data('flu'));
		$.getJSON(parametros.antisUrl, {
			fluType : $(this).data('cat'),
            ajax : 'true'
        }, function(data) {
            var html='<option value="">'+ parametros.blank +'</option>';
            var len = data.length;
            for ( var i = 0; i < len; i++) {
                html += '<option value="' + data[i].catKey + '">'
                    + data[i].messageKey + '</option>';
            }
            $('#antigen').html(html);
            $('#antigen').focus();
            $('#antigen').select2({
        	    theme: "bootstrap",
        	    width: '100%'
            });
        });
		
		$('#titulo').html('<h2 class="modal-title">'+ $(this).data('nomitem') +'</h2>');
		$('#modalResult').modal('show');
	}
	else{
		if($('#sampleId').val()=='') $('#sampleId').focus();
		if($('#resultDate').val()=='') $('#resultDate').focus();
	}
  });
  
  
  $('#sampleId').change(function() {
	  if($('#sampleId').val()!='' && $('#resultDate').val()!='' && $('#resultLab').val()!=''){
		  searchData();
	  }  
  });
  
  $('#resultLab').change(function() {
	  if($('#sampleId').val()!='' && $('#resultDate').val()!='' && $('#resultLab').val()!=''){
		  searchData();
	  }         
  });
  
  $('#resultDate').change(function() {
	  if($('#sampleId').val()!='' && $('#resultDate').val()!='' && $('#resultLab').val()!=''){
		  searchData();
	  }           
  });
  
  
  $("#salir").click(function(){ 
	  $('#result').val('').trigger('change');
	  });
  
  
  function searchData(){
	  $.blockUI({ message: parametros.waitmessage });
	  $.getJSON(parametros.searchUrl,{
		  sampleId : $("#sampleId").val(),
		  resultDate : $("#resultDate").val(),
		  resultLab : $("#resultLab").val(),
            ajax : 'true'
        }, function(data) {
		  var table1 = $('#resultados').DataTable({
	          "oLanguage": {
	              "sUrl": parametros.dataTablesLang
	          },
	          "bFilter": true, 
	          "bInfo": true, 
	          "bPaginate": true, 
	          "bDestroy": true,
	          "responsive": true
	      });
		  table1.clear().draw();
		if (data == ''){
			toastr.info(data, parametros.noResults, {
				closeButton: true,
				progressBar: true,
			 });
		}
		else{
			for (var row in data) {
				table1.row.add([data[row].fluType,data[row].antigen,data[row].result,data[row].file,data[row].obs,data[row].estado,data[row].pasive]);
			}
		}
	})
	.fail(function() {
	    alert( "error" );
	    $.unblockUI();
	});
	$.unblockUI();
  }

  }
 };
}();
