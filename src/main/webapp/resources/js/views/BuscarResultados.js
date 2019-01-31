var ProcessSearch = function () {
	
return {
  //main function to initiate the module
  init: function (parametros) {	
	  
	$('#estado, #resultLab,#sampleType,#fluType,#antigen, #usrResult').select2({
		theme: "bootstrap"
	});
	
	$('#resultadosdiv').hide();
	
	$('input[name="fecResultadoRange"]').daterangepicker({
	   ranges: {
	     'Hoy': [moment(), moment()],
	 'Ayer': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
	 'Ultimos 7 Dias': [moment().subtract(6, 'days'), moment()],
	 'Ultimos 30 Dias': [moment().subtract(29, 'days'), moment()],
	 'Este mes': [moment().startOf('month'), moment().endOf('month')],
	 'Mes pasado': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
	   },
	   singleDatePicker: false,
	   startDate: moment().subtract(29, 'days'),
	   maxDate:moment(),
	   locale: {
	       "format": "YYYY-MM-DD",
	   "separator": " - ",
	   "applyLabel": "Aplicar",
	   "cancelLabel": "Cancelar",
	   "fromLabel": "Desde",
	   "toLabel": "Hasta",
	   "customRangeLabel": "Personalizado",
	   "weekLabel": "S",
	   "daysOfWeek": [
	   "Do",
	   "Lu",
	   "Ma",
	   "Mi",
	   "Ju",
	   "Vi",
	   "Sa"
	   ],
	   "monthNames": [
	   "Enero",
	   "Febrero",
	   "Marzo",
	   "Abril",
	   "Mayo",
	   "Junio",
	   "Julio",
	   "Agosto",
	   "Septiembre",
	   "Octubre",
	   "Noviembre",
	   "Diciembre"
	   ],
	   "firstDay": 1
	   },
	});
	
	$('#checkNumero').change(function() {
        if(this.checked) {
        	$("#sampleId").prop('disabled', false);
        }else{
        	$("#sampleId").prop('disabled', true);
        }
              
    });
	
	$('#checkDates').change(function() {
        if(this.checked) {
        	$("#fecResultadoRange").prop('disabled', false);
        }else{
        	$("#fecResultadoRange").prop('disabled', true);
        }
              
    });

  $( '#resultados-form' ).validate( {
	    rules: {
	      sampleId: {
	    	  required: true
	      },
	      estado: {
	    	  required: true
	      },
	      resultLab: {
	          required: true
	      },
	      fecResultadoRange: {
	          required: true
	      },
	      sampleType: {
	    	  required: true
	      },
	      usrResult: {
	          required: true
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
	    },
        submitHandler: function (form) {
            processReport();
        }
	  });
  
  Date.prototype.yyyymmdd = function() {         
      
      var yyyy = this.getFullYear().toString();                                    
      var mm = (this.getMonth()+1).toString(); // getMonth() is zero-based         
      var dd  = this.getDate().toString();             
                          
      return yyyy + '-' + (mm[1]?mm:"0"+mm[0]) + '-' + (dd[1]?dd:"0"+dd[0]);
 };
	  
  function processReport(){
	  $.blockUI({ message: parametros.waitmessage });
	  $.getJSON(parametros.searchUrl, $('#resultados-form').serialize(), function(data) {
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
				var d1 = (new Date(data[row].resultDate)).yyyymmdd();
				data[row].sampleDate==null?d2=null:d2 = new Date(data[row].sampleDate).yyyymmdd();
				var d3 = (new Date(data[row].recordDate)).yyyymmdd();
				var firstEntryUrl = parametros.resultadosUrl + 'firstEntry/editResult/' + data[row].idResult+'/';
				var secondEntryUrl = parametros.resultadosUrl + 'secondEntry/editResult/' + data[row].idResult+'/';
				var btnedit1entry = null;
				var btnadd2entry = null;
				var btnedit2entry = null;
				data[row].estado=='0'?btnedit1entry = '<a title="" href=' + firstEntryUrl + ' class="btn btn-xs btn-primary" ><i class="icon-pencil"></i></a>':btnedit1entry = '';
				data[row].estado=='1'?btnadd2entry = '<a title="" href=' + secondEntryUrl + ' class="btn btn-xs btn-primary" ><i class="icon-directions"></i></a>':btnadd2entry = '';
				data[row].estado=='2'?btnedit2entry = '<a title="" href=' + secondEntryUrl + ' class="btn btn-xs btn-primary" ><i class="icon-directions"></i></a>':btnedit2entry = '';
				
				table1.row.add([data[row].sampleId,d1,data[row].resultLab,data[row].fluType,data[row].antigen,data[row].result,data[row].estado,data[row].sampleType,data[row].usrResult.completeName,
					d2,data[row].pasive,data[row].recordUser,d3,btnedit1entry + ' ' +btnadd2entry+ ' ' +btnedit2entry]);
			}
			$('#resultadosdiv').show();
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
